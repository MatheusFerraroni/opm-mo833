# sh ./compile.sh

rm ./output.txt
touch output.txt

# sh ./run_cluster.sh 100000 t2small1 >> output.txt
# sh ./run_cluster.sh 100000 t3small1 >> output.txt
# sh ./run_cluster.sh 100000 t3xlarge1 >> output.txt
# sh ./run_cluster.sh 100000 c5xlarge1 >> output.txt
# sh ./run_cluster.sh 100000 c6gxlarge1 >> output.txt


# sh ./run_cluster.sh 100000 t2small2 >> output.txt
# sh ./run_cluster.sh 100000 t3small2 >> output.txt
# sh ./run_cluster.sh 100000 t3xlarge2 >> output.txt
sh ./run_cluster.sh 100000 c5xlarge2 >> output.txt
# sh ./run_cluster.sh 100000 c6gxlarge2 >> output.txt


# sh ./run_cluster.sh 100000 t2small4 >> output.txt
# sh ./run_cluster.sh 100000 t3small4 >> output.txt
# sh ./run_cluster.sh 100000 t3xlarge4 >> output.txt
sh ./run_cluster.sh 100000 c5xlarge4 >> output.txt
# sh ./run_cluster.sh 100000 c6gxlarge4 >> output.txt


# sh ./run_cluster.sh 100000 t2small8 >> output.txt
# sh ./run_cluster.sh 100000 t3small8 >> output.txt
# sh ./run_cluster.sh 100000 t3xlarge8 >> output.txt
sh ./run_cluster.sh 100000 c5xlarge8 >> output.txt
# sh ./run_cluster.sh 100000 c6gxlarge8 >> output.txt
