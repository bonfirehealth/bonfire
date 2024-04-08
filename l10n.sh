#!/bin/bash

# Variables
LOCO_EXPORT_API_KEY=$(grep LOCO_EXPORT_API_KEY .env | cut -d '=' -f2)
LOCO_FULL_API_KEY=$(grep LOCO_FULL_API_KEY .env | cut -d '=' -f2)
OUTPUT_PATH="lib/app/l10n"

# Make dir
mkdir -p ${OUTPUT_PATH}/arb

# Remove old generated l10n files
rm lib/app/l10n/arb/*.arb

# Export translations from Google Sheets
wget "https://docs.google.com/spreadsheets/d/1jxIEeJQDoYC-VbvK2BwxVle0tosW-8bqgDH6yCkiktA/gviz/tq?tqx=out:csv&sheet=Localisations" -O "lib/app/l10n/translations.csv"

# Import translations into Loco
cat lib/app/l10n/translations.csv | curl -X POST -H "Authorization: Loco $LOCO_FULL_API_KEY" --data-binary @- "https://localise.biz/api/import/csv?index=text&locale=id"

# Export translations from Loco
echo "👷 [bonfirehealth] Exporting translations from Loco..."
curl -s -o "translated.zip" "https://localise.biz/api/export/archive/arb.zip?fallback=en&order=id&key=$LOCO_EXPORT_API_KEY"
unzip -qq "translated.zip" -d "l10n-temp"

for file in l10n-temp/*/*/*.arb; do
    echo "👷 [bonfirehealth] Renaming ${file}..."
    fileName="${file##*/}"
    locale="${fileName##*_}"
    localeName="app"
    sed 's/"type": "string",//g' "$file" >"${file}_tmp" && mv "${file}_tmp" "$file"
    mv "$file" "${OUTPUT_PATH}/arb/${localeName}_${locale}"
done

# Generate Dart files with translations
echo "👷 [bonfirehealth] Generating Dart files with translations..."
flutter pub get

# Cleanup
echo "👷 [bonfirehealth] Cleaning up..."
rm translated.zip
rm -rf l10n-temp
rm lib/app/l10n/translations.csv

# Echo the generation completed message
echo "👷 [bonfirehealth] l10n generation completed"
