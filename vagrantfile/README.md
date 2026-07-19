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
