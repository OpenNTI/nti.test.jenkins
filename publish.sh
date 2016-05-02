#!/bin/bash
# set -x

function checkbranch ()
{
	# local BRANCHES=`git branch --contains $1`;
	local CURRENT=`git rev-parse --abbrev-ref HEAD`;
	if [[ $CURRENT == "HEAD" ]]; then
		(>&2 echo "Error: In detached head state. No known branch.");
		exit;
	fi

	if [[ $CURRENT == "feature/"* ]]; then
		echo "Ignoring feature branches";
		exit;
	fi
}

function get()
{
	node -e "process.stdout.write(require('./package.json').$1)"
}

function checkexists()
{
	local versions=`npm view $PACKAGE@$VERSION version --loglevel silent`;
	if [ -n "$versions" ]; then
		echo "Package Exists; Checking version...";
		if [[ $versions != "undefined" ]]; then
			echo "$PACKAGE@$VERSION Exists ($versions)";
			exit;
		fi
	else
		echo "$PACKAGE does not have any versions published";
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

checkbranch;
checkexists;

echo "New Version: $VERSION";

#npm publish;

git checkout package.json