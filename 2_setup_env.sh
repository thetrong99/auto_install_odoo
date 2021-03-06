#!/bin/bash

#cài pyenv
cd /tmp
curl https://pyenv.run | bash
cd
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> .bashrc
echo 'eval "$(pyenv init -)"' >> .bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> .bashrc

echo 'export PATH="/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:$HOME/.pyenv/bin"' >> .bash_profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> .bash_profile
echo 'export PATH="$PYENV_ROOT/shims:$PATH"' >> .bash_profile

sleep 2
exec /bin/bash -l 
source /home/tsm/.bash_profile 
echo "------------pyenv done----------"

#sh /home/tsm/3_set_source_code.sh