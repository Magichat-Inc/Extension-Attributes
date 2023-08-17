#!/bin/sh

####################################################################################################
# Safari Build Version
# Safariのビルドバージョンを取得する
#                         
# Author: Magic Hat Inc. (Melinda Magyar)           
# 著者: 株式会社マジックハット (マジャル メリンダ)
#
# Last modified: 2023/01/18
# 最終更新日: 2023年 1月 18日
####################################################################################################

if [ -d /Applications/Safari.app ] ; then
    RESULT=$(plutil -p "/Applications/Safari.app/Contents/Info.plist" | grep "CFBundleVersion" |sed 's/.*> //g' | tr -d '"')
    echo "<result>$RESULT</result>"
else
    echo "<result>Not Installed</result>"
fi

exit 0
