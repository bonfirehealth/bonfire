#!/bin/bash

echo "💎 [bonfirehealth] Checkout GitHub develop branch..."
git checkout develop

echo "💎 [bonfirehealth] Generating assets..."
#./generate.sh

echo "💎 [bonfirehealth] Bumping new version for $1 changes..."
cider bump $1 --bump-build
new_version=$(cider version)
version_name=$(cut -d\+ -f1 <<<$new_version)
build_number=$(echo "$new_version" | sed 's/.*+//')
cider release

echo "💎 [bonfirehealth] Updating and pushing app version $new_version to GitHub develop branch..."
git add .
git commit -m "[C/Pubspec] Updated app version $new_version"
git push -u origin develop

echo "💎 [bonfirehealth] Merging to GitHub develop branch into staging branch..."
git checkout staging
git merge develop --no-edit
git push -u origin staging

echo "💎 [bonfirehealth] Pushing to GitHub stagings/$new_version branch..."
git fetch --all
git checkout -b staging/$new_version
git push -u origin staging/$new_version

echo "💎 [bonfirehealth] Merging to GitHub staging branch into master branch..."
git checkout master
git merge staging --no-edit
git push -u origin master

echo "💎 [bonfirehealth] Pushing to GitHub releases/$new_version branch..."
git checkout -b releases/$new_version
git push -u origin releases/$new_version

./build_deploy.sh web release staging $version_name $build_number #&& ./build_deploy.sh web release production $version_name $build_number

# ./build_deploy.sh appbundle release staging $version_name $build_number && ./build_deploy.sh appbundle release production $version_name $build_number

# ./build_deploy.sh ios release staging $version_name $build_number && ./build_deploy.sh ios release production $1 $build_number



git checkout develop
cider describe $new_version
