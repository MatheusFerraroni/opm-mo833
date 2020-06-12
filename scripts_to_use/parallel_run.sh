# rm ~/experimental_results/sshs/*


# clapp cluster start cluster-opm-t2small1
# clapp cluster start cluster-opm-t3small1
# clapp cluster start cluster-opm-t3xlarge1
# clapp cluster start cluster-opm-c5xlarge1
# clapp cluster start cluster-opm-a1xlarge1
# clapp cluster start cluster-opm-t2small2
# clapp cluster start cluster-opm-t3small2
# clapp cluster start cluster-opm-t3xlarge2
# clapp cluster start cluster-opm-c5xlarge2
# clapp cluster start cluster-opm-a1xlarge2
# clapp cluster start cluster-opm-t2small4
# clapp cluster start cluster-opm-t3small4
# clapp cluster start cluster-opm-t3xlarge4
# clapp cluster start cluster-opm-c5xlarge4
# clapp cluster start cluster-opm-a1xlarge4
# clapp cluster start cluster-opm-t2small8
# clapp cluster start cluster-opm-t3small8
# clapp cluster start cluster-opm-t3xlarge8
# clapp cluster start cluster-opm-c5xlarge8
# clapp cluster start cluster-opm-a1xlarge8


# clapp node list | grep master
# clapp node list | grep master | cut -d' ' -f8 | cut -d'`' -f2 | cut -d'=' -f2 | cut -d':' -f1