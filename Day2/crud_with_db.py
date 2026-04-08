from fastapi import FastAPI
import psycopg2

app=FastAPI()
try:
    conn=psycopg2.connect(
        host="localhost",
        database="Crud_fastapi",
        user="postgres",
        password="harika"
    )
    print("Connected Successfully")
except Exception as e:
    print(e)

@app.get("/")
def home():
    return "<h2>Home Page</h2>"

@app.get("/users")
def get_users():
    cursor=conn.cursor()
    cursor.execute("SELECT *from users;")
    users=cursor.fetchall()
    cursor.close()
    return {"data":users}

@app.post("/users")
def post_user(id:int):
    cursor=conn.cursor()
    cursor.execute("INSERT INTO users(id) values (%s)",(id,))
    conn.commit()
    cursor.close()
    return "Inserted Successfully"
