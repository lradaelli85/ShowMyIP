# Show IP address on Bash

This script will show on your Bash terminal your local and public IP addresses

![bash](https://https://raw.githubusercontent.com/lradaelli85/ShowMyIP/master/image/bash.png)

# Requirements

- dig

- iproute2

# Introduction

The aim of this script is to  show on your Bash terminal your local and public IP addresses.

Public IP is retrieved from openDNS using dig.

# Configuration and usage

If you are not familiar with bashrc and cron,you may run the `install.sh` script that will do everything automatically.

If you don't trust the automatic script,you just need to:

- copy the `my_ip` bash script into your pesonal bin folder (usually ~/bin) or /usr/local/bin/ folder

- add a cron that runs every minute like this one below

```
* * * * * `whoami` /usr/local/bin/my_ip
```

- edit your  ~/.bashrc file and change your PS1 variable using this one below

```
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\][$(if [ -f /tmp/ip_adddresses ];then cat /tmp/ip_adddresses;fi)]\[\033[01;33m\]\u\[\e[m\]@\[\e[33m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
```

- read the new ~/.bashrc file with

```
source ~/.bashrc
```

# NOTES

if you don't want to change your current colours,you need only to add this on your PS1 variable

```
[$(if [ -f /tmp/ip_adddresses ];then cat /tmp/ip_adddresses;fi)]
```

The `install.sh` script append at the end of the  ~/.bashrc the PS1 variable,not the best,but i haven't found any other way to do that
