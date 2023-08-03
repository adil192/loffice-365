# Add the local node_modules folder to the path
NODE_MODULES="$(pwd)/node_modules/.bin"
export PATH="${NODE_MODULES}:${PATH}"
