
set -e

echo "init tmux"
yum install -y tmux

# install vim
echo "init vim"
yum install -y vim || true
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim ||true
cp -f ./.vimrc ~/.vimrc


echo "initt bash rc"
cp -f ./.bashrc ~/.bashrc
. ~/.bashrc




