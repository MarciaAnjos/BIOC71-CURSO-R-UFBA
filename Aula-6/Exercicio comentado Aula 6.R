######################################################
# Introducao Linguagem R
# Marcia Anjos
# Universidade Federal da Bahia
#Exercicio _ Tutoriais de Programação
#####################################################
getwd()
setwd("C:/Users/Luiz e Marcia/Google Drive/Curso R/Exercicios/")
getwd()

#Uma funções muito simples
#aprendendo a calcular média

media <-function(x)
{
  soma=sum(x)#funcao soma aplicada sobre o objeto x
    nobs=length(x)# aplica a função nobs em todo o objeto x
      media=soma/nobs# o objeto media é a media de x
  return(media) #a função retorna o objeto média contendo o valor da media de x
}
?nobs

##Testando a função####

?ls()# lista os objetos
media #é o nome da função acima que retorna como objeto a media de x
media()#é a função
dados=rnorm(20,2,1) #cria um objeto dados com 200 valores aleatorios com media 2 e desvio padrao 1
media(dados)#aplica a função média para o objeto dados
dados1=rnorm(200,2,1)##cria um objeto dados1 com 200 valores aleatorios com media 2 e desvio padrao 1
media(dados1)#aplica a função média para o objeto dados1
dados2=(rnorm(10000,2,1))#cria o objeto dados2 com 10000 valores aleatorios, media 2 e sd 1
media(dados2)#retorna a media do objeto dados2
sd(dados)#retorna o desvio padrao do objeto dados
dados3=rnorm(20,2,0.01) #cria um objeto dados3 com 20 valores aleatorios com media 2 e desvio padrao 0.01
media(dados3)#retorna a media do objeto dados3
dados4=rnorm(200,2,0.01) #cria um objeto dados4 com 200 valores aleatorios com media 2 e desvio padrao 0.01
media(dados4)#retorna a media do objeto dados4
dados[2]<-NA #substitui o elemento 2 do objeto dados por NA
dados #verifico se o comando anterior funcionou
media(dados)#retorna a media de dados que é NA.

#Funcao para lidar com dados com NA#

media= function(x,rmNA=TRUE)  
{
  if(rmNA==TRUE)
  {
    dados=(na.omit(x))
    n.NA=length(x)-length(dados)
    cat("\t", n.NA," valores NA excluídos\n")
  }
  else
  {
    dados=x
  }
  soma=sum(dados)
  nobs=length(dados)
  media=soma/nobs
  return(media)
}

#Calcular a média do vetor dados

media(dados)#aplico a função media no objeto dados. Ela retorna duas informações: o número de NA retirados dos dados e a media do conjunto de dados

#Função para calcular variância####

var.curso<-function(x)
{
  media=media(dados)
  dados=na.omit(dados)	
  disvquad=(dados-media)^2
  var.curso=sum(disvquad)/(length(dados)-1)
  return(var.curso)
}
#Calcular a variância de dados e comparando com a função do R!
  
  var.curso(dados)
