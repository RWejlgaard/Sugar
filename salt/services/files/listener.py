import time
import salt
import salt.client
import salt.config
import salt.utils.event
import mysql.connector
from daemon import runner
from lockfile import LockTimeout
import sys

IGNORE_LIST = ['salt/event/exit', 'salt/auth']


class Listener():
	def __init__(self):
		self.stdin_path = '/dev/null'
		self.stdout_path = '/dev/tty'
		self.stderr_path = '/dev/tty'
		self.pidfile_path = '/tmp/sugar_listener.pid'
		self.pidfile_timeout = 5

	def handle_event(e):
		try:
			if e['tag'] not in IGNORE_LIST:
				print "Got event\t{}".format(e['tag'])
				con = mysql.connector.connect(user='events', password='N2F6jfBm', host='ymir.wejlgaard.com',
											  database='salt')
				cursor = con.cursor()
				query = """INSERT INTO events (time, tag, data) VALUES (now(),"{}", "{}");""".format(str(e['tag']), str(e['data']))
				cursor.execute(query)
				con.commit()
				print "Posted event\t{}".format(e['tag'])
				con.close()
		except Exception as e:
			print e

	def run(self):
		opts = salt.config.client_config('/etc/salt/master')
		sevent = salt.utils.event.get_event(
			'master',
			sock_dir=opts['sock_dir'],
			transport=opts['transport'],
			opts=opts
		)

		print "Listener Started!"

		while True:
			try:
				ret = sevent.get_event(full=True)
				if ret is None:
					continue
				else:
					self.handle_event(ret)
				time.sleep(1)
			except KeyboardInterrupt:
				quit()


if __name__ == "__main__":
	listener = Listener()
	daemon = runner.DaemonRunner(listener)
	try:
		daemon.do_action()
	except Exception as e:
		print e
		daemon._start()
