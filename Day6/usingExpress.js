const express=require('express');
const app=express();
const user=[{id:1,name:"harika"}]
app.use(express.json())
app.get("/",(req,res)=>{
    res.send("Hello, Welcome");
});
app.get('/not-found',(req,res)=>{
    res.status(404).send("This page does not exist");
})
app.get('/users',(req,res)=>{
    res.json(user);
})
app.post('/users',(req,res)=>{
    user.push(req.body);
    res.send("data received");
})
app.listen(3000,()=>{
    console.log(`listening at the port ${3000}...`);
});