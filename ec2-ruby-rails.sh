#!/bin/bash
# installs software and configures an EC2 instance for use as a
# Ruby/Rails development/education machine, or potentially usable as a
# Rails server
# rex 2016.0713.1340

echo "-->  BEGIN ec2-ruby-rails.sh" >> /home/ubuntu/arr-provision.log

############################################################################
# download and execute provisioning software

echo "wget -O aws-ruby-rails.zip https://github.com/addiscent/aws-ruby-rails/archive/master.zip" >> /home/ubuntu/arr-provision.log
wget -O aws-ruby-rails.zip https://github.com/addiscent/aws-ruby-rails/archive/master.zip

echo "unzip aws-ruby-rails.zip" >> /home/ubuntu/arr-provision.log
unzip aws-ruby-rails.zip

echo "chmod +x ./aws-ruby-rails-master/ec2-ruby-rails-config-install.sh" >> /home/ubuntu/arr-provision.log
chmod +x ./aws-ruby-rails-master/ec2-ruby-rails-config-install.sh

echo "./aws-ruby-rails-master/ec2-ruby-rails-config-install.sh" >> /home/ubuntu/arr-provision.log
./aws-ruby-rails-master/ec2-ruby-rails-config-install.sh >> /home/ubuntu/arr-provision.log

echo "rm -r ./aws-ruby-rails-master" >> /home/ubuntu/arr-provision.log
rm -r ./aws-ruby-rails-master

echo "rm aws-ruby-rails.zip" >> /home/ubuntu/arr-provision.log
rm aws-ruby-rails.zip

echo "-->  END ec2-ruby-rails.sh" >> /home/ubuntu/arr-provision.log

