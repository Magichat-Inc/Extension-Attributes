#!/bin/sh

####################################################################################################
# Determine whether Find My Mac has been set on Mac      
# Mac で「Mac を探す」が設定されているかどうかを確認します。   
#                         
# Author: Magic Hat Inc. (Melinda Magyar)           
# 著者: 株式会社マジックハット (マジャル メリンダ)
#
# Last modified: 2024/04/26
# 最終更新日: 2024年 4月 26日
####################################################################################################

fmmToken=$(/usr/sbin/nvram -x -p | /usr/bin/grep "fmm-mobileme-token-FMM")

if [ -z "$fmmToken" ]; then
    echo "<result>Disabled</result>"
else
    echo "<result>Enabled</result>"
fi

exit 0
