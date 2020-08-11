# setup-centos8.sh

# Configure script
set -e # Stop script execution on any error
echo ""; echo "---- Setting Up CentOS 8.x ----"

# Configure variables
TESTPOINT=google.com
echo "- Variables Set -"

# Test internet connectivity
ping -q -c5 $TESTPOINT > /dev/null 2>&1
 
if [ $? -eq 0 ]
then
	echo "- Internet Ok -"	
else
	echo "- Internet Failed! -"
fi


# Sync clock
echo "- Sync Clock -"
cat >> /etc/chrony.conf <<EOF
server 0.au.pool.ntp.org
EOF

systemctl enable --now chronyd.service

# Base OS update
echo "- Update OS -"
dnf clean packages
dnf -yqe 3 update
echo "- Install Tools -"
dnf -yqe 3 install net-tools bind-utils wget tree

echo "---- CentOS Base Setup Complete ----"; echo ""
