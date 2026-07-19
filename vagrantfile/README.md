# Installing Vagrant/Packer on Ubuntu/Debian
### Add the HashiCorp GPG key.
```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```
### Add the official HashiCorp Linux repository.
```bash
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```
### Update and install.
```bash
sudo apt-get update
sudo apt-get install vagrant
sudo apt-get install packer
```
# Add public box in vagrant
### Using Public Boxes
### Adding a bento box to Vagrant
```bash
vagrant box add --provider virtualbox bento/ubuntu-22.04
vagrant box add --provider virtualbox bento/debian-12
```
# Some code for vagrant
### Turns on and prepares (boots) the virtual machine.
```bash
vagrant up
```
### You log into the virtual machine (SSH connection)
```bash
vagrant ssh
```
### Turns off the machine (like Shutdown)
```bash
vagrant halt
```
### It completely deletes the car (cannot be returned)
```bash
vagrant destroy
```
### Restarts the machine (applies new settings such as network or port forwarding)
```bash
vagrant reload
```
### Shows the status of all Vagrant machines in the entire system (not just the current project)
```bash
vagrant --global status
```
### Shows the list of downloaded boxes (ready operating systems)
```bash
vagrant box list
```

