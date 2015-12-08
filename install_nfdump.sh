#!/bin/bash


#########################################################
#--- gcc ----------------------------------#
#########################################################

if [ -z `which gcc` ]; then

    echo "You dont have installed gcc, please install it."
    exit 1

fi

#########################################################
#--- lex/flex  ----------------------------------#
#########################################################

if [ -z `which flex` ]; then

    tar xvf flex-2.5.39.tar.gz
    cd flex-2.5.39
    ./configure
    make
    sudo make install
    cd ..
    
fi

#########################################################
#--- Install autoconf ----------------------------------#
#########################################################

tar xvf autoconf-2.69.tar.gz
cd autoconf-2.69
./configure
make
sudo make install

if [ -z `which autoconf` ]; then
    
    echo "ERROR: There was a problem  with the autoconf installation."
    exit 1
    
fi
cd ..

#########################################################
#--- Install automake ----------------------------------#
#########################################################

tar xvf automake-1.14.tar.gz
cd automake-1.14
./configure
make
sudo make install

if [ -z `which automake`   ]; then

    echo "ERROR: there was a problem with the automake installation"
    exit 1
    
fi
cd ..

#########################################################
#--- Install nfdump ----------------------------------#
#########################################################

cd nfdump
./configure --enable-sflow
make
sudo make install

if [ -z `which nfdump`   ]; then
     
    echo "ERROR: there was a problem with the nfdump installation"
    exit 1
          
fi
cd ..

echo "Done !!!!!!!!!!!!!!!!!!!!!!!!"
nfdump -V

