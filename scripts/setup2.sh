
echo "INICIANDO COMPILERS" >> ~/log_geral.txt

cd ~/opm-common/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j  1> make_res.out 2> make_res.outerr


echo "COMPILERS 1" >> ~/log_geral.txt

cd ~/opm-material/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j  1> make_res.out 2> make_res.outerr


echo "COMPILERS 2" >> ~/log_geral.txt

cd ~/opm-grid/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j  1> make_res.out 2> make_res.outerr


echo "COMPILERS 3" >> ~/log_geral.txt

cd ~/opm-models/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j  1> make_res.out 2> make_res.outerr


echo "COMPILERS 4" >> ~/log_geral.txt

cd ~/opm-simulators/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j  1> make_res.out 2> make_res.outerr


echo "COMPILERS 5" >> ~/log_geral.txt

cd ~/opm-upscaling/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j  1> make_res.out 2> make_res.outerr

echo "COMPILERS COMPLETE" >> ~/log_geral.txt