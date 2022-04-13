#!/bin/bash

# Touch IDは有効するかどうかを確認

# Touch IDは端末のシステムがサポートされているかどうかを確認
touchIDfunctionality=$(/usr/bin/bioutil -rs | grep "Touch ID functionality")

if [[ -z $touchIDfunctionality ]]
then
    echo "<result>Unsupported</result>"
    exit 0
fi

# ログインしているユーザを使用としてTouch IDの発行数を確認
loginUser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')
numFingerPrint=$(/usr/bin/sudo -u "$loginUser" /usr/bin/bioutil -c | awk '/User/{print $3}')

#　Touch IDの発行数によってOn・Offというステタスを分ける
if [[ $numFingerPrint > 0 ]]
then
    echo "<result>On</result>"
else
    echo "<result>Off</result>"
fi