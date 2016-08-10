# LEMP Ansible

Repository contains a playbook for provisioning modern LEMP environment. Following is handled out of the box.

* User setup
* SSH setup
* Firewall setup

It will also install following software:

* Nginx with HTTP/2
* PHP 7
* MySQL (You can change it to MariaDB role under `provision.yml` file)
* Node.JS
* Git
* Fail2Ban

## Usage

Configure your hosts file

```
[web]
<server or droplet ip>
```

Edit `var/all.yml` to configure your default use[hashed](http://docs.ansible.com/ansible/faq.html#how-do-i-generate-crypted-passwords-for-the-user-module) sudo password. This will create a new user on the provisioned servers that you can use to gain SSH access. And you can also configure any require extra packages you want in the same file under server -> packages.

Run:
`ansible-playbook provision.yml`
