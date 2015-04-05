#!/bin/bash

# cd libs 
# android update lib-project --target 10 --path appcompat
# cd -
# ant debug
ant clean debug
adb push bin/Knock-debug.apk /data/local/tmp/com.knock
adb shell pm install -r "/data/local/tmp/com.knock"
adb logcat -c
adb shell am start -D -n "com.knock/com.knock.MainActivity" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER
adb shell am start -n "com.knock/com.knock.MainActivity" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER
# adb logcat -s *:D *:E
adb logcat | grep '^[DE]/Knock'
# adb logcat -s | grep Knock
