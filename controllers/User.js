'use strict';

var url = require('url');


var User = require('./UserService');


module.exports.findUser = function findUser (req, res, next) {
  var tags = req.swagger.params['tags'].value;
  var limit = req.swagger.params['limit'].value;
  

  var result = User.findUser(tags, limit);

  if(typeof result !== 'undefined') {
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(result || {}, null, 2));
  }
  else
    res.end();
};
