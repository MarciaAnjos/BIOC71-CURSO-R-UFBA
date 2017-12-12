getwd()
aves.c <- read.csv2("aves_cerrado.csv", row.names=1, as.is=T)
head(aves.c)
tail(aves.c)
str(aves.c)
summary(aves.c)
aves.c[aves.c$urubu==NA,]
is.na(aves.c) #a célula está vazia ou não está disponível?
is.na(aves.c$urubu)
aves.c[is.na(aves.c$urubu),]
aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),]
temp1 <- aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),] #retira as celulas vazias (na) da tabela
#corrigindo as celulas vazia que não são (Na) e sim equivalente a 0.
aves.c$urubu[is.na(aves.c$urubu)] <- 0
aves.c[is.na(aves.c$urubu),2] <- 0
aves.c[is.na(aves.c[,2]), 2] <- 0
aves.c$carcara[is.na(aves.c$carcara)] <- 0
aves.c$seriema[is.na(aves.c$seriema)] <- 0
aves.c[aves.c$urubu==0|aves.c$carcara==0|aves.c$seriema==0,]
temp1
table(aves.c$fisionomia)
aves.c$fisionomia[aves.c$fisionomia=="ce"] <- "Ce"
table(aves.c$fisionomia)
aves.c$fisionomia <- factor(aves.c$fisionomia, levels=c("CL","CC","Ce"))
str(aves.c)
summary(aves.c)
