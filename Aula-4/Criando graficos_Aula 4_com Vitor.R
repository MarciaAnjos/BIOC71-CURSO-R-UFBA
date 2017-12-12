######################################################
# IntroduÃ§Ã£o Linguagem R
# Marcia Anjos
# Universidade Federal da Bahia
#####################################################
####Criando graficos no R####
#aprendendo a criar gráficos
#criano R e salva em todos os formatos possíveis a partir de dispositivos com a extensão de interesse
#tem que mandar salvar ou o arquivo fica corrompido

####Estrutura do grafico - exemplo
# Chame o tipo de arquivo desejado, passando informações de tamanho, resolução, tipo de fonte, e nome de arquivo
png("SocialNetworkExample.png", #nome do arquivo
    width = 900, #largura do grafico
    height = 900) #comprimento do grafico

#plote seu gráfico normalmente, ele será escrito no arquivo e não irá aparecer na tela
plot(graph.subset,
     layout= layout_nicely(graph=graph.subset),
     vertex.label=NA,
     vertex.color=colors[membership(graph.subset.modulos)],#comandos para colorir o arquivo
     vertex.size = 5,
)
#feche o dispositivo, usando dev.off(), senão o arquivo ficará corrompido
dev.off() #comando para salvar o arquivo para não ficar corrompido

#plotar - apos gerar a analise vc joga os resultados para dentro de um objeto e esse será plotado.

####função plot####
#plot x e y com pontinhos - depois vc informa que tipo de ponto será
#ggplo2 - outro pacote de gráfico com mais interfaces - plota automaticamente uma legenda

plot(x= iris$Sepal.Length, y=iris$Sepal.Width,col=iris$Species)#parametro col. é a cor do que será plotado

#qualquer coluna que tenha um fator pode ser usada para agrupar os dados. Nesse caso a coluna $Specie está sendo usada para colorir os dados
#os tres primeiro paramentros usados sao X, y e COl(que pode ser uma lista de numeros ou um fatos)
plot(x= iris$Sepal.Length, y=iris$Sepal.Width, col = c(19, 21, 186))#as cores podem ser chamadas por números ou cores. 
#parqa saber quantas cores o R tem use a função 
colors()
plot(x= iris$Sepal.Length, y=iris$Sepal.Width, col = rainbow(4)) #rainbow é um argumento que fornece a quantidade de cores necessárias. Enttre parentese indico o número de cores que quero.
#pacote com paleta de cores para daltonicos (varides(?) e o dicromatid)

#Notação de formula####
plot(iris$Petal.Length ~ iris$Sepal.Length, col = rainbow(3)) #quer dizer plot petal,lenght em função de Sepal. lenght. Esse modelo é muito usado para plotar funções lineares

#porém o mais recomendado é usar 
plot(x= iris$Sepal.Length, y=iris$Sepal.Width, col = rainbow(3))

#Função Plot####

?plot
#tipos de pontos são número de ) a 25. Dá para plotar figuras tmb
#mudar a cor do texto
#Use as funções = col.axis, col.lab , col.main
plot(x= iris$Sepal.Length, y=iris$Sepal.Width, col = rainbow(3), col.axis= "blue", xlab = "Eixo X", ylab = "Eixo Y") #(acrescento para mudar cor e também nome do eixo. sempre seguido de ="TITULO DO EIXO")

#Legendas####
#função legend
#Cheme um plot e depois chama a legenda por cima
plot(x= iris$Sepal.Length, y=iris$Sepal.Width, type = "l", col = rainbow(3))
legend(4.5,4.0,legend = c(unique(iris$Species))) #primeiro indico a posição onde quero a legenda.

#caso queira destacar algum ponto ou imagem podemos fazer isso dentro do grafico
text(4.5, 4, "teste")

#para transformar um grafico de pontos em linha
plot(x= iris$Sepal.Length, y=iris$Sepal.Width, type = "l" #muda o tipo de ponto
     , col = rainbow(3)
     , main = "titulo do grafico"  #altera nome do grafico
     , family = "serif" #muda a fonte
     ,cex=2 #aumenta ou diminue o tamanho dos pontos
     ,lwd= 3 #Para mudar a expressura da linha usa lwd = 3
     ,lty = "dotdash"  #altera o tipo de linhas 
     , xlim = c(4.5,4) #mostra os pontos dentro do limite de x solicitado que é indicado pelas coordenadas
    , ylim = c(0.0, 4.0) #mostra os pontos dentro do limite de y solicitado que é indicado pelas coordenadas
     , xlim=range(iris$Sepal.Length)
    , bty ="n") #xlim =range mostra todo o limite dentro da coluna

#o eixo se cruza no limite indicado com xlim e ylim
#para mudar o tipo de grafico de quadrado para caixa aberta
plot(x= iris$Sepal.Length, y=iris$Sepal.Width, type = "p" #muda o tipo de ponto
     , col = rainbow(3)
     , main = "titulo do grafico"  #altera nome do grafico
     , family = "serif" #muda a fonte
     ,cex=2 #aumenta ou diminue o tamanho dos pontos
     ,lwd= 3 #Para mudar a expressura da linha usa lwd = 3
     ,lty = "dotdash" #altera o tipo de linhas 
     , bty = "n")  #modifica a caixa externa do grafico, pode usar "o", "l" ou "n"


#para plotar dois gráficos um do lado do outro
par(mfrow=c(1,2)#linha, coluna - primeiro uso a função par e depois plot com o grafico de interesse
    , cex= 0.5) #alterando o cex dentro da função par, padronizo o paramentro para todos os gráficos.
dev.off()
plot(x=iris$Sepal.Length, y=iris$Petal.Length,        #primeiro gráfico
     col = iris$Species,                          
     main = "Sepal.Length x Petal.Length", cex= 2)     

plot(x=iris$Sepal.Length, y=iris$Sepal.Width,         #segundo gráfico
     col = iris$Species,                          
     main = "Sepal.Length x Sepal.Width in Iris")      
#caso queira modificar no gráfico (cor, titulos...) faço isso nos comandos para cada grafico, fução axis.
#com o comando dev.off ele reseta todos os comandos do par e volta para o padrão.

####Adicionando detalhes no grafico####
#abline - adiciona linha de regres

plot(x=iris$Sepal.Length, y=iris$Sepal.Width,         #segundo gráfico
     col = iris$Species,                          
     main = "Sepal.Length x Sepal.Width in Iris")
     abline(v=mean(iris$Sepal.Length), col="red") #plot a reta na vertical utilizando a media da coluna informada
     abline(h=mean(iris$Sepal.Width), col="blue")   #plot a reta na horizontal utilizando a media da coluna informada    
     mod=lm(iris$Petal.Length~iris$Sepal.Length)
abline(mod) y#reta de regressão
dev.off()
points(x=5, y=3) # ponto na coordenada x  e y
arrows(x0=5, y0=2,x1=5,y1=3, angle = 90)#reta indo de x0, y0, para x1, y
segments (x0=6, y0=4.0, x1=4.5, y1=3.5) #segmento indo de x0, y0 para x1, y1 
text(x=7, y=4, "chuchu", col="purple")

#alterando parametros dos eixos####
Exemplo

plot(TamanhoDaAsa ~ Idade, xlab = "Idade (décadas)",  
     ylab = "Comprimento (metros)",  
     main = "Tamanho da asa"  
     , bty = "n"  
     , xlim = c(0, 23), ylim = c(0, max(TamanhoDaAsa))  
     , lwd = 2  
)  
abline(modelo, col = "red", lwd = 2) 
modelo=lm(TamanhoDaAsa ~ Idade)
par(bty = "n" , lwd = 2)
plot(TamanhoDaAsa ~ Idade, xlab = "Idade (décadas)",  
     ylab = "Comprimento (metros)",  
     main = "Tamanho da asa"  
     , xlim = c(0, 23)  
     , ylim = c(0, max(TamanhoDaAsa)) 
     , yaxt = "n"  # "n" não plota o eixo, pois iremos alterá-lo com axis()
     , xaxt = "n" #peço para não plotar o eixo e depois uso a função axis
)  
axis(1, pos = 0)  # peço eixos cruzando no 0 - mudo caracteristicas diretas do eixo 
#tenho que informar para cada eixo plotado
axis(2, pos = 0, las=2)  
abline(modelo, col = "red", lwd = 2)

#modelo linear - plotar residuos e outras informações que permitem avaliar a qualidade do modelo

##Plotar médias com barras de desvio padrão####
m1=mean(dragoes$y[dragoes$x=="aventureiros"]);m2=mean(dragoes$y[dragoes$x=="fazendeiros"])
m3=mean(dragoes$y[dragoes$x=="vacas"]);m4=mean(dragoes$y[dragoes$x=="virgens"],na.rm = T)
s1=sd(dragoes$y[dragoes$x=="aventureiros"]);s2=sd(dragoes$y[dragoes$x=="fazendeiros"])
s3=sd(dragoes$y[dragoes$x=="vacas"]);s4=sd(dragoes$y[dragoes$x=="virgens"],na.rm = T)
avg=c(m1,m2,m3,m4)
sdev=c(s1,s2,s3,s4)
plot(x= 1:4 #idica que serão 4 setas
     , y= avg,cex=1.5,pch=16, col=1:4,ylim=range(c(avg-sdev, avg+sdev)))
arrows(x0=1:4, y0=avg-sdev, x1=1:4, y1=avg+sdev, length=0.05, angle=90, code=3)#arrows é um vetor de setas
abline(h=mean(avg), col="red")#media total


#Boxplot####
#o eixo x deve ser um fator, se for continuo vai dá erro.


#Função aggregate####
#só funciona para valores numericos
#agrega os dados pelos níveis de um fator
#x - objeto que será agregado
#by - coluna que contem os níveis
#FUN - função que será aplicada para cada nível do fator. Aqui informo para remover o na dos dados.