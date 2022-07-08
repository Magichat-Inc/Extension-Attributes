#!/bin/sh

##Get the wireless port ID
WirelessPort=$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')

echo $WirelessPort

##Collect new preferred wireless network inventory and send back to the JSS
PreferredNetworks=$(networksetup -listpreferredwirelessnetworks "$WirelessPort" | awk -F'\t' '{print $2}')

echo "<result>$PreferredNetworks</result>"