#!/bin/bash

################################################################################
#
# Submit file for a batch job on Rosie.
#
# To submit your job, run 'sbatch <jobfile>'
# To view your jobs in the Slurm queue, run 'squeue -l -u <your_username>'
# To view details of a running job, run 'scontrol show jobid -d <jobid>'
# To cancel a job, run 'scancel <jobid>'
#
# See the manpages for salloc, srun, sbatch, squeue, scontrol, and scancel
# for more information or read the Slurm docs online: https://slurm.schedmd.com
#
################################################################################


# You _must_ specify the partition. Rosie's default is the 'teaching'
# partition for interactive nodes.  Another option is the 'batch' partition.
#SBATCH --partition=batch

# The number of nodes to request
#SBATCH --nodes=1

# The number of GPUs to request
#SBATCH --gpus=1

# The number of CPUs to request per GPU
#SBATCH --cpus-per-gpu=4

# The error file to write to
# #SBATCH --error='sbatcherrorfile.out'

# Kill the job if it takes longer than the specified time
# format: <days>-<hours>:<minutes>
#SBATCH --time=1-0:0


####
#
# Here's the actual job code.
# Note: You need to make sure that you execute this from the directory that
# your python file is located in OR provide an absolute path.
#
####

# Path to container
#container="/data/containers/msoe-tensorflow-20.07-tf2-py3.sif"

# Command to run inside container
command="ssh -L 5000:dh-mgmt2.hpc.msoe.edu:5000 andreanoc@dh0-mgmt2.hpc.msoe.edu  &&
python ./app.py"

# Execute singularity container on node.
#singularity exec --nv -B /data:/data ${container} /usr/local/bin/nvidia_entrypoint.sh ${command}

# Use srun to run experiment
srun $command