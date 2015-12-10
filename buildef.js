(function() {
  'use strict';
  var tl, git, os;
  tl = require('./toolbox.js');
  git = require('nodegit');
  os = require('os');

  function Buildef(options) {
    return this.init(options);
  }

  Buildef.prototype = {
    init: function(options) {
      var i;
      this.os = os.type();
      console.log(this.os);
      this.options = {};
      if (options) {
        for (i = options.length - 1; i >= 0; i--) {
          this.options = options[i];
        }
      }
    },
    clone: function(repo, path, opt) {
      var errorAndAttemptOpen = function() {
        return git.Repository.open(path);
      };
      git.Clone(repo, path, opt).catch(errorAndAttemptOpen)
        .then(function(repository) {
          console.log('Is the repository bare? %s', Boolean(repository.isBare()));
        });
    }
  };
  module.exports = Buildef;
  var build = new Buildef({});
})();

