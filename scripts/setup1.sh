
echo "iniciando" > ~/log_geral.txt

sudo apt-get update

echo "update ok" >> ~/log_geral.txt


# Make sure we have updated URLs to packages etc.
sudo apt-get update -y

# For server edition of Ubuntu add-apt-repository depends on
sudo apt-get install -y software-properties-common

# Add PPA for OPM packages
sudo add-apt-repository -y ppa:opm/ppa

sudo apt-get update -y

# Packages necessary for building
sudo apt-get install -y build-essential gfortran pkg-config cmake

# Packages necessary for documentation
sudo apt-get install -y doxygen ghostscript texlive-latex-recommended pgf gnuplot

# Packages necessary for version control
sudo apt-get install -y git-core

# MPI for parallel programs
sudo apt-get install -y mpi-default-dev
# Prerequisite libraries
sudo apt-get install -y libblas-dev libboost-all-dev \
  libsuitesparse-dev libtrilinos-zoltan-dev

# Parts of Dune needed
sudo apt-get install -y libdune-common-dev libdune-geometry-dev \
  libdune-istl-dev libdune-grid-dev








git clone https://github.com/OPM/opm-common.git
mkdir opm-common/build
# cd opm-common/build
# cmake .. 1> cmake.out 2> cmake.outerr



echo "all complete" >> ~/log_geral.txt