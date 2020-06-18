echo "# Criando cluster para compilação"

efsendpoint=$(cat efsoutput.txt | grep EFSADDR | cut -d'=' -f2 | cut -d'"' -f1)

clapp cluster start cluster-opm-compiler

clusterid=$(clapp cluster list | grep id | cut -d' ' -f2)

echo "# Cluster criado: "$clusterid

echo "# Montando EFS"

clapp cluster action $clusterid opm mountefs --extra efslocation=$efsendpoint

echo "COMPILANDO"

clapp cluster action $clusterid opm compila

echo "# Desligando cluster de compilação"

clapp cluster stop $clusterid

echo "# Cluster desligado"