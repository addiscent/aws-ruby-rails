#!/bin/bash
# install and execute script which provisions ruby/rails.
# During launch of a new EC2 instance, copy-paste the code herein into
# the "Advanced Details -> User Data" edit box

apt-get -y install unzip

wget -O aws-ruby-rails-provision.zip https://github.com/addiscent/aws-ruby-rails-provision/archive/master.zip

unzip aws-ruby-rails-provision.zip

chmod +x ./aws-ruby-rails-provision-master/aws-ruby-rails-provision.sh

./aws-ruby-rails-provision-master/aws-ruby-rails-provision.sh

rm -r ./aws-ruby-rails-provision-master
rm aws-ruby-rails-provision.zip

