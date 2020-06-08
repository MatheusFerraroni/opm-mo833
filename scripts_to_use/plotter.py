import os
from glob import glob


path = "/home/matheus/experimental_results/"


arquivos_encontrados = [y for x in os.walk(path) for y in glob(os.path.join(x[0], '*.txt'))]


datasets = ["NORNE","spe9","spe10model1"]
clusters = ["t3small8","t3small2","t3xlarge2","t3xlarge8","t3xlarge8","t3xlarge1","t3xlarge1","t2small2","t2small1","t2small1","t3xlarge4","t2small8","t3small4","t2small4","t3small1","t3small1"]



resultados_encontrados = {}
for d in datasets:
    resultados_encontrados[d] = {}
    for c in clusters:
        resultados_encontrados[d][c] = []


for arquivo in arquivos_encontrados:
    arq_info = arquivo.replace(path,"").split("/")
    resultados_encontrados[arq_info[0]][arq_info[1]] = arquivo



for d in datasets:
    for c in clusters:
        print(resultados_encontrados[d][c])
        # f = open(resultados_encontrados[d][c],"r")
        # resultados_encontrados[d][c] = f.read().split("\n")
        # f.close()

        # for i in range(len(resultados_encontrados[d][c])):
        #     resultados_encontrados[d][c][i] = resultados_encontrados[d][c][i].replace("[MO833] ","").split(",")


# beta_val = 0
# beta_count = 0
# total_val = 0
# total_count = 0
# start_val = 0
# start_count = 0
# pi_avg_val = 0
# pi_avg_count = 0

# for d in datasets:
#     for c in clusters:
#         for i in range(len(resultados_encontrados[d][c])):
            
#             if resultados_encontrados[d][c][i][0]=="PI avg":
#                 pi_avg_val += float(resultados_encontrados[d][c][i][1])
#                 pi_avg_count += 1
#             elif resultados_encontrados[d][c][i][0]=="Total time":
#                 total_val += float(resultados_encontrados[d][c][i][1])
#                 total_count += 1
#             elif resultados_encontrados[d][c][i][0]=="Beta":
#                 beta_val += float(resultados_encontrados[d][c][i][1])
#                 beta_count += 1
#             elif resultados_encontrados[d][c][i][0]=="t1_antes_paramount":
#                 start_val += float(resultados_encontrados[d][c][i][1])
#                 start_count += 1
#             elif resultados_encontrados[d][c][i][0]=="Paramount Iteration":
#                 pass
#         pi_avg_val /= pi_avg_count
#         beta_val /= beta_count
#         total_val /= total_count
#         start_val /= start_count

#         print(pi_avg_val, beta_val, total_val, start_val)
        # break
    # break