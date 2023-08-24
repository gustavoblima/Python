import sqlite3
import datetime
from datetime import datetime, timedelta

con = sqlite3.connect("C:\\jex\\python\\teste.db")
cursor = con.cursor()
def inserir():

    sql = ("INSERT INTO funcionarios (nome, idade, data) " "VALUES (?, ?, ?)")
    data = datetime.now().date()
    print(data)
    value = "Davi Guedes dos Santos", 16, data
    cursor.execute(sql, value)
    con.commit()

    cursor.close()
    con.close()

inserir()

def ler_dados():
    sql = ("SELECT * FROM funcionarios " "WHERE id=?")
    value = 2
    cursor.execute(sql, (value,))
    
    for (id, nome, idade) in cursor :
        print(f"O dado requisitado do servidor: {id, nome, idade}")


def ler_total_dados():
    sql = "SELECT * FROM funcionarios"
    cursor.execute(sql)

    for (id, nome, idade) in cursor:
        print (f"O total de dados: {id, nome, idade}")


#ler_dados()
#ler_total_dados()