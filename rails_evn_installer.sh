#!/usr/bin/env bash

echo 'y' | sudo apt-get install git curl libyaml-dev libxslt-dev libxml2-dev libsqlite3-dev
curl -sSL https://get.rvm.io | bash -s stable
sed -i 's!cache.ruby-lang.org/pub/ruby!ruby.taobao.org/mirrors/ruby!' ~/.rvm/config/db
echo -e 'install: --no-rdoc --no-ri\nupdate: --no-rdoc --no-ri' > ~/.gemrc
source ~/.rvm/scripts/rvm
rvm requirements
rvm install 2.0.0 --with-openssl-dir=$HOME/.rvm/usr
gem sources --remove https://rubygems.org/
gem sources -a http://ruby.taobao.org/
rvm use 2.0.0@rails_4_0 --create --default
# gem update --system 2.1.9
gem install rails --version 4.0.4 --no-ri --no-rdoc
sudo reboot
