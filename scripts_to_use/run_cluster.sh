#!/bin/sh
die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 2 ] || die "2 argumentos necessarios, $# fornecidos. (1 - max-pi/2- tipo configuracao)"
echo $1 | grep -E -q '^[0-9]+$' || die "Parametro 1 deve ser um valor numerico, $1 fornecido"

rm ~/experimental_results/sshs/*

echo "# Criando maquinas"

clapp cluster start cluster-opm-$2

clusterid=$(clapp cluster list | grep id | cut -d' ' -f2)
masterid=$(clapp node list | grep master | cut -d' ' -f3 | cut -d'`' -f2)

echo "# Cluster criado: "$clusterid

echo "# Master id: "$masterid

echo "# Executando Datasets"

clapp cluster action $clusterid opm run --nodes $masterid --extra maxpi=$1 tipo=$2

echo "# Desligando cluster"

clapp cluster stop $clusterid

echo "# Cluster desligado"