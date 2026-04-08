from flask import Flask,render_template,request,flash
import jwt
from datetime import datetime,timedelta

app=Flask(__name__)
users={
    "harika":"harika"
}
SECRET_KEY="1234"
@app.route('/')
def home():
    return render_template("login.html")

@app.route('/login',methods=['POST'])
def login():
    username=request.form.get("username")
    password=request.form.get("password")
    stored_password=users.get(username)
    if not stored_password or password!=stored_password:
        return "Invalid username or password"
    token=jwt.encode(
        {"user":username,"exp":datetime.utcnow()+timedelta(minutes=30)},
        SECRET_KEY,
        algorithm="HS256"
    )
    return f"login successful"
if __name__=="__main__":
    app.run(debug=True)