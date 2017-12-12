######################################################
# Introdução Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#quando possível, sua resposta deve ser um código do R

#####Trabalhando com dados#####
# o que é um dataframe? Qual a diferneça entre um dataframe e um list?
#dataframe é uma tabela (matriz) do R que se pode misturar valores de classes diferentes. list é um conjunto de elementos (componentes) sem restrição de classes.

# o que as funções abaixo fazem? O que elas retornam?
is.vector(temp1) #testa o tipo de vetor. retorna (resposta sobre se o que está dentro do parentese é um vetor) verdade se o vetor específico tiver como atributo apenas nome (variavel categórica). Caso contrário retorna falso
is.numeric(teste) #testa o tipo do objeto e não a classe. (se é um número) Retorna verdade se o objeto pode ser interpretado como número.
is.character(teste) #testa objeto do tipo caracter. Retorna verdadeiro ou falso se o argumento for do tipo caracter ou não.
is.matrix(peso) #testa se o argumento é estritamente uma matrix.Retorna verdade ou falsa para os dados analisados
is.na() #indica o número de valores faltantes (na). (se o valores são NA)
is.data.frame() #checa se o objeto é um data.frame. Retorna verdade se o objeto for um data.frame e falso no caso contrário.


#o que queremos dizer quando dizemos uma função "retorna" alguma coisa?
#a função mostra a resposta (resultado ou valor final) para o que foi perguntado. os valores retornados podemos jogar para dentro de um objeto para ser usado depois

#o que a função summary() faz?
#produz resultado resumido de vários modelos.

#Três áreas foram submetidas aplicação de três adubos diferentes, e uma foi
#mantida como controle. A biomassa seca (kg) por parcela foi medida para
#verificar se houve efeito do adubo. Os dados obtidos foram:

#(Controle)	A	37	34	36	42	31  33
#B	62	54	57	64	60
#C	63	58	60	62	61 44
#D	41	37	38	49	35 49
tratamento= c(rep("a",6), rep("b",5), rep("c",6), rep("d",6))
peso= c(37,	34,	36,	42,	31, 33, 62,	54,	57,	64,	60, 63,	58,	60,	62,	61, 44, 41,	37, 38,	49,	35, 49)
#Crie um dataframe com estes dados #uma observação por linha, uma variavel por coluna. um coluna é o tratamento e  outra os valores.
adubados= data.frame(tratamento,peso)

#Calcule a média de cada tipo de adubo, sem usar summary(), usando o dataframe que você criou acima
media.a=mean(adubados$peso[adubados$tratamento=="a"]) #media dos adubados, na coluna peso que tenham na mesma linha do tratamento a letra "a". precisamos indexar o objeto do qual queremos a media
media.b=mean(adubados$peso[adubados$tratamento=="b"])
media.c=mean(adubados$peso[adubados$tratamento=="c"])
media.d=mean(adubados$peso[adubados$tratamento=="d"])
#que problemas você teve ao fazer o exercício acima?
#havia um elemento a menos. Conseguir organizar as colunas e linhas e gerar as funçoes na ordem correta

# O que a função unique() faz?
#mostra os valores unicos (sem repetição) presentes no objeto enviado

#Usando o conjunto de dados caixeta.csv, disponivel em
#http://ecologia.ib.usp.br/bie5782/doku.php?id=dados:dados-caixeta, 
#calcule quantas espécies estão presentes na coluna especie. Para ler o arquivo, execute o código abaixo
caixeta = read.csv("caixeta.csv", header=T, sep=",", as.is=T)
str(caixeta)
summary(caixeta)

# o arquivo deve estar no seu diretório de trabalho
getwd()
str(caixeta) #o que este comando faz? #mostra de forma compactada a estrutura interna do objeto. Nesse caso o número de observações internas e o número de variaveis
summary(caixeta) #sumariza resultado dos resultados de várias funções do modelo.Apresentando valor min, max. mean, desvio padrão e mediana

#podemos criar uma coluna a mais no nosso dataframe apenas dizendo ao R o que
#colocar lá. Por exemplo, criamos uma coluna com o nome do coletor do dado
caixeta$coletor= "Darwin" #regra da reciclagem
str(caixeta)

#agora adicione no objeto caixeta uma coluna chamada "desvio" com o quanto a
#altura de cada árvore difere da média de todas as árvores

caixeta$desvio= caixeta$h- mean(caixeta$h)
#outra forma de criar a coluna
desvio=mean(caixeta$h)
caixeta4desvio= desvio
#ou, trabalhando com matriz que não se pode usar $
#cbind(x,y) = y é o vetor a ser criado

#rbind()

#Usando a função table(), conte quantos indivíduos de cada espécie existem
table(caixeta$especie)

#A função table() também pode contar por espécie em cada local, depois por local em cada espécie). Como?
table(caixeta$especie, caixeta$local) #a virgula é lida como (ordenado por)
table(caixeta$local, caixeta$especie)

#crie um objeto chamado pequenas que contenha todas as árvores com altura (h)
#menor que um metro.(Os dados no arquivo estão em centímetros)
#havia feito direto, por isso não apareciam todas as colunas do objeto. Retornava apenas true e false.

pequenas= caixeta[caixeta$h < 100,]
pequenas
#Caso queira dizer quais as colunas quero ver quando for verificar o objeto.
pequenas1= caixeta[caixeta$h < 100, c(4,3,2)]
#pequenas= (caixeta[caixeta$h < 100, c(4,3,2)]) #os parenteses externos indicam que tudo se torna um vetor. não faz diferença para o resultado final

