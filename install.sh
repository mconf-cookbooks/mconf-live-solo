#!/bin/bash -xe

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo 'LANG="en_US.UTF-8"' | sudo tee /etc/default/locale
sudo apt-get update
sudo apt-get -y install locales language-pack-en
sudo update-locale LANG=en_US.UTF-8

cd
files=( ".profile" ".bashrc" )
properties=( "LC_ALL" "LANG" "LANGUAGE" )

for file in "${files[@]}"; do
    touch $file
    for property in "${properties[@]}"; do
        sed -i "/export $property=/d" $file
        echo "export $property=en_US.UTF-8" | tee -a $file
    done
done

sudo apt-get -y install git ruby1.9.3 build-essential ntp
sudo gem install bundler --no-ri --no-rdoc -V

cd $DIR
bundle install
bundle exec berks install
bundle exec berks vendor cookbooks/

sudo chef-client -z -c solo.rb -j mconf-live-standalone.json
