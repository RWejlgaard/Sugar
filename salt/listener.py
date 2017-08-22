import time
import salt
import salt.client
import salt.config
import salt.utils.event
import mysql.connector

IGNORE_LIST = ['salt/event/exit']


def start_listener():
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
                handle_event(ret)
            time.sleep(2)
        except KeyboardInterrupt:
            quit()


def handle_event(e):
    try:
        if e['tag'] not in IGNORE_LIST:
            print "Got event\t{}".format(e['tag'])
            con = mysql.connector.connect(user='events', password='N2F6jfBm', host='ymir.wejlgaard.com', database='salt')
            cursor = con.cursor()
            query = """INSERT INTO events (tag, data) VALUES ("{}", "{}");""".format(str(e['tag']), str(e['data']))
            cursor.execute(query)
            con.commit()
            print "Posted event\t{}".format(e['tag'])
            con.close()
    except Exception as e:
        print e

if __name__ == '__main__':
    start_listener()
