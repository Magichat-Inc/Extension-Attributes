#!/bin/sh

####################################################################################################
# Script for getting the HDD usage in GB      
# HDDの使用量を得る            
#                         
# Author: Melinda Magyar (Magic Hat Inc.)             
# 著者: マジャル メリンダ（株式会社マジックハット）
#
# Last modified: 2022/07/08
# 最終更新日: 2022年 7月 8日
####################################################################################################

echo "<result>$(diskutil info / | awk '/Free Space|Available Space/ {print $4,$5}')</result>"

exit 0