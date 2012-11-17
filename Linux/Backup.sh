#!bin/sh
tar -cvf backup_`date +"%m_%d_%y_%H%M"`.tar ~/linux-excercise/ 
gzip backup_`date +"%m_%d_%y_%H%M"`.tar