#crie um objeto chamado grandes que contenha todas as árvores acima de 3 metros
grandes= caixeta[caixeta$h >300, ]
grandes

#crie um objeto chamado medias que todas as árvores com alturas entre um metro e tres metros
medias= caixeta[caixeta$h >= 100 & caixeta$h <= 300,]
medias

#agora em uma linha de comando, crie um objeto que contenha a quantidade de
#árvores pequenas, médias e grandes, separadamente
todas= c(length(pequenas$local), length(medias$local), length(grandes$local))
todas
dim(pequenas) #permite ver a dimensão da tabela.
#caso o comando seja grande e dê erro, posso subdividir os comando e executar por partes para verificar onde se encontra o erro
#comente a linha de cada comando.

#Crie um objeto chamado obj somente com os individuos de "Alchornea
obj1= caixeta[caixeta$especie == "Alchornea triplinervia",] #estava errado pois tinha iniciado com caixeta$especie. ele usou apenas a coluna especie,
#se quero pegar algo dentro de um objeto tenho que usar o colchete. se coloco parentese ele entende que caixeta é uma função pois tudo que vem antes do parentese e lido como função
obj1

#triplinervia" Em quantas localidades esta espécie ocorre? Qual comando para encontrar essa informação?
# devo utilizar o novo objeto que tem apenas a especie de interesse. da forma que fiz ele não me dava o número de ocorrencia por local
table(obj1$local) #nome do local com o numero de individuos
unique(obj1$local) #nome dos locais


#podemos remover dados de um dataframe, usando o sinal de menos
caixeta.sem.tabebuia = caixeta[ - which(caixeta$especie=="Tabebuia cassinoides"),]
unique(caixeta.sem.tabebuia$especie)#mostra o resultados por nomes não repetidos.
sort(unique(caixeta.sem.tabebuia$especie)) #ordena o resultado de unique em ordem alfabética


#agora crie um objeto removendo todas as "Tabebuia cassinoides" do local retiro
#(somente do local retiro)
caixeta.sem.retiro = caixeta[!c(caixeta$local=="retiro" & caixeta$especie== "Tabebuia cassinoides"),]
caixeta.sem.retiro = caixeta[
  !c(
    caixeta$local=="retiro"
    &
      caixeta$especie== "Tabebuia cassinoides"
    ),
  ] # condição (!) quer dizer não pegue o que cumprir a condição abaixo


#posso dividir a linha de comando nas diferentes partes e executar aos poucos para entender o que cada parte que dizer.


#crie os objetos abaixo, junte eles num dataframe de duas colunas chamado comNA,
#depois crie um novo objeto chamado semNA, removendo todas as linhas que contenham NA, usando a notação acima (dica: só se usa "" para valores do tipo
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
comNA= data.frame(x=id, y=c(a, b, c, d))
semNA= comNA [!is.na(comNA$y),]
semNA= na.omit(comNA) #outra forma de eliminar os NA do conjunto de dados

#Abaixo temos dados de tamanho de mandíbula de chacal dourado.
#Crie um dataframe com esses dados. Qual a média por sexo? E para a espécie? Guarde estes valores
#em tres objetos diferentes.

#machos: 120 107 110 116 114 111 113 117 114 112
#femeas: 110 111 107 108 110 105 107 106 111 111
#Quantos machos têm a mandíbula maior do que a média das fêmeas?
machos= c(120, 107, 110, 116, 114, 111, 113, 117, 114, 112)
femeas= c(110, 111, 107, 108, 110, 105, 107, 106, 111, 111) 

media.m= mean(machos)
media.f= mean(femeas)
media.mb= mean(c(machos, femeas))
media.gd= machos[machos> media.f]
#usando data frame
machos.gd1=data.frame(machos, femeas)
machos.gd2= machos.gd1$machos[machos.gd1$machos >media.f]

#Função if


#escreva **uma** linha de código que testa se um número é par, e caso seja,
#manda uma mensagem dizendo "par". dica: use a função %% (resto da divisão, ou
#remainder em inglês) e a função message()

#agora crie um código  como acima, mas que diga "par" se for par e "impar" se
#for impar. Dica: leia sobre as funções else e ifelse

#crie um ciclo (for) que mostre o console todos os inteiros de 1 até 10, um por
#um

#crie um ciclo (for) que some todos os inteiros de 25 até 43, guardando esses
#valores num objeto soma (dica: crie o objeto soma com valor zero antes do
#código do ciclo)

#####Desafio level Hard#####
#Escreva um código que escreva os números de um a 100, com as seguintes
#condições: Se o número for multiplo de 3, ao invés do dígito, escreva "Fu". Se
#o número for múltiplo de 5, ao invés do dígito, escreva "bá". Para números que
#forem multiplos tanto de 3 quanto de 5, escreva "Fubá". A melhor solução ganha
#um chocolate    
for (i in 1:100) {
  if(i %% 3 == 0 & i %% 5 == 0 ){
     message ("Fubá")
  } else  if(i%% 3 == 0) {
      message ("Fu")
    } else if (i %% 5 == 0) {
      message ("Bá")
      }else message (i)
}
#a função else só funciona para a condição anterior. toda vez que for utilizar teremos que chamá-la novamente.  
## %% quer dizer divisivel por 