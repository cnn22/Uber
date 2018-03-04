import mysql.connector
from mysql.connector import errorcode

class Query():
  def fetchtablename(self):
      try:
        cnx = mysql.connector.connect(user='root', password='root', host = '127.0.0.1',
                                      database='test')
      except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
          print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
          print("Database does not exist")
        else:
          print(err)
      else:
          cursor = cnx.cursor()     
          cursor.execute("USE test") 
          cursor.execute("SHOW TABLES")
          table = cursor.fetchall()
          print(table)
      cnx.close()


a = Query()
a.fetchtablename()
