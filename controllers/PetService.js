'use strict';

exports.findPets = function(tags, limit) {

  var examples = {};
  
  examples['application/json'] = [ "" ];
  

  
  if(Object.keys(examples).length > 0)
    return examples[Object.keys(examples)[0]];
  
}
exports.updatePet = function(body) {

  var examples = {};
  
  examples['application/json'] = {
  "message" : "aeiou",
  "code" : 123
};
  

  
  if(Object.keys(examples).length > 0)
    return examples[Object.keys(examples)[0]];
  
}
exports.addPet = function(body) {

  var examples = {};
  
  examples['application/json'] = "";
  

  
  if(Object.keys(examples).length > 0)
    return examples[Object.keys(examples)[0]];
  
}
exports.findPetById = function(id) {

  var examples = {};
  
  examples['application/json'] = "";
  

  
  if(Object.keys(examples).length > 0)
    return examples[Object.keys(examples)[0]];
  
}
exports.updatePetWithFoorm = function(id, name, status) {

  var examples = {};
  
  examples['application/json'] = "";
  

  
  if(Object.keys(examples).length > 0)
    return examples[Object.keys(examples)[0]];
  
}
exports.deletePet = function(id) {

  var examples = {};
  

  
}
exports.uploadFile = function(id, file, additionalMetadata) {

  var examples = {};
  
  examples['application/json'] = {
  "message" : "aeiou",
  "code" : 123,
  "type" : "aeiou"
};
  

  
  if(Object.keys(examples).length > 0)
    return examples[Object.keys(examples)[0]];
  
}
