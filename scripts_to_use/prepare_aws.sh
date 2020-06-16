# clapp cluster start cluster-opmprepare

clusterid=$(clapp cluster list | grep id | cut -d' ' -f2)

echo "# Cluster criado: "$clusterid


# clapp cluster action $clusterid opmprepare securitynew>outputsecurity.txt
# clapp cluster action $clusterid opmprepare placementnew



securitygrouid=$(cat outputsecurity.txt | grep group= | cut -d'=' -f2 | cut -d'"' -f1)
vpcid=$(cat outputsecurity.txt | grep vpc= | cut -d'=' -f2 | cut -d'"' -f1)




# clapp cluster action $clusterid opmprepare getsubnets --extra vpcid=$vpcid > subnets.txt


# cat subnets.txt | grep "\"id\":" | sort | uniq > subnets2.txt

# input="subnets2.txt"
# while IFS= read -r line
# do
#   echo $line | cut -d':' -f2 | cut -d'"' -f2 >> subnets3.txt
# done < "$input"


echo clapp cluster action $clusterid opmprepare efsnew --extra vpcid=$vpcid secid=$securitygrouid
# input="subnets3.txt"
# while IFS= read -r line
# do
#   
# done < "$input"


