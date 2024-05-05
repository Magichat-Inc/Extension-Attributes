#!/bin/sh

####################################################################################################
# Get PPPC (Screen Recording) value
# PPPCの設定値(画面収録)を取得します。
#
# Author: Magic Hat Inc. (Melinda Magyar)             
# 著者: 株式会社マジックハット（マジャル メリンダ）
#
# Last modified: 2024/04/22
# 最終更新日: 2024年 4月 22日
#
# Reference (参考): https://www.rainforestqa.com/blog/macos-tcc-db-deep-dive#all-services
####################################################################################################

# PPPC service name
# PPPC サービス名
service="kTCCServiceScreenCapture"
# Get Bundle Identifier of the app
# 対象アプリのBundle ID
app="com.tinyspeck.slackmacgap"

# Get data from database
# DBからデータを取得する
database_data=$(sqlite3 '/Library/Application Support/com.apple.TCC/TCC.db' 'SELECT service,client,auth_value FROM access WHERE service="'"$service"'" AND client="'"$app"'"')

if [[ -z $database_data ]]; then
    echo "<result>Error: Unable to read TCC.db or database is empty.</result>"
    exit 1
fi

# Value from the database record
# DBからの値
value=$(echo "$database_data" | awk -F "|" '{print $3}')

case $value in
    0)
        echo "<result>OFF</result>" ;;
    1)
        echo "<result>不明</result>" ;;
    2)
        echo "<result>ON</result>" ;;
    3)
        echo "<result>ON (Limited)</result>" ;;
    *)
        echo "<result>無効な値</result>" ;;
esac

exit 0
