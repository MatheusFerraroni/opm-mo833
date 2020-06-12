import os
from glob import glob


path = "/home/matheus/experimental_results (copy)/"


arquivos_encontrados = [y for x in os.walk(path) for y in glob(os.path.join(x[0], '*.txt'))]


datasets = ["NORNE","spe9","spe10model1"]
clusters = [
"t2small1",
"t2small2",
"t2small4",
"t2small8",

"t3small1",
"t3small2",
"t3small4",
"t3small8",

"t3xlarge1",
"t3xlarge2",
"t3xlarge4",
"t3xlarge8",

"c5xlarge1",
"c5xlarge2",
"c5xlarge4",
"c5xlarge8",

"c6gxlarge1",
"c6gxlarge2",
"c6gxlarge4",
"c6gxlarge8",
]


def get_dados(arquivo):
    # print("Lendo arquivo: ",arquivo)
    f = open(arquivo,"r")
    infos = f.read().split("\n")
    f.close()


    inicialization_time = None

    total_time_time = None
    total_time_main = 0
    total_time_main_count = 0
    beta = None
    avg_PIs = None
    n_PIs = -1
    st_PI = None
    nd_PI = None
    avg2_6 = 0
    avg2_11 = 0

    for i in range(len(infos)):
        line = infos[i].split(",")
        line[0] = line[0].replace("[MO833] ","")
        
        try:
            # print(line)
            if line[0]=="PI avg":
                if int(line[1])!=0:
                    continue
                avg_PIs = float(line[2])
            elif line[0]=="Total time":
                total_time_main += float(line[1])
                total_time_main_count += 1
            elif line[0]=="Beta":
                if int(line[1])!=0:
                    continue
                beta = float(line[2])
            elif line[0]=="real":
                total_time_time = float(line[1])
            elif line[0]=="t1_antes_paramount":
                if int(line[1])!=0:
                    continue
                inicialization_time = float(line[2])
            elif line[0]=="Paramount Iteration":
                if int(line[1])!=0:
                    continue

                pi_numer = int(line[2])
                pi_tempo = float(line[3])
                if pi_numer>=2 and pi_numer<=6:
                    avg2_6 += pi_tempo
                    avg2_11 += pi_tempo
                elif pi_numer>=2 and pi_numer <=11:
                    avg2_11 += pi_tempo
                if pi_numer==1:
                    st_PI = pi_tempo
                if pi_numer==2:
                    nd_PI = pi_tempo
                if pi_numer>n_PIs:
                    n_PIs = pi_numer
        except:
            raise

    if total_time_main_count>0:
        total_time_main /= total_time_main_count

    if n_PIs<6:
        avg2_6 = 0
        avg2_11 = 0
    elif n_PIs <11:
        avg2_6 = avg2_6/5
        avg2_11 = 0
    else:
        avg2_6 = avg2_6/5
        avg2_11 = avg2_11/10

    ret = {}
    ret["inicialization_time"] = inicialization_time
    ret["total_time_time"] = total_time_time
    ret["total_time_main"] = total_time_main
    ret["beta"] = beta
    ret["avg_PIs"] = avg_PIs
    ret["n_PIs"] = n_PIs
    ret["1st_PI"] = st_PI
    ret["2nd_PI"] = nd_PI
    ret["avg2_6"] = avg2_6
    ret["avg2_11"] = avg2_11
    return ret


resultados_encontrados = {}
for d in datasets:
    resultados_encontrados[d] = {}
    for c in clusters:
        resultados_encontrados[d][c] = []
        resultados_encontrados[d][c] = [y for x in os.walk(path+d+"/"+c+"/") for y in glob(os.path.join(x[0], '*.txt'))]

        for i in range(len(resultados_encontrados[d][c])):
            resultados_encontrados[d][c][i] = get_dados(resultados_encontrados[d][c][i])


    break





def csv():
    header = "test-case,cfg,date,total_time-time,total_time-main,beta,avg-PIs,n-PIs,1st-PI,2nd-PI,avg(2-6),avg(2-11)"
    # (a) test-case: nome do diretório que identifica o caso de teste (test-case em 6-b);
    # (b) cfg: nome do diretório que identifica a configuração do cluster (cfg em 6-b);
    # (c) date: nome do diretório que identifica a data do experimento (date em 6-b);
    # (d) total_time-time: tempo total de execução medido com a ferramenta time (Wallclock time - real);
    # (e) total_time-main: tempo total de execução medido com a instrumentação da função main (Item 5-a)
    # (f) beta: valor de beta;
    # (g) avg-PIs: Tempo médio de todas as iterações paramount;
    # (h) n-PIs: Número de paramount iterations;
    # (i) 1st-PI: Tempo da primeira paramount iteration;
    # (j) 2nd-PI: Tempo da segunda paramount iteration;
    # (k) avg(2-6): Tempo médio das iterações 2 até 6. Zero caso a aplicação execute menos do que 6 iterações;
    # (l) avg(2-11): Tempo médio das iterações 2 até 11. Zero caso a aplicação execute menos do que 11 iterações;