const express=require('express')
const router=express.Router();
const post = require("../controller/postController");
const Authenticate = require('../middleware/AuthMiddleware');

router.get('/posts',Authenticate,post.getposts)
router.get('/post/:id',Authenticate,post.getpost)
router.put('/post/:id',Authenticate,post.updatepost)
router.delete('/post/:id',Authenticate,post.deletepost)
router.get('/createpost',Authenticate,post.createpostpage)
router.post('/creatpost',Authenticate,post.createpost)

module.exports=router 