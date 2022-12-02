const Post = require('../models/post');

const ErrorHandler = (err)=>{
    var errors = {}
    if(err.message.includes('Post validation failed')){
        Object.values(err.errors).forEach(({properties})=>{
            errors[properties.path]=properties.message;
        })
    }
    return errors;
}

const getposts = async(req, res) => {
    // get all posts
    var posts = await Post.find().sort({createdAt:-1});
    res.send(posts);
}
const getpost = async(req, res) => {
    // get post by id
    var post = await Post.findById(req.params.id);
    res.render('Posts/show',{post:post});
}
const updatepost = async(req, res) => {
    // update post by id
    var post = await Post.findByIdAndUpdate(req.params.id,req.body);
    res.redirect('/posts');
}

const deletepost = async(req, res) => {
    // delete post by id
    var post = await Post.findByIdAndDelete(req.params.id);
    res.send(post);
}

const createpostpage = async(req, res) => {
    // render create post page  
    res.render('Posts/create');
}
const createpost = async(req, res) => {
    // add post
    try{
        var post = await Post.create(req.body);
        res.redirect('/posts');
    }
    catch(err){
        const errors = ErrorHandler(err);
        res.status(400).send(errors);
    }
}
module.exports = {
    getposts,
    getpost,
    updatepost,
    deletepost,
    createpostpage,
    createpost
}