######################################################
# Introducao Linguagem R
# Marcia Anjos
# Universidade Federal da Bahia
#####################################################
#para especificar o diretorio de trabalho
getwd()
setwd("C:/Users/Luiz e Marcia/Google Drive/Curso R")
###Analise exploratoria####

#Abro o arquivo de dados carregando para dentro de um objeto
aves.c = read.table("aves_cerrado_A5.csv", row.names=1, header=T, sep=";", dec=",", as.is=T)
aves.c = read.csv2("aves_cerrado_A5.csv", row.names=1, as.is=T)

#verifico a composição dos dados
head(aves.c)
tail(aves.c)
str(aves.c)
summary(aves.c)

#visto que tem NA, preciso saber se são dados faltantes ou locais onde não houve observação. Sendo o segundo caso devo substituir NA por )

aves.c[is.na(aves.c$urubu),]
aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),]
#Esses comando me mostram exatamente onde está o NA
#posso guarda essa parte dos dados para posterior comparação e verificar se foi corrigido (guardo no objeto temp1)
temp1 <- aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),]

#E agora vamos corrigir estes valores, que pode ser feito de três maneiras:
  
  aves.c$urubu[is.na(aves.c$urubu)] = 0
aves.c[is.na(aves.c$urubu),2] = 0
aves.c[is.na(aves.c[,2]), 2] = 0
# essas trÊs linha são diferentes formas para corrigir o mesmo problema

  aves.c$carcara[is.na(aves.c$carcara)] = 0
aves.c$seriema[is.na(aves.c$seriema)] = 0
#Agora podemos comparar se a correção funcionou com o objeto temp1
aves.c[aves.c$urubu==0|aves.c$carcara==0|aves.c$seriema==0,]
temp1
#ok. onde havia NA temos 0

#Agora vamos verificar os valores da coluna que será um fator

table(aves.c$fisionomia) # Há um erro de digitação no código de fisionomia de uma parcela (ce). Corrigindo:
  
  aves.c$fisionomia[aves.c$fisionomia=="ce"] = "Ce"
table(aves.c$fisionomia) #corrigido

#Convertendo para fator, que ordenamos da fisionomia mais aberta para a menos:
  
aves.c$fisionomia <- factor(aves.c$fisionomia, levels=c("CL","CC","Ce"))

#Confira tudo novamente:
  
  str(aves.c) #todas as observações e todas as variaveis
summary(aves.c) #sem NA

###Média, Mediana e Quantis####

#Estat??sticas descritivas básicas (média e mediana)
  
  #como o elemento é uma lista use a funçao sapply
sapply(aves.c[,2:4],mean) #solicito para mostrar médias das colunas 2 até a 4
sapply(aves.c[,2:4],median)#solicito para mostrar medianas das colunas 2 até a 4

#No caso de data frames você consegue o mesmo com a função apply, indicando no segundo argumento a margem a aplicar a função (1 para linhas e 2 para colunas):
  
  apply(aves.c[,2:4],2,median)# A DIFERENÇA AQUI É QUE INFORMO QUE QUERO A MEDIANA POR COLUNAS

#Calcule também a média truncada:
  ??trim
  apply(aves.c[,2:4], 2, mean, trim=0.1)

#Há muita diferença entre essas três medidas de tendência central? Como você as explicaria? 
  #não há muito diferença. 
  
#Agora calcule os quantis para o número de avistamentos de urubus. O padrão da função quantile são quartis, como na função summary:
  
  quantile(aves.c$urubu) ## retorna o valor de cada quantis. O mesmo que o retornado pelo summary
summary(aves.c$urubu)#retorna todas as informaçoes basicas dos dados (coluna urubu) (valor min, 1 quantis, mediana, media, 3 quantis e valor max)

#Mas você pode mudar para qualquer quantil:
  
quantile(aves.c$urubu, probs= seq(from=0,to=1,by=0.1)) #interessante. Parece detalhar melhor a distribuição na curva. Inves de mostrar a cada 25% ele mostra a cada 10% (?)

#Por fim, obtenha quartis, médias e medianas de uma vez para todas as variáveis, com o comando:
  
  summary(aves.c[,2:4])

  ##Exploração de uma Variável Categórica####
  
