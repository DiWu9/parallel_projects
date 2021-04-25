#PBS -l nodes=1:ppn=4
#PBS -l walltime=10:00
#PBS -j oe
#PBS -N runmpi

if [ "$PBS_ENVIRONMENT" != "PBS_INTERACTIVE" ] ; then
cd $PBS_O_WORKDIR
fi

typeset integer NPROCS
NPROCS=`wc -l $PBS_NODEFILE | awk '{print $1}'`

#location of mpi files
#MPI_DIR=$HOME/some-mpi-directory

##to use TCP
mpirun --mca btl tcp,self --mca btl_tcp_if_include eth0 \
       -hostfile $PBS_NODEFILE -np $NPROCS ./normalize
