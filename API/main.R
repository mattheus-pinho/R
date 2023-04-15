if(!require(plumber))
  install.packages(plumber)

library(plumber)
library(dplyr)

setwd("E:/Users/Matheus/Documents/R/API")

livros <- read.csv("livros.csv", header = TRUE, sep = ";")

#Api que captura lista de livros

#Entrega uma lista de livros usando o genero como parametro
#* @get /livrosGenero
function(genero, quantidade){
  
  variacoes <- distinct(livros, select = Gênero, order(TRUE))
  
  if(grep(genero, variacoes))
  {
    for(i in livros)
    {
      listaGeral <- filter(livros[i, ], Gênero==genero)
    }
  }
  else
  {
    plumber::abort(600, "Gênero invalido")
  }
  for (j in 1:quantidade) 
  {
    lista <- rbind(lista, listaGeral[j, ])
  }
  
  
  return(lista)
}

#Entrega uma lista de livros usando a quantidade como parametro, a sequenciaserá sempre a mesma armazenada no banco
#* @get /livrosQTD
function(quantidade){
  
  lista <- vector("list", quantidade)
  
  for (i in 1:quantidade) 
  {
    lista[[i]] <- livros[i,]
  }
  return(lista)
}



#Entrega uma lista de livros cuja o nome dos autores seja similar