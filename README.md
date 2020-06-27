# centos7-cis-vagrant

![auto-deploy](https://github.com/karthick-kk/centos7-cis-vagrant/workflows/auto-deploy/badge.svg)

This repository provides packer json which can run Vagrant to create CIS compliant CentOS VM images.

* CIS hardening is based on https://github.com/MindPointGroup/RHEL7-CIS.git

## How to build?
### Clone this repo
`$ git clone https://github.com/karthickk/centos7-cis-vagrant`
### Build image
`$ packer build cis_centos7.json`




