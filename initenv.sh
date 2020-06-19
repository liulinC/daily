
set -e

echo "init tmux"
yum install -y tmux

# install vim
echo "init vim"
yum install -y vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp -f ./.vimrc ~/.vimrc


echo "initt bash rc"
cp -f ./.bashrc ~/.bashrc
. ~/.bashrc




