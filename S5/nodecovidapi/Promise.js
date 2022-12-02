const fs= require("fs");

readFilePromise = (file,format) => {
    return new Promise((resolve,reject)=>{
        // read file
        fs.readFile(file,format,(err,data)=>{
            if(err){
                reject(err);
            }
            resolve(data);
        });
    })
}


readFilePromise("Promisme.txt","utf-8").then((data) => {
    console.log(data);
}
).catch((err) => {
    console.log(err);
}
)