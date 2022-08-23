#!/bin/sh

####################################################################################################
# Determine whether Find My Mac has been set on Mac      
# Mac で「Mac を探す」が設定されているかどうかを確認する          
#                         
# Author: Melinda Magyar (Magic Hat Inc.)             
# 著者: マジャル メリンダ（株式会社マジックハット）
#
# Last modified: 2022/08/23
# 最終更新日: 2022年 8月 23日
####################################################################################################

fmmToken=$(/usr/sbin/nvram -x -p | /usr/bin/grep "fmm-mobileme-token-FMM")

if [ -z "$fmmToken" ]; then
    echo "<result>Disabled</result>"
else
    echo "<result>Enabled</result>"
fi

exit 0
