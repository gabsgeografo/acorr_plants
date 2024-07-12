#' ---
#' title: "Métodos de ordenação: Análise de Correspondência"
#' subtitle: "Espécie de plantas na Reserva Natural de Steneryd"
#' author: "Werlleson Nascimento e Carlos Tadeu dos Santos Dias"
#' modif: "Gabriel Passos"
#' date: "12/07/2024"
#' output: html_document
#' ---


#' # Carregar pacotes
library(ca)
library(factoextra)
library(FactoMineR)
library(ggrepel)



#' # Carregar dados
dados <- read.csv("Plants Steneryd Reserve.csv",header=TRUE,row.names=1)
colnames(dados) <- paste("S",1:ncol(dados),sep="")


#' # Analise de Corresponencia (ACORR)
res.ca <- ca(dados)
res.ca


#' # Extracao dos Autovalores
eig.val <- get_eigenvalue(res.ca)
eig.val


#' # Visualização gráfica biplot simétrico usando o FactoMineR
res.ca <- CA(dados, graph = T, axes = c(1,2))

fviz_ca_biplot(res.ca, axes = c(1, 2), repel = TRUE, ggtheme = theme_test()) + 
  theme(text = element_text(size = 12)) # De outra forma
