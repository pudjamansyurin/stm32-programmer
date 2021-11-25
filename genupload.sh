#!/bin/bash
source .env
source "./gencrc.sh"

echo "FTP uploading (${APP_BIN_FILE}) ..."
$CURL -T $APP_BIN_FILE "ftp://$FTP_HOST/$DEV/" --user "$FTP_USERNAME:$FTP_PASSWORD" || exit 1

echo "FTP uploading (${CRC_BIN_FILE}) ..."
$CURL -T $CRC_BIN_FILE "ftp://$FTP_HOST/$DEV/" --user "$FTP_USERNAME:$FTP_PASSWORD" || exit 1

echo "FTP uploading (${CRCAPP_BIN_FILE}) ..."
$CURL -T $CRCAPP_BIN_FILE "ftp://$FTP_HOST/$DEV/" --user "$FTP_USERNAME:$FTP_PASSWORD" || exit 1

echo "FTP done, ready for FOTA."

