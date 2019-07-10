#!/bin/bash 

function requirements(){

DIG=`which dig`
if [ $? -ne 0 ]
then
	echo "dig not installed,exiting..."
	exit 1;
fi
not_su=0
SUDO=`which sudo`
if [ $? -ne 0 ]
then
	SUDO="su root -c"
	not_su=1
fi

}

function setup_cron(){

	echo "* * * * * `whoami` /usr/local/bin/my_ip" > myip
 
}


function setup_bashrc(){

echo "PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\][$""(if [ -f /tmp/ip_adddresses ];then cat /tmp/ip_adddresses;fi)""]\[\033[01;33m\]\u\[\e[m\]@\[\e[33m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> $HOME/.bashrc

}


function install(){

	_array=("cp my_ip /usr/local/bin" "cp myip /etc/cron.d/" "systemctl restart cron")
	for cmd in "${_array[@]}"
	do
		if [ $not_su == 1 ]
		then
			echo "running $cmd"
			$SUDO "$cmd"
		else
			echo "running $cmd"
			$SUDO $cmd
		fi
	done	
	echo "SETUP DONE!"
    echo "copy and paste this command"
	echo "source $HOME/.bashrc"

}

requirements
setup_cron
setup_bashrc
install
