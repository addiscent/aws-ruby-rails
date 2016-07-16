#!/bin/bash
# installs software and configures an EC2 instance for use as a
# Ruby/Rails development/education machine
# rex 2016.0715.1830

THIS_FILENAME="ec2-ruby-rails.sh"

echo "BEGIN $THIS_FILENAME" >> /home/ubuntu/arr-provision.log

############################################################################
# install unzip
echo "$THIS_FILENAME : apt-get -y install unzip" >> /home/ubuntu/arr-provision.log
apt-get -y install unzip && \

############################################################################
# download and execute provisioning software

echo "$THIS_FILENAME : wget -O aws-ruby-rails.zip https://github.com/addiscent/aws-ruby-rails/archive/master.zip" >> /home/ubuntu/arr-provision.log
wget -O aws-ruby-rails.zip https://github.com/addiscent/aws-ruby-rails/archive/master.zip && \

echo "$THIS_FILENAME : unzip aws-ruby-rails.zip" >> /home/ubuntu/arr-provision.log
unzip aws-ruby-rails.zip && \

echo "$THIS_FILENAME : chmod +x ./aws-ruby-rails-master/ec2-ruby-rails-config-install.sh" >> /home/ubuntu/arr-provision.log
chmod +x ./aws-ruby-rails-master/ec2-ruby-rails-config-install.sh && \

echo "$THIS_FILENAME : ./aws-ruby-rails-master/ec2-ruby-rails-config-install.sh" >> /home/ubuntu/arr-provision.log
./aws-ruby-rails-master/ec2-ruby-rails-config-install.sh >> /home/ubuntu/arr-provision.log && \

echo "$THIS_FILENAME : rm -r ./aws-ruby-rails-master" >> /home/ubuntu/arr-provision.log
rm -r ./aws-ruby-rails-master && \

echo "$THIS_FILENAME : rm aws-ruby-rails.zip" >> /home/ubuntu/arr-provision.log
rm aws-ruby-rails.zip

echo "END $THIS_FILENAME" >> /home/ubuntu/arr-provision.log