var(dados)# retorna a variancia de dados Na, pois tem NA em dados
var(dados,na.rm=TRUE)# a função retira o NA e retorna o valor numerico da variancia
var(dados,na.rm=FALSE)#a função não retira o NA e retorna media NA
 help(var)
 
 #Função para calcular o Índice de Dispersão####
 ID.curso<-function(x)
 {
   id=var.curso(x)/media(x)
   return(id)
 }
 #Simulando dados com parâmetros conhecidos
 
 #Simulando Aleatório
 aleat=rpois(200,2)#cria o objeto aleat com distribuicao aleatoria
 aleat
 
 #Uniforme
 unif=runif(200,0,4)#cria o objeto unif com distribuicao uniforme
 unif#verifico o objeto
 unif=round(unif,0)# arredonda os valores decimais
 unif#verifico o objeto
 
 #Agregado
 agreg=round(c(runif(100,0,1)
               ,runif(100,5,10)))#cria objeto com dois conjuntos de valores uniformes com medias e desvios diferentes
 agreg
 
 #Calcular o coeficiente de dispersão
 
 ID.curso(aleat) #aplica a função ID.curso sobre o objeto aleart, assim retira os NA e calcula o indice de dispersão
 
 ID.curso(unif)#aplica a função ID.curso sobre o objeto unif, assim retira os NA e calcula o indice de dispersão
 
 ID.curso(agreg)#aplica a função ID.curso sobre o objeto agreg, assim retira os NA e calcula o indice de dispersão
 
 #o valor do Indice de dispersão varia de acordo com a distribuição dos dados
 
 #Função para criar o teste de signficância do ID####
 
 test.ID <- function(x, nsim=1000)
 { 
   ID.curso=function(x){var(x)/mean(x)}# essa função precisa das funcoes media e ID.curso
   dados=na.omit(x)
   ndados=length(dados)
   med=mean(dados)
   id=var(dados)/med
   simula.aleat=rpois(length(dados)*nsim, lambda=med)
   sim.dados=matrix(simula.aleat,ncol= ndados)
   sim.ID=apply(sim.dados,1,ID.curso)
   quant.ID=quantile(sim.ID, probs=c(0.025,0.975))
   if(id>=quant.ID[1] & id<=quant.ID[2])
   { 
     cat("\n\n\n\t distribuição aleatória para alfa=0.05 \n\t ID= ",id,"\n\n\n")
   }
   if(id < quant.ID[1]) 
   { 
     cat("\n\n\n\t distribuição uniforme, p<0.025 \n\t ID= ",id,"\n\n\n")
   }
   if(id>quant.ID[2])
   { 
     cat("\n\n\n\t distribuição agregado, p>0.975 \n\t ID= ",id,"\n\n\n")
   }
   resulta=c(id,quant.ID)
   names(resulta)<-c("Indice de Dispersão", "critico 0.025", "critico 0.975")
   return(resulta)
 }
 
 #Testanto os dados simulados
 
 test.ID(aleat)#aplica a função e testa a significancia do ID sobre o objeto aleat. retorna o tipo de distribuição para os dados e o valor de ID é próximo de 1 
 test.ID(agreg)##aplica a função e testa a significancia do ID sobre o objeto agreg. retornaa o tipo de distribuição para os dados, nesse caso são agregados
 test.ID(unif)#aplica a função e testa a significancia do ID sobre o objeto unif, retorna o tipo de distribuição para os dados, nesse caso é uniforme e o valor de ID é abaixo de 1
 
 #Outra função####
 
 eda.shape #função grafica. posta os diferentes tipos de graficos para o conjunto de dados
 
 eda.shape <- function(x)
 {
   x11() 
   par(mfrow = c(2,2))	## muda o dispositivo gráfico para 2x2
   hist(x)                 ## produz histograma de x
   boxplot(x)
   iqd <- summary(x)[5] -	summary(x)[2]     ## faz a diferença entre o quinto elemento x e o segundo
   plot(density(x,width=2*iqd),xlab="x",ylab="",type="l")
   qqnorm(x)
   qqline(x)
   par(mfrow=c(1,1))
   
 }
 
 ##Criando um vetor de dados com 20 valores simulando a densidade de árvores por parcelas
 
 set.seed(22) ## estabelece uma semente aleatória 
 dados.pois20<-rpois(20,lambda=6) ## sorteia dados aleatórios de uma função poisson com média 6
 sum(dados.pois20) ## a somatória aqui sempre dará 131, somente porque a semente é a mesma
 set.seed(22)
 dados.norm20<-rnorm(20,mean=6, sd=2) ## sorteia 20 dados de uma função normal com média 6 e dp = 1
 sum (dados.norm20)  ### aqui o resultado dará sempre 130.48
 
 ###aplicar eda.shape para dados.dens
 
 eda.shape(dados.pois20)#retorna uma janela extra com os graficos de hist, boxplot, plot de densidade e o teste de normalidade, para os dados com distribuição de poisson
 
 eda.shape(dados.norm20)#retorna uma janela extra com os graficos de hist, boxplot, grafico de linha e teste de normalidade , para os dados com distribuição normal
 
 ###aumentando a amostra
 
 eda.shape(rpois(500,6))#aumentando a amostra, mesmo com a mesma media há variaçao no padrao de distribuição nos graficos
 
 eda.shape(rnorm(500,6)) #aumentando a amostra, mesmo com a mesma media há variaçao no padrao de distribuição nos graficos. O teste de normalidade é o que apresenta maior diferença
 
 #Modificando uma função####
 
 eda.shape1 <- function(x)
 {
   x11()
   par(mfrow = c(2,2))
   hist(x,main="Histograma de x")
   boxplot(x, main="BoxPlot de x")
   iqd <- summary(x)[5] -	summary(x)[2]
   plot(density(x,width=2*iqd),xlab="x",ylab="",type="l", main="Distribuição de densidade de x")
   qqnorm(x,col="red",main="Gráfico Quantil x Quantil",xlab="Quantil Teórico",ylab="Quantil da Amostra")
   qqline(x)
   par(mfrow=c(1,1))
   
 }
 
 #Executando a função modificada
 
 eda.shape1(rnorm(500,6))###retorna uma janela extra com os graficos de hist, boxplot, plot e o teste de normalidade , para os dados com distribuição normal. A diferença são as especificações para os graficos ,como titulos e outras especificações para o  teste de normalidade
 
 #Fazendo ciclos de operações####
 
 #Um outro instrumento importante para programar em R é o loop ou ciclos. Ele permite a aplicação de uma função ou tarefa a uma sequência pré determinada de dados. Ou seja, repete a mesma sequência de comandos um número determinado de vezes.
 
 #Simulando dados de novo!
   
   x1=rpois(20,1) #Cria o objeto x1 com 20 valores com distribuição poisson com lambda 1
 x2=rpois(20,2) ##Cria o objeto x2 com 20 valores com distribuição poisson com lambda 2
 x3=rpois(20,3)#Cria o objeto x3 com 20 valores com distribuição poisson com lambda 3
 x4=rpois(20,1)#Cria o objeto x4 com 20 valores com distribuição poisson com lambda 1
 sp.oc=matrix(c(x1,x2,x3,x4), ncol=4)#Cria o objeto sp.oc em uma matriz com os objetos x1, x2, x3 e x4 em 4 colunas
 colnames(sp.oc)<-c("plot A", "plot B", "plot C", "plot D")#nomeia as colunas
 rownames(sp.oc)<-paste("sp", c(1:20))#nomeia as linhas
 str(sp.oc)#verifica estrutura de sp.oc
 dim(sp.oc)# mostra a dimensão da matriz 20 linhas 4 colunas
 head(sp.oc)#mostra as 6 primeiras linhas da matriz
 
 #Uma fun?ao para contar especies por parcelas. Mais uma vez uma funcao ja existente em versao piorada!!
   
   n.spp<-function(dados)
   {
     nplot=dim(dados)[2]
     resultados=rep(0,nplot)
     names(resultados)<-paste("n.spp", c(1:nplot))
     dados[dados>0]=1
     for(i in 1:(dim(dados)[2]))
     {
       cont.sp=sum(dados[,i])
       resultados[i]=cont.sp
     }
     return(resultados)
   }
 
 
 ##### Aplicando a funcao
 
 n.spp(sp.oc)# a função mostra a frequencia de cada especie, mas não informa isso por parcela
 
