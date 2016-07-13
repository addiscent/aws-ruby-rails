#!/bin/bash
# installs software and configures an EC2 instance for use as a
# Ruby/Rails development/education machine, or potentially usable as a
# Rails server
# rex 2016.0713.1240

echo "BEGIN EC2 Provision" >> /home/ubuntu/arr-provision.log

##############################################################################
# set the hostname

echo "-->  Set hostname to aws-ruby-rails"

hostname aws-ruby-rails

echo "aws-ruby-rails" > /etc/hostname

sed -i 's/localhost/localhost aws-ruby-rails/g' /etc/hosts

#############################################################################
# set custom prompt and functions/aliases in .bashrc for users root and ubuntu

echo "-->  Set .bashrc customization for root and ubuntu"

cat ./aws-ruby-rails-provision-master/bashrc-mod.txt >> /home/ubuntu/.bashrc

cat ./aws-ruby-rails-provision-master/bashrc-mod.txt >> /root/.bashrc

##########################################################################
# remove ruby 1.9.1

echo "-->  Remove ruby 1.9.1"

apt-get -y remove ruby1.9.1 --purge

############################################################################
# install unzip
echo "-->  apt-get -y install unzip" >> /home/ubuntu/arr-provision.log
apt-get -y install unzip

############################################################################
# install ruby/rails and related tools/software

echo "wget -O aws-ruby-rails-provision.zip https://github.com/addiscent/aws-ruby-rails-provision/archive/master.zip" >> /home/ubuntu/arr-provision.log
wget -O aws-ruby-rails-provision.zip https://github.com/addiscent/aws-ruby-rails-provision/archive/master.zip

echo "unzip aws-ruby-rails-provision.zip" >> /home/ubuntu/arr-provision.log
unzip aws-ruby-rails-provision.zip

echo "chmod +x ./aws-ruby-rails-provision-master/aws-ruby-rails-provision.sh" >> /home/ubuntu/arr-provision.log
chmod +x ./aws-ruby-rails-provision-master/aws-ruby-rails-provision.sh

echo "./aws-ruby-rails-provision-master/aws-ruby-rails-provision.sh" >> /home/ubuntu/arr-provision.log
./aws-ruby-rails-provision-master/aws-ruby-rails-provision.sh >> /home/ubuntu/arr-provision.log

echo "rm -r ./aws-ruby-rails-provision-master" >> /home/ubuntu/arr-provision.log
rm -r ./aws-ruby-rails-provision-master

echo "rm aws-ruby-rails-provision.zip" >> /home/ubuntu/arr-provision.log
rm aws-ruby-rails-provision.zip

echo "END EC2 Provision" >> /home/ubuntu/arr-provision.log

