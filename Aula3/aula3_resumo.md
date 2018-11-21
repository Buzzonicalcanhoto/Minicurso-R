---
title: |-
  | **Minicurso R**
  | _____________________________________
  
subtitle: |- 
   | **PET - Estatística**
   | _____________________________________
  
author: |-
  | Lineu Alberto Cavazani de Freitas
  | Nilton da Silva Reis Filho
  | Willian Henrique de Paula Ramos
  | João Matheus S. K. T. Hneda
  | _____________________________________ 
  
output:
  html_document:                    # Classe de documento.
    toc: true                       # Exibir sumário.
    toc_depth: 2                    # Profundidade do sumário.
    toc_float:                      # Sumário flutuante na borda.
      collapsed: TRUE
      smooth_scroll: TRUE
    number_sections: true           # Se??es numeradas.
    theme: united
    #default, cerulean, journal, flatly, readable, spacelab,united, cosmo, lumen, paper, sandstone, simplex, yeti
    
    highlight: textmate                # Cores para o destaque de c?digo.
  # "default", "tango", "pygments", "kate",  "monochrome", "espresso", "zenburn", "haddock", "textmate"
    #css: styles.css                 # Caminho para arquivo CSS.
    fig_width: 7                    # Lagura das figuras.
    fig_height: 6                   # Altura das figuras.
    fig_caption: true               # Exibica??o de legenda.
    code_folding:               # Esconder/exibir bloco de c?digo.
    keep_md: true                   # Manter o arquivo md.
    #template: quarterly_report.html # Caminho para o template.
---






# Entrada e Saída de Dados

## Entrada de dados pelo teclado

Vamos começar com a funcão \(\bf{scan}\). Ela serve para adicionar elementos em um vetor diretamente do console.

Entrando com números:

```r
obj1 <- scan()
```
Ao realizar o comando acima o console irá mudar e o usuário pode adicionar os valores no \(\it{obj1}\) diretamente do console. Para encerrar a entrada de números basta apertar o botão enter duas vezes.

Entrando com texto:

```r
obj2 <- scan(what = "character")
```
Para entrarmos com texto basta utilizarmos o argumento \(\it{what = "character"}\). Funcionará de forma análoga ao anterior. Um cuidado que o usuário deve tomar é que a função interpreta espaços como um novo elemento do objeto, assim nomes compostos não poderiam ser escritos com essa função.

Para resolver o problema acima podemos utilizar a função \(\bf{readLines}\). 


```r
obj3 <- readLines(n = 1)
obj4 <- readLines(n = 2)
```

A função readLines vai funcionar também como a scan no sentido da entrada de dados pelo console. O argumento \(\it{n}\) é referente a quantidade de elementos que o objeto vai receber.

## Entrada e saída de dados usando arquivos

Existem diversas funções que permitem o carregamento de arquivos no R.
Elas possuem diversas formas e são úteis em situações diferentes do dia a dia. Aqui nós vamos abordar as funções que já vem com o R e tambem
uma função especifica para arquivos do excel. Mostraremos também como extraír objetos do R em formatos de arquivo. 

A função \(\bf{read.table}\) é uma das funções mais usadas no R, permite a entrada de diferentes formatos:


```r
#generico <- read.table("nome_arquivo.extensao", header = TRUE,
#                       sep = ";", dec = ",")
```

Na função genérica acima podemos notar que no primeiro argumento se especifica o nome do arquivo. Em \(\it{header}\) é possivel escolher se o usuário quer ou não que a primeira linha do arquivo seja utilizada como nome das colunas. \(\it{sep}\) diz como estão separadas as colunas do seu arquivo e \(\it{dec}\) é o  separador de números decimais.

Alguns exemplos dessa função:


```r
# Importando arquivos com extensão csv

obj5 <- read.table("crabs.csv", header = TRUE,
                   sep = ";", dec = ",")
# Entrada
head(obj5, n = 4L)
```

```
##   especie sexo  FL  RW   CL   CW  BD
## 1    azul    M 8.1 6.7 16.1 19.0 7.0
## 2    azul    M 8.8 7.7 18.1 20.8 7.4
## 3    azul    M 9.2 7.8 19.0 22.4 7.7
## 4    azul    M 9.6 7.9 20.1 23.1 8.2
```

```r
# Importando arquivos com extensão txt

obj6 <- read.table("aula3.txt", header = TRUE,
                   sep = "\t", fill = TRUE)

# Entrada
head(obj6, n = 4L)
```

```
##      Nome Idade Altura      Cursos
## 1    João    22   1.81 Estatística
## 2   Lineu    22   1.92 Estatística
## 3  Nilton    20   1.82 Estatística
## 4 Willian    19   1.69 Estatística
```

```r
# Importando arquivos por uma url

obj7 <- read.table("http://www.leg.ufpr.br/~fernandomayer/data/crabs.csv", header = TRUE,
                   sep = ";", dec = ",")

# Entrada
head(obj7, n = 4L)
```

```
##   especie sexo  FL  RW   CL   CW  BD
## 1    azul    M 8.1 6.7 16.1 19.0 7.0
## 2    azul    M 8.8 7.7 18.1 20.8 7.4
## 3    azul    M 9.2 7.8 19.0 22.4 7.7
## 4    azul    M 9.6 7.9 20.1 23.1 8.2
```


