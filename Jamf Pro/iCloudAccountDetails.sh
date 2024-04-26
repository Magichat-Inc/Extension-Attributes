#!/bin/sh

####################################################################################################
# Grabs iCloud account details such as the Display Name and the Account ID     
# iCloud アカウントの詳細を取得します。 (表示名やアカウントID等)        
#                         
# Author: Magic Hat Inc. (Melinda Magyar)           
# 著者: 株式会社マジックハット (マジャル メリンダ)
#
# Last modified: 2024/04/26
# 最終更新日: 2024年 4月 26日
####################################################################################################

loggedInUser=$(stat -f%Su /dev/console)

if [[ -e "/Users/$loggedInUser/Library/Preferences/MobileMeAccounts.plist" ]]; then
    iCloudAccount=$(defaults read /Users/$loggedInUser/Library/Preferences/MobileMeAccounts.plist Accounts | grep AccountID | cut -d '"' -f 2)

    if [ -z "$iCloudAccount" ]; then
        iCloudStatus="Disabled"
    else
        plistBuddy="/usr/libexec/PlistBuddy"
        displayName=$("$plistBuddy" -c "print :Accounts:0:DisplayName" /Users/$loggedInUser/Library/Preferences/MobileMeAccounts.plist 2> /dev/null)
        iCloudStatus="$displayName, $iCloudAccount"
    fi
fi

echo "<result>$iCloudStatus</result>"

exit 0
