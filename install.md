sudo apt -y install openssh-server
sudo apt -y install bc imagemagick nginx git mc htop procps vim nano
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# update chrome (it adds the repo)
# sudo apt update
# sudo apt install google-chrome-stable

# Run chrome from the GUI at least once to let it sort out things
cd ~
git clone https://github.com/8layer8/headless-monitor.git

# Edit setwebroot.sh as needed
rm /var/www/html/index.nginx-debian.html
cp -R ~/headless-monitor/ /var/www/html
chown -R tmradmin:tmradmin /var/www/html
chown tmradmin:tmradmin /var/www/html

cp ~/headless-monitor/monitor.sh ~/monitor.sh
chmod +x ~/monitor.sh

# Add to crontab:
# crontab -e
0 4,8,12,16,20  * * *  /home/tmradmin/monitor.sh


# Test it
# It's normal for the no such directory errors, it is all part of the cascade moves every 4 hours. The first several passes, there are no files to move yet.
cd ~/headless-monitor
./go.sh

# after 7 runs of go.sh, the errors should go away now that everything has been populated.
