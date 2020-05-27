
cd opm-common/build
cmake .. -DUSE_MPI=1
make -i -j
cd ~

cd opm-material/build
cmake .. -DUSE_MPI=1
make -i -j
cd ~

cd opm-grid/build
cmake .. -DUSE_MPI=1
make -i -j
cd ~

cd opm-models/build
cmake .. -DUSE_MPI=1
make -i -j
cd ~

cd opm-simulators/build
cmake .. -DUSE_MPI=1
make -i -j
cd ~

cd opm-upscaling/build
cmake .. -DUSE_MPI=1
make -i -j
cd ~
