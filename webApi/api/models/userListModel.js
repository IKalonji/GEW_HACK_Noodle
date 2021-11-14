
'use strict';
var mongoose = require('mongoose');
var Schema = mongoose.Schema;


var UserSchema = new Schema({
  name: {
    type: String,
    required: 'Kindly enter the name of the user'
  },
  Created_date: {
    type: Date,
    default: Date.now
  },
  premiums: {
    type: [{
      type: String,
      enum: ['none', 'basic', 'gold']
    }],
    default: ['none']
  }
});

module.exports = mongoose.model('Users', UserSchema);