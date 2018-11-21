# Suporte aula 2 ----------------------------------------------------------


# Indexação ---------------------------------------------------------------

# Vetores

ob1 <- seq(0, 5, by = 1)
ch <- rep(c("a","b","c"), each = 3)

# Indexação serve para sabermos quais elementos estão em cada posição de um objeto.
# É utilizado uma chave para expecificarmos quais posições queremos que o R mostre.

ob1[1]
ob1[c(2,3)]
ob1[seq(3,6, by=1)]
ch[c(1,2,3,4,5)]
ob1[c(TRUE, TRUE, FALSE, FALSE, FALSE, TRUE)]

# Utilizando um sinal de menos antes do argumento podemos ocultar as posições

ob1[-c(1,2)]
ob1[-c(1,2,3,4)]

# Utilizando um vetor para indexar outro vetor 

ob2 <- c(2,3,4)
ob1[ob2]

# Matrizes

ob3 <- matrix(seq(1,9, by=1), nrow = 3, ncol = 3, byrow = TRUE)

# Matrizes são objetos bidimensionais, por essa razão a indexação funciona de maneira
# diferente do que os vetores.
# Exemplo: objeto[linha, coluna] - Note que para indexar uma matriz primeiro colocamos 
# a posição da linha e depois da coluna.

ob3[1,3]
ob3[c(1,2), 2]
ob3[c(1,3), c(2,3)]
ob3[1, c(1,2,3)]
ob3[-1, c(2,3)]
ob3[-c(1,3), -2]


# Para retornar todas as linhas ou todas as colunas sem precisar ficar digitando todos os 
# elementos da mesma basta fazer o seguinte comando:

ob3[c(1,2), ]
ob3[, c(1,2)]

# Note que no primeiro caso indexamos as duas primeiras linhas da matriz e não especificamos
# nenhuma coluna e o R retornou todas as colunas. Já no segundo aconteceu o mesmo processo
# porem indexando somente as colunas.

# É possível mostrar a matriz com dimensões utilizando o comando drop = FALSE

ob3[2, 1, drop = FALSE]
ob3[1, ,drop = FALSE]
ob3[c(1,2), 1, drop = FALSE]

row.names(ob3) <- c("a","b","c")
colnames(ob3) <- c("A", "B", "C")

ob3[1, ]
ob3[c(1,2), ]
ob3[c("a", "b"), ]
ob3["a", c("B", "C")]


# Listas

ob4 <- list(Primeiro = c(1,2,3,4,5), 
            Segundo = c(6,7,8,9),
            Terceiro = c(10,20,40,5))

# As listas por serem objetos unidimencionais e que podem conter outros tipos de objeto
# em seu interior são indexadas de uma outra forma.

ob4[c(1,2)]

# Repare que o comando acima retorna os objetos da lista nas posições requeridas. Isso é
# bastante útil, mas agora imagine que você quer acessar um elemento específico dentro 
# de um objeto da lista. Há várias maneiras de se fazer isso, aqui vamos mostrar três. 
# A primeira é a seguinte:
# lista[[c(posição_objeto_lista, posição_elemento_objeto)]].
# Já a segunda:
# lista[[posição_objeto_lista]][posição_elemento_objeto].
# Por fim:
# lista$nome_do_objeto[posição_elemento_objeto]
# Recomendamos não utilizarem a primeira pelo fato de que ela apresenta muitas restrições, 
# como: Só poder expecificar um elemento do objeto indexado e funciona apenas com objetos 
# de uma dimensão. 


# Exemplos da primeira forma:

ob4[[c(1, 2)]]
ob4[[c(3,3)]]
ob4[[c(1, -1)]] # Erro

# Exemplos da segunda forma:

ob4[[2]][c(1,2,3)]
ob4[[1]][-1]
ob4[[3]][3]

ob4$Quarta <- ob3 # Será explicado adiante

ob4[[4]][c(1,2), ]
ob4[[4]][c(1,2), 1, drop = FALSE]
ob4[[4]][-1, c(1,2)]

# Terceira forma

ob4$Primeiro[c(1,2,3)]
ob4$Quarta[1, c(1,2), drop = FALSE]
ob4$Quarta[-1, c(2,3), drop = FALSE]

ob4$Primeiro
ob4$Segundo

# Note que aqui chamamos os objetos pertencentes a lista utilizando o 
# nome_lista$nome_objeto, com isso podemos adicionar novos objetos na lista
# fazendo o seguinte comando nome_lista$nome_novo_objeto <- conteudo.

# Exemplo:

ob4$Quinto <- data.frame(First = c(1,2,3,4),
                  Second = c("a", "b", "c", "d"))

ob4$Sexto <- rep(c(1,2,3,4), each = 4)
ob4$Setimo <- seq(1, 5, length.out = 4)


# Data frames

# Data frames tem uma estrutura parecida com a de matrizes, por isso a forma de indexar
# é similar. Algumas mudanças se dão na forma de chamar as colunas, que no caso pode-se 
# chamar utilizando o $, similar as listas.