##Mais função!! 
 #SIMILARIDADE####
 
 sim<-function(dados)#vai aplicar a função de similaridade no objeto dados
 {
   nplot=dim(dados)[2]#informa a dimensão da matriz apenas para o segundoelemento informada pela funcao dim e coloca esse resultado no objeto nplot.
   similar=matrix(1,ncol=nplot,nrow=nplot)#informa a dimensao da matriz será igual a do nplot
   rownames(similar)<-paste("plot", c(1:nplot))#renomeia as linhas
   colnames(similar)<-paste("plot", c(1:nplot))#renomeia as colunas
   dados[dados>0]=1#os valores maior que ) são igual a 1 indicando 
   for(i in 1:nplot-1)
   {
     m=i+1
     for(m in m:nplot)
     {
       co.oc=sum(dados[,i]>0 & dados[,m]>0)
       total.sp=sum(dados[,i])+sum(dados[,m])-co.oc
       similar[i,m]=co.oc/total.sp 
       similar[m,i]=co.oc/total.sp 
     }
     
   }
   return(similar)
 }

sim(sp.oc) #retorna a matriz de similaridade para os dados sp.oc. mostrando a similaridade entre as parcelas
sim.sp.oc=sim(sp.oc)

#Exerc?cio An?lise explorat?ria simult?nea de duas vari?veis


rm(list = ls()) #limpa todos os objetos do environment
dev.off() #limpa todos os graficos

library("plotrix") #busca o pacote na biblioteca
install.packages("plotrix") #load("plotrix")
?multhist  # multhist(x,beside=TRUE,freq=NULL,probability=!freq,plot.it=TRUE,...)

