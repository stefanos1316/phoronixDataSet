CFLAGS="-O2 -fstack-protector-all" ./configure && make && sudo make install
#CFLAGS="-O2 -fno-stack-protector" ./configure && make && sudo make install
#CFLAGS="-O2 -z execstack" ./configure && make && sudo make install
#CFLAGS="-O2 -no-pie -fno-pic" ./configure && make && sudo make install
#CFLAGS="-O2 -fvtable-verify=none" ./configure && make && sudo make install
#CFLAGS="-O2 -fstack-protector-all -z execstack -no-pie -fno-pic -fvtable-verify=none" ./configure && make && sudo make install
