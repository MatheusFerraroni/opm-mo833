
echo "iniciando" > /home/ubuntu/log_geral.txt




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



echo "Começando os clones do OPM" >> /home/ubuntu/log_geral.txt

git clone https://github.com/OPM/opm-common.git
mkdir /home/ubuntu/opm-common/build


git clone https://github.com/OPM/opm-material.git
mkdir /home/ubuntu/opm-material/build


git clone https://github.com/OPM/opm-grid.git
mkdir /home/ubuntu/opm-grid/build


git clone https://github.com/OPM/opm-models.git
mkdir /home/ubuntu/opm-models/build


git clone https://github.com/OPM/opm-simulators.git
mkdir /home/ubuntu/opm-simulators/build


git clone https://github.com/OPM/opm-upscaling.git
mkdir /home/ubuntu/opm-upscaling/build





echo "all complete" >> /home/ubuntu/log_geral.txt