#!/bin/bash
# installs software and configures an EC2 instance for use as a
# Ruby/Rails development/education machine, or potentially usable as a
# Rails server
# rex 2016.0713.1240

echo "BEGIN ec2-ruby-rails-config-install.sh" >> /home/ubuntu/arr-provision.log

##############################################################################
# set the hostname

echo "ec2-ruby-rails-config-install.sh : Set hostname to aws-ruby-rails"

hostname aws-ruby-rails

echo "aws-ruby-rails" > /etc/hostname

sed -i 's/localhost/localhost aws-ruby-rails/g' /etc/hosts

#############################################################################
# set custom prompt and functions/aliases in .bashrc for users root and ubuntu

echo "ec2-ruby-rails-config-install.sh : Set .bashrc customization for root and ubuntu"

cat ./aws-ruby-rails-master/bashrc-mod.txt >> /home/ubuntu/.bashrc

cat ./aws-ruby-rails-master/bashrc-mod.txt >> /root/.bashrc

############################################################################
# install ruby/rails and related tools/software

echo "ec2-ruby-rails-config-install.sh : wget -O ruby-rails-install.zip https://github.com/addiscent/ruby-rails-install/archive/master.zip" >> /home/ubuntu/arr-provision.log
wget -O ruby-rails-install.zip https://github.com/addiscent/ruby-rails-install/archive/master.zip

echo "ec2-ruby-rails-config-install.sh : unzip ruby-rails-install.zip" >> /home/ubuntu/arr-provision.log
unzip ruby-rails-install.zip

echo "ec2-ruby-rails-config-install.sh : chmod +x ./ruby-rails-install-master/ruby-rails-install.sh" >> /home/ubuntu/arr-provision.log
chmod +x ./ruby-rails-install-master/ruby-rails-install.sh

echo "ec2-ruby-rails-config-install.sh : ./ruby-rails-install-master/ruby-rails-install.sh" >> /home/ubuntu/arr-provision.log
./ruby-rails-install-master/ruby-rails-install.sh >> /home/ubuntu/arr-provision.log

echo "ec2-ruby-rails-config-install.sh : rm -r ./ruby-rails-install-master" >> /home/ubuntu/arr-provision.log
rm -r ./ruby-rails-install-master

echo "ec2-ruby-rails-config-install.sh : rm ruby-rails-install.zip" >> /home/ubuntu/arr-provision.log
rm ruby-rails-install.zip

echo "END ec2-ruby-rails-config-install.sh" >> /home/ubuntu/arr-provision.log

