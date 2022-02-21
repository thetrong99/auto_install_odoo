cd /tmp
curl https://pyenv.run | bash
cd
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> .bashrc
echo 'eval "$(pyenv init -)"' >> .bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> .bashrc

echo 'export PATH="/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:$HOME/.pyenv/bin"' >> .bash_profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> .bash_profile
echo 'export PATH="$PYENV_ROOT/shims:$PATH"' >> .bash_profile

exec $SHELL -l
source $HOME/.bash_profile

pyenv install 3.6.9
cd /opt/tsm-backend
pyenv virtualenv 3.6.9 tsm-backend-env
pyenv local tsm-backend-env
pip install --upgrade pip
pip install -r odoo12/requirements.txt