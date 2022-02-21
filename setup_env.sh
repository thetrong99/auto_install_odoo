cd /tmp
curl https://pyenv.run | bash
cd
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> .bashrc
echo 'eval "$(pyenv init -)"' >> .bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> .bashrc

echo 'export PATH="/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:$HOME/.pyenv/bin"' >> .bash_profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> .bash_profile
echo 'export PATH="$PYENV_ROOT/shims:$PATH"' >> .bash_profile

sleep 3
exec $SHELL -l
source $HOME/.bash_profile
sleep 2
pyenv install 3.6.9
sleep 5
cd /opt/tsm-backend
pyenv virtualenv 3.6.9 backend-env
pyenv local backend-env
pip install --upgrade pip && pip install -r odoo12/requirements.txt