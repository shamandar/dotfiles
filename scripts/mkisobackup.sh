#!/bin/sh

## Runtime Dependencies:
##  - gnu_ddrescue      (GNU ddrescue with recovery, not dd_rescue + dd_rhelp)
##  - dvdisaster

if [ $# != 1 ]; then
    echo "USAGE: $0 <filename_no_ext>"
    exit 1
fi

image=$1
blocksize=2048
device=/dev/sr0

## Get the good data first
ddrescue --no-scrape --sector-size=$blocksize $device $image.iso $image.mapfile

## Try scrapping bad blocks
ddrescue --idirect --retry-passes=3 --sector-size=$blocksize $device $image.iso $image.mapfile

## Try reading backward
ddrescue --idirect --retry-passes=3 --reverse --sector-size=$blocksize $device $image.iso $image.mapfile

## DONE let's create ECC
dvdisaster --image $image.iso --ecc $image.ecc --create
