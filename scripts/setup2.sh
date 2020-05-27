
echo "INICIANDO COMPILERS" >> /home/ubuntu/log_geral.txt
date "+%H:%M:%S   %d/%m/%y" > /home/ubuntu/log_geral.txt

cd /home/ubuntu/opm-common/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j 2 1> make_res.out 2> make_res.outerr


echo "COMPILERS 1" >> /home/ubuntu/log_geral.txt
date "+%H:%M:%S   %d/%m/%y" > /home/ubuntu/log_geral.txt

cd /home/ubuntu/opm-material/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j 2 1> make_res.out 2> make_res.outerr


echo "COMPILERS 2" >> /home/ubuntu/log_geral.txt
date "+%H:%M:%S   %d/%m/%y" > /home/ubuntu/log_geral.txt

cd /home/ubuntu/opm-grid/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j 2 1> make_res.out 2> make_res.outerr


echo "COMPILERS 3" >> /home/ubuntu/log_geral.txt
date "+%H:%M:%S   %d/%m/%y" > /home/ubuntu/log_geral.txt

cd /home/ubuntu/opm-models/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j 2 1> make_res.out 2> make_res.outerr


echo "COMPILERS 4" >> /home/ubuntu/log_geral.txt
date "+%H:%M:%S   %d/%m/%y" > /home/ubuntu/log_geral.txt

cd /home/ubuntu/opm-simulators/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j 2 1> make_res.out 2> make_res.outerr


echo "COMPILERS 5" >> /home/ubuntu/log_geral.txt
date "+%H:%M:%S   %d/%m/%y" > /home/ubuntu/log_geral.txt

cd /home/ubuntu/opm-upscaling/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j 2 1> make_res.out 2> make_res.outerr

echo "COMPILERS COMPLETE" >> /home/ubuntu/log_geral.txt
date "+%H:%M:%S   %d/%m/%y" > /home/ubuntu/log_geral.txt