#!/bin/bash
command clear
beginning() {
    command anonsurf start
    command clear
    echo
    echo
    echo ".▄▄ · ▪  ▄▄▌  ▄▄▄ . ▐ ▄ ▄▄▄▄▄"
    echo "▐█ ▀. ██ ██•  ▀▄.▀·•█▌▐█•██  "
    echo "▄▀▀▀█▄▐█·██▪  ▐▀▀▪▄▐█▐▐▌ ▐█.▪"
    echo "▐█▄▪▐█▐█▌▐█▌▐▌▐█▄▄▌██▐█▌ ▐█▌·"
    echo " ▀▀▀▀ ▀▀▀.▀▀▀  ▀▀▀ ▀▀ █▪ ▀▀▀  V. 0.1"
    echo "-------------------------------------"
    echo " Created By: PsycoLulz"
    echo
    echo 
    read -p $'Enter Domain Here (Ex. example.com): ' domain 
    scanmenu
}
scanmenu() {
    command clear
    echo 
    echo
    echo "======================================================="
    command figlet Scan Type
    echo "======================================================="
    echo
    echo "Domain Entered: https://$domain"
    echo
    echo "             0. All"
    echo "             1. Check HTTP Headers"
    echo "             2. Check DNS Records"
    echo "             3. Check For Robots File"
    echo "             4. Check For Crossdomain Policy"
    echo "             5. Check For Index.html"
    echo "             6. Enter A Different Domain"
    echo "             7. Quit"
    echo 
    read -p $'Please Choose A Scan Type: ' scantype
    if [[ $scantype == "0" ]]
    then
    optzero
    elif [[ $scantype == "1" ]]
    then
    optone
    elif [[ $scantype == "2" ]]
    then
    opttwo
    elif [[ $scantype == "3" ]]
    then
    optthree
    elif [[ $scantype == "4" ]]
    then
    optfour
    elif [[ $scantype == "5" ]]
    then
    optfive
    elif [[ $scantype == "6" ]]
    then
    beginning 
    elif [[ $scantype == "7" ]]
    then
    optseven
    else
    command clear
    scanmenu
    fi
}
optzero() {
    command clear
    echo
    echo 
    command HEAD https://$domain 
    command dnsrecon -d $domain 
    echo
    echo 
    read -p $'Would You Like To Save Your Output For Robots.txt? y/n :' saverobots
    if [[ $saverobots == "y" ]]
    then
    command curl https://$domain/robots.txt -o robots.md
    elif [[ $saverobots == "n" ]]
    then
    command curl https://$domain/robots.txt 
    else
    command clear
    optzero
    fi
    optzero1
}
optzero1() {
    echo
    echo
    read -p $'Would You Like To Save Your Output For Crossdomain.xml? y/n :' savecross
    if [[ $savecross == "y" ]]
    then
    command curl https://$domain/crossdomain.xml -o crossdomain.md 
    elif [[ $savecross == "n" ]]
    then
    command curl https://$domain/crossdomain.xml
    else
    command clear
    optzero1
    fi
    optzero2
}
optzero2() {
    echo
    echo
    command wget https://$domain/index.html
}
optone() {
    command clear
    echo
    echo
    command HEAD https://$domain
}
opttwo() {
    command clear
    echo
    echo
    command dnsrecon -d $domain 
}
optthree() {
    command clear
    echo
    echo 
    read -p $'Would You Like To Save Your Output For Robots.txt? y/n :' saverobots
    if [[ $saverobots == "y" ]]
    then
    command curl https://$domain/robots.txt -o robots.md
    elif [[ $saverobots == "n" ]]
    then
    command curl https://$domain/robots.txt 
    else
    command clear
    optthree
    fi
}
optfour() {
    command clear
    command wget https://$domain/crossdomain.xml 
}
optfive() {
    command clear
    command wget https://$domain/index.html 
}
optseven() {
    command anonsurf stop
    command clear
    echo
    echo "Thank You For Using My Tool :)"
}
beginning
