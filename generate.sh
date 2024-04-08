#!/bin/bash

echo "👷 [bonfirehealth] Generating amplify backend config..."
./amplify.sh pull dev

echo "👷 [bonfirehealth] Generating l10n assets..."
echo "👷 Ignoring generate l10n from loco..."
#./l10n.sh

echo "👷 [bonfirehealth] Running flutter pub get..."
flutter pub get

echo "👷 [bonfirehealth] Generating data models code generation..."
flutter pub run build_runner build --delete-conflicting-outputs

echo "👷 [bonfirehealth] Sorting flutter codebase imports..."
flutter pub run import_sorter:main