#Vamos explorar a variável categórica nome da espécie, com a função table:
    
    caixeta= read.csv("caixeta.csv", header = T, sep = ",", dec = ".", as.is=T) #carrega o conj de dados
  class(caixeta)
  names(caixeta) #verificas os nomes das colunas
  table(caixeta$especie)#retorna o conteudo da coluna especie dentro do data.frame caixeta
summary(caixeta)
  #Qual a diferença no resultado se usamos o comando abaixo?
    
  sort(table(caixeta$especie), decreasing=T) #retorna a coluna especie em ordem decrescente
  
#O resultado da função table pode ser fornecido à função de gráficos de barras:
    
    barplot(sort(table(caixeta$especie), decreasing=T)) #plota a coluna especie em ordem decrescente
  barplot(table(caixeta$local))#plota a coluna local com a "distribuição - quantidade" dos dados
  
  ##Gráficos para uma Variável####
  
#Voltando ao objeto criado no tutorial Conferindo Data Frames, vamos criar em uma só página os quatro gráficos básicos de diagnóstico de uma variável numérica, para o número de avistamentos de urubus:
    
    par(mfrow=c(2,2))#informo que quero ver os graficos em duas linhas e em duas colunas
  boxplot(aves.c$urubu)#ploto o boxplot da coluna urubu
  hist(aves.c$urubu)#ploto o histograma da coluna urubu
  plot(density(aves.c$urubu))#plota um grafico de linha com a densidade da coluna urubu
  stripchart(aves.c$urubu, method="stack")#não conheço esse tipo de grafico
  par(mfrow=c(1,1))
# O que acontece se você omite a primeira linha? E a última?
  #não observei nenhuma modificação
  
 ## Variações do Histograma####
  
  
#Voltando ao objeto criado no tutorial Conferindo Data Frames, vamos fazer algumas variações de histogramas do número de avistamentos de urubus: Você pode acrescentar marcas (traços) indicando a posição de cada observação no eixo x.
  
  ## Histograma com os valores (funcao rug)
  hist(aves.c$urubu)
  rug(jitter(aves.c$urubu))
  rug((aves.c$urubu))
  ?rug
  #O que acontece se você omite a função jitter neste caso? Por que?
  #aparece barras de escala entre os valores presestabelecidos. Valores decimais, talvez. Sem jitter, há mudanças desses valores.São reescalonados
    
#Agora vamos fazer um histograma re-escalonado de modo que as áreas das barras somem um. Com isto, podemos sobrepor ao histograma um ajuste não paramétrico de densidade probabil??stica, que também mantém área um:
    
    hist(aves.c$urubu, prob=T)
  lines( density(aves.c$urubu),col="blue" ) #sobrepoe a linha de densidade no histograma

  #Também sobre este histograma podemos sobrepor a curva normal. Para os parâmetros da normal, usamos a média e o desvio-padrão da amostra.
  
  hist(aves.c$urubu, prob=T)
  curve(expr = dnorm(x,mean=mean(aves.c$urubu),sd=sd(aves.c$urubu)),add=T, col="red")

#Por fim, vamos sobrepor a curva emp??rica de densidade probabil??stica com a curva normal:
    
  plot(density(aves.c$urubu),col="blue", ylim=c(0,0.08))
  curve(expr = dnorm(x,mean=mean(aves.c$urubu),sd=sd(aves.c$urubu)),add=T, col="red")

#O que estes gráficos revelam sobre a distribuição do número de avistamentos de urubus neste estudo fict??cio?
  #apresenta distribuição normal (?), e densidade é maior no extremo positivo ou quantis acima de 50% (?)
  
  ##table e aggregate####
  
  #Usaremos o objeto caixeta criado no tutorial Exploração de uma Variável Categórica.
  
  #A relação entre duas ou mais variáveis categóricas pode ser explorada com tabelas cruzadas, por exemplo:
    
    table(caixeta$especie,caixeta$local)

