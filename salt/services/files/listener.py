import time
import salt
import salt.client
import salt.config
import salt.utils.event
import mysql.connector
import json
from daemon import runner
import redis
from lockfile import LockTimeout
import sys

IGNORE_LIST = ['salt/event/exit', 'salt/auth']


class Listener():
	def __init__(self):
		self.stdin_path = '/dev/stdin'
		self.stdout_path = '/dev/stdout'
		self.stderr_path = '/dev/stderr'
		self.pidfile_path = '/tmp/sugar_listener.pid'
		self.pidfile_timeout = 5

	def fire_event(self, payload, tag='salt/info'):
		sock_dir = '/var/run/salt/minion'
		event = salt.utils.event.SaltEvent('master', sock_dir)
		event.fire_event(payload, tag)

	def handle_event(self, sevent):
		ret = sevent.get_event(full=True)
		if ret is not None:
			try:
				if ret['tag'] not in IGNORE_LIST:
					print "Got event\t{}".format(ret['tag'])
					con = mysql.connector.connect(user='events', password='N2F6jfBm', host='ymir.wejlgaard.com',
												  database='salt')
					cursor = con.cursor()
					query = """INSERT INTO events (time, tag, data) VALUES (now(),"{}", "{}");""".format(str(ret['tag']), str(ret['data']))
					cursor.execute(query)
					con.commit()
					print "Posted event\t{}".format(ret['tag'])
					con.close()
			except Exception as e:
				print e

	def handle_queue(self):
		r = redis.Redis('ziva.wejlgaard.com', 1234)
		ticket = r.lpop('queue')
		if ticket is not None:
			# todo some kind of validation would be pretty kewl
			payload = json.loads(ticket)
			self.fire_event(payload, tag='sugar/ticket/received')




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
				self.handle_event(sevent)
				self.handle_queue()
				time.sleep(1)
			except KeyboardInterrupt:
				quit()




if __name__ == "__main__":
	l = Listener()
	l.run()
	# listener = Listener()
	# daemon = runner.DaemonRunner(listener)
	# try:
	# 	daemon.do_action()
	# except Exception as e:
	# 	print e
	# 	daemon._start()
