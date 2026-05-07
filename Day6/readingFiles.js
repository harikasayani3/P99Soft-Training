const fs=require('fs');
fs.readFile('./example.txt',{encoding:'utf-8',flag:'r'},(err,data)=>{
    if(err){
        console.log(err);
    }
    else{
        console.log(data);
    }
})
try{
    const data=fs.readFileSync('./example.txt',{encoding:'utf-8',flag:'r'});
    console.log(data);
}
catch(err){
    console.log(err);
}
