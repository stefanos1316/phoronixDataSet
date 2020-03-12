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

echo "-------Downloading and installing bzip2"
mkdir bzip2 && cd bzip2
wget http://downloads.openwrt.org/sources/bzip2-1.0.6.tar.gz
tar -xzvf bzip2-1.0.6.tar.gz && rm bzip2-1.0.6.tar.gz
mv bzip2-1.0.6/* ./ && rm -rf bzip2-1.0.6
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O2/-O2\ '"$toReplace"'/g' Makefile
fi
make
mv bzip2 bzip2-bin
echo "#!/bin/bash
./bzip2-bin -c -5 ../../../inputs/linux-5.3.tar.gz > /dev/null" > bzip2 
chmod +x bzip2
cd ../

echo "-------Downloading and installing hpcg"
mkdir hpcg && cd hpcg
wget http://www.hpcg-benchmark.org/downloads/hpcg-3.1.tar.gz
tar -xzvf hpcg-3.1.tar.gz && rm hpcg-3.1.tar.gz
mv hpcg-3.1/* ./ && rm -rf hpcg-3.1
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/\$(LINKER)/\$(LINKER)\ '"$toReplace"'/g' Makefile
fi
make arch=Linux_MPI
echo "#!/bin/bash
rm -f HPCG-Benchmark*.txt
cd bin/
mpirun --allow-run-as-root -np 8 ./xhpcg" > hpcg
chmod +x hpcg
cd ../

exit

echo "-------Downloading and installing povray"
mkdir povray && cd povray
wget http://www.phoronix-test-suite.com/benchmark-files/povray-3.7.0.7.tar.xz
tar -xf povray-3.7.0.7.tar.xz && rm povray-3.7.0.7.tar.xz
mv povray-3.7.0.7/* ./ && rm -rf povray-3.7.0.7/ 
cd unix
autoupdate
./prebuild.sh
cd ..
automake --add-missing
CXXFLAGS=${SECURITY_FLAGS} CFLAGS=${SECURITY_FLAGS} LIBS="-lboost_system" ./configure COMPILED_BY="justarandom@gmail.com" --with-boost-thread=boost_thread
make -j $(nproc --all)
echo "#!/bin/sh
echo 1 | ./unix/povray -benchmark" > povray
chmod +x povray
cd ../

echo "-------Downloading and installing ramspeed"
mkdir ramspeed && cd ramspeed
wget http://www.phoronix-test-suite.com/benchmark-files/ramsmp-3.5.0.tar.gz
tar -xzvf ramsmp-3.5.0.tar.gz && rm ramsmp-3.5.0.tar.gz
mv ramsmp-3.5.0/* ./ && rm -rf ramsmp-3.5.0
cc -O3 -march=native -o ramsmp fltmark.c fltmem.c intmark.c intmem.c ramsmp.c ${SECURITY_FLAGS}
echo "#!/bin/bash
argumentType=\`echo \$1 | awk -F\"_\" '{print \$2}'\`
testType=\`echo \$1 | awk -F\"_\" '{print \$1}'\`
case \${argumentType} in
	(\"int\") argumentType=3 ;;
	(\"float\") argumentType=6 ;;
esac
for i in {1..10}; do
	./ramsmp -b \${argumentType} -l \${testType} 
done" > ramspeed
chmod +x ramspeed
cd ../

echo "-------Downloading and installing mt-dgemm"
mkdir mt-dgemm && cd mt-dgemm
wget http://phoronix-test-suite.com/benchmark-files/mtdgemm-crossroads-v1.0.0.tgz
tar -xf mtdgemm-crossroads-v1.0.0.tgz && rm mtdgemm-crossroads-v1.0.0.tgz
mv mt-dgemm/* ./ && rm -rf mt-dgemm
cc -O3 -march=native -fopenmp -o mtdgemm src/mt-dgemm.c ${SECURITY_FLAGS} 
echo "#!/bin/sh
export OMP_NUM_THREADS=\$(nproc --all)
export OMP_PLACES=cores
export OMP_PROC_BIND=close
./mtdgemm 3072 4" > mt-dgemm
chmod +x mt-dgemm
cd ../

echo "-------Downloading and installing jxrend"
mkdir jxrend && cd jxrend
wget http://www.phoronix-test-suite.com/benchmark-files/JXRenderMark-1.0.1.zip
unzip JXRenderMark-1.0.1.zip && rm JXRenderMark-1.0.1.zip
cc JXRenderMark.c -o jxrend -lX11 -lXrender -O2 ${SECURITY_FLAGS}
cd ../

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

echo "-------Downloading and installing aio-stress"
mkdir aio-stress && cd aio-stress
wget http://fsbench.filesystems.org/bench/aio-stress.c
cc -Wall -pthread -o aio-stress aio-stress.c -laio ${SECURITY_FLAGS}
cd ../