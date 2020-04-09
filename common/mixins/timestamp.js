'use strict';

module.exports = function(Model) {
  // Model is the model class
  // options is an object containing the config properties from model definition
  Model.defineProperty('createdAt', {type: Date, default: '$now'});
  Model.defineProperty('updatedAt', {type: Date, default: '$now'});

  /** define property will define these fields when model will be created */
  /** to set updated at we need observe model and need to set it manually */
  Model.observe('before save', (ctx, next) => {
    if (ctx.instance) {
      ctx.instance['updatedAt'] = new Date();
    } else {
      ctx.data['updatedAt'] = new Date();
    }
    return next();
  });
};

