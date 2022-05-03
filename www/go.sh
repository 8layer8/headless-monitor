#!/bin/bash
#  Prereqs: bc imagemagick nginx google-chrome
# setup
export WEBROOT=/home/brad/www
mkdir ${WEBROOT}
mkdir ${WEBROOT}/archive
mkdir ${WEBROOT}/24hour
mkdir ${WEBROOT}/16hour
mkdir ${WEBROOT}/12hour
mkdir ${WEBROOT}/8hour
mkdir ${WEBROOT}/4hour
mkdir ${WEBROOT}/current
mkdir ${WEBROOT}/suspicious

# chown -R www-data:www-data ${WEBROOT}
# chmod 755 ${WEBROOT}

# To add or remove a site, edit this file below
for site in `cat tmr-hosted-domains.txt`

	do 

	#Take screenshot of site, rename to the site
	/opt/google/chrome/chrome --headless --disable-gpu --screenshot --window-size=800,600 https://${site}
	mv screenshot.png ${site}.png
        chmod 755 ${site}.png
	#Timestamp the screenshot and burn it into the picture
	convert ${site}.png -gravity SouthEast -pointsize 22 -fill black -annotate +30+30 "`date`"  ${site}.png

	#cycle things out of the hourly trees
	rm -f  ${WEBROOT}/archive/${site}.png
	mv ${WEBROOT}/24hour/${site}.png  ${WEBROOT}/archive/${site}.png
	mv ${WEBROOT}/16hour/${site}.png  ${WEBROOT}/24hour/${site}.png
	mv ${WEBROOT}/12hour/${site}.png  ${WEBROOT}/16hour/${site}.png
	mv ${WEBROOT}/8hour/${site}.png  ${WEBROOT}/12hour/${site}.png
	mv ${WEBROOT}/4hour/${site}.png  ${WEBROOT}/8hour/${site}.png
	mv ${WEBROOT}/current/${site}.png  ${WEBROOT}/4hour/${site}.png

	#Determine amount of red, if red copy to suspicious and current, if not, just copy to current
	./test-for-red.sh ${site}.png

	# suspicious never gets cleaned up, but would only show the latest of any particular site

done

# Rebuild the index files, they shouldn't change unless a new site is added
./populate.sh

