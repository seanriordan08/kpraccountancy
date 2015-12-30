### ssh into your vps with emailed credentials
ssh root@your_ip_address
pw: provided_in_email

### setup deployer
useradd deployer
passwd deployer
deploy
deploy

### setup ssh keys by copying local public key onto remote .ssh/authorized_keys file
remote: in roo/.ssh, `vim authorized_keys`
local: copy id_rsa.pub (public key)
remote: paste key into authorized_keys
logout of remote
log back into root - you should not be prompted for a password

### create local db
local: bin/rake db:create

### if using basic ansible provisioner
-modify `telemark-ops/ansible/production`

-modify `telemark-ops/ansible/group_vars/production`

-modify `telemark-ops/ansible/group_vars/all`


## Provisioning

To provision a new server: cd ansible && `ansible-playbook -i production provision.yml`

##Deploying

To deploy the app: cd ansible && `ansible-playbook -i production deploy.yml`