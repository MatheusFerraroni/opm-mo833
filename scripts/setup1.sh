
echo "iniciando" > ~/log_geral.txt

sudo apt-get update

echo "update ok" >> ~/log_geral.txt

# sudo apt-get install -y wget make gcc libgfortran3 \
# sysstat libibnetdisc-dev openmpi-bin libopenmpi-dev \
# libhdf5-openmpi-dev gfortran build-essential git

# echo "apt-get install ok" >> ~/log_geral.txt

# wget https://github.com/Kitware/CMake/releases/download/v3.17.2/cmake-3.17.2-Linux-x86_64.sh


# echo "pegou instalador do cmake" >> ~/log_geral.txt


# chmod +x cmake-3.17.2-Linux-x86_64.sh
# echo "permissao no arquivo para instalar cmake" >> ~/log_geral.txt
# bash cmake-3.17.2-Linux-x86_64.sh --skip-license
# echo "instalou cmake" >> ~/log_geral.txt
# sudo ln -s /home/ubuntu/bin/* /usr/local/bin
# echo "criou link cmake" >> ~/log_geral.txt






# # Make sure we have updated URLs to packages etc.
# sudo apt-get update -y

# # For server edition of Ubuntu add-apt-repository depends on
# sudo apt-get install -y software-properties-common

# # Add PPA for OPM packages
# sudo add-apt-repository -y ppa:opm/ppa
# sudo apt-get update -y

# # Packages necessary for building
# sudo apt-get install -y build-essential gfortran pkg-config cmake

# # Packages necessary for documentation
# sudo apt-get install -y doxygen ghostscript texlive-latex-recommended pgf gnuplot

# # Packages necessary for version control
# sudo apt-get install -y git-core

# # MPI for parallel programs
# sudo apt-get install -y mpi-default-dev
# # Prerequisite libraries
# sudo apt-get install -y libblas-dev libboost-all-dev \
#   libsuitesparse-dev libtrilinos-zoltan-dev

# # Parts of Dune needed
# sudo apt-get install libdune-common-dev libdune-geometry-dev \
#   libdune-istl-dev libdune-grid-dev








git clone https://github.com/OPM/opm-common.git
mkdir opm-common/build
# cd  opm-common/build
# cmake .. 1> cmake.out 2> cmake.outerr



echo "all complete" >> ~/log_geral.txt