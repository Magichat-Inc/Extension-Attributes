#!/bin/sh

####################################################################################################
# Safari Build Version
# Safariのビルドバージョンを取得します。
#                         
# Author: Magic Hat Inc. (Melinda Magyar)           
# 著者: 株式会社マジックハット (マジャル メリンダ)
#
# Last modified: 2024/04/26
# 最終更新日: 2024年 4月 26日
####################################################################################################

if [ -d /Applications/Safari.app ] ; then
    RESULT=$(plutil -p "/Applications/Safari.app/Contents/Info.plist" | grep "CFBundleVersion" |sed 's/.*> //g' | tr -d '"')
    echo "<result>$RESULT</result>"
else
    echo "<result>Not Installed</result>"
fi

exit 0
