# aws-ruby-rails-provision
Installs Ruby, Rails, and other tools/apps minimally required for operating a Rails server

WARNING : The provisioning script named _aws-ruby-rails-provision.sh_ has some minor bugs.  It will successfully provision Ruby, Rails, etc, but it displays the prompt of the user _root_ incorrectly.  Instead of a #, it incorrectly displays a $.  I will fix this bug very soon, but until then, beware, do not mistakenly operate as user _root_ instead of the less dangerous user _ubunutu_.  If you must work as the user root, fix the prompt yourself by editing the _.bashrc_ file, or use _whoami_ frequently while you work.

## Usage :

Start an EC2 instance using the EC2 Dashboard.  In the Advanced Details User Data box, paste the contents of the script file _ec2-provision-ruby-rails.sh_.  That script will provisiong Ruby/Rails immediately after EC2 launch.  Provisioning adds approximately ten minutes to the normal Launch time.

To verify successful Ruby/Rails installation, log into the EC2 instance, and verify the version number of the installed software, as follows :

> $ ruby --version

        ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-linux]
  
> $ gem --version

        2.5.1
      
> $ bundler --version

        Bundler version 1.12.5
      
> $ rails --version

        Rails 5.0.0
      
> $ git --version

        git version 1.9.1
      
> $ nodejs --version
        v0.10.25

