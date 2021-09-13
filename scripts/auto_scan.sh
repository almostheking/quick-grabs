#!/bin/sh

TARG="192.170.171.0/24"
TIMESTAMP=`date +"%Y-%m-%d_%T"`

sudo nmap -A -T4 -oX scan.xml $TARG > scans/nmap_scheduled_$TIMESTAMP.txt
sudo cp scans/nmap_scheduled_$TIMESTAMP.txt today.txt
sudo diff -y -B -w yesterday.txt today.txt > diffs/diff_report_$TIMESTAMP.txt
sudo rm -rf yesterday.txt
sudo mv today.txt yesterday.txt
