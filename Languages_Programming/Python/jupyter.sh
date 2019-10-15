##### Set tab size for Jupyter notebook
mkdir ~/.jupyter/nbconfig

echo '{
  "CodeCell": {
    "cm_config": {
      "indentUnit": 2
    }
  }
}' > ~/.jupyter/nbconfig/notebook.json



https://towardsdatascience.com/optimizing-jupyter-notebook-tips-tricks-and-nbextensions-26d75d502663
##### Themes
sudo python3 -m pip install jupyterthemes
# list theme
jt -l
# set theme
jt -t THEME_NAME
# restore theme
jt -r
