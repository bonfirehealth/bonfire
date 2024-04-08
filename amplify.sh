#!/bin/bash

AMPLIFY_PATH="lib/app"
AMPLIFY_APP_ID=""

echo "👷 [bonfirehealth] Amplify $1 for $2 environment..."
amplify env checkout $2

if [ $2 == "dev" ]; then
    echo "👷 [bonfirehealth] Setting amplify app id for $2 environment..."
    AMPLIFY_APP_ID="d22vba9ek59av5"
elif [ $2 == "stg" ]; then
    echo "👷 [bonfirehealth] Setting amplify app id for $2 environment..."
    AMPLIFY_APP_ID="d22vba9ek59av5"
else
    echo "👷 [bonfirehealth] Setting amplify app id for $2 environment..."
    AMPLIFY_APP_ID="d22vba9ek59av5"
fi

amplify $1 --appId $AMPLIFY_APP_ID --envName $2 -y $3

if [ $2 == "dev" ]; then
    echo "👷 [bonfirehealth] Renaming amplify config file..."
    mv "${AMPLIFY_PATH}/constants/amplifyconfiguration.dart" "${AMPLIFY_PATH}/constants/amplify_config_development.dart"
elif [ $2 == "stg" ]; then
    echo "👷 [bonfirehealth] Renaming amplify config file..."
    mv "${AMPLIFY_PATH}/constants/amplifyconfiguration.dart" "${AMPLIFY_PATH}/constants/amplify_config_staging.dart"
else
    echo "👷 [bonfirehealth] Renaming amplify config file..."
    mv "${AMPLIFY_PATH}/constants/amplifyconfiguration.dart" "${AMPLIFY_PATH}/constants/amplify_config_production.dart"
fi

if [ $1 == "pull" ]; then

    rm -r "${AMPLIFY_PATH}/models/"

    echo "👷 [bonfirehealth] Moving updated amplify generated models..."
    mv lib/models/ "${AMPLIFY_PATH}/"

    echo "👷 [bonfirehealth] Renaming amplify generated models..."
    for file in $AMPLIFY_PATH/models/*.dart; do
        echo "👷 [bonfirehealth] Processing ${file}..."
        fileName="${file##*/}"
        newFileName=$(echo "$fileName" | sed -r 's/([A-Z])/_\1/g' | sed 's/^_//')
        newFileName=$(echo "$newFileName" | tr '[:upper:]' '[:lower:]')
        for file2 in $AMPLIFY_PATH/models/*.dart; do
            fileName2="${file2##*/}"
            newFileName2=$(echo "$fileName2" | sed -r 's/([A-Z])/_\1/g' | sed 's/^_//')
            newFileName2=$(echo "$newFileName2" | tr '[:upper:]' '[:lower:]')
            echo "=== 💙 Renaming imports from ${fileName2} to ${newFileName2}..."
            sed "s/${fileName2}/${newFileName2}/Ig" "$file" >"${file}_tmp" && mv "${file}_tmp" "$file"
        done
    done

    for file in $AMPLIFY_PATH/models/*.dart; do
        echo "👷 [bonfirehealth] Processing ${file}..."
        sed "s/\?\['serializedData'\]//g" "$file" >"${file}_tmp" && mv "${file}_tmp" "$file"
        sed "s/\['serializedData'\]//g" "$file" >"${file}_tmp" && mv "${file}_tmp" "$file"
        sed "s/\] is List/\]\?\['items'\] is List/g" "$file" >"${file}_tmp" && mv "${file}_tmp" "$file"
        sed "s/\] as List/\]\?\['items'\] as List/g" "$file" >"${file}_tmp" && mv "${file}_tmp" "$file"
        fileName="${file##*/}"
        newFileName=$(echo "$fileName" | sed -r 's/([A-Z])/_\1/g' | sed 's/^_//')
        newFileName=$(echo "$newFileName" | tr '[:upper:]' '[:lower:]')
        echo "=== 💙 Renaming files from ${fileName} to ${newFileName}..."
        mv "$file" "${AMPLIFY_PATH}/models/${newFileName}"

    done

    echo "👷 [bonfirehealth] Running flutter pub get..."
    flutter pub get

    echo "👷 [bonfirehealth] Running flutter import_sorter:main..."
    flutter pub run import_sorter:main
fi