# Quando temos uma variavel categórica (fator) e uma numérica, as funções aggregate e tapply são muito úteis. A função aggregate é o equivalente das tabelas dinâmicas das planilhas eletrônicas. Por exemplo, para obter do objeto caixeta um data frame com a altura média dos fustes de cada espécie de árvore por local você executa o comando:
    
    caixeta.alt <- aggregate(caixeta$h, by=list(local=caixeta$local,especie=caixeta$especie),
                             FUN=mean) #cria o objeto caixeta.alt contendo a media da altura por local e por especie 

    #Consulte a ajuda da função aggregate e experimente outras combinações de fatores e funções, com este conjunto de dados.
  
  ?xtabs
  #não deu tempo
  
  #Crie um objeto com este arquivo e faça as seguintes tabulações:
    
    xtabs(Freq~Sex+Survived, data=Titanic.df)
  prop.table(xtabs(Freq~Sex+Survived, data=Titanic.df), margin=1)
  xtabs(Freq~Class+Survived, data=Titanic.df)
  prop.table(xtabs(Freq~Class+Survived, data=Titanic.df), margin=1)
  #Por que usamos a função xtabs neste caso e não a função table? P.ex:
    
    table(Titanic.df$Sex,Titanic.df$Survived)
  
  #Fórmula Estat??stica em Gráficos####
  
  #A função xtabs (tutorial anterior) usa a notação de fórmula estat??stica do R, que é:
    
  #variável dependente ~ variáveis preditoras
#Esta notação foi criada para os modelos estat??sticos, como a regressão linear, mas foi estendida para vários gráficos no R. Experimente os comandos abaixo em que esta notação é usada:
    
    boxplot(urubu~fisionomia, data=aves.c) #plota urubu em função de fisionomia
  plot(seriema~urubu, data=aves.c, subset=fisionomia=="Ce")
  plot(seriema~urubu, data=aves.c, subset=fisionomia=="CC")
  plot(seriema~urubu, data=aves.c, subset=fisionomia!="CL")
 #Que tipo de padrão ou diferenças estes gráficos podem revelar? 
    #revela o padrão de distribuição de um dado em função do outro...
    
    #Esta fórmula pode ainda incluir um fator condicionante, que aplica a relação proposta dentro de cada n??vel dos condicionais:
    
    #variável dependente ~ variáveis preditoras | variáveis condicionantes
  #O pacote lattice implementa esta idéia para gráficos:
    
    library(lattice)
  xyplot(seriema~urubu|fisionomia, data= aves.c)
  #Qual a diferença entre este gráfico e os três últimos obtidos com os comandos anteriores?
   #plota os 3 graficos dentro da mesma "caixa" com a mesma escala. fica melhor para verificar as diferenças entre os dados comparados
    
  
  #O quarteto de Anscombe####
  
  
  #O pacote datasets tem vários conjuntos de dados que se tornaram clássicos da estat??stica. Vamos analisar um dos mais usados para treino de análises exploratórias. Como o R já carrega o datasets por padrão, precisamos apenas fazer uma cópia do objeto para nossa área de trabalho 1):
  
  data(anscombe) #carrega para a area de trabalho
ls() #agora o objeto está no workspace
#Este objeto é composto de 4 pares de variáveis, nomeadas x1 a x4 (variáveis independentes ou preditoras) e y1 a y4 (variáveis dependentes ou resposta):
  
  names(anscombe)
#Compare as médias de cada uma das variáveis. Para isto, use a função apply para aplicar a função mean a cada coluna2) deste data frame:
  
 apply(anscombe[1:4], MARGIN=2, FUN=mean) #as medias são iguais
apply(anscombe[5:8], 2, mean)

#Faça o mesmo para obter as variâncias:
  
  apply(anscombe[1:4], 2, var)
apply(anscombe[5:8], 2, var)

#A pergunta principal para este conjunto de dados é se há relação entre cada variável x e y. Isso pode ser testado com o coeficiente de correlação de Pearson, que vai de zero (nenhuma correlação) a um (positivo ou negativo, correlação perfeita).

with(anscombe,cor(x1,y1))
with(anscombe,cor(x2,y2))
with(anscombe,cor(x3,y3))
with(anscombe,cor(x4,y4))
#O que se pode concluir até aqui? Faça os gráficos de dispersão:
  #Há alta correlação entre as variaveis
  
  par(mfrow=c(2,2)) # 4 graficos em uma janela
plot(y1~x1, data=anscombe)
plot(y2~x2, data=anscombe)
plot(y3~x3, data=anscombe)
plot(y4~x4, data=anscombe)
par(mfrow=c(1,1))
#Você pode acrescentar as linhas de regressão linear 3):
  
  par(mfrow=c(2,2)) # 4 graficos em uma janela
