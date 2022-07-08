#!/bin/sh

####################################################################################################
# Script for getting the HDD usage in percentage      
# HDDの使用率を得る            
#                         
# Author: Melinda Magyar (Magic Hat Inc.)             
# 著者: マジャル メリンダ（株式会社マジックハット）
#
# Last modified: 2022/07/08
# 最終更新日: 2022年 7月 8日
####################################################################################################

used_percentage=$(df -H | grep -w "/System/Volumes/Data$"  | awk '{print $5}')

echo "<result>$used_percentage</result>"

exit 0