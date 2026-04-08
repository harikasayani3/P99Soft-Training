from flask import Flask,render_template,request,jsonify
app=Flask(__name__)

users=["Alice","Bob"]

#for entry page
@app.route("/")
def home():
    return "<h2>Home Page</h2>"

#checking for get request
@app.route("/users",methods=["GET"])
def get_users():
    return jsonify({"users":users})

#checking for post request
@app.route("/users",methods=["POST"])
def add_users():
    data=request.json
    name=data.get("name")
    users.append(name)
    return "New user created"

if __name__=="__main__":
    app.run(debug=True)