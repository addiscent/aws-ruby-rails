#!/bin/bash
# install and execute a script which provisions ruby/rails.
# During launch of a new EC2 instance, copy-paste the code herein into
# the "Advanced Details -> User Data" edit box
# rex 2016.0712.0000

echo "BEGIN EC2 Provision" >> /home/ubuntu/arr-provision.log

echo "apt-get -y install unzip" >> /home/ubuntu/arr-provision.log
apt-get -y install unzip

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

