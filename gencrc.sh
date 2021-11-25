#!/bin/bash
source .env

echo "Removing cached files..."
rm -rf dist/
mkdir dist
sleep 2

echo "Copy APP & BL file..."
cp $APP_SRC_FILE $APP_BIN_FILE || exit 1
cp $BL_SRC_FILE $BL_BIN_FILE || exit 1
sleep 2 

echo "Calculating CRC..."
CRC_RESULT=$($JACKSUM -a crc32_mpeg2 -E hexup -F "#CHECKSUM" $APP_BIN_FILE) || exit 1
echo $CRC_RESULT > $CRC_STR_FILE 
$XXD -r -p $CRC_STR_FILE | $XXD -e -g4 | $XXD -r > $CRC_BIN_FILE || exit 1
sleep 2

echo "CRC = 0x$CRC_RESULT"
sleep 2

echo "Merge CRC to APP file..."
cat $CRC_BIN_FILE $APP_BIN_FILE > $CRCAPP_BIN_FILE || exit 1
sleep 2 
