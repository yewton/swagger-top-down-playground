'use strict';

var url = require('url');


var Default = require('./DefaultService');


module.exports.findPets = function findPets (req, res, next) {
  var tags = req.swagger.params['tags'].value;
  var limit = req.swagger.params['limit'].value;
  

  var result = Default.findPets(tags, limit);

  if(typeof result !== 'undefined') {
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(result || {}, null, 2));
  }
  else
    res.end();
};

module.exports.addPet = function addPet (req, res, next) {
  var pet = req.swagger.params['pet'].value;
  

  var result = Default.addPet(pet);

  if(typeof result !== 'undefined') {
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(result || {}, null, 2));
  }
  else
    res.end();
};

module.exports.findPetById = function findPetById (req, res, next) {
  var id = req.swagger.params['id'].value;
  

  var result = Default.findPetById(id);

  if(typeof result !== 'undefined') {
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(result || {}, null, 2));
  }
  else
    res.end();
};

module.exports.deletePet = function deletePet (req, res, next) {
  var id = req.swagger.params['id'].value;
  

  var result = Default.deletePet(id);

  if(typeof result !== 'undefined') {
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(result || {}, null, 2));
  }
  else
    res.end();
};
