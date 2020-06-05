rm ~/experimental_results/sshs/*

echo "# Criando maquinas"

clapp cluster start cluster-opm-t2small-1

clusterid=$(clapp cluster list | grep id | cut -d' ' -f2)

echo "# Cluster criado: "$clusterid

echo "# Executando NORNE"

clapp cluster action $clusterid opm run --extra maxpi=$1 tipo=t2small1

echo "# Desligando cluster de compilação"

clapp cluster stop $clusterid

echo "# Cluster desligado"