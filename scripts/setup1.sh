
echo "iniciando" > ~/log_geral.txt

sudo apt-get update

echo "update ok" >> ~/log_geral.txt

sudo apt-get install -y wget make gcc libgfortran3 \
sysstat libibnetdisc-dev openmpi-bin libopenmpi-dev \
libhdf5-openmpi-dev gfortran build-essential git

echo "apt-get install ok" >> ~/log_geral.txt

wget https://github.com/Kitware/CMake/releases/download/v3.17.2/cmake-3.17.2-Linux-x86_64.sh


echo "pegou instalador do cmake" >> ~/log_geral.txt


chmod +x cmake-3.17.2-Linux-x86_64.sh
echo "permissao no arquivo para instalar cmake" >> ~/log_geral.txt
bash cmake-3.17.2-Linux-x86_64.sh --skip-license
echo "instalou cmake" >> ~/log_geral.txt
sudo ln -s /home/ubuntu/bin/* /usr/local/bin
echo "criou link cmake" >> ~/log_geral.txt


git clone https://github.com/OPM/opm-common.git

# mkdir opm-common/build
# cd  opm-common/build
# cmake ..



echo "all complete" >> ~/log_geral.txt