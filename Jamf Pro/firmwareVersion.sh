#!/bin/zsh

####################################################################################################
# Gets the network firmware version.
# ネットワーク ファームウェアのバージョンを取得します。
# 
#                         
# Author: Magic Hat Inc. (Melinda Magyar)           
# 著者: 株式会社マジックハット (マジャル メリンダ)
#
#
# Last modified: 2025/02/05
# 最終更新日: 2025年 02月 05日
####################################################################################################

networkFirmwareVersion=$(system_profiler SPAirPortDataType | grep "Firmware Version" | awk -F 'Firmware Version: ' '{print $2}')

echo "<result>$networkFirmwareVersion</result>"

exit 0
