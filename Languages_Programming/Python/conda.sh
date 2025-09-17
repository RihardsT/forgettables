### Guide
https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html

# Symlink conda folder to some other disk, to keep space on home
# Can conda be symlinked before it's installed?
ln -s conda data2/conda

#
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

eval "$(/home/rihards/data2/conda/bin/conda shell.YOUR_SHELL_NAME hook)"

fish_add_path /home/rihards/data2/conda/condabin
conda init fish

#
conda create -n NAME python=3.13
conda activate NAME

conda deactivate

# Uninstall
rm -rf ~/conda
conda init --reverse --all
rm -rf ~/.condarc ~/.conda ~/.continuum
