console.log(' --------------- ');
console.log(' Initialising github. ');

var repl = require('repl').start(),
	mods = ["os", "fs", "github"];


var InitHub = module.exports = function(user, pass) {
	this.hub = new Github({
		// required
		version: "3.0.0",
		// optional
		timeout: 5000
		#, username: user,
		#password: pass
	});

	this.keyfile = "~/.ssh/id_rsa.pub";
};

InitHub.prototype = {
	exits: function(cb) {
		var succ = false;
		cb ( succ );
	},

	upload: function(cb) {
		this.exits( cb );
	}
};

repl.context['hub'] = new InitHub('jmkogut','lolhax12#');
