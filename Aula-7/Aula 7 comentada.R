######################################################
# Introducao Linguagem R
# Marcia Anjos
# Universidade Federal da Bahia
#####################################################
#####Exercicio Aula 7##########
##Git salva minha vida

#####Usando Git com RStudio#####


#Funcao GIT é um programa com linguagem de programação que salva suas versões ao longo do trabalho. Ele permite restaurar as alteraçãos. é uma linha do tempo das alterações. Preciso mandar salvar, ele  não salva sozinho. 
#Use o git salvando todo tipo de arquivo. 

#GitHub é o site que armazena os arquivos.
#repositório - uma pasta no computador ou site com o código e o histórico do código. 
#Commit - comando que salva o estado atual. ou seja, as alterações do arquivo. vc informa qual alteração foi feita, salva e fecha.
#o repositorio é uma linha de commit
#Diff - compara o estado atual com o anterior. Mostras as diferenças feitas onde e quando.
#merge - funde duas versoes distintas do mesmo codigo.

#dá commit, manda pro repositório central e puxa dele.

#status - compara o repositorio com o repositorio externo.
#git push - envia uma copia para o repositorio externo. 
#usando outro computador dá um pull e puxo do repositorio externo
#pull e push são os comandos que permitem puxar e empurrar o código do repositorio

#branch - forma uma linha do tempo do código. funciona em paralelo com a versão atual. permite vc testar versoes paralelas testando outra coisas.
#clonar - clonar repositorios

#Git hub é uma empresa- 
#Git hub educacional dá acesso a vartios repositorios inclusive particular
#é bom ter o git privado.
#outra empresa é o Bitbucket

#gitkraken - ver interface

#lembre sempre de: repositorio, commit, pull, push e marge
#a versão do repositorio nunca é alterada. vc pode puxar do repositorio a qualquer momento.

#apos criar o repositorio no GITHUB, crio um projeto no Rstudio com o endereço do git
#cada projeto criado seja um repositorio diferente

#abrindo o git no Rstudio
#no campo de eviromente a ultima aba GIT aparece os arquivos que estão em seu repositorio. 
#para salvar esses arquivos selecionamos e clicamos em commit.
#aparece uma nova janela com tres abas
#uma com os arquivo que serão salvos. Uma onde devemos comentar as alterações e outra que mostra o que foi adicionado e apagado do arquivo. (adicionado aparece em verde e apagado aparece em vermelho)
#na aba commit escrevo as alterações e clico em commite. ele abre outra janela informando as alterações. assim ele salva as alterações. e volta para janela em branco,
#agora vamos puxar do repositorio os arquivos novamente. pois se outra pessoa tiver feito alterações ele informa. 
#clico em PULL para ele verifica se houve alguma alteração alem da que foi salva para puxar os arquivos
#depois clico em PUSH para empurrar os arquivos. ele vai pedir login e senha. ele processa um pouco e finaliza.
#fecho e vou na pagina do Github e atualizo. Os arquivos alterados serão atualizados e a msg de commit aparecerá do lado.
#no github clico no nome do arquivo alterado. Abre o conteudo do arquivo. ele é editavel no github
#clico no lapis e abre uma tela de edição. apos editar no quadro do commmit no final da tela, posso informar detalhes das alterações.
#volto no Rstudio e clico em PULL para ele verivicar e puxar o arquivo
#apos receber a mensagem de marge ele informa que deu erro e modifica o conteudo do arquivo
#vou no relogio na aba enviroment vai abrir uma janela mostrando as modificações.
#Apago no arquivo o conteudo que não quero que fica, salvo, dou commit e pull/push. 
#o R atualiza e concatena as alteraçoes em uma nova linha. Corrigingo assim o marge. 

####refazendo a aula#####

#Primeiro, crie sua conta educacional no GitHub e configure o Git com seu nome e email (você já deveria ter feito isso nas Atividades preliminares)

#Clone o repositório https://github.com/vrios/exemplo-curso-r para sua máquina

#Na sua máquina, crie um arquivo chamado chuchu.R, edite, salve, e dê um commit.

#Dê um pull, seguido de um push. O que aconteceu e porque?
#Enviei o arquivo e ao puxar d? erro, pois n?o tenho autoriza??o para alterar os arquivos no reposit?rio de Vitor (exemplo-curso-r)

#O que é um pull request?
#? uma requisi??o do propriet?rio do reposit?rio para eu puxar o arquvivo. Posso criar e salvar o arquivo no repositorio de outra pessoa mas n?o posso puxar sem autoriza??o.

#O que é um fork?
#? um comando que gera uma copia do processo atual e funciona em paralelo com o processo atual.

#####Criando seu primeiro repositório no GitHub#####
# Crie um repositório (público ou privado, como queira) chamado BIOC71-CURSO-R-UFBA

# Coloque uma descrição, um arquivo de licença e um .gitignore

# Clone ele para sua máquina, criando um projeto do RStudio

# No diretório do projeto do RStudio, crie Uma pasta para cada aula do curso, com o nome seguindo o padrão aula_1, aula_2, etc

# Dentro de cada pasta, coloque os scripts correspondentes

# Para cada pasta, dê um commit separado, somente com os arquivos correspondentes àquela aula

# Após dar todos os commits, dê um push pro remote

##### Alterando o Repositório e restuarando versões anteriores #####

# No GitHub, na página inicial do repositório, crie um novo arquivo chamado aula_0.R . Nele, salve o script das atividades preliminares do curso (você fez as atvidades preliminares, certo? *certo?*?). Salve o arquivo no GitHub com uma commit message descritiva

# verifique o status do seu repositório local, e sincronize seu local com o remote

# Faça alterações em arquivos do repositório local, seguidas vezes, em locais diferentes dos arquivos, sempre dando commit e push. Como reverter para um estado anterior? Como acessar o histórico do arquivo no Github? Restaure somente um dos arquivos para um estado anterior

#Extra: clone o repositório deste curso, sugira uma modificação em um dos arquivos de qualquer aula, de preferência uma melhoria de clareza do exercício ou da aula, e faça um pull request. Se eu fizer o merge vc ganha um chocolate