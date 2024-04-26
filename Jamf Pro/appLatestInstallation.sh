#!/bin/sh

####################################################################################################
# Get the latest installation date of an application    
# アプリケーションの最新のインストール日を取得します。                    
#   
# Author: Magic Hat Inc. (Melinda Magyar)             
# 著者: 株式会社マジックハット（マジャル メリンダ）
#
# Last modified: 2023/12/12
# 最終更新日: 2023年 12月 12日
####################################################################################################

# 例: /Applications/Okta\ Verify.app
applicationPath=/Applications/Okta\ Verify.app

installationDateInUTC=$(mdls -name kMDItemFSContentChangeDate "$applicationPath" -r)

installationDate=$(date -jf "%Y-%m-%d %H:%M:%S %z" "$installationDateInUTC" "+%Y-%m-%d %H:%M" -u -v9H)

echo "<result>$installationDate</result>"

exit 0
