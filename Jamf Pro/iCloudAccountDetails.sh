#!/bin/bash

####################################################################################################
# Grabs iCloud account details such as the Display Name and the Account ID     
# iCloud アカウントの詳細を取得する (表示名やアカウントID等)        
#                         
# Author: Magic Hat Inc. (Melinda Magyar、Natnicha Sangsasitorn)           
# 著者: 株式会社マジックハット（マジャル メリンダ、ナトニチャ サンサシトーン）
#
# Last modified: 2025/01/22
# 最終更新日: 2025年 1月 22日
####################################################################################################


loggedInUser=$(stat -f%Su /dev/console)

if [[ -e "/Users/$loggedInUser/Library/Preferences/MobileMeAccounts.plist" ]]; then
    iCloudAccount=$(defaults read /Users/$loggedInUser/Library/Preferences/MobileMeAccounts.plist Accounts | grep AccountID | cut -d '"' -f 2)

    if [ -z "$iCloudAccount" ]; then
        iCloudStatus="Disabled"
    else
        plistBuddy="/usr/libexec/PlistBuddy"
        displayName=$("$plistBuddy" -c "print :Accounts:0:DisplayName" /Users/$loggedInUser/Library/Preferences/MobileMeAccounts.plist 2> /dev/null)
        iCloudStatus="$iCloudAccount"
    fi
    
elif [[ -d "/Users/$loggedInUser/Library/Application Support/iCloud/Accounts" ]]; then
    iCloudAccount=$(sudo find "/Users/$loggedInUser/Library/Application Support/iCloud/Accounts" -type l -name '*@*' | awk -F'/' '{print $NF}')
    if [ -z "$iCloudAccount" ]; then
        iCloudStatus="Disabled"
    else
        iCloudStatus="$iCloudAccount"
    fi
else
    iCloudStatus="Didn't find the setting file."
fi

echo "<result>$iCloudStatus</result>"

exit 0
