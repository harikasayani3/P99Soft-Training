const http=require('http');
const server=http.createServer((req,res)=>{
    res.writeHead(200,{'Content-Type':'text/html'});
    const url=req.url;
    if(url=='/users'){
        res.end('<h1>This page belongs to users details</h1>');
    }
    else if(url=='/products'){
        res.end('<h1>This page belongs to products page</h1>');
    }
    else if(url=='/'){
        res.end('<h1>Welocome to the main page</h1>');
    }
}).listen(3000,()=>{
    console.log(`Server is running at 3000 port....`);
})