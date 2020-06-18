
ansible-playbook ~/.clap/groups/roles/opm_security.yml 1> outputsecurity.txt 2> outputsecurity.err

ansible-playbook ~/.clap/groups/roles/opm_placement.yml 1> placementout.txt 2> placementout.err

securitygrouid=$(cat outputsecurity.txt | grep group= | cut -d'=' -f2 | cut -d'"' -f1)
vpcid=$(cat outputsecurity.txt | grep vpc= | cut -d'=' -f2 | cut -d'"' -f1)

ansible-playbook ~/.clap/groups/roles/opm_efsnew.yml -e "vpcid=$vpcid secid=$securitygrouid" 1> efsoutput.txt 2> efsoutput.err

efsendpoint=$(cat efsoutput.txt | grep EFSADDR | cut -d'=' -f2 | cut -d'"' -f1)
