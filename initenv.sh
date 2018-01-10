
set -e

# install vim
echo "install  vim"
yum install -y vim

echo "init tbash rc"
cp -f ./.bashrc ~/.bashrc
. ~/.bashrc