plot(y1~x1, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y1~x1, data=anscombe))
plot(y2~x2, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y2~x2, data=anscombe))
plot(y3~x3, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y3~x3, data=anscombe))
plot(y4~x4, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y4~x4, data=anscombe))
par(mfrow=c(1,1)) #plot os graficos de cada variavel x em função da y e tambem a linha de regressão


##PARTE 2####
#Cervejas

#Uma amostra de 30 estudantes foi indagada sobre seu tipo de cerveja preferida, com o seguinte resultado

cervejas <-c("chope","lata","garrafa","chope","garrafa", "garrafa","lata","lata","nenhuma","lata","garrafa","garrafa", "garrafa","lata","lata","lata","garrafa","lata","chope","nenhuma", "garrafa","garrafa","garrafa","chope","garrafa","garrafa","chope","garrafa","lata","lata")
#Represente este resultado como um gráfico de barras e um dotplot (função dotchart).

cervejas.t <- table(cervejas) #cria a tabela com a contagem
class(cervejas.t)
cervejas.t <- sort(cervejas.t, decreasing = F)#põe em ordem crescnte
barplot(cervejas.t) 
dotchart(cervejas.t)

#Qual tem maior razão dado/tinta?
#o dorchart

 #Caixetais###

#Neste exerc??cio, use o objeto caixeta, criado no tutorial Exploração de uma Variável Categórica.

#Construa um histograma do dap dos fustes dos caixetais.

str(caixeta)
head(caixeta)
caixeta$dap = caixeta$cap/pi
hist(caixeta$dap)

#Construa histogramas da altura das árvores para os diferentes caixetais ('local').
hist(caixeta$h[caixeta$local=="chauas"])
hist(caixeta$h[caixeta$local=="jureia"])
hist(caixeta$h[caixeta$local=="retiro"])

#Há diferenças entre as estruturas (distribuição de tamanhos) dos caixetais?
#há diferença de acordo com a localidade (ou distribuição por localidade)  

#Eucaliptos##

egrandis= read.table("egrandis.csv",header=T,sep=",")
head(egrandis)
summary(egrandis)

#Utilize o gráfico boxplot para analisar o DAP de árvores de E. grandis em função das variáveis região (regiao) e rotação (rotacao).
boxplot(dap~regiao, data=egrandis) #dap por região
boxplot(dap~rot, data=egrandis) #dap por rotação
boxplot(dap~rot*regiao, data = egrandis) #plotando região e rotação junto.

#Avalie a normalidade da altura do conjunto total de árvores com um gráfico quantil-quantil contra a distribuição normal.
#não consegui fazer.A resposta online também não funcionou. E não encontrei o erro
qqnorm(egrandis$ht)
qqline(egrandis$ht, col="red")

#Mais Caixetais

#Aqui usaremos novamente o objeto caixeta, criado no tutorial Exploração de uma Variável Categórica.
caixeta <- read.csv("caixeta.csv", as.is=T)

#Analise a relação dap-altura ('dap' e 'h') em função do caixetal (local) com a função plot, mas somente para as árvores 2) de caixeta (Tabebuia cassinoides).
tabebuia <- caixeta[caixeta$especie =="Tabebuia cassinoides", ]
head(tabebuia)
par(mfrow=c(2,2))
plot(dap ~ h, data= tabebuia, subset = local=="chauas", main ="chauas")
plot(dap ~ h, data= tabebuia, subset = local=="jureia", main = "jureia")
plot(dap ~ h, data= tabebuia, subset = local=="retiro", main = "retiro")
par(mfrow=c(1,1))

#Para a mesma relação do item anterior, verifique linearidade com a função scatter.smooth
Utilizando o pacote lattice, analise a relação dap-altura ('dap' e 'h') em função do caixetal (local), mas somente para as árvores 3) de caixeta (Tabebuia cassinoides).
library(lattice) #carregando o pacote
xyplot(dap ~ h | local, data=tabebuia)

###Parte 3####
#Estat??sticas Descritivas#

cax = read.csv("caixeta.csv", header=TRUE, as.is=TRUE)

summary(cax)

