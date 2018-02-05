const path = require("path");
const fs = require("fs");

const filePath = process.argv[2];
const file = path.join(filePath, ".babelrc");
const tags = process.argv.slice(3);
console.log(tags);

const babelrc = {};

babelrc.presets = [...tags];

fs.writeFile(file, JSON.stringify(babelrc, null, 2), err => {
	if (err) {
		console.error(err);
		return;
	}
	console.log("babelrc created");
});
