#!/bin/sh

for files in `ls glyphicons_*`
do
  newfilename=`echo $files | cut -c16-`
  cp $files $newfilename
done
