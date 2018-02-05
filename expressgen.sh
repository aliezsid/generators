#! /bin/bash

path=$1

if [ -z $path ];then
	echo "---Invalid Path---"
else
	mkdir -p $path	
	mkdir -p ${path}/models
	touch ${path}/server.js
	cd $path
	yarn init -y
	yarn add -D nodemon babel-cli babel-preset-env babel-preset-stage-2
	yarn add mongoose bcrypt jsonwebtoken express body-parser
	node $HOME/generators/babelrcgen.js . env stage-2
	node $HOME/generators/addtoscripts.js ./package.json dev "DEV_MODE=true nodemon --exec babel-node server.js"
	node $HOME/generators/addtoscripts.js ./package.json prod "nodemon --exec babel-node server.js" 
fi
