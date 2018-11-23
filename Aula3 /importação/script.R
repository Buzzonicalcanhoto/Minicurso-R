# Aula 3 - Minicurso R ----------------------------------------------------

# Entrada de dados pelo teclado

# Funcao scan:

# Numeros

obj1 <- scan()
obj1


# Texto

obj2 <- scan(what = "character")
obj2


# Funcao readLines:

obj3 <- readLines(n=1)
obj3

obj4 <- readLines(n=2)
obj4


# Entrada de dados por arquivo

# read.table e write.table

generico <- read.table("nome_arquivo.extensao", header = TRUE,
                       sep = ";", dec = ",")



generico2 <- write.table(objeto, file = "nome_arquivo.extensao", 
                         sep = ";", dec = ",", row.names = FALSE)


# ***

## lembrar do setwd

setwd("~/Downloads") # Diretorio onde esta o meu arquivo

# ***

obj5 <- read.table("crabs.csv", header = TRUE,
                   sep = ";", dec = ",")
obj5


## Outra forma de carregar arquivos e pela sua url

obj6 <- read.table("http://www.leg.ufpr.br/~fernandomayer/data/crabs.csv", header = TRUE,
                   sep = ";", dec = ",")

## Leitura de .txt

## Em geral o separador de colunas se da por '\t' e o argumento fill serve
## para deixar o R interpretar o arquivo e definir as colunas

obj7 <- read.table("aula3.txt", header = TRUE,
                   sep = "\t", fill = TRUE)
obj7

## Uma outra forma de se corregar o arquivo e especificando o nome das
## colunas

obj7 <- read.table("aula3_ex.txt", header = TRUE, 
                   sep = "\t", col.names = c("Nome", "Idade", "Altura", "cursos"))

obj7

## Criando uma nova coluna no obj6

obj6$num <- seq(from = 1,  to = length(obj6$especie), by = 1)
obj6

## Exportanto

write.table(obj6, file = "aula3.csv", sep = ",",
            dec = ".", row.names = FALSE)



## Usando txt

obj7$cursos <- c("Estatística", "Matemática", "Economia", "Biologia")
obj7

write.table(obj7, file = "aula3_ex.txt", sep = "\t", dec = ".", 
            row.names = FALSE, quote = TRUE)

# read.csv2

## Em geral tem a mesma funcao da read.table, porem os argumentos padroes 
## da funcao sao diferentes. No caso da read.csv2 a funcao ja especifica
## os argumentos no formato de arquivos escritos no Brasil.

obj6 <- read.csv2("crabs.csv")
obj6


## Para carregar arquivos com extensao .xlsx, comum em arquivos do excel,
## vamos utilizar o pacote gdata.

install.packages("gdata", dependencies = TRUE) # Instalar pacote

library(gdata) # Carregar o pacote

# read.xls

obj8 <- read.xls("aula3.xlsx", sheet = 1, header = TRUE)
obj8


# Resumos e estruturas dos dados

# str

## A funcao str retorna um resumo da estrutura do objeto 

iris <- iris
str(iris)

# head e tail

## Com head e possivel visualizar as primeiras linhas da sua tabela, enquanto
## com a funcao tail o R retorna as ultimas linhas

head(iris)
tail(iris)



# estatísticas

mean(obj7$Idade)
median(obj7$Idade)
quantile(obj7$Idade)
max(obj7$Idade)
min(obj7$Idade)
var(obj7$Idade)
sd(obj7$Idade)

summary(obj7$Idade)

# Frequencias

## Frequencia absoluta

freq_un <- table(iris$Species)
freq_un
addmargins(freq_un)

freq_bi <- table(iris$Sepal.Length, iris$Species)
freq_bi
addmargins(freq_bi)

## Proporcao

prop_un <- prop.table(freq_un)
prop_un
addmargins(prop_un)

prop_bi <- prop.table(freq_bi)
prop_bi
addmargins(prop_bi)

# Analise Explanatoria de Dados



# Simulando dados e montando data frame -----------------------------------

v1  <-  rnorm(1500)
v2 <-  rnorm(1500)

x  <-  v1*2
y <-  v1+v2

z <-  rep(c('a','b'), 750)

df <- data.frame(x=x,y=y,z=z)
head(df)

#-------------------------------------------------------

# Usando o base 

## Representações univariadas

### histograma

hist(df$y)

hist(df$y, col = 2)

hist(df$y, col = 3, 
     xlab = 'Variável y',
     ylab = 'Frequência',
     main = 'Histograma')

### densidade

plot(density(df$y))

plot(density(df$y),
     xlab = 'Variável y',
     ylab = 'Densidade',
     main = 'Densidade')

polygon(density(df$y), col='lightblue')

### boxplot

boxplot(df$y)

boxplot(df$y,
        main = 'Boxplot',
        col = '#F8E0E6')

### barras

freq <- c(a = sum(df$z=='a'),
          b = sum(df$z=='b'))

barplot(freq)

barplot(freq,
        xlab = 'Categorias',
        ylab = 'Frequência',
        main = 'Gráfico de Barras')

### setores

pie(freq)

pie(freq,
    main = 'Gráfico de Setores',
    col = c('#2EFEF7', '#81F79F'))

## Representações bivariadas

### dispersão

plot(y~x, data = df)

plot(y~x, data = df, col = '#848484',
     main = 'Gráfico de Dispersão')

abline(lm(y~x), col = 2, lwd = 2)

### boxplot

plot(y~z, data = df)

plot(y~z, data = df,
     col = c(2,3),
     xlab = 'Níveis',
     main = 'Boxplot')

#-------------------------------------------------------

# GGPLOT2

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

### setores


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

#histograma

histogram(df$y)

histogram(df$y, 
          col = "blue",
          xlab = "Variável y",
          ylab = "Frequência",
          main = "Histograma"
          )


#densidade 

densityplot(df$y)

densityplot(df$y,
            xlab = "Variável y",
            ylab = "Densidade",
            main = "Densidade",
            col = "green",
            fill = "darkgreen"
            )




#boxplot


#barras
#setores
#dispersão
#boxplot

#-------------------------------------------------------

# EXTRA

#séries temporais
#dados longitudinais
#dados espaciais




# Grafico de barras

## Quantidades de deteminado tamanhos de plantas 

barchart()

## Modificando o grafico

barchart(df$z, horizontal = FALSE, col = c("darkgreen", "lightgreen"),
         main = "Barras", ylab = "Quantidade",
         xlab = "Tamanho", scales = list(cex=1.2)
)

# Boxplot

bwplot(Species ~ Sepal.Length, data = iris)

bwplot(Sepal.Length ~ Species, data = iris, col = c("blue", "red", "green"))


