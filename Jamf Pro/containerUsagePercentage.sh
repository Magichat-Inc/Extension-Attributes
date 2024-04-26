#!/bin/sh

####################################################################################################
# Script for getting the HDD usage in percentage      
# HDDの使用率を取得します。         
#                         
# Author: Magic Hat Inc. (Melinda Magyar)           
# 著者: 株式会社マジックハット (マジャル メリンダ)
#
# Last modified: 2024/04/26
# 最終更新日: 2024年 4月 26日
####################################################################################################

used_percentage=$(df -H | grep -w "/System/Volumes/Data$"  | awk '{print $5}')

echo "<result>$used_percentage</result>"

exit 0
