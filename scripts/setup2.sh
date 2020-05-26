
cd opm-common/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j 2 1> make.out 2> make.outerr
cd ~

cd opm-material/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j 2 1> make.out 2> make.outerr
cd ~

cd opm-grid/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j 2 1> make.out 2> make.outerr
cd ~

cd opm-models/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j 2 1> make.out 2> make.outerr
cd ~

cd opm-simulators/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i 1> make.out 2> make.outerr
cd ~

cd opm-upscaling/build
cmake .. -DUSE_MPI=1 1> cmake.out 2> cmake.outerr
make -i -j 2 1> make.out 2> make.outerr
cd ~