#preciso de uma fun??o que tenha como input dois vetores de mesmo tamanho. 
#essa fun??o deve retirar os NA, e plotar os diferentes tipos de graficos com as configura??es previamente definidas. 
#devido os vetores serem numericos para facilitar, tirarei o grafico de histograma. 
#a fun??o deve informar se os vetores possuem o mesmo tamanho 
#caso ela seja executada na integra deve d? como resposta de saida o resultado de diferentes fun??es realizadas

myf= function(x,y,rmNA= TRUE) #a fun??o tem como argumento x, y e presen?a de NA
{
  if(length(x)==! length(y))#se o comprimento de x exatamente diferente de y, printe a mensagem que est? entre parenteses.
  {
    cat("\t","vetores de diferentes tamanhos ")
  }
  
  if(rmNA==TRUE) #### informe o n de NA retirados
  {
    x.1= na.omit(x)#retire os NA presente em x e guarde o resultado no objeto x.1
    x.1
    ?na.omit
    y.1= na.omit(y)#retire os NA presente em y e guarde o resultado no objeto y.1
    y.1
    n.NA= (length(x)-length(x.1))+(length(y)-length(y.1))# retira os NA de todo o x e y. n.NA ? o numero de NA retirado  de x menos x.1 e o mesmo com y
    n.NA    #numero de NA retirado
    cat("\t", n.NA," valores NA exclu?dos\n") #retorna o n?mero de NA retirado
  }
  eda.shape = function(x.1) #fun??o de dispositivo grafico
  {
    x11() #abre uma janela extra para exibir os graficos
    par(mfrow = c(2,2))	## muda o dispositivo grafico para em duas linhas e duas colunas
    
    hist(unlist(x.1), hist.args$breaks, plot = FALSE)     ## n?o produz histograma de x
    boxplot(x.1, xlab="x",ylab="ind", main= "T? na m?dia") #plota o boxplot de x com os titulos dos eixos
    iqd = summary(x.1)[5] -	summary(x.1)[2]   ## faz a diferenca entre o quinto elemento x e o segundo, que ser? usado para calculo da densidde (?)
    plot(density(x.1,width=2*iqd),main= "Denso", xlab="x",ylab="",type="l") #plota o grafico de densidade
    qqnorm(x.1, xlab = "Distribui??o", ylab = "")#gera o grafico do teste de normalidade
    qqline(x.1, distribution = qnorm, probs = c(0.25, 0.75), qtype = 7)#desenha linha de distribui??o, assumindo distribui??o normal no 1 e 3? quartil e qtype (ta relacionado a inclina??o da reta) 
    par(mfrow=c(1,1))# aumento a area de plotagem para ver aenas um gr?fico por vez
  }
  
  par(mfrow = c(2,2)) ## muda o dispositivo gr?fico para 2x2 quatro gr?ficos por vez
  lista= list(x.1,y)#cria uma lista com os objetos x.1 e y
  #?list
  multhist(lista) ## produz barplot dos dois 
  #Graf 2
  boxplot(x.1,y, ylab="Quantidade", main= "Boxplot de X e Y", col=c("red", "blue"), lty= 1, type = "l")
  (a= min(x.1,y.1)) # cria o objeto com o valor minimo dentro de x.1 e y.1
  (b=max(x.1,y.1))# cria o objeto com o valor maximo dentro de x.1 e y.1
  #Graf 3
  qqnorm(x.1,col="green", pch=19, xlab="Quantis Te?ricos", ylab="Quantis da amostra", main= "Quantis de x e y", ylim=c(a,b))# plota o grafico de normalidade com as condi??es citadas
  par(new=TRUE) # transforma o objeto em um vetor l?gico e todos os elementos contidos tem a mesma probabilidade para falso
  qqnorm(y.1, xlab="", ylab="", main= "", ylim=c(a,b))
  #Graf 3
  plot(x~y, xlab="valores do x", ylab="os valores de Y", main= "Rela??o de X e Y", pch=23, col="purple")
  
  summ_x= summary(x.1)
  summ_y= summary(y.1)
  cor.X_y= cor(x.1,y.1)
  mediax=mean(x.1)
  saida= list(summ_x, summ_y, cor.X_y, mediax)
  names(saida) = c("Sum?rio de X", "Sum?rio de Y", "Coeficiente de Correla??o", "mean")
  saida
  ?list
  saida 
  names(saida)
  return(saida)
}

myf(vetor1, vetor2, rmNA = TRUE)
#codigo modificado da solu??o de exercicio do ecoR