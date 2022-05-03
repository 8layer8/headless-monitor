#!/bin/bash
source ./setwebroot.sh
# export WEBROOT=/home/${USER}/headless-monitor/www

# set your red limit, most pages are about 1, so anything approaching 2 is going to be pink/red
pctRedLimit=1.9
# Figure the red factor, its not really a percentage but it is a relative how-red-is-it-compared-to-green-and-blue
pctRed=`convert ${1} -resize 1x1\!     -format "%[fx:int(255*r+.5)] %[fx:int(255*g+.5)] %[fx:int(255*b+.5)]" info:- |cut -f 1-3  |while read -r r g b ; do echo "scale=3; (($r/$g)+($r/$b))/2"|bc -l  ; done` 

echo  ${1} " has a red factor of: " $pctRed

if (( $(echo "$pctRed > $pctRedLimit" |bc -l) )); then
  echo "Alert! Alert! " ${1} " is too red!";
  cp ${1} ${WEBROOT}/suspicious/${1};
  mv ${1} ${WEBROOT}/current/${1};
else
  echo ${1} " is ok";
  mv ${1} ${WEBROOT}/current/${1};
fi

