#!/bin/zsh

####################################################################################################
# Gets the card type.
# カードの種類を取得します。
# 
#                         
# Author: Magic Hat Inc. (Melinda Magyar)           
# 著者: 株式会社マジックハット (マジャル メリンダ)
#
#
# Last modified: 2025/02/05
# 最終更新日: 2025年 02月 05日
####################################################################################################

cardType=$(system_profiler SPAirPortDataType | grep "Card Type" | awk -F': ' '{print $2}')

echo "<result>$cardType</result>"

exit 0
