#!/bin/bash

currentUser=$( /usr/bin/stat -f "%Su" /dev/console )

echo "<result>$(date -r $(sudo dscl . -read /Users/$currentUser accountPolicyData |
	tail -n +2 |
	plutil -extract passwordLastSetTime xml1 -o - -- - |
	sed -n "s/<real>\([0-9]*\).*/\1/p"))</result>"
