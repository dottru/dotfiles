console.log(' --------------- ');
console.log(' Initialising github. ');

var repl = require('repl').start(),
	mods = ["os", "fs", "github"];

var Github = require('github');

var InitHub = module.exports = function(user, pass) {
	this.hub = new Github({
		// required
		version: "3.0.0",
		// optional
		timeout: 5000
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

repl.context.git = new InitHub('jmkogut','lolhax12#');

var f = new InitHub('jmkogut','lolhax12#');
f.upload( whatevs );




