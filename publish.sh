#!/bin/bash
# set -x

function get()
{
	node -e "process.stdout.write(require('./package.json').$1)"
}

function checkexists()
{
	npm view $PACKAGE@$VERSION version --loglevel silent > /dev/null;
	if [[ $? == 0 ]]; then
		echo "Exists";
		exit;
	fi
}

DATETIME=`date +%Y%m%d%H%M%S`
PACKAGE=$(get name)
VERSION=$(get version)

# Create alpha tag
if [[ $VERSION == *"alpha"* ]]; then
	VERSION="$VERSION$DATETIME";
	npm --no-git-tag-version version "$VERSION" > /dev/null;
fi

checkexists;

echo "New Version: $VERSION";

#npm publish;

git checkout package.json