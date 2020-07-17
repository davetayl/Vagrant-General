# setup-centos.sh

# Configure script
set -e # Stop script execution on any error
echo ""; echo "---- Setting up CentOS ----"

# Configure variables
TESTPOINT=google.com
echo "- Variables set -"

# Test internet connectivity
ping -q -c5 $TESTPOINT > /dev/null 2>&1
 
if [ $? -eq 0 ]
then
	echo "- Internet Ok -"	
else
	echo "- Internet failed -"
fi


# Sync clock
echo "- Sync Clock -"
cat >> /etc/chrony.conf <<EOF
server 0.au.pool.ntp.org
EOF

systemctl enable --now chronyd.service

# Base OS update
echo "- Update OS -"
dnf -yqe 3 update
dnf -yqe 3 install net-tools bind-utils wget tree

echo "---- CentOS Base Setup Complete ----"; echo ""
