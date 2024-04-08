#!/bin/bash

if [ $1 == "web" ]; then
    echo "👷 [bonfirehealth] Copy index.html to web folder for $3 environment..."
    cp configs/index_$3.html web/index.html

    echo "👷 [bonfirehealth] Copy manifest.json to web folder for $3 environment..."
    cp configs/manifest_$3.json web/manifest.json

    echo "👷 [bonfirehealth] Building flutter $1 app (v$4+$5) into $2 mode for $3 environment..."
    flutter build $1 --$2 --flavor $3 --build-name=$4 --build-number=$5 -t "lib/main_$3.dart" --web-renderer html

    if [ $3 == "development" ]; then
        echo "👷 [bonfirehealth] Deploying amplify development project..."

    elif [ $3 == "staging" ]; then
        echo "👷 [bonfirehealth] Deploying amplify staging project..."

    else
        echo "👷 [bonfirehealth] Deploying amplify production project..."

    fi
else
    echo "👷 [bonfirehealth] Building flutter $1 app (v$4+$5) into $2 mode for $3 environment..."
    flutter build $1 --$2 --flavor $3 --build-name=$4 --build-number=$5 -t "lib/main_$3.dart"

    echo "👷 [bonfirehealth] Deploying flutter $1 app (v$4+$5) into $2 mode for $3 environment..."
    if [ $1 == "appbundle" ]; then
        cd android && bundle exec fastlane $3 version_name:"$4 ($5)" build_number:$5 --verbose
    elif [ $1 == "ios" ]; then
        cd ios && bundle exec fastlane $3 version_name:$4 build_number:$5 --verbose
    fi
fi

cd ..
