######################################################
# Introdu??o Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################
###respondendo o script
#quando poss?vel, sua resposta deve ser um c?digo do R

#####Trabalhando com dados#####
# o que ? um dataframe? Qual a diferne?a entre um dataframe e um list?
#dataframe ? uma tabela (matriz) do R que se pode misturar valores de classes diferentes. list ? um conjunto de elementos (componentes) sem restri??o de classes.

# o que as fun??es abaixo fazem? O que elas retornam?
is.vector(temp1) #testa o tipo de vetor. retorna (resposta sobre se o que est? dentro do parentese ? um vetor) verdade se o vetor espec?fico tiver como atributo apenas nome (variavel categ?rica). Caso contr?rio retorna falso
is.numeric(teste) #testa o tipo do objeto e n?o a classe. (se ? um n?mero) Retorna verdade se o objeto pode ser interpretado como n?mero.
is.character(teste) #testa objeto do tipo caracter. Retorna verdadeiro ou falso se o argumento for do tipo caracter ou n?o.
is.matrix(peso) #testa se o argumento ? estritamente uma matrix.Retorna verdade ou falsa para os dados analisados
is.na() #indica o n?mero de valores faltantes (na). (se o valores s?o NA)
is.data.frame() #checa se o objeto ? um data.frame. Retorna verdade se o objeto for um data.frame e falso no caso contr?rio.


#o que queremos dizer quando dizemos uma fun??o "retorna" alguma coisa?
#a fun??o mostra a resposta (resultado ou valor final) para o que foi perguntado. os valores retornados podemos jogar para dentro de um objeto para ser usado depois

#o que a fun??o summary() faz?
#produz resultado resumido de v?rios modelos.

#Tr?s ?reas foram submetidas aplica??o de tr?s adubos diferentes, e uma foi
#mantida como controle. A biomassa seca (kg) por parcela foi medida para
#verificar se houve efeito do adubo. Os dados obtidos foram:

#(Controle)	A	37	34	36	42	31  33
#B	62	54	57	64	60
#C	63	58	60	62	61 44
#D	41	37	38	49	35 49
tratamento= c(rep("a",6), rep("b",5), rep("c",6), rep("d",6))
peso= c(37,	34,	36,	42,	31, 33, 62,	54,	57,	64,	60, 63,	58,	60,	62,	61, 44, 41,	37, 38,	49,	35, 49)
#Crie um dataframe com estes dados #uma observa??o por linha, uma variavel por coluna. um coluna ? o tratamento e  outra os valores.
adubados= data.frame(tratamento,peso)

#Calcule a m?dia de cada tipo de adubo, sem usar summary(), usando o dataframe que voc? criou acima
media.a=mean(adubados$peso[adubados$tratamento=="a"]) #media dos adubados, na coluna peso que tenham na mesma linha do tratamento a letra "a". precisamos indexar o objeto do qual queremos a media
media.b=mean(adubados$peso[adubados$tratamento=="b"])
media.c=mean(adubados$peso[adubados$tratamento=="c"])
media.d=mean(adubados$peso[adubados$tratamento=="d"])
#que problemas voc? teve ao fazer o exerc?cio acima?
#havia um elemento a menos. Conseguir organizar as colunas e linhas e gerar as fun?oes na ordem correta

# O que a fun??o unique() faz?
#mostra os valores unicos (sem repeti??o) presentes no objeto enviado

#Usando o conjunto de dados caixeta.csv, disponivel em
#http://ecologia.ib.usp.br/bie5782/doku.php?id=dados:dados-caixeta, 
#calcule quantas esp?cies est?o presentes na coluna especie. Para ler o arquivo, execute o c?digo abaixo
caixeta = read.csv("caixeta.csv", header=T, sep=",", as.is=T)
str(caixeta)
summary(caixeta)

# o arquivo deve estar no seu diret?rio de trabalho
getwd()
str(caixeta) #o que este comando faz? #mostra de forma compactada a estrutura interna do objeto. Nesse caso o n?mero de observa??es internas e o n?mero de variaveis
summary(caixeta) #sumariza resultado dos resultados de v?rias fun??es do modelo.Apresentando valor min, max. mean, desvio padr?o e mediana

#podemos criar uma coluna a mais no nosso dataframe apenas dizendo ao R o que
#colocar l?. Por exemplo, criamos uma coluna com o nome do coletor do dado
caixeta$coletor= "Darwin" #regra da reciclagem
str(caixeta)

