#!/bin/zsh

####################################################################################################
# This script sets a value for a specific extension attribute.
# このスクリプトは、特定の拡張属性の値を設定します。
# 
#                         
# Author: Magic Hat Inc. (Melinda Magyar)           
# 著者: 株式会社マジックハット (マジャル メリンダ)
#
#
# Last modified: 2024/12/23
# 最終更新日: 2024年 12月 23日
####################################################################################################

# Define Client Credentials and Jamf Cloud URL
# Jamf Pro のURLとAPIロールとクライアント情報
url="https://インスタンス名.jamfcloud.com"
client_id="クライエントID"
client_secret="クライアントシークレット"

# Current user
# 現在のユーザー名を取得する
current_user=$( /usr/bin/stat -f "%Su" /dev/console )

# Grab UDID
# UDIDを取得する
computerUDID=$(/usr/sbin/system_profiler SPHardwareDataType | /usr/bin/awk '/Hardware UUID:/ { print $3 }')

# Set EA ID and value
# EAのIDと新しい価値を設定する
EA_id="17"
EA_value="$current_user@auth.workers-hub.com"

# Generate authentication (Access) token
# 認証トークンを生成する
getAccessToken() {
	response=$(curl --silent --location --request POST "${url}/api/oauth/token" \
 	 	--header "Content-Type: application/x-www-form-urlencoded" \
 		--data-urlencode "client_id=${client_id}" \
 		--data-urlencode "grant_type=client_credentials" \
 		--data-urlencode "client_secret=${client_secret}")
 	access_token=$(echo "$response" | plutil -extract access_token raw -)
 	token_expires_in=$(echo "$response" | plutil -extract expires_in raw -)
 	token_expiration_epoch=$(($current_epoch + $token_expires_in - 1))
}

# Check token expiration
# トークンの有効期限を確認する
checkTokenExpiration() {
 	current_epoch=$(date +%s)
    if [[ token_expiration_epoch -ge current_epoch ]]
    then
        echo "トークンは次の時間まで有効： " "$token_expiration_epoch"
    else
        echo "有効なトークンがありません。新しいトークンを取得します。"
        getAccessToken
    fi
}

# Invalidate token when done
# 完了したらトークンを無効化する
invalidateToken() {
	responseCode=$(curl -w "%{http_code}" -H "Authorization: Bearer ${access_token}" $url/api/v1/auth/invalidate-token -X POST -s -o /dev/null)
	if [[ ${responseCode} == 204 ]]
	then
		echo "トークンが正常に無効化されました。"
		access_token=""
		token_expiration_epoch="0"
	elif [[ ${responseCode} == 401 ]]
	then
		echo "トークンはすでに無効です。"
	else
		echo "トークンの無効化中に不明なエラーが発生しました。"
	fi
}

updateExtensionAttribute() {
    curl -k -s -H "Authorization: Bearer ${access_token}" $url/JSSResource/computers/udid/$computerUDID/subset/extension_attributes \
    -X PUT -H "Content-Type: application/xml" \
    -d "<computer><extension_attributes><extension_attribute><id>$EA_id</id><value>$EA_value</value></extension_attribute></extension_attributes></computer>"
}

# Functions - - - END
# スクリプト内で使う関数  - - -　ここから

# Call all functions
# すべての関数の呼び出しする
checkTokenExpiration
updateExtensionAttribute
invalidateToken

exit 0
