if(!require(plumber))
  install.packages(plumber)

library(plumber)
library(dplyr)


#Api que captura lista de livros

#pega uma lista de livros usando a quantidade como parametro, a sequenciaserá sempre a mesma armazenada no banco
#* @get /livros
function(quantidade){

  setwd("E:/Users/Matheus/Documents/R/API")
  
  livros <- read.csv("livros.csv", header = TRUE, sep = ";")
  
  for (i in 1:quantidade) {
    lista <- rbind(lista, livros[i,])
  }
 
  return(lista)
}
