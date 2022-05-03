# Current
cat index-template-top.html > index.html
# Middle needs things like: <img src="img/11.jpg">
for this in `ls -1 ./current/*.png`; do echo "<img src=\"${this}\">"; done >>index.html 
cat index-template-bottom.html >> index.html

DIRECTORY=archive
cat index-template-top.html > ${DIRECTORY}/index.html
# Middle needs things like: <img src="img/11.jpg">
for this in `ls -1 ./${DIRECTORY}/*.png`; do echo "<img src=\"../${this}\">"; done >>${DIRECTORY}/index.html
cat index-template-bottom.html >> ${DIRECTORY}/index.html


DIRECTORY=12hour
cat index-template-top.html > ${DIRECTORY}/index.html
# Middle needs things like: <img src="img/11.jpg">
for this in `ls -1 ./${DIRECTORY}/*.png`; do echo "<img src=\"../${this}\">"; done >>${DIRECTORY}/index.html
cat index-template-bottom.html >> ${DIRECTORY}/index.html

DIRECTORY=16hour
cat index-template-top.html > ${DIRECTORY}/index.html
# Middle needs things like: <img src="img/11.jpg">
for this in `ls -1 ./${DIRECTORY}/*.png`; do echo "<img src=\"../${this}\">"; done >>${DIRECTORY}/index.html
cat index-template-bottom.html >> ${DIRECTORY}/index.html

DIRECTORY=24hour
cat index-template-top.html > ${DIRECTORY}/index.html
# Middle needs things like: <img src="img/11.jpg">
for this in `ls -1 ./${DIRECTORY}/*.png`; do echo "<img src=\"../${this}\">"; done >>${DIRECTORY}/index.html
cat index-template-bottom.html >> ${DIRECTORY}/index.html

DIRECTORY=4hour
cat index-template-top.html > ${DIRECTORY}/index.html
# Middle needs things like: <img src="img/11.jpg">
for this in `ls -1 ./${DIRECTORY}/*.png`; do echo "<img src=\"../${this}\">"; done >>${DIRECTORY}/index.html
cat index-template-bottom.html >> ${DIRECTORY}/index.html

DIRECTORY=8hour
cat index-template-top.html > ${DIRECTORY}/index.html
# Middle needs things like: <img src="img/11.jpg">
for this in `ls -1 ./${DIRECTORY}/*.png`; do echo "<img src=\"../${this}\">"; done >>${DIRECTORY}/index.html
cat index-template-bottom.html >> ${DIRECTORY}/index.html

DIRECTORY=suspicious
cat index-template-top.html > ${DIRECTORY}/index.html
# Middle needs things like: <img src="img/11.jpg">
for this in `ls -1 ./${DIRECTORY}/*.png`; do echo "<img src=\"../${this}\">"; done >>${DIRECTORY}/index.html
cat index-template-bottom.html >> ${DIRECTORY}/index.html
