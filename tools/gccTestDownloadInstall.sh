#!/bin/bash

SECURITY_FLAGS=''

if [ -z "$1" ]; then
    echo "Please provide any of the following CFLAGS as a string to prepare the executables:"
    echo "'-fno-stack-protector -z execstack -no-pie -fvtable-verify=none'"
    SECURITY_FLAGS=''
else
    SECURITY_FLAGS=$1
fi

taskDirectory='gcc_tasks_test'
taskScripts='scripts'
mkdir gcc_tasks_test
cd gcc_tasks_test

echo "-------Downloading and installing qgears"
mkdir qgears && cd qgears
wget http://www.phoronix-test-suite.com/benchmark-files/qgears2.tar.bz2
tar -jxf qgears2.tar.bz2 && rm qgears2.tar.bz2
mv qgears2/* ./ && rm -rf qgears2
chmod +w commonrenderer.cpp
echo "--- commonrenderer.cpp.orig       2008-11-02 16:19:16.000000000 -0500
+++ commonrenderer.cpp  2008-11-02 16:20:33.000000000 -0500
@@ -31,6 +31,7 @@
 double gear1_rotation = 35;
 double gear2_rotation = 24;
 double gear3_rotation = 33.5;
+int frame_report_count = 0;
 
 #define LINEWIDTH 3
 
@@ -83,7 +84,13 @@
 
     ++frame_cnt;
     if (FRAME_COUNT_INTERVAL == frame_cnt)
+    {
         printFrameRate();
+        frame_report_count++;
+    }
+
+    if(frame_report_count == 40)
+        exit(0);
 }
 
 QPainterPath CommonRenderer::gearPath(double inner_radius, double outer_radius," | patch -p0
qmake
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O2/-O2\ '"$toReplace"'/g' Makefile
fi
make -j $(nproc --all)
mv qgears qgears-bin
echo "#!/bin/bash
export QT_QPA_PLATFORM='offscreen'
for i in {1..10}; do
./qgears-bin \$1
done" > qgears
chmod +x qgears
cd ../

exit

echo "-------Downloading and installing aio-stress"
mkdir aio-stress && cd aio-stress
wget http://fsbench.filesystems.org/bench/aio-stress.c
cc -Wall -pthread -o aio-stress aio-stress.c -laio ${SECURITY_FLAGS}
cd ../