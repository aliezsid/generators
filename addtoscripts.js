const path = require("path");
const fs = require("fs");

const file = process.argv[2];
const tag = process.argv[3];
const value = process.argv[4];

const json = require(path.resolve(file));

if (!json.scripts) {
	json.scripts = {};
}

json.scripts[tag] = value;

fs.writeFile(path.resolve(file), JSON.stringify(json, null, 2), function(err) {
	if (err) {
		console.error(err);
		return;
	}
	console.log("Done adding to package.json");
});
