# If using pyenv, install tkinter dependcies first, then install python
sudo apt-get install tk-dev
pyenv install 3.5.2
pyenv local 3.5.2

# -U upgrade
pip install -U matplotlib

pip install -r requirements.txt

### Install with python pip, when you've broken OS pip somehow
sudo python3 -m pip install PACKAGE
# Install to user, to have the executables available easily, easier than ^^
pip install --user matplotlib
# Remember to set path for bins to be usable
export PATH="${PATH}:$(python3 -c 'import site; print(site.USER_BASE)')/bin"


##### Virtual environment
sudo pip install -U virtualenv
sudo apt install python3-virtualenv

# Create a python virtual environment in current dir?
virtualenv .venv
# Enable the virtual environment
source .venv/bin/activate
# Run pip commands to install your packages
pip install -U PACKAGE
# To go out of virtualenv
deactivate


##### Install non system pip packages now.
mkdir ~/venvs
VIRTUALENV=HERE
python3 -m venv ~/venvs/${VIRTUALENV}
~/venvs/${VIRTUALENV}/bin/pip install PACKAGE_HERE
~/venvs/${VIRTUALENV}/bin/python SCRIPT_HERE


### Install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
