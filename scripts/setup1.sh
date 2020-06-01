
echo "SETUP 1 STARTED" > /home/ubuntu/log_geral.txt
date "+%H:%M:%S   %d/%m/%y" >> /home/ubuntu/log_geral.txt



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

sudo apt-get install -y unzip




echo "PREPARANDO EFS" >> /home/ubuntu/log_geral.txt
date "+%H:%M:%S   %d/%m/%y" >> /home/ubuntu/log_geral.txt


sudo apt-get install -y nfs-common

sudo apt-get update

sudo apt-get install -y git binutils make

git clone https://github.com/aws/efs-utils

cd efs-utils

make deb

sudo apt-get install -y ./build/amazon-efs-utils*deb

sudo mkdir /home/ubuntu/efs

sudo chmod -R 777 /home/ubuntu/efs

cd /home/ubuntu



# sudo mount -t efs fs-2e5fb0ad:/ /home/ubuntu/efs

# sudo mount -t efs -o tls fs-2e5fb0ad:/ /home/ubuntu/efs

# sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-2e5fb0ad.efs.us-east-1.amazonaws.com:/ /home/ubuntu/efs



echo "Começando os clones do OPM" >> /home/ubuntu/log_geral.txt
date "+%H:%M:%S   %d/%m/%y" >> /home/ubuntu/log_geral.txt

git clone https://github.com/MatheusFerraroni/opm-common.git
mkdir /home/ubuntu/opm-common/build


git clone https://github.com/MatheusFerraroni/opm-material.git
mkdir /home/ubuntu/opm-material/build


git clone https://github.com/MatheusFerraroni/opm-grid.git
mkdir /home/ubuntu/opm-grid/build


git clone https://github.com/MatheusFerraroni/opm-models.git
mkdir /home/ubuntu/opm-models/build


git clone https://github.com/MatheusFerraroni/opm-simulators.git
mkdir /home/ubuntu/opm-simulators/build


git clone https://github.com/MatheusFerraroni/opm-upscaling.git
mkdir /home/ubuntu/opm-upscaling/build


git clone https://github.com/MatheusFerraroni/opm-data.git


echo "Pegando PERF" >> /home/ubuntu/log_geral.txt
date "+%H:%M:%S   %d/%m/%y" >> /home/ubuntu/log_geral.txt



apt-get install -y linux-tools-$(uname -r) linux-tools-generic


echo "Pegando VALGRIND" >> /home/ubuntu/log_geral.txt
date "+%H:%M:%S   %d/%m/%y" >> /home/ubuntu/log_geral.txt

sudo apt-get install -y valgrind

echo "SETUP 1 COMPLETE" >> /home/ubuntu/log_geral.txt
date "+%H:%M:%S   %d/%m/%y" >> /home/ubuntu/log_geral.txt
