# Add the local node_modules folder to the path
NODE_MODULES="$(pwd)/node_modules/.bin"
export PATH="${NODE_MODULES}:${PATH}"

# Unmaintained warning
echo "WARNING: This project is powered by nativefier (https://github.com/nativefier/nativefier) which is no longer maintained."
echo "This project will continue to work for now, but will break in the future and won't receive any security updates."
echo -ne "\n\n"