Já a função \(\bf{write.table}\) funciona da seguinte forma:


```r
#generico <- write.table(objeto, file = "nome_arquivo.extensao", 
#                         sep = ";", dec = ",", row.names = FALSE)
```


Na função write.table o primeiro argumento é o objeto no qual se quer 
exportar, \(\it{file}\) se especifica o nome do arquivo de saida e sua extensão. \(\it{row.names}\) é logico e define se o nome das linhas vão ou não serem exportadas com o arquivo. Os outros argumentos são similares aos da função read.table.

Vamos mostrar agora uma função útil para extrair arquivos com extensão xlsx, padrão de arquivos do excel.

Precisaremos do pacote \(\it{gdata}\).


```r
# Instalando pacote
#install.packages("gdata", dependencies = TRUE)

# Carregando pacote
library(gdata)
```

Utilizaremos a função \(\it{read.xls}\) para ler os arquivos.



```r
#generico <- read.xls("nome_arquivo.xlsx", sheet = planilha_desejada, header = TRUE)
```

Na função read.xls segue o mesmo padrão que as outras mostradas até aqui. A única mudança é que se pode escolher qual planilha do arquivo o usuário quer trabalhar com o argumento \(\it{sheet}\). 

Exemplo:

```r
# Importando 
obj8 <- read.xls("aula3.xlsx", sheet = 1, header = TRUE)

# Entrada
head(obj8, n = 4L)
```

```
##      Nome Idade Altura       Curso
## 1    Joao    22   1.81 Estatistica
## 2   Lineu    22   1.92 Estatistica
## 3  Nilton    20   1.82 Estatistica
## 4 Willian    19   1.69 Estatistica
```


# Estrutura dos Dados

É muito importante sabermos a estrutura dos dados que estamos trabalhando, para isso podemos utilizar algumas funções que já estão implementadas no R.

Com a função \(\bf{str}\) podemos observar a classe do nosso objeto, a quantidade de observações, os nomes das colunas e suas respectivas classes.  


```r
str(obj6)
```

```
## 'data.frame':	4 obs. of  4 variables:
##  $ Nome  : Factor w/ 4 levels "João","Lineu",..: 1 2 3 4
##  $ Idade : int  22 22 20 19
##  $ Altura: num  1.81 1.92 1.82 1.69
##  $ Cursos: Factor w/ 1 level "Estatística": 1 1 1 1
```

As funções \(\bf{head}\) e \(\bf{tail}\) retornam, respectivamente, os primeiros e os ultimos valores do objeto.

head:

```r
head(obj6, n = 5L)
```

```
##      Nome Idade Altura      Cursos
## 1    João    22   1.81 Estatística
## 2   Lineu    22   1.92 Estatística
## 3  Nilton    20   1.82 Estatística
## 4 Willian    19   1.69 Estatística
```

O argumento \(\it{n}\) serve para especificar a quantidade de linhas que a função vai retornar.

tail:

```r
tail(obj6, n = 5L)
```

```
##      Nome Idade Altura      Cursos
## 1    João    22   1.81 Estatística
## 2   Lineu    22   1.92 Estatística
## 3  Nilton    20   1.82 Estatística
## 4 Willian    19   1.69 Estatística
```

# Estatísticas 

Podemos utilizar também algumas funções para calcular estatísticas referentes aos nossos objetos. 

São elas:


<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Função </th>
   <th style="text-align:left;"> Calcula </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> mean() </td>
   <td style="text-align:left;"> Média </td>
  </tr>
  <tr>
   <td style="text-align:left;"> median() </td>
   <td style="text-align:left;"> Mediana </td>
  </tr>
  <tr>
   <td style="text-align:left;"> min() </td>
   <td style="text-align:left;"> Minimo </td>
  </tr>
  <tr>
   <td style="text-align:left;"> max() </td>
   <td style="text-align:left;"> Maxímo </td>
  </tr>
  <tr>
   <td style="text-align:left;"> var() </td>
   <td style="text-align:left;"> Variância </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sd() </td>
   <td style="text-align:left;"> Desvio Padrão </td>
  </tr>
</tbody>
</table>

A função \(\bf{summary}\) nos retorna algumas estatísticas rapidamente.


```r
summary(obj6$Idade)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   19.00   19.75   21.00   20.75   22.00   22.00
```

Podemos obter frequências absolutas de nosso objeto com a função \(\bf{table}\).

Para o exemplo a seguir utilizaremos a base de dados \(\it{iris}\) que por padrão já vem na instalação do R.


```r
# Estrutura 
str(iris)
```

```
## 'data.frame':	150 obs. of  5 variables:
##  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
##  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
##  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
##  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
##  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
```

```r
# Primeiras linhas
head(iris, n = 4L)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
```

Notem que a coluna \(\it{Species}\) é um fator. Vamos montar uma tabela de frequência para cada espécie (fator):


```r
freq <- table(iris$Species)
freq
```

```
## 
##     setosa versicolor  virginica 
##         50         50         50
```

Podemos obter a proporção com a função \(\bf{prop.table}\).


```r
proporcao <- prop.table(freq)
proporcao
```

```
## 
##     setosa versicolor  virginica 
##  0.3333333  0.3333333  0.3333333
```


# Análise Explanatória de Dados
