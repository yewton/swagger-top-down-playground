'use strict';

var url = require('url');


var Pet = require('./PetService');


module.exports.findPets = function findPets (req, res, next) {
  var tags = req.swagger.params['tags'].value;
  var limit = req.swagger.params['limit'].value;
  

  var result = Pet.findPets(tags, limit);

  if(typeof result !== 'undefined') {
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(result || {}, null, 2));
  }
  else
    res.end();
};

module.exports.updatePet = function updatePet (req, res, next) {
  var body = req.swagger.params['body'].value;
  

  var result = Pet.updatePet(body);

  if(typeof result !== 'undefined') {
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(result || {}, null, 2));
  }
  else
    res.end();
};

module.exports.addPet = function addPet (req, res, next) {
  var body = req.swagger.params['body'].value;
  

  var result = Pet.addPet(body);

  if(typeof result !== 'undefined') {
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(result || {}, null, 2));
  }
  else
    res.end();
};

module.exports.findPetById = function findPetById (req, res, next) {
  var id = req.swagger.params['id'].value;
  

  var result = Pet.findPetById(id);

  if(typeof result !== 'undefined') {
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(result || {}, null, 2));
  }
  else
    res.end();
};

module.exports.updatePetWithFoorm = function updatePetWithFoorm (req, res, next) {
  var id = req.swagger.params['id'].value;
  var name = req.swagger.params['name'].value;
  var status = req.swagger.params['status'].value;
  

  var result = Pet.updatePetWithFoorm(id, name, status);

  if(typeof result !== 'undefined') {
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(result || {}, null, 2));
  }
  else
    res.end();
};

module.exports.deletePet = function deletePet (req, res, next) {
  var id = req.swagger.params['id'].value;
  

  var result = Pet.deletePet(id);

  if(typeof result !== 'undefined') {
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(result || {}, null, 2));
  }
  else
    res.end();
};

module.exports.uploadFile = function uploadFile (req, res, next) {
  var id = req.swagger.params['id'].value;
  var file = req.swagger.params['file'].value;
  var additionalMetadata = req.swagger.params['additionalMetadata'].value;
  

  var result = Pet.uploadFile(id, file, additionalMetadata);

  if(typeof result !== 'undefined') {
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(result || {}, null, 2));
  }
  else
    res.end();
};
