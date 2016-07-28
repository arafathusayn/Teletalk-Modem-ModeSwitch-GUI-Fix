#!/bin/bash

zenity --question --title="Required Confirmation" --text="السلام عليكم ورحمة الله وبركاته\n\nHave you said \"Bismillaah\"?";

if [ "$?" = 0 ] ; then
	var1="$(lsusb | grep -o -P '(?<=ID 19d2:).*(?= ZTE)')"
	pid=0x$var1
	gksudo "usb_modeswitch -v 0x19d2 -p $pid -V 0x19d2 -P 0x2003 -M '5553424312345678000000000000061e000000000000000000000000000000' -2 '5553424312345679000000000000061b000000020000000000000000000000' -n 1" --message "Please type your Admin/Super user password. Then click \"OK\""
	if [ "$?" = 0 ] ; then
		zenity --info --title="Success!" --text="Your Teletalk modem has been turned to \"Mobile Broadband\" mode successfully.\n\nNow please check whether your modem is restarting. If it is restarting, everything is okay.\n\nAfter it restarts, go to \"Network Connections\" settings to create and connect your modem as \"Mobile Broadband\".\n\n... والسلام عليكم ورحمة الله وبركاته ..."
	else
		zenity --error --text="You must give correct Super user password to run this command!"
	fi
else
	zenity --error --title="Not Done!" --text="Sorry. Saying \"Bismillaah\" is required before you start this program.\n\nPlease run the program again after saying \"Bismillaah\" and click \"Yes\" to continue."
fi
