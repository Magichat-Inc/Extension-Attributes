#!/bin/sh

####################################################################################################
# Script for getting the HDD usage in GB      
# HDDの使用量を取得します。          
#                         
# Author: Magic Hat Inc. (Melinda Magyar)           
# 著者: 株式会社マジックハット (マジャル メリンダ)
#
# Last modified: 2024/04/26
# 最終更新日: 2024年 4月 26日
####################################################################################################

echo "<result>$(diskutil info / | awk '/Free Space|Available Space/ {print $4,$5}')</result>"

exit 0
