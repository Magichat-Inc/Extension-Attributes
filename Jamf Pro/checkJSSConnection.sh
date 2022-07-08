#!/bin/sh

jssConnect=$(jamf checkJSSConnection)
echo $jssConnect


if [[ $jssConnect == *"The JSS is available"* ]]
then
	result=yes
else
	result=no
fi

echo "<result>$result</result>"