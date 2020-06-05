
echo "# Criando cluster para compilação"
clapp cluster start cluster-opm-compiler


clusterid=$(clapp cluster list | grep id | cut -d' ' -f2)

echo "# Cluster criado: "$clusterid
echo "# Desligando cluster de compilação"

clapp cluster stop $clusterid

echo "# Cluster desligado"