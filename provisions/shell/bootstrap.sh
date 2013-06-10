#!/bin/bash

if [ -f /etc/apt/sources.list ]; then
	# Set UTF-8
	export LANG=en_US.UTF-8
	export LANGUAGE=en_US.UTF-8
	export LC_ALL=en_US.UTF-8

	# Essentials
	apt-get update
	apt-get -q -y -o DPkg::Options::=--force-confold install build-essential
	apt-get -q -y -o DPkg::Options::=--force-confold install git-core
	apt-get -q -y -o DPkg::Options::=--force-confold install git-doc
	apt-get -q -y -o DPkg::Options::=--force-confold install zlib1g-dev
	apt-get -q -y -o DPkg::Options::=--force-confold install openssl
	apt-get -q -y -o DPkg::Options::=--force-confold install libreadline-dev
	apt-get -q -y -o DPkg::Options::=--force-confold install zsh
	apt-get -q -y -o DPkg::Options::=--force-confold install libssl-dev
	apt-get -q -y -o DPkg::Options::=--force-confold install libyaml-dev
	apt-get -q -y -o DPkg::Options::=--force-confold install libxml2-dev
	apt-get -q -y -o DPkg::Options::=--force-confold install libxslt-dev
	apt-get -q -y -o DPkg::Options::=--force-confold install libv8-dev
	apt-get -q -y -o DPkg::Options::=--force-confold install libreadline-dev
	apt-get -q -y -o DPkg::Options::=--force-confold install libsqlite3-dev
	apt-get -q -y -o DPkg::Options::=--force-confold install postgresql
	apt-get -q -y -o DPkg::Options::=--force-confold install postgresql-contrib
	apt-get -q -y -o DPkg::Options::=--force-confold install postgresql-client
	apt-get -q -y -o DPkg::Options::=--force-confold install nginx
	apt-get -q -y -o DPkg::Options::=--force-confold install libpq-dev
	apt-get -q -y -o DPkg::Options::=--force-confold install tmux
	apt-get -q -y -o DPkg::Options::=--force-confold install vim
else
	echo "Your distribution is not supported by this StackScript"
	exit
fi
