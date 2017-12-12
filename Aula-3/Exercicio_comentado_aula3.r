######################################################
# Introdu??o Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################
#diferenciando comandos
#diferencie a fun??o source da fun??o load()
#source executa, rodar os comando do arquivo 
#load() carrega o conteudo de um arquivo para dentro de um objeto

#baixe para seu diret?rio de trabalho o arquivo toroidal.distance.R, dispon?vel
#em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R, e o arquivo distancias.csv, disponivel em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/distancias.csv

getwd()
setwd("C:/Users/Luiz e Marcia/Google Drive/Curso R")
getwd()

#Abra toridal.distances.R no R

# O que voc? precisa fazer para que as fun??es contidas nesse arquivo estejam dispon?veis para uso no R?
#abrir o arquivo no R,  usar a fun??o source no canto superior direito para deix?-la disponivel.

# Fa?a o procedimento que voc? descreveu acima
source( "C:/Users/Luiz e Marcia/Google Drive/Curso R/toroidal.distance.r")

# dentro do script toroidal.distance.R, altere o nome da fun??o toroidal.distances para distance.matrix (substitua o nome dentro do arquivo) e salve o arquivo

# Carregue o arquivo distancias.csv para dentro do objeto distancias
distancias= read.csv("distancias.csv", header= T, sep = ",", as.is = T)
View(distancias)

#chame a fun??o distance.matrix() com o objeto distancias, e o argumento tam = 10
distance.matrix(distancias, tam= 10)

# o que aconteceu?
#retornou os valores em forma de matriz

# O que voc? precisa fazer para que voc? possa usar a fun??o distance.matrix?
#com o comando source () busco o arquivo com a fun??o e o R carrega para deix?-la dispon?vel para uso.

# Usando a linha de comando, importe o arquivo dragoes.xsls para o objeto DnD
install.packages("readxl")
install.packages("writexl")
DnD = read_xlsx("dragoes.xlsx")
library(readxl)
library(writexl)

# Confira a estrutura do arquivo
str(DnD)
# H? algum NA? houve algum problema com o cabe?alho?
#sim, tem NA. 
#o nome da primeira coluna aparece entre parenteses. o programa reconhec, mas pode gerar erros em outras an?lises.Para corrigir, usamos a fun??o colnames
colnames(DnD)
colnames(DnD) = c("peso em centenas de kg", "Dragao identidade", "vacas", "fazendeiros", "virgens", "aventureiros")
colnames(DnD)

# Refa?a o script da aula 2, salvando o objeto caixeta com a coluna coletor e desvio em um arquivo chamado caixeta_com_desvio.csv
caixeta = read.csv("caixeta.csv", header=T, sep=",", as.is=T)
caixeta$coletor= "Darwin"
desvio=mean(caixeta$h)
caixeta$desvio= desvio
write.csv (x = caixeta , file = "caixeta_com_desvio.csv")
caixeta_com_desvio= read.csv("caixeta_com_desvio.csv", header= T, sep = ",", as.is = T)

 

