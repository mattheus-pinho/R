if(!require(dplyr))
  install.packages("dplyr")

if(!require(car))
  install.packages("car")

library(car)
require(dplyr)

setwd("E:/Users/Matheus/Documents/R/R-DB")

dados <- read.csv('banco.csv', sep = ';', dec = ',')

dados$Genero <- factor(dados$Genero, labels = c("M", "F"), levels = c(0, 1))
dados$Grau_de_Instrucao <- factor(dados$Grau_de_Instrucao, labels = c("Fundamental", "Medio", "Superior"), levels = 0:2, order = T)


View(dados)
glimpse(dados)