ob5 <- data.frame(Nomes = c("João","Lineu", "Nilton", "Willian"),
                  Idade = c(22, 22, 20, 19),
                  Formado = rep(FALSE, times = 4),
                  PET = rep(TRUE, times = 4))

ob5[1,]
ob5[c(1,2,3),] 
ob5[-4, ]
ob5[c(2,3), c(1,2)]
ob5[, 1]
ob5[, 1, drop = FALSE]
ob5[c(1,2), c("Nomes", "Idade")]

# Usando o cifrão

ob5$Idade
ob5$Nomes
ob5$Idade[3]
ob5$Nomes[c(1,2)]

# Repare que o R esta interpretando os nomes como fator, para transformar essa coluna 
# para caracter é simples:

ob5$Nomes <- as.character(ob5$Nomes)
ob5$Nomes

# Verificando a classe das colunas de um data.frame

class(ob5)
class(ob5$Nomes)
class(ob5$Formado)

# Indexando pelos nomes das linhas:
row.names(ob5) <- letters[1:4]
names(ob5) <- c("Names", "Age", "Formact", "PET")

ob5[c("a", "b", "c"), ]
ob5[, c("Names", "Age")]
ob5$Names[c("a", "b")] # Note que não funciona
ob5$Names[c(1, 2)]



# Seleção Condicional -----------------------------------------------------

# Seleção condicional nada mais é do que uma indexação utilizando condições 
# de interesse. Um exemplo seria: example[example > 5], isso retornaria os 
# elementos do objeto example que são maiores que 5. O R interpreta isso da 
# seguinte forma: Primeiro note que há uma expressão booleana dentro das chaves
# essa expressão retorná TRUE para os elementos de example maiores que 5 e 
# FALSE caso contrário. Portanto teriamos uma série de TRUE's e FALSE's 
# indexando o vetor example. Supondo que: 
# example <- c(1, 20, 6, 2) 
# Teriamos:
# example[example > 5], o R interpretaria assim: 
# example[c(FALSE, TRUE, TRUE, FALSE)] e assim retornaria apenas os elementos
# das posições que estão igual a TRUE. Com os exemplos a seguir ficará mais 
# claro como funcionam. 


# Vetores

ob2 <- runif(50, min = 0, max = 200)
hp <- runif(50, min = 0, max = 200)


ob1[ob1 > 2]
ob1[ob1 > 1 & ob1 < 3]
ob1[ob1 == 2]
ch[ch == "b"]
ch[ch == "a"]
ch[ch %in% "a"]


ob2[ob2 > 20 | ob2 < 5]


ob2[ob2 > 50]
ob2[ob2 < hp]


# Repare que as seleções condicionais retorna os resultados que satisfazem determinada 
# condição. Em algumas situações podemos estar interessados na posição dos elementos 
# desejados. Para isso podemos utilizar a função "which".

which(ob1 > 2)
which(ob1 > 1 & ob1 < 3)
which(ob1 > 4 | ob1 < 3)
which(ob2 > hp)

# As funções which.max e which.min retornam a posição, respectivamente, do maior e do
# menor valor de determinado objeto.

which.max(ob2)
ob2[5]

which.min(ob2)
ob2[9]


# Para indexar o objeto com a posição do maior ou menor valor:

ob2[which.max(ob2)]
ob2[which.min(ob2)]


amplitude <- ob2[which.max(ob2)] - ob2[which.min(ob2)]

# Matrizes

# Seleção condicional para matrizes se especifica alguma condição, ele vai olhar em 
# todos os elementos da matriz e vai retornar em formato unidimensional os resultados
# que satisfazem a condição.

ob3[ob3 > 2]
ob3[ob3 > 2 & ob3 <= 8]
ob3[ob3 < 2 | ob3 > 7]



# Lista

ob4$Primeiro[ob4$Primeiro > 2]
ob4$Terceiro[ob4$Primeiro > 1]
ob4$Terceiro[c(2, 3, 4, 5, 6)]

ob4[[2]][ob4$Segundo > 8]
ob4[[1]][ob4$Primeiro > 2 & ob4$Primeiro < 4]


teste <- c(3, 8, 10, 4, 9, 7, 1, 9, 2, 4)
teste[teste != 4]
a <- LETTERS[1:length(teste)]
teste[a %in% c("B","F","D")]
which(a %in% c("B","F","D"))
which(teste > 8 & teste < 10)
teste[c(5,8)]
# Data frame

# Similares as matrizes, porém com algumas expecificidades da estrutura que permitem
# uma versatilidade maior nas formas de utilizar seleções condicionais. 

df <- data.frame(Nome = c("José", "Thiago", "João", "Judas"),
                 Idade = c(30, 19, 24, 28),
                 Traiu = c(F, F, F, T),
                 Pagamento = c(NA, NA, NA, 12))
df
df[df$Idade > 20, ]
df[df$Traiu == TRUE, ]
df[df$Pagamento == 12 & !is.na(df$Pagamento), ]
df[df$Idade > 20, c("Nome", "Pagamento")]
df[df$Idade > 20 & df$Idade < 25, ]

subset(df, Nome == "Thiago")
subset(df, Idade > 20, select = "Nome")
subset(df, Idade > 20, select = c("Nome", "Pagamento"))
