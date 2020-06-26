## Informações básicas

Autor: Matheus Ferraroni Sanches
RA: 212142
Data: 29/06/2020
Aplicação: <a href="https://opm-project.org/">OPEN POROUS MEDIA (OPM)</a>.



## Reprodução dos Experimentos

* Pasta de credenciais do Clap deve ter o mesmo nome das credenciais usadas neste trabalho. Alguns dos scripts fazem referências direta a elas.
* Tutorial feito para ubuntu Ubuntu 18.04.4 Desktop (64-bit) (http://releases.ubuntu.com/18.04/ubuntu-18.04.4-desktop-amd64.iso.torrent?_ga=2.71374547.1733202993.1593114621-1005120194.1584732179)


### Preparar ambiente local

1. Instalar CLAP
⋅⋅* sudo apt-get install gcc g++ git libc6-dev libffi-dev libssl-dev virtualenv python3 python3-pip
⋅⋅* git clone https://github.com/lmcad-unicamp/CLAP.git clap
⋅⋅* cd clap
⋅⋅* chmod +x install.sh
⋅⋅* ./install.sh
2. Ative o virtual-env do CLAP
⋅⋅* source clap-env/bin/activate
⋅⋅* cd ~
3. Clone os scripts e pastas necessárias
⋅⋅* git clone https://github.com/MatheusFerraroni/opm-mo833
⋅⋅* Copiar as pastas ~/opm-mo833/clap/configs e ~/opm-mo833/clap/group para ~/.clap/
4. Configure as chaves na pasta ~/.clap/private de acordo com o arquivo na url (https://git.io/JfjYw)
![alt text](./imgs/private.png "Chaves configuradas")
