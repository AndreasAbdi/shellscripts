#!/bin/bash
############################################### THIS HERE FILE IS FOR FUNCTIONS ############################################

function switch_maven_settings() {
	echo "Copying settings-$1.xml to settings.xml..."

	cd ~/.m2
	file="settings-$1.xml"
	if [ -f "$file" ]
	then
	    set -v
	    cd ~/.m2
	    rm settings.xml.bak
	    cp settings.xml settings.xml.bak
	    cp settings-$1.xml settings.xml
	else
	    echo "$file not found."
	fi
}


