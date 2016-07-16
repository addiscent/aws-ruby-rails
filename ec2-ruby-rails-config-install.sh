#!/bin/bash
# installs software and configures an EC2 instance for use as a
# Ruby/Rails development/education machine, or potentially usable as a
# Rails server
# rex 2016.0715.1840

THIS_FILENAME="ec2-ruby-rails-config-install.sh"

echo "BEGIN $THIS_FILENAME" >> /home/ubuntu/arr-provision.log

##############################################################################
# set the hostname

echo "$THIS_FILENAME : Set hostname to aws-ruby-rails"

hostname aws-ruby-rails && \

echo "aws-ruby-rails" > /etc/hostname && \

sed -i 's/localhost/localhost aws-ruby-rails/g' /etc/hosts && \

#############################################################################
# set custom prompt and functions/aliases in .bashrc for users root and ubuntu

echo "$THIS_FILENAME : Set .bashrc customization for root and ubuntu"

cat ./aws-ruby-rails-master/bashrc-mod.txt >> /home/ubuntu/.bashrc && \

cat ./aws-ruby-rails-master/bashrc-mod.txt >> /root/.bashrc && \

############################################################################
# install ruby/rails and related tools/software

echo "$THIS_FILENAME : wget -O ruby-rails-install.zip https://github.com/addiscent/ruby-rails-install/archive/master.zip" >> /home/ubuntu/arr-provision.log
wget -O ruby-rails-install.zip https://github.com/addiscent/ruby-rails-install/archive/master.zip && \

echo "$THIS_FILENAME : unzip ruby-rails-install.zip" >> /home/ubuntu/arr-provision.log
unzip ruby-rails-install.zip && \

echo "$THIS_FILENAME : chmod +x ./ruby-rails-install-master/ruby-rails-install.sh" >> /home/ubuntu/arr-provision.log
chmod +x ./ruby-rails-install-master/ruby-rails-install.sh && \

echo "$THIS_FILENAME : ./ruby-rails-install-master/ruby-rails-install.sh" >> /home/ubuntu/arr-provision.log
./ruby-rails-install-master/ruby-rails-install.sh >> /home/ubuntu/arr-provision.log && \

echo "$THIS_FILENAME : rm -r ./ruby-rails-install-master" >> /home/ubuntu/arr-provision.log
rm -r ./ruby-rails-install-master && \

echo "$THIS_FILENAME : rm ruby-rails-install.zip" >> /home/ubuntu/arr-provision.log
rm ruby-rails-install.zip && \

echo "END $THIS_FILENAME" >> /home/ubuntu/arr-provision.log

