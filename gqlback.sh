#! /bin/bash

path=$1

if [ -z $path ];then
	echo "---Invalid Path---"
else
	mkdir -p $path	
	mkdir -p ${path}/models
	mkdir -p ${path}/models/data
	touch ${path}/server.js
	touch ${path}/models/schema.js
	touch ${path}/models/resolvers.js
	touch ${path}/models/data/UserModel.js
	cd $path
	yarn init -y
	yarn add -D nodemon babel-cli babel-preset-env babel-preset-stage-2
	yarn add mongoose bcrypt jsonwebtoken express graphql apollo-server-express body-parser graphql-tools
	node $HOME/generators/babelrcgen.js . env stage-2
	node $HOME/generators/addtoscripts.js ./package.json dev "DEV_MODE=true nodemon --exec babel-node server.js"
	node $HOME/generators/addtoscripts.js ./package.json prod "nodemon --exec babel-node server.js" 
fi
