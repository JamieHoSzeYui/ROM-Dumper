#!/bin/bash

OUTDIR=$1 
MYPATH=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`
if [[ $(ls $1 / grep system) ]]; then
    SYSTEM=1
fi 
if [[ $(ls $1 / grep vendor) ]]; then
    VENDOR=1
fi 
if [[ $(ls $1 / grep product) ]]; then
    PRODUCT=1
fi 
if [[ $(ls $1 / grep ext) ]]; then
    EXT=1
fi 
if [[ $(ls $1 / grep csc) ]]; then
    CSC=1
fi 
##############################
cd $1
curl -sL https://git.io/file-transfer | sh   
cd $MYPATH
##############################
touch $1/links.txt

if [[ $SYSTEM = 1 ]]; then 
    mkdir $1/system
    sudo mount -o ro $1/system.img $1/system 2>/dev/null 
    cd out 
    zip -r system.zip system 2>/dev/null
    echo "echo "System Download link :"" >> links.txt
    ./transfer wet system.zip | grep link >> links.txt  
fi

cd $MYPATH

if [[ $VENDOR = 1 ]]; then 
    mkdir $1/vendor
    sudo mount -o ro $1/vendor.img $1/vendor 2>/dev/null 
    cd out 
    zip -r vendor.zip vendor 2>/dev/null
    echo "echo "Vendor Download link :"" >> links.txt
    ./transfer wet vendor.zip | grep link >> links.txt  
fi 

cd $MYPATH

if [[ $PRODUCT = 1 ]]; then 
    mkdir $1/product
    sudo mount -o ro $1/product.img $1/product 2>/dev/null 
    cd out 
    zip -r product.zip product 2>/dev/null
    echo "echo "Product Download link :"" >> links.txt
    ./transfer wet product.zip | grep link >> links.txt  
fi 

cd $MYPATH

if [[ $CSC = 1 ]]; then 
    mkdir $1/csc
    sudo mount -o ro $1/csc.img $1/csc 2>/dev/null 
    cd $1 
    zip -r csc.zip vendor 2>/dev/null
    echo "echo "csc Download link :"" >> links.txt
    ./transfer wet csc.zip | grep link >> links.txt  
fi 

cd $MYPATH

if [[ $EXT = 1 ]]; then 
    mkdir $1/system-ext
    sudo mount -o ro $1/system-ext.img $1/system-ext 2>/dev/null 
    cd $1 
    zip -r system-ext.zip system-ext 2>/dev/null
    echo "echo "system-ext Download link :"" >> links.txt
    ./transfer wet system-ext.zip | grep link >> links.txt  
fi 

cd $MYPATH

