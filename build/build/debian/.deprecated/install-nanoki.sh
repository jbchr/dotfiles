#!/bin/bash
# build nanoki wiki engine
set -x

sudo aptitude install liblua5.1-dev liblua5.1-filesystem0 liblua5.1-sql-sqlite3-2 ident2

cd /data/depot/wiki/nanoki
unzip -u asb-lua-discount-1.2.10.1-11-g98cab0e.zip
tar xvfj discount-2.1.3.tar.bz2
tar xvfz lua-5.1.5.tar.gz
tar xvfz luasocket-2.0.2.tar.gz
tar xvfz lzlib-04-work3.tar.gz
tar xvfj Nanoki.112.tar.bz2
#tar xvfj slnbase-0.9.tar.bz2
tar xvfj slncrypto-1.1.tar.bz2
#tar xvfz slnspider-0.9.gz -C slnspider-0.9
#tar xvfz slnunicode-1.1a.tar.gz
sudo chown -R shum:shum *

cd lua-5.1.5
make linux
sudo make install

cd ../Nanoki.112
# make script fails otherwise
mkdir lib 2>/dev/null
make

cd ../asb-lua-discount-98cab0e
make
cp discount.so ../Nanoki.112/lib

cd ../discount-2.1.3
./configure.sh
make
sudo make install

cd ../luasocket-2.0.2
#aptitude install luasocket
make
sudo make install

cd ../lzlib-0.4-work3
make
cp zlib.so ../Nanoki.112/lib

cd ../slncrypto-1.1/
#cc -I/usr/local/include -I../slncrypt-1.2.3 -g -Werror -Wall -pedantic  -O0 -fPIC -std=c99   -c -o slncrypt.o slncrypt.c
cc -I/usr/local/include -I../slncrypt-1.2.3 -g -Wall -pedantic  -O0 -fPIC -std=c99   -c -o slncrypt.o slncrypt.c
cc -o crypto.so -shared slncrypt.o -L../slncrypt-1.2.3 -lz -L/usr/local/lib -L/usr/local/bin
cp crypto.so ../Nanoki.112/lib

# install package
cd ../Nanoki.112
cp -fv /home/shum/.config/nanoki/*.lua .
sudo make install

# enable wiki body sqlite3 search
sudo ln -sf /usr/lib/x86_64-linux-gnu/lua/5.1/luasql/sqlite3.so /usr/local/nanoki/lib/luasql.so
# markdown not compiled into Nanoki.luac - not needed with discount above
sudo cp markdown.lua /usr/local/nanoki
# copy *lua files for luajit invocation
#sudo rsync -av * /usr/local/nanoki/
sudo ln -s /home/shum/.config/nanoki/etc/screen.css /usr/local/nanoki/etc/