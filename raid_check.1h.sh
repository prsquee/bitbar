#!/usr/bin/env bash

echo '💾'
echo '---'
diskutil appleraid list | awk '/^Status/ {print "apple:",$2}'
diskutil appleraid list | awk '/^[01]/ {print "--"$2,$4}'
echo '---'
/usr/local/bin/zpool status    tank | awk '/state:/    {print "zfs:",$2}'
/usr/local/bin/zpool status -L tank | awk '/disk[0-9]/ {print "--"$1,$2}'
