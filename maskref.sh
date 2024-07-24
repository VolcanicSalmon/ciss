beds=($(ls *bedgraph | sed -n ${SLURM_ARRAY_TASK_ID}p))
bedout=$(echo $beds | sed 's/bedgraph/ft.bed/')
fas=$(echo $beds | sed 's/_mappa.bedgraph//')
faout=$(echo $beds | sed 's/bedgraph/fa/')
awk '{ if ($4 <= 0.5) print $1"\t"$2"\t"$3;}' $beds | /mnt/shared/scratch/kli/apps/bedtools2/bin/bedtools merge -i - -d 100 > ${bedout}
bedtools maskfasta -fi ../$fas -fo $faout
