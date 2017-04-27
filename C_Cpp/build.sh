sudo apt-get install libboost-all-dev
sudo apt-get install openmpi-bin openmpi-common libopenmpi1.6 libopenmpi-dev

mpic++ rsacracker.cpp -o rsacracker -lboost_mpi -lboost_serialization
mpirun -np 4 rsacracker