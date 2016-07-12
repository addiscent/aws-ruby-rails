# aws-ruby-rails-provision
The scripts in this repository are intended for provisioning an AWS Ubuntu Server 14.04 EC2 instance during Launch.  On such an AWS EC2 instance, the scripts install Ruby, Rails, and other tools minimally required for operating a Rails server.

Inspect these scripts, and understand what they do before you use them.  In addition to installing Ruby/Rails/etc, the scripts do minor modification to the .bashrc to "improve" the prompt for the users _root_ and _ubuntu_.

#### NOTE
These provisioning scripts are written for, (and tested only on), Ubuntu Server 14.04.  With minor modifications, the scripts may work for other Linux distributions, but the scripts currently will not work for non-Ubuntu distros.

### WARNING
Mon, July 11, 10:42pm.

The tip of the master branch is not stable, it is broken, and you should not use it at this time.  Please check back again later for a working version.

## Usage
Provisioning works on a t2.nano, (512MB), or larger.  After provisioning, 6GB of storage is available on an 8GB EBS volume.

1. Begin the Launch of an EC2 instance using the EC2 Dashboard.

2. On the page labeled "Step 3: Configure Instance Details", notice the drop-down-menu-button labeled _Advanced Details_.  Choose that button.

3. Notice the _User Data_ edit box.  Ensure the "As text" radio button is selected.  In the _User Data_ box, paste the contents of the script file _ec2-provision-ruby-rails.sh_.

Continue with Launch per usual.  The _ec2-provision-ruby-rails.sh_ script will provision Ruby/Rails immediately after EC2 launch.  Provisioning adds approximately ten minutes to the normal Launch time.  

To verify successful Ruby/Rails installation, log into the EC2 instance, and verify the version numbers of the installed software, as follows :

> $ ruby --version

        ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-linux]
  
> $ gem --version

        2.5.1
      
> $ bundler --version

        Bundler version 1.12.5
      
> $ rails --version

        Rails 5.0.0
      
> $ nodejs --version
        v0.10.25

> $ git --version

        git version 1.9.1
      
## IMPORTANT
After provisioning is complete, the EC2 instance should be rebooted.  Don't reboot prematurely.  To determine if provisioning has completed, log into the EC2 instance, and display the provisioning log file.  The contents of the log file indicate provisioning has completed :

> cat /home/ubuntu/arr-provision.log

        Result :
            .
            .
          Ruby on Rails 5.0.0 (Ruby 2.3.1) Provisioning DONE

