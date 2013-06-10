Vagrant on Rails
==========

##Overview
Vagrant setup and provisions for rails project.

### Set Development Environment

#### Rails Project

    Put your rails code in project directory.

#### Vagrant

    $ vagrant up
    $ vagrant ssh

#### Database
Set password with 'secret'

    $ sudo su - postgres
    $ createuser -P -ds root

#### Ruby gems

    $ cd ~/project
    $ bundle install

#### Tmuxinator

    # tmuxinator start project