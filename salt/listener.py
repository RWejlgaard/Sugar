from time import sleep
import salt
import salt.client
import mysql.connector

def db_connect(query):
    con = mysql.connector.connect(user='root', password='ERI2gOZ1OJQ=',
                                  host='ymir.wejlgaard.com', database='salt')
    try:
        con.cmd_query(query)
    except Exception as e:
        print "SQL_ERROR: {}".format(e)




def update_queue():



if __name__ == '__main__':
    while True:
        listen()
        sleep(30)
