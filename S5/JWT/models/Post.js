const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const PostSchema = new Schema({
  Title: {
    type: String,
    required: [true,"Title is required"],
  },
  Content: {
    type: String,
    required: [true,"Content is required"],
    minlength:[8,"Content must be at least 8 characters"],
  },
}, { timestamps: true });



PostSchema.post('save', function ( doc, next ) {
  console.log('Post saved');
  next();
});
  

const Post = mongoose.model('Post', PostSchema);
module.exports = Post;