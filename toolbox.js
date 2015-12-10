(function() {
  'use strict';
  var f = require('fs');

  function isFile(route) {
    var arr;
    if (f.existsSync(route) && f.stat(route).isFile()) {
      return true;
    } else {
      if (route[route.length] === '/') {
        return true;
      }
    }
    return false;
  }

  function touch(txt, route) {
    if (!f.existsSync(route)) {
      f.writeFile(route, txt, function(e) {
        if (e) {
          console.log('toolbox.touch: writeFile error at ' + route + '.\n');
        }
      });
    }
  }

  function mkdir(route) {
    if (!f.existsSync(route)) {
      f.mkdirSync(route);
    }
  }

  function rm(route) {
    if (!f.existsSync(route)) {
      isFile(route) ? f.unlinkSync(route) : f.rmdirSync(route);
    }
  }
  
  exports.isFile = isFile;
  exports.rm = rm;
  exports.mkdir = mkdir;
  exports.touch = touch;
})();

