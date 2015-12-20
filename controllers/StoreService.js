'use strict';

exports.getInventry = function() {

  var examples = {};
  
  examples['application/json'] = { };
  

  
  if(Object.keys(examples).length > 0)
    return examples[Object.keys(examples)[0]];
  
}
exports.placeOrder = function(body) {

  var examples = {};
  
  examples['application/json'] = {
  "id" : 123456789,
  "petId" : 123456789,
  "complete" : true,
  "status" : "aeiou",
  "quantity" : 123,
  "shipDate" : "2015-12-20T10:18:00.196+0000"
};
  

  
  if(Object.keys(examples).length > 0)
    return examples[Object.keys(examples)[0]];
  
}
exports.getOrderById = function(orderId) {

  var examples = {};
  
  examples['application/json'] = {
  "id" : 123456789,
  "petId" : 123456789,
  "complete" : true,
  "status" : "aeiou",
  "quantity" : 123,
  "shipDate" : "2015-12-20T10:18:00.201+0000"
};
  

  
  if(Object.keys(examples).length > 0)
    return examples[Object.keys(examples)[0]];
  
}
