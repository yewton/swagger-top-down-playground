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

module.exports.addPet = function addPet (req, res, next) {
  var pet = req.swagger.params['pet'].value;
  

  var result = Pet.addPet(pet);

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