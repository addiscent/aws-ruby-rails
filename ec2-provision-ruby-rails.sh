#!/bin/bash
# install and execute script which provisions ruby/rails

sudo -y apt-get unzip

wget -O aws-ruby-rails.zip https://github.com/addiscent/aws-ruby-rails/archive/master.zip

unzip aws-ruby-rails.zip

chmode +x ./aws-ruby-rails/aws-ruby-rails.sh
./aws-ruby-rails/aws-ruby-rails.sh


