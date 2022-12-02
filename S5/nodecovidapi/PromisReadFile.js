const fs= require("fs").promises;
async function copy(source, target,format) {
    try {
        const data = await fs.readFile(source,format);
        await fs.writeFile(target, data, (err) => {
        if(err) throw err;
        console.log('file saved');
    });
    } catch (error) {
        console.log(error);
    }
    
}
copy("Promisme.txt","Promisme-copy.555t","utf-8");
console.log("Fine ....");

