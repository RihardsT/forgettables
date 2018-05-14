# If using pyenv, install tkinter dependcies first, then install python
sudo apt-get install tk-dev
pyenv install 3.5.2
pyenv local 3.5.2

pip install -U matplotlib


pip install -r requirements.txt
