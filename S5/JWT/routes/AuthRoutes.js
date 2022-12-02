const express=require('express')
const router=express.Router();
const { user } = require("../controller/userController");

router.get('/login',user.login)
router.post('/login',user.loginpost)
router.get('/register',user.register)
router.post('/register',user.registerpost)
router.get('/logout',user.logout)

module.exports=router