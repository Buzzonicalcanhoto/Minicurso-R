#-------------------------------------------------------
#                    Aula 3 - Parte 2
#                  Análise Exploratória
#-------------------------------------------------------

# DATAFRAME COM DADOS SIMULADOS

v1 = rnorm(1500)
v2 = rnorm(1500)

x = v1*2
y = v1+v2

#z = rep(c('a','b'), 750)
z = ifelse(y > 1,'a','b')

df <- data.frame(x=x, y=y, z=z)

head(df)
#-------------------------------------------------------

# R BASE

## Representações univariadas

### histograma

hist(df$y)

### densidade

plot(density(df$y))

### boxplot

boxplot(df$y)

### barras

freq <- c(a = sum(df$z=='a'),
          b = sum(df$z=='b'))

barplot(freq)

### setores

pie(freq)

## Representações bivariadas

### dispersão

plot(y~x, data = df)

abline(lm(y~x))

### boxplot

plot(y~z, data = df)

#-------------------------------------------------------

# GGPLOT2

# install.packages('ggplot2')
library(ggplot2)

## Representações univariadas

### histograma

ggplot(data=df, mapping = aes(x=y)) + 
  geom_histogram()

### densidade

ggplot(data=df, mapping = aes(x=y))+
  geom_density()

### boxplot

ggplot(data=df, mapping = aes(y=y)) + 
  geom_boxplot()

### barras
cont <- data.frame(nivel = c('a','b'),
                   freq = freq)

ggplot(data=cont, aes(x=nivel, y=freq)) + 
  geom_bar(stat="identity")

### setores

ggplot(cont, aes(x="", y=freq, fill=nivel))+
  geom_bar(width = 1, stat = "identity")+ 
  coord_polar("y", start=0)

## Representações bivariadas

### dispersão

ggplot(data=df, mapping = aes(x=x,y=y))+
  geom_point() + geom_smooth()

### boxplot

ggplot(data=df, mapping = aes(x=z,y=y)) + 
  geom_boxplot()
#-------------------------------------------------------

# LATTICE

library(lattice)

## Representações univariadas

#histograma

histogram(df$y)

#densidade 

densityplot(df$y)


#boxplot

bwplot(df$y)

#barras

barchart(df$z)

## Representações bivariadas


#dispersão

xyplot(y ~ x, data = df)

xyplot(y ~ x, data = df,
       panel = function(x, y){
       panel.xyplot(x, y)
       panel.abline(lm(y ~ x))
           })


#boxplot

bwplot(y ~ z, data = df)


#-------------------------------------------------------

# EXTRA

#séries temporais

y <- rpois(200, 10)

serie <- ts(y, frequency=5, start=c(1955,1))

serie

plot.ts(serie)

#dados longitudinais

dados<-data.frame(individuo=c(rep(1,6),rep(2,6),
                              rep(3,6),rep(4,6),
                              rep(5,6),rep(6,6),
                              rep(7,6),rep(8,6),
                              rep(9,6),rep(10,6)),
                  momento=rep(1:6, 10),
                  resposta=rgamma(60,1,1))

head(dados)

ggplot(dados, aes(x=factor(momento), 
                  y=resposta,
                  col = factor(individuo)))+
  geom_line(aes(group=individuo),size=1) +
  geom_point()

# mapas

require(maptools)     ## fun??es para importa??o/exposta??o e manipula??o de mapas e dados geogr?ficos    

par.ori <- par(no.readonly=TRUE)

pr <- readShapePoly("41MU500G.shp", IDvar="GEOCODIGO")

plot(pr)

## Gráfico de radar

library(radarchart)

atributos <- c("Comunicativo", "Proativo", 
               "Inteligente", "Extrovertido", 
               "Presente", "Educado")

notas <- list( "Candidato 1" = c(9, 7, 8, 5, 3, 7),
               "Candidato 2" = c(7, 6, 6, 2, 6, 9),
               "Candidato 3" = c(6, 5, 8, 4, 7, 6),
               "Candidato 4" = c(2, 5, 4, 4, 1, 3))

chartJSRadar(scores=notas, labs=atributos)