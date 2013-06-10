#!/bin/bash

if [ -f /etc/apt/sources.list ]; then
	# Install rbenv
	cd /home/$SUDO_USER
	git clone git://github.com/sstephenson/rbenv.git .rbenv
	echo "if [ -d /home/${SUDO_USER}/.rbenv ]; then" >> /home/$SUDO_USER/.bashrc
	echo "   export PATH=\"/home/${SUDO_USER}/.rbenv/bin:$PATH\"" >> /home/$SUDO_USER/.bashrc
	echo '   eval "$(rbenv init bash -)"' >> /home/$SUDO_USER/.bashrc
	echo '   export LANG=en_US.UTF-8' >> /home/$SUDO_USER/.bashrc
	echo '   export LANGUAGE=en_US.UTF-8' >> /home/$SUDO_USER/.bashrc
	echo '   export LC_ALL=en_US.UTF-8' >> /home/$SUDO_USER/.bashrc
	echo '   export EDITOR='vim'' >> /home/$SUDO_USER/.bashrc
	echo 'fi' >> /home/$SUDO_USER/.bashrc

	echo '[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator' >> /home/$SUDO_USER/.bashrc

	mkdir -p /home/$SUDO_USER/.rbenv/plugins
	cd /home/$SUDO_USER/.rbenv/plugins
	git clone git://github.com/sstephenson/ruby-build.git
	
	# Set permissions
	chown -R $SUDO_USER /home/$SUDO_USER/.rbenv
	chgrp -R $SUDO_USER /home/$SUDO_USER/.rbenv
	chown -R $SUDO_USER /home/$SUDO_USER/.bashrc
	chgrp -R $SUDO_USER /home/$SUDO_USER/.bashrc

	su - $SUDO_USER -c "export PATH='/home/${SUDO_USER}/.rbenv/bin:$PATH'"
	su - $SUDO_USER -c "/home/${SUDO_USER}/.rbenv/bin/rbenv install 1.9.3-p429"
	su - $SUDO_USER -c "/home/${SUDO_USER}/.rbenv/bin/rbenv rehash"
	su - $SUDO_USER -c "/home/${SUDO_USER}/.rbenv/bin/rbenv global 1.9.3-p429"
	su - $SUDO_USER -c "/home/${SUDO_USER}/.rbenv/versions/1.9.3-p429/bin/gem install bundler"
	
	# Postgres
	rm /etc/postgresql/9.1/main/pg_hba.conf
	wget -c -O /etc/postgresql/9.1/main/pg_hba.conf https://gist.github.com/jyr/8430e75cb59676b3b979/raw/76ed072001c22e619d11970dd8d72bd5b0b24e18/gistfile1.txt
	/etc/init.d/postgresql restart
	sed -e 's|adapter: postgresql|adapter: postgresql\n  username: root\n  password: secret|g'  < /home/$SUDO_USER/project/config/database.yml.sample > /home/$SUDO_USER/project/config/database.yml
	
	gem install tmuxinator
	gem install rails

	# Tmux
	cd /home/$SUDO_USER
	wget -c https://raw.github.com/jyr/tmux-conf/master/.tmux.conf

	# Tmuxinator
	cd /home/$SUDO_USER/.tmuxinator
	wget -c https://raw.github.com/jyr/tmuxinator-conf/master/.tmuxinator/project.yml

else
	echo "Your distribution is not supported by this StackScript"
	exit
fi
