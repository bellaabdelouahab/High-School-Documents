const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const UserSchema = new Schema({
  username: {
    type: String,
    required: [true,"Username is required"],
    unique: true,
  }, 
  password: {
    type: String,
    required: [true,"Password is required"],
    minlength:[8,"Password must be at least 8 characters"],
    validate: [(val) =>  /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/.test(val),
    "The password must has at least 1 lowercase letter, 1 uppercase letter, 1 number and 1 special character"],
  },
}, { timestamps: true });

UserSchema.statics.login = async function (username, password) {
  const user = await this.findOne({username});
  if (user) {
    const auth = await user.comparePassword(password);
    if (auth) {
      return user;
    }
    throw Error('Incorrect password');
  }
  throw Error("Incorrect username or password");
};
UserSchema.methods.comparePassword = async function (password) {
  const user = this;
  return password === user.password;
};

UserSchema.post('save', function ( doc, next ) {
  console.log('User saved');
  next();
});
  

const User = mongoose.model('User', UserSchema);
module.exports = User;