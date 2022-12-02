// import user model\
const User = require('../models/User');

// TODO: login user
const ErrorHandler = (err)=>{
    var errors = {}
    if(err.message.includes('User validation failed')){
        Object.values(err.errors).forEach(({properties})=>{
            errors[properties.path]=properties.message;
        })
        // duplicate key error
        
    }
    if(err.code===11000){
        errors.username="Username already exists"
    }
    return errors;
}

const getToken = (id)=>{
    const token = jwt.sign({id:id},process.env.JWT_KEY,{expiresIn:'1h'})
    return token;
}




const login = async(req, res) => {
    console.log('login');
    // render login page
    res.render('Auth/login');
}
const register = async(req, res) => {
}

const loginpost = async(req, res) => {
    try{
        const user = await User.login(req.body.username,req.body.password)
        // get token
        var token = getToken(user);
        // send token to client
        res.cookie('jwt',token,{httpOnly:true,maxAge:60000});
        console.log(token);
        res.status(200).json([{user:user},{token:token}]);
    }
    catch(err){
        console.log(err);
        res.status(400).send(err);
    }
}
const registerpost = async(req, res) => {
    // insert user into database
    try{
    var user = await User.create(req.body);
    res.status(200).json(user);
    }
    catch(err){
        const errors = ErrorHandler(err);
        res.status(400).send(errors);
    }
}
const logout = async(req, res) => {
    res.cookie('jwt', '', { maxAge: 1 });
    res.redirect('/login');
}
exports.user = {
    login,
    register,
    loginpost,
    registerpost,
    logout
}
