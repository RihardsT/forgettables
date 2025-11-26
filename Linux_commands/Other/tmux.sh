https://linuxize.com/post/getting-started-with-tmux/

##### Completion:
wget https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux
sudo mv tmux /usr/share/bash-completion/completions/tmux

### Run
tmux
# Detach
Ctrl+b d

# Reattach
tmux ls
tmux attach


## New named session
tmux new -s NAME

##### Commands Ctrl+b
### Panes
% - Split pane horizontally
" - Split pane vertically
o - Next pane
; - Toggle between panes
x - Close pane

### Windows
c - create a new window
w - choose window from list
n - switch to next window
0 - switch to window 0
, - rename window


##### Scroll
### with mouse:
echo "set -g mouse on" > ~/.tmux.conf
shift + selection # to copy
###
Ctrl+b + arrows, pg up/down
Ctrl+c # to exit the command mode and stop scrolling
