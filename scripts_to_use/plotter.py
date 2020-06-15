import os
from glob import glob
import numpy as np
import matplotlib.pyplot as plt


path = "/home/matheus/experimental_results/"
arquivos_encontrados = [y for x in os.walk(path) for y in glob(os.path.join(x[0], '*.txt'))]
datasets = ["NORNE","spe9","spe10model1"]




def csv_gen(testcase, cfg, infos):
    header = "test-case,cfg,date,total_time-time,total_time-main,beta,avg-PIs,n-PIs,1st-PI,2nd-PI,avg(2-6),avg(2-11)"

    texto = ""
    for info in infos:
        texto += testcase+","
        texto += cfg+","
        texto += str(info["data_res"])+","
        texto += str(info["total_time_time"])+","
        texto += str(info["total_time_main"])+","
        texto += str(info["beta"])+","
        texto += str(info["avg_PIs"])+","
        texto += str(info["n_PIs"])+","
        texto += str(info["1st_PI"])+","
        texto += str(info["2nd_PI"])+","
        texto += str(info["avg2_6"])+","
        texto += str(info["avg2_11"])
        texto += "\n"

    f = open(path+testcase+"/"+cfg+"/result.csv","w")
    f.write(header+"\n"+texto)
    f.close()

    return texto


def chart_gen(testcase, infos, path_img):
    fig = plt.figure(figsize=(25,10))
    for c in clusters:

        if len(infos[c])==0: continue

        total_x = infos[c][0]["n_PIs"]

        data_y = []
        stds = []
        for i in range(total_x):
            med = 0

            vals = []
            for j in range(len(infos[c])):
                med += infos[c][j]["pi_array_tempos"][i]
                vals.append(infos[c][j]["pi_array_tempos"][i])

            stds.append(np.std(vals))
            med /= len(infos[c])
            data_y.append(med)

        data_x = np.arange(1,total_x+1)
        plt.errorbar(data_x, data_y, yerr=stds, label=c)


    plt.title(testcase)
    plt.xlim(-1,len(data_x)+1)
    plt.xlabel("# Paramount Iteration")
    plt.grid(True, ls="-.", lw=0.5)
    plt.ylabel("Tempo (s)")
    plt.legend(bbox_to_anchor=(0., 1.05, 1., .102), loc='lower left',
           ncol=8, mode="expand", borderaxespad=0.,shadow=True, fancybox=True)
    plt.savefig(path+testcase+"/absolute_"+path_img, bbox_inches="tight")
    plt.close()


def chart_gen2(testcase, infos, path_img):

    fig = plt.figure(figsize=(25,10))
    dados_para_plotar = []
    for c in clusters:

        if len(infos[c])==0: continue


        total_x = infos[c][0]["n_PIs"]

        data_y = []
        stds = []
        for i in range(total_x):
            med = 0

            vals = []
            for j in range(len(infos[c])):
                med += infos[c][j]["pi_array_tempos"][i]
                vals.append(infos[c][j]["pi_array_tempos"][i])


            stds.append(np.std(vals))
            med /= len(infos[c])
            data_y.append(med)



        data_x = np.arange(1,total_x+1)

        dados_para_plotar.append({"x":data_x,"y":data_y,"lbl":c,"std":stds})


    divisores = dados_para_plotar[0]["y"].copy()
    for i in range(len(dados_para_plotar)):
        for j in range(len(dados_para_plotar[i]["y"])):
            divisores[j] = min(divisores[j], dados_para_plotar[i]["y"][j])



    for i in range(len(dados_para_plotar)):
        for j in range(len(dados_para_plotar[i]["y"])):
            dados_para_plotar[i]["y"][j] /= divisores[j]
        plt.errorbar(dados_para_plotar[i]["x"], dados_para_plotar[i]["y"], yerr=dados_para_plotar[i]["std"], label=dados_para_plotar[i]["lbl"])




    plt.title(testcase)
    plt.xlim(-1,len(data_x)+1)
    plt.xlabel("# Paramount Iteration")
    plt.ylim(0)
    plt.ylabel("Tempo (s)")
    plt.legend(bbox_to_anchor=(0., 1.05, 1., .102), loc='lower left',
           ncol=8, mode="expand", borderaxespad=0.,shadow=True, fancybox=True)
    plt.savefig(path+testcase+"/relative_"+path_img, bbox_inches="tight")
    plt.close()



def get_dados(arquivo):
    # print("Lendo arquivo: ",arquivo)

    data_res = arquivo.split("/")[-1].split(".")[0]
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

    pi_array_tempos = []
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
                pi_array_tempos.append(pi_tempo)
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
    ret["data_res"] = data_res
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
    ret["pi_array_tempos"] = pi_array_tempos
    return ret




def faz_tudo(cluster, path_img):

    resultados_encontrados = {}
    header = "test-case,cfg,date,total_time-time,total_time-main,beta,avg-PIs,n-PIs,1st-PI,2nd-PI,avg(2-6),avg(2-11)\n"

    mega_csv_geral = ""
    for d in datasets:
        resultados_encontrados[d] = {}


        csv_geral = ""
        for c in clusters:
            resultados_encontrados[d][c] = []
            resultados_encontrados[d][c] = [y for x in os.walk(path+d+"/"+c+"/") for y in glob(os.path.join(x[0], '*.txt'))]

            for i in range(len(resultados_encontrados[d][c])):
                resultados_encontrados[d][c][i] = get_dados(resultados_encontrados[d][c][i])



            csv_geral += csv_gen(d,c,resultados_encontrados[d][c])

        mega_csv_geral += csv_geral
        f = open(path+d+"/resultado.csv","w")
        f.write(header+csv_geral)
        f.close()
        chart_gen(d,resultados_encontrados[d],path_img)
        chart_gen2(d,resultados_encontrados[d],path_img)

    f = open(path+"resultado.csv","w")
    f.write(header+mega_csv_geral)
    f.close()






clusters = [

"t2small1",
"t2small2",
"t2small4",
"t2small8",


]

faz_tudo(clusters,"t2small.pdf")

clusters = [

"t3small1",
"t3small2",
"t3small4",
"t3small8",

]

faz_tudo(clusters,"t3small.pdf")

clusters = [

"t3xlarge1",
"t3xlarge2",
"t3xlarge4",
"t3xlarge8",

]

faz_tudo(clusters,"t3xlarge.pdf")

clusters = [
"c5xlarge1",
"c5xlarge2",
"c5xlarge4",
"c5xlarge8",

]

faz_tudo(clusters,"c5xlarge.pdf")

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

]

faz_tudo(clusters,"tudo.pdf")
