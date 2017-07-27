# laptop-setup

An Ansible playbook I use to set up my Linux laptop.  It supports Fedora and Ubuntu, and it is geared toward a Java developer.

### How to use

After installation of Fedora or Ubuntu, install ansible and git:
  `sudo yum install ansible git`
or
  `sudo apt install ansible git`

Clone this repo

Change directory to the newly-cloned repository, and run the following command:
  `ansible-playbook -i environments/fedora/hosts -K site.yml -vv`
or
  `ansible-playbook -i environments/ubuntu/hosts -K site.yml -vv`
