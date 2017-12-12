
######################################################
# Introdução Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#####Usando o R como calculadora#####
##entrando no R

#Digite no R os códigos abaixo.
#Dica: escreva neste arquivo, ao lado do comando, o que ele faz,
#como no exemplo abaixo

1 + 1 #soma os valores

# O símbolo # representa um comentário, isto é, tudo que vier à direita
# dele será ignorado quando o R ler o arquivo

34 - 72.3 #subtrai 72.3 de 34

# use pontos como separador de decimal. O que acontece se você usar virgula?
78 / 3 #divide 78 por 3
2 ^ 3 #eleva dois a potência 3
3 * 2 #multiplica 3 por 2
sqrt(2)#fornece o valor da raiz quadrada de 2
pi # fornece o valor de pi
log(x = 3,base = 10)# fornece o valor do log de 3 na base 10
exp(x = 1)# fornece log de 1 na base 10
#o que querem dizer estes valores dentro do parêntese? porque usamos o = aqui?
#Os valores dentro dos parênteses indicam argumentos ou parâmetros da função.

#####Atribuição de valores e criação de objetos#####
#O que os comandos abaixo fazem?
objeto1=3 ##Cria o vetor e indica qual o elemento dentro dos vetores
objeto1 #mostra qual o elemento dentro do vetor objeto1
objeto = 42 # cria o vetor objeto 
objeto #mostra qual o elemento dentro do vetor objeto1
objeto.2 <- 42 # cria o vetor objeto.2
objeto.2 #mostra o elemento dentro do vetor
# Os símbolos = e <- fazem basicamente a mesma coisa. Que coisa?
#eles atribuem os valores a direita para dentro do objeto (gráfico, arquivo, endereço..) ou vetor (objeto com varios valores)
objeto.cubico <-objeto^3 #cria um objeto com o nome objeto.cubico que é igual ao elemento dentro  do objeto elevado ao cubo.
resultado.1 <- (objeto.cubico / 3) + 7 #cria o objeto resultado.1 com o elemento resultado da equação que segue o nome do objeto
objeto.texto <- "texto sempre vem entre aspas" #cria o objeto com o nome objeto.texto que contem o elemento "texto sempre vem entre aspas"
objeto.texto #mostra o elemento dentro do objeto
objeto.texto.2 <- "42" #cria o objeto objeto.texto.2 com o elemento 42, porém transformado em texto.

objeto.vetor.1 = 1:34 # cria o objeto com nome objeto.vetor.1 com os elementos que é a sequencia de 1 a 34
objeto.vetor.1 #mostra os elementos dentro do objeto
objeto.vetor2 = c(1, 74.5, 48) #cria o objeto objeto.vetor2 e atribuir esses trÊs valores para o objeto.vetor2
objeto.vetor2 #mostra os valores do objeto.vetor2

?seq #aciona a função ajuda da função seq
objeto.vetor3 = seq(from = 20, to = 32, by = 0.5) # cria o objeto e atribui a ele os elementos que são sequencia de numeros de 20 a 32 mostrados a cada 0.5

#podemos calcular estatísticas com o r
mean(objeto.vetor3) #media do objeto.vetor3
var(objeto.vetor3) #variancia do objeto.vetor3
median(objeto.vetor3) #mediana do objeto.vetor3
min(objeto.vetor3)#menor valor dentro do objeto
max(objeto.vetor3)#maior valor dentro do objeto
diff(objeto.vetor3) #calcula a diferença entre os elementos sucessivos do vetor

# R também faz comparações entre objetos
42 > 7 # mostra que o resultado é verdadeiro, ou seja, 42 é maior que 7
objeto == objeto.2 #mostra que o objeto é exatamente igual ao objeto.2
objeto == objeto.texto.2 #mostra que o objeto é exatamente igual ao objeto.texto.2
# o que aconteceu acima? # os comandos mostram que os objetos possuem valores iguais
7.1 <= 7.001 #mostra que isso é falso. os valores não são iguais.
?"<"

#pedindo ajuda
?pi #abre o help com informa??es sobre fun??o Pi
?log #abre o help com informa??es sobre fun??o log
??lm #mostra todos os pacotes que realizam fun??es de modelo linear
help(log)#abre o help com informa??es sobre fun??o log
help.search("anova") #mostra todos os pacotes que realizam an?lise anova

#####Arquivos e diret?rios#####
# Como voc? descobre o diret?rio de trabalho?
#utilizando o comando getwd3().

# Como voc? lista o conte?do do diret?rio de trabalho?
#utilizando o comando ls.

# Como voc? define o diret?rio de trabalho?
# utilizando a fun??o setwd("endere?o do diret?rio")

# Como voc? carrega um arquivo de script?
#utilizando o comando + ou os comandos Arquivo/Abrir script.

# Como voc? salva os objetos que criou?
#utilizando o comando 	save.

# Como voc? carrega os objetos que criou?
#Por configura??o padr?o, o R gravar? o workspace na extens?o .RData, e quando voc? reiniciar uma sess?o, o R automaticamente carrega esse arquivo.

# Como ver quais objetos est?o na sua ?rea de trabalho?
#utilizando o comando ls()

# Como remover objetos da ?rea de trabalho?
#utilizand o comando rm

##### Lidando com erros#####
# O que acontece quando voc? digita os comandos abaixo? Como consertar cada erro?
objetol # aparece mensagem de erro objetol n?o encontrado. Se eu esteiver me referindo ao Objeto1, basta corrigir o erro de digita??o
objeto .texto #mensagem de erro simbolo n?o reconhecido, pois tem um espa?o antes do ponto. para corrigir elimino o espa?o
Objeto # objeto n?o encontrado. O nome do objeto foi digitado com inicial maiuscula, corrige iniciando com minuscula.
source("chuchu.R") #o R informa que n?o existe um arquivo com esse nome.
source(chuchu.R) #o R informa que n?o existe um objeto com esse nome.
setwd("C:/CavernaDoDragão") #mensagem de erro informando que o n?o pode mudar o diret?rio do trabalho.
getwd #informa qual o diret?rio de trabalho
Getwd() #informaque a fun??o getwd n?o foi encontrada.O diret?rio de trabalho n?o foi definido. Deveria colocar entre parentese o nome do projeto para que fosse localizado (?)
#dica: quando o R der erro, copie e cole a mensagem de erro no google