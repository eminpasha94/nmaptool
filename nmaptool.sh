#!/bin/bash

RED="\e[31m"
NC="\e[0m"

clear
echo -e "${RED}========== NMAP TOOL ==========${NC}"

while true; do
    echo -e "${RED}"
    echo "1) Sadə scan (nmap IP)"
    echo "2) Açıq portların sürətli scan-ı (-F)"
    echo "3) OS aşkarlanması (-O)"
    echo "4) Service & versiya aşkarlanması (-sV)"
    echo "5) Aggressive scan (-A)"
    echo "6) TCP SYN scan (-sS)"
    echo "7) UDP scan (-sU)"
    echo "8) Bütün portlar (1-65535)"
    echo "9) Script scan (default scripts)"
    echo "10) Firewall bypass scan (fragment)"
    echo "0) Çıxış"
    echo -e "${NC}"

    read -p "Seçimini et: " choice

    if [[ "$choice" == "0" ]]; then
        echo "Çıxılır..."
        exit 0
    fi

    read -p "Hədəf IP və ya domain daxil et: " target
    echo "--------------------------------"

    case $choice in
        1) nmap $target ;;
        2) nmap -F $target ;;
        3) nmap -O $target ;;
        4) nmap -sV $target ;;
        5) nmap -A $target ;;
        6) nmap -sS $target ;;
        7) nmap -sU $target ;;
        8) nmap -p- $target ;;
        9) nmap --script=default $target ;;
        10) nmap -f $target ;;
        *) echo "Yanlış seçim!" ;;
    esac

    echo
    read -p "Davam etmək üçün Enter bas..."
    clear
done

