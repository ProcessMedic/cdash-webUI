#!/bin/bash
# Wordpress Automated Ubuntu Installer
# 	by rav3ndust
#	for the ProcessMedic Automatic Client Dashboard project.
#
# This script automatically installs a Wordpress instance on Ubuntu.
# We are targeting Ubuntu 20.04+. 
# I can' t guarantee compatibility with older versions.
PKGS="apache2 ghostscript libapache2-mod-php mysql-server php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql php-xml php-zip"
script="Wordpress Automated Ubuntu Installer"
processMedic="https://github.com/rav3ndust/PM-OSS" # rav3ndust's fork of the PM-OSS repo (new configs)
apache_config_location="/etc/apache2/sites-available/wordpress.conf"
PM_apache_config_location="~/software/PM-Tools/PM-OSS/wordpress-configuration/apache-conf/wordpress.conf"
# download wordpress from upstream wordpress.org.
# this ensures we don't get an outdated version from apt.
download_WP() {
	sudo mkdir -p /srv/www
	sudo chown www-data: /srv/www
	curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www
}
# check for issues during process, send output to stdout
run_ChkErr() {
	prev_out=$(eval $1)
	return_val=$?
	if [ $return_val != 0 ]; then
		echo "Process $1 failed."
		echo "Please check output for errors."
		exit -1
	else
		echo "Current output: "
		sleep 1 && echo "$prev_out"
		echo "Process success with no issues."
	fi
	return $return_val
}
# download processmedic repo for applying server configurations automatically.
process_medic() {
	echo "Downloading ProcessMedic's open-source repository..."
	mkdir -p software/PM-Tools && cd software/PM-Tools
	git clone $processMedic
}
# begin script
echo $script
sleep 1
cd $HOME
echo "Updating system repositories..."
sudo apt update
sleep 1
# download packages for wordpress
echo "Downloading needed packages for Wordpress installation..."
sleep 1
run_ChkErr "sudo apt-get install $PKGS"
# download processmedic repo for applying configs
process_medic
sleep 1
# handle apache configs
run_ChkErr "sudo touch $apache_config_location"
run_ChkErr "sudo cp $PM_apache_config_location $apache_config_location"
cd $apache_config_location
run_ChkErr "sudo a2ensite wordpress" 
run_ChkErr "sudo a2enmod rewrite"
echo "Apache is configured. Please edit the config file and add your hostname to serve your pages."
sleep 1
echo "Your Apache configuration can be found at $apache_config_location."
sleep 1
echo "Reloading the Apache service..."
sudo service apache2 reload 
# next, we need to add logic for: 
#	- configuring the MySQL database.
#	- connecting wordpress to the mysql database.
#	- configuring Wordpress.
