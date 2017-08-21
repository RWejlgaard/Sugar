from time import sleep
import salt
import salt.client
import salt.config
import salt.utils.event
import mysql.connector

def db_connect(query):
    con = mysql.connector.connect(user='root', password='ERI2gOZ1OJQ=',
                                  host='ymir.wejlgaard.com', database='salt')
    try:
        return con.cmd_query(query)
    except Exception as e:
        print "SQL_ERROR: {}".format(e)

    con.close()


def update_queue():
    pass

def get_event():
    opts = salt.config.client_config('/etc/salt/master')

    sevent = salt.utils.event.get_event(
        'master',
        sock_dir=opts['sock_dir'],
        transport=opts['transport'],
        opts=opts)

    while True:
        ret = sevent.get_event(full=True)
        if ret is None:
            continue
        else:
            handle_event(sevent)


def handle_event(event):
    _stamp = event['data']['_stamp']
    cmd = event['data']['cmd']
    fun = event['data']['fun']
    fun_args = event['data']['fun_args']
    minion_id = event['data']['minion_id']
    jid = event['data']['jid']
    retcode = event['data']['retcode']
    _return = event['data']['return']
    success = event['data']['success']
    tag = event['tag']

    s

    db_connect("""INSERT INTO `salt`.`events` 
                  (_stamp, cmd, fun, fun_args, minion_id, jid, retcode, return, success, tag)
                  VALUES ({},{},{},{},{},{},{},{},{},{})""".format(_stamp, cmd, fun, fun_args, minion_id, jid, retcode, _return, success, tag))



if __name__ == '__main__':
    get_event()
    # while True:
    #     listen()
    #     sleep(30)
