sudo apt-get remove --purge $1
sudo apt-get autoremove
sudo apt clean
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P 
