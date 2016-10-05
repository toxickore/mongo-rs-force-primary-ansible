# mongo-rs-force-primary-ansible
This ansible playbook deploy the mongoDB replica set
Requirements:
* Python installed on the target machine
* Debian distribution
* OpenSSH daemon installed on target machine
* Public key authentication already configured
* Use the same user ID on the intentory server and target host

How to use
* $ git clone https://github.com/toxickore/mongo-rs-force-primary-ansible.git
* copy the hosts file to /etc/ansible/hosts and edit with the proper IP address for the target
* Run ansible-playbook mongo.yaml --become --ask-become-pass
* Once the playbook is applied to the target host run: bash start.sh from the mongo-replica folder
