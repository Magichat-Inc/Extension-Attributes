#!/bin/zsh

####################################################################################################
# Gets the device model number.
# デバイスの機器番号を取得します。
# 
#                         
# Author: Magic Hat Inc. (Melinda Magyar)           
# 著者: 株式会社マジックハット (マジャル メリンダ)
#
#
# Last modified: 2025/02/05
# 最終更新日: 2025年 02月 05日
####################################################################################################

modelNumber=$(system_profiler SPHardwareDataType | grep "Model Number" | awk -F ': ' '{print $2}')

echo "<result>$modelNumber</result>"

exit 0
