'use strict';

exports.loginUser = function(username, password) {

  var examples = {};
  
  examples['application/json'] = "aeiou";
  

  
  if(Object.keys(examples).length > 0)
    return examples[Object.keys(examples)[0]];
  
}
exports.logoutUser = function() {

  var examples = {};
  

  
}
exports.createUser = function(body) {

  var examples = {};
  

  
}
exports.getUserByName = function(name) {

  var examples = {};
  
  examples['application/json'] = {
  "id" : 123456789,
  "lastName" : "諏訪賀",
  "phone" : "+81-90-9999-9999",
  "username" : "user1",
  "email" : "foo@example.com",
  "userStatus" : "1",
  "firstName" : "太郎",
  "password" : "pa55w0rd"
};
  

  
  if(Object.keys(examples).length > 0)
    return examples[Object.keys(examples)[0]];
  
}