#outras estatisticas#
resumo1 = aggregate( cax[ , c("cap","h")], list(local=cax$local), mean )
resumo2 = aggregate( cax[ , c("cap","h")], list(local=cax$local), sd )

resumo = merge( resumo1, resumo2, by="local", suffixes=c(".mean",".sd") )
resumo


#Construa um 'data.frame' com os dados de ?rea basal por 'local' e 'parcela'.
#Encontre a m?dia e desvio padr?o da ?rea basal por 'local'.
cax.dataframe= c(cax$local, cax$parcela)
cax$ab <- cax$cap^2/(4*pi)
by(cax$ab, cax$local, mean)
by(cax$ab, cax$local, sd)

#Calcule o intervalo de confian?a de 95% da ?rea basal por 'local'.
by(cax$ab, cax$local, t.test)


###Exerc?cio: Altura de ?rvores em Caixetais####

#Construa um histograma da altura das ?rvores do caixetal.
cax.arv <- cax[cax$fuste==1,-4] #n?o consegui fazer. Fui ver no exercio online, mas ainda n?o entendi o c?digo usado
cax.h.arv <- aggregate(cax$h,
                        by=list(especie=cax$especie,
                                local=cax$local,
                                parcela=cax$parcela,arvore=cax$arvore),
                        FUN=max)
require(lattice)
histogram(~x|local,data=cax.h.arv)
#Construa histogramas da altura das ?rvores para os diferentes caxetais ('local').

#H? diferen?as entre as estruturas (distribui??o de tamanhos) dos caixetais?
## Ha  diferencas nas distribuicoes de alturas. Retiro apresenta as mais altas.


##Exerc?cio: Di?metros de ?rvores de Eucalipto
#Construa um histogram do DAP das ?rvores de E. saligna. Procure interpretar o histograma.
egrandis <- read.table("egrandis.csv",sep=";",dec=".", header=T)
str(egrandis)
hist(egrandis$dap)
# houve maior frequencia de arvores com dap acima de 10cm e a menor frequencia para arvores acima de 20 a 40cm.


##Exerc?cio: Distribui??o de DAP nos Caixetais
#Realize uma an?lise de densidade do DAP para cada um dos caixetais. Os resultados confirmam o que foi visto nos histogramas?

plot(density(cax.h.arv$x[cax.h.arv$local=="chauas"]),
     xlim=range(cax.h.arv$x), main="", xlab="Altura (m)")
lines(density(cax.h.arv$x[cax.h.arv$local=="jureia"]),col="red")
lines(density(cax.h.arv$x[cax.h.arv$local=="retiro"]),col="blue")
legend("topright",c("Chauas","Jureia","Retiro"),lty=1,col=c("black","red","blue"))
## Ha pequenas diferencas nas distribuicoes de alturas. Confirma o que foi visto no histograma.

#Exerc?cio: Altura de ?rvores em Caixetais II
#Utilize o gr?fico boxplot para analisar a altura das ?rvores em caixetais.
boxplot(cax$h) #a maioria das arvores est?o acima da altura media (?)

#Exerc?cio: Estrutura de Eucaliptais
#Utilize o gr?fico boxplot para analisar o DAP de ?rvores de E. grandis em fun??o das vari?veis regi?o ('regiao') e rota??o ('rot').
egrandis <- read.table("egrandis.csv",sep=";",dec=".", header=T)
str(egrandis)
## Dap x regiao
boxplot(dap~regiao,data=egrandis)#botucatu e Salto est?o acima da m?dia do valor de DAP
boxplot(dap~rotacao,data=egrandis)

## Exerc?cio: Invent?rio em Floresta Plantada
#Verifique se as vari?veis quantitativas obtidas no invent?rio de florestas plantadas tem distribui??o Normal: 'dap', 'ht' e 'hdom'.
qqnorm(egrandis$dap)
qqnorm(egrandis$ht)
#sim. 

##Exerc?cio: Domin?ncia em Caixetais
#Construa um gr?fico da domin?ncia das esp?cies nos caixetais.

#Exerc?cio: Invent?rio em Floresta Plantada
#Utilizando a fun??o 'dotchart' investigue o n?mero de ?rvores no invent?rio em fun??o da regi?o ('regiao') e rota??o ('rot').
