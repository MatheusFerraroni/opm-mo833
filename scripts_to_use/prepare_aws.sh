
# ansible-playbook ~/.clap/groups/roles/opm_security.yml >outputsecurity.txt

securitygrouid=$(cat outputsecurity.txt | grep group= | cut -d'=' -f2 | cut -d'"' -f1)
vpcid=$(cat outputsecurity.txt | grep vpc= | cut -d'=' -f2 | cut -d'"' -f1)

echo $securitygrouid
echo $vpcid


ansible-playbook ~/.clap/groups/roles/opm_efsnew.yml -e "vpcid=$vpcid secid=$securitygrouid"