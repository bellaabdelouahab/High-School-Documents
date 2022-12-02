const express = require('express')
require('dotenv').config()
const db=require('mongoose')
const cookieParser = require('cookie-parser');
const app=express();  


app.use(express.json())
app.use(express.urlencoded({extended:true}))
app.use(express.static('public'))
app.use(cookieParser());
app.set('view engine', 'pug')
db.connect(process.env.DB_KEY,{useNewUrlParser:true})
db.Promise=global.Promise;
app.use(require('./routes/AuthRoutes'))
app.use(require('./routes/PostRoutes'))
app.get('/',(req,res)=>{
    res.render('Posts/index')
})

const server = app.listen(process.env.PORT || 5000,()=>{
    console.log('api listeningat : http://localhost:5000')
    
})
