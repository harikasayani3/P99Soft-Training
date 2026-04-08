from fastapi import FastAPI
from pydantic import BaseModel

app=FastAPI()

class Data(BaseModel):
    name:str
    age:int

@app.get("/")
def home():
    return "<h2>Home Page</h2>"

@app.post("/")
def add_user(body:int):
    return body

@app.post("/user/data")
def add_user_data(data:Data):
    return data