#!/bin/bash

#number of cores to reserve for job
nthreads=319

#full s3 path where networks will go
s3="s3://metanetworks/ROSMAP/metanetworksV2/MCI/"

#location of data file
dataFile="/shared/ROSMAP/rosmapMCIRNAseq.csv"

#location of metanetwork synapse scripts
pathv="/shared/metanetworkSynapse/"

#output path for temporary result file prior to pushing to s3/synapse
outputpath="/shared/ROSMAP/metanetworksV2/MCI/"

#path within s3
s3b="ROSMAP/metanetworksV2/MCI/"

#id of folder on Synapse that files will go to
parentId="syn5752536"

#path to csv file with annotations to add to file on Synapse
annotationFile="/shared/ROSMAP/metanetworksV2/MCI/annoFile.txt"

#path to csv file with provenance to add to file on synapse
provenanceFile="/shared/ROSMAP/metanetworksV2/MCI/provenanceFile.txt"

#path to error output
errorOutput="/shared/ROSMAP/metanetworksV2/MCI/Regressionerror.txt"

#path to out output
outOutput="/shared/ROSMAP/metanetworksV2/MCI/Regressionout.txt"

#job script name
jobname="ROSMAPRegressionMCI"


echo "qsub -v s3=$s3,dataFile=$dataFile,pathv=$pathv,c3net=0,mrnet=0,wgcnaTOM=0,sparrowZ=1,lassoCV1se=1,ridgeCV1se=1,genie3=1,tigress=1,numberCore=$nthreads,outputpath=$outputpath,s3b=$s3b,parentId=$parentId,annotationFile=$annotationFile,provenanceFile=$provenanceFile -pe orte $nthreads -S /bin/bash -V -cwd -N $jobname -e $errorOutput -o $outOutput $pathv/buildNet.sh"

qsub -v s3=$s3,dataFile=$dataFile,pathv=$pathv,c3net=0,mrnet=0,wgcnaTOM=0,sparrowZ=1,lassoCV1se=1,ridgeCV1se=1,genie3=1,tigress=1,numberCore=$nthreads,outputpath=$outputpath,s3b=$s3b,parentId=$parentId,annotationFile=$annotationFile,provenanceFile=$provenanceFile -pe orte $nthreads -S /bin/bash -V -cwd -N $jobname -e $errorOutput -o $outOutput $pathv/buildNet.sh