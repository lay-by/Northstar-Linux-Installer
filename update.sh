#!/bin/sh
GREEN='\033[0;32m'
LATEST=$(curl --silent https://api.github.com/repos/R2Northstar/Northstar/releases/latest | jq '.name')
if [ ! -f "version" ];then
    echo "0.0.0" > version
fi
CURVERS=$(cat version)
if [ $LATEST != $CURVERS ]; then
    TEMP=$(curl --silent https://api.github.com/repos/R2Northstar/Northstar/releases/latest | jq -r '.assets'[0].browser_download_url)
    wget ${TEMP}
    unzip -o *.zip
    mv "NorthstarLauncher.exe" "Titanfall2.exe"
    rm *.zip
    echo -e "\n${GREEN}Installed version $LATEST\n"
    echo $LATEST > version
else
    echo -e "\n${GREEN}You are already on newest version $LATEST\n"
fi