#agora adicione no objeto caixeta uma coluna chamada "desvio" com o quanto a
#altura de cada ?rvore difere da m?dia de todas as ?rvores

caixeta$desvio= caixeta$h- mean(caixeta$h)
#outra forma de criar a coluna
desvio=mean(caixeta$h)
caixeta4desvio= desvio
#ou, trabalhando com matriz que n?o se pode usar $
#cbind(x,y) = y ? o vetor a ser criado

#rbind()

#Usando a fun??o table(), conte quantos indiv?duos de cada esp?cie existem
table(caixeta$especie)

#A fun??o table() tamb?m pode contar por esp?cie em cada local, depois por local
#em cada esp?cie). Como?
table(caixeta$especie, caixeta$local) #a virgula ? lida como (ordenado por)
table(caixeta$local, caixeta$especie)

#crie um objeto chamado pequenas que contenha todas as ?rvores com altura (h)
#menor que um metro.(Os dados no arquivo est?o em cent?metros)

pequenas= c(caixeta$h < 100)
pequenas

#crie um objeto chamado grandes que contenha todas as ?rvores acima de 3 metros
grandes= c(caixeta$h >300)
grandes

#crie um objeto chamado medias que todas as ?rvores com alturas entre um metro e
#tres metros
medias= c(caixeta$h >= 100 & caixeta$h <= 300)
medias

#agora em uma linha de comando, crie um objeto que contenha a quantidade de
#?rvores pequenas, m?dias e grandes, separadamente
todas= c((caixeta$h < 100), (caixeta$h >= 100 & caixeta$h <= 300), (caixeta$h >300))
todas
todas= c((pequenas), (medias), (grandes))
todas

#Crie um objeto chamado obj somente com os individuos de "Alchornea
obj= caixeta$especie[caixeta$especie == "Alchornea"]
obj1= caixeta$especie[caixeta$especie == "Alchornea triplinervia"]
obj1
#triplinervia" Em quantas localidades esta esp?cie ocorre? Qual comando para
#encontrar essa informa??o?
caixeta$especie[caixeta$especie == "triplinervia" & caixeta$local]
table(caixeta$especie , caixeta$local)
#podemos remover dados de um dataframe, usando o sinal de menos

caixeta.sem.tabebuia = caixeta[ - c(caixeta$especie=="Tabebuia cassinoides"),]
unique(caixeta.sem.tabebuia$especie)

#agora crie um objeto removendo todas as "Tabebuia cassinoides" do local retiro
#(somente do local retiro)
caixeta.sem.tabebuia = caixeta[ - which(caixeta$especie=="Tabebuia cassinoides",caixeta$local=="retiro")]
unique(caixeta.sem.tabebuia$especie, caixeta$local=="retiro")

#crie os objetos abaixo, junte eles num dataframe de duas colunas chamado comNA,
#depois crie um novo objeto chamado semNA, removendo todas as linhas que
#contenham NA, usando a nota??o acima (dica: s? se usa "" para valores do tipo
#character)
id = 1:80
a = c(121.72355, 103.79754, 130.15442, 98.29305, 103.43365, 102.44998,
      NA, 111.07215, 113.74047, 103.16081, 80.87149, 98.66692,
      65.09549, 155.74965, 88.30168, 147.43610, 114.60806, 109.87433,
      149.54772, 83.54137
)
b = c(77.91352, 78.07251, 81.95604, 75.64862, 78.45213, 79.11058,
      79.98952, 79.18127, 840.1635, 74.86860, 82.01886, 78.26936,
      77.94691, 78.75372, 77.64901, NA, 77.19803, 72.48175,
      83.45336, 78.99681
)
c = c(127.9366, 201.7158, NA, 136.5880, 131.7213, 118.1486,
      125.7534, 139.6544, 163.5890, 139.7455, NA, 141.4450, 110.7311,
      157.5921, 176.8437, 102.8659, 121.8286, 134.7097, 157.1392, 166.7133
)
d = c(191.3721, 216.1671, 165.4380, 196.2730, 172.6565, 178.2955,
      193.6687, NA, 160.2968, 208.4400, 204.0934, 208.1798,
      186.6380, 193.9446, NA, 198.6853, 213.8838, 210.1881,
      209.9109, 210.9228
)