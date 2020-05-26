
cd opm-common/build
cmake .. 1> cmake.out 2> cmake.outerr
make -j 2 1> make.out 2> make.outerr
cd ~

cd opm-material/build
cmake .. 1> cmake.out 2> cmake.outerr
make -j 2 1> make.out 2> make.outerr
cd ~

cd opm-grid/build
cmake .. 1> cmake.out 2> cmake.outerr
make -j 2 1> make.out 2> make.outerr
cd ~

cd opm-models/build
cmake .. 1> cmake.out 2> cmake.outerr
make -j 2 1> make.out 2> make.outerr
cd ~

cd opm-simulators/build
cmake .. 1> cmake.out 2> cmake.outerr
make 1> make.out 2> make.outerr
cd ~

cd opm-upscaling/build
cmake .. 1> cmake.out 2> cmake.outerr
make -j 2 1> make.out 2> make.outerr
cd ~
