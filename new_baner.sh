#!/bin/bash
motd_localisation="/etc/update-motd.d"
apt install screenfetch -y
touch $motd_localisation/02-info
echo "#!/bin/sh" >> $motd_localisation/01-info
echo "echo" >> $motd_localisation/01-info
echo "/usr/bin/screenfetch" >> $motd_localisation/01-info
echo "echo" >> $motd_localisation/01-info
echo "echo" >> $motd_localisation/01-info
echo "echo" >> $motd_localisation/01-info
echo "echo \"This server is: \" $(hostname)" >> $motd_localisation/01-info
chmod +x $motd_localisation/01-info
cd $motd_localisation
chmod -x 00-header
chmod -x 10-help-text
chmod -x 90-updates-available
