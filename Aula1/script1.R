##Guia para montagem aula 1 do minicurso R

## 1- Exlicando a função do setwd

setwd("~/Minicurso")##Abre o diretório minicurso do seu pc.
##Dados salvos nesse diretŕio poderão ser importados de forma 
##simpes e rápida.
##Primeiro comando ao se entrar no R.




## 2- Mostrar rapidamente operações mateméticas no R.
1+1
(1+1) * 5 ## respeita a ordem comum de operações matemáticas
sqrt(4)
4^2
factorial(8)
exp(6)

## 3- Criando Vetores.

##Exemplos
cursos <- c("matemática", "história", "geografia") 
média <- c(60.6,80.8,85.7)
logica <- c(TRUE, FALSE, TRUE)
alunos <- c(60L, 30L, 40L)
classes <- c("henrique, " 40)
classes2 <- c(TRUE, 2)

##Fornçando objeto a mudar de classe
as.logical(cursos)
as.character(média)
as.integer(média)
as.factor(cursos)


## 4- Salvando um script(save.image)
##basta clicar no disquinho acima
runif(10,5,6)
runif(n= 10, max = 6, min = 5 )
rep(1,20)
seq(1,20, length.out = 12)
seq(1,20, by= 2)



## 6- Explicar como pesquisar a respeito de certa função.
##?função que deseja
?runif

## 7- Introdução a função olá mundo.
ola.mundo <- function(){
  writeLines("Olá mundo")
}
ola.mundo()



ola.mundo <- function(texto){
  writeLines(texto)
}
ola.mundo("Bom dia")



## 8- Gerenciando área de trabalho.
ls()
rm()
rm(x,y)
rm(list = ls())


## 10- Apresentando como trabalhar com valores perdidos (NA)
is.na(cursos)
any(is.na(cursos))
66/0 ## impossivel
0/0 ##indeterminaçao
rm(milsa)


## 11- Criando uma matriz no R.
## Muita utilidade quando tratamos da computação
matriz <- matrix(1:16,nrow = 4, ncol = 4)## preenchimento por 
## coluna
matriz

matriz <- matrix(1:16, nrow = 4, ncol = 4, byrow = TRUE)
matriz

objeto <- c(0,5, 60, 34, 12 , 16)
matriz <- matrix(objeto, nrow = 2, ncol = 3)
matriz

## adcionando uma linha na matriz
novo <- c(0,1,2)
rbind(matriz, c(0,1,2))
class(matriz)
dim(matriz)

str(matriz)

##Adcionando uma nova coluna
cbind(matriz, c(1,2))
matriz <- cbind(matriz, c(1,2))
matriz

## Podem ser criadas a partir de vetores também
##Usar o argumento dim

vetor <- c(1,2,3,4)
dim(vetor) <- c(2,2)
vetor
class(vetor)

vetor * 3  # operações normais de matrizes.
vetor * vetor


## 12- Criando uma lista no R
## Inserir diferentes tipos de classe em um mesmo objeto

lista <- list(novo =novo, cursos, c(TRUE, FALSE), matriz)
lista

class(lista)

length(lista)

str(lista)

lista$Nilton <- c("nilton") ## adcionando um lemento a lista
lista




## 13- Criando um data frame no R.

data <- data.frame(novo = novo,
                   carros = c("celta", "uno", "gol"))

data
row.names(data)<- c("x", "y", "z")
data

colnames(data)<- c(1,2)

##fazer mais uns exemplos.



## 15- Propondo alguns exercicios, e passar outros para casa.
Criar os ex