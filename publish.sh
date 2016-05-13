#!/bin/bash
# set -x

#Fail fast
set -e

#force our publishes to go to our repo, just in case the env or package has not specified it.
REGISTRY="--registry https://npm.nextthought.com/"
#publish and only log warn/errors
LOGLEVEL="--no-progress --quiet"
#optionaly tag "alpha" instead of "latest"
TAG=


function get()
{
	node -e "process.stdout.write(require('./package.json').$1)"
}

function checkBranch ()
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

function checkExists()
{
	local versions=`npm view $PACKAGE@$VERSION version --silent`;
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

function maybeTagVersion()
{
	# Create alpha tag
	if [[ $VERSION == *"alpha"* ]]; then
		VERSION="$VERSION$DATETIME";
		npm --no-git-tag-version version "$VERSION" > /dev/null;
		TAG='--tag alpha'
	fi
}

DATETIME=`date +%Y%m%d%H%M%S`
PACKAGE=$(get name)
VERSION=$(get version)

maybeTagVersion;
checkBranch;
checkExists;

echo "New Version: $VERSION";

npm publish $TAG $LOGLEVEL $REGISTRY;

git checkout package.json
