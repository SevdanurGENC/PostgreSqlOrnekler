import psycopg2
from psycopg2 import sql, extensions
import sys


connection = psycopg2.connect(
            user = "postgres",
            password = "root",
            host = "localhost",
            port = "5432",
            database = "kitap"
        )

cursor = connection.cursor() 

autocommit = extensions.ISOLATION_LEVEL_AUTOCOMMIT
connection.set_isolation_level( autocommit )

def createDB(dbname):
    try: 
        global connection       
        global cursor
        create_db = "CREATE DATABASE " + dbname
        cursor.execute(create_db)
        connection.commit() 
        print ("Veri Tabani Basariyla Olusturuldu.")

    except(Exception, psycopg2.Error) as error:
        print("PostgreSQL veri tabanina baglanirken bir hata olustu : ", error)
        connection = None

    finally: 
        if connection != None:
            cursor.close()
            connection.close()
            print("PostgreSql veri tabani su an kapatilmistir.")
  
def createTable():
    try: 
        global connection
        global cursor
        create_table = "CREATE TABLE book (id INTEGER PRIMARY KEY, 
        author VARCHAR(128), isbn VARCHAR(128),
         title VARCHAR(128), date_published DATE);"
        cursor.execute(create_table)
        print ("Tablo Basariyla Olusturulmustur.")

    except(Exception, psycopg2.Error) as error:
        print("PostgreSQL veri tabanina baglanirken bir hata olustu : ", error)
        connection = None

    finally: 
        if connection != None:
            cursor.close()
            connection.close()
            print("PostgreSql veri tabani su an kapatilmistir.")


def insertTable(id, author, isbn, title, date_published):
    try: 
        global connection
        global cursor
        pg_insert = "INSERT INTO book (id, author, isbn, title, date_published)
         VALUES (%s,%s,%s,%s,%s)"
        inserted_values = (id, author, isbn, title, date_published)

        cursor.execute(pg_insert, inserted_values)
        count = cursor.rowcount
        print (count, " kayit tabloya eklenmistir.")

    except(Exception, psycopg2.Error) as error:
        print("PostgreSQL veri tabanina baglanirken bir hata olustu : ", error)
        connection = None

    finally: 
        if connection != None:
            cursor.close()
            connection.close()
            print("PostgreSql veri tabani su an kapatilmistir.")
 

def selectTable():
    try: 
        global connection
        global cursor 
        
        query_select = "SELECT * FROM book"
        cursor.execute(query_select) 
        books = cursor.fetchall() 
        for kitaplar in books:
            print(kitaplar) 

        count = cursor.rowcount
        print ("Tabloda toplam : ", count, " kayit bulunmaktadir.")

    except(Exception, psycopg2.Error) as error:
        print("PostgreSQL veri tabanina baglanirken bir hata olustu : ", error)
        connection = None

    finally: 
        if connection != None:
            cursor.close()
            connection.close()
            print("PostgreSql veri tabani su an kapatilmistir.")


def updateTable(bookid, title):
    try: 
        global connection
        global cursor

        pg_update = "Update book set title = %s where id = %s"
        cursor.execute(pg_update, (title, bookid)) 
        count = cursor.rowcount
        print(count, " kayit basarili bir sekilde guncellenmistir.")  

    except(Exception, psycopg2.Error) as error:
        print("PostgreSQL veri tabanina baglanirken bir hata olustu : ", error)
        connection = None

    finally: 
        if connection != None:
            cursor.close()
            connection.close()
            print("PostgreSql veri tabani su an kapatilmistir.")
            
def deleteTable(bookid):
    try: 
        global connection
        global cursor

        pg_delete = 'DELETE FROM book where id = {}'.format(bookid)

        cursor.execute( pg_delete ) 
        count = cursor.rowcount
        print(count, " kayit basarili bir sekilde silinmistir.") 

    except(Exception, psycopg2.Error) as error:
        print("PostgreSQL veri tabanina baglanirken bir hata olustu : ", error)
        connection = None

    finally: 
        if connection != None:
            cursor.close()
            connection.close()
            print("PostgreSql veri tabani su an kapatilmistir.")


def menu():
    print("=============================")
    print("Veri Tabanina Hos Geldiniz")
    print("1-Tum Kayitlari Listele")
    print("2-Yeni Kayit Ekle")
    print("3-Kayit Guncelleme")
    print("4-Kayit Sil")
    print("5-Cikis") 

def main():

    while True:   # while 1
        menu() 
        secim = input("Lutfen seciminizi yapiniz : ") 
        if secim == '1': 
            selectTable()
        elif secim == '2': 
            id = input("ID : ") 
            author = input("Yazar Adi : ") 
            isbn = input("ISBN : ") 
            title = input("Kitap Adi : ") 
            date_published = input("Yayinlandigi Tarih : ") 
            insertTable(id, author, isbn, title, date_published)
        elif secim == '3':
            id = input("ID : ")  
            title = input("Kitap Adi : ")  
            updateTable(id, title)
        elif secim == '4':
            id = input("Silinecek ID : ")  
            deleteTable(id) 
        elif secim == '5':
            sys.exit()
        else: 
            print("Farkli bir giris yaptiniz.") 

if __name__ == "__main__":
    createDB("kitap")
    createTable()
    main()
