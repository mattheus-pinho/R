if(!require(plumber))
  install.packages(plumber)

library(plumber)
library(dplyr)

setwd("E:/Users/Matheus/Documents/R/API")

orgLista <- read.csv("orgs.csv", header = TRUE, sep = ",")

#Todos Países da lista - ok
#* @get /paisesLista
paisesListas <- function()
{
  paisesLista <- distinct(orgLista, select = Country, .keep_all = TRUE) %>% arrange(Country) %>% select(Country)
  
  return(paisesLista)

}

#Todas Organizações - ok
#* @get /todasOrganizacoes
todasOrganizacoes <- function()
{
  return(orgLista)
}

#Organizações por ano de fundação
#* @get /anoDeFundacao
anoDeFundacao <- function(ano)
{
  listaPorAno <- filter(orgLista, Founded==ano)
  if(nrow(listaPorAno) == 0){
    stop("ANO INVALIDO OU REGISTRO INEXISTENTE", call. = FALSE, status = 400)
  }else{
    return(listaPorAno)
  }
  
}

#Todos os ramos de atuação da lista
#* @get /todosRamos

todosRamos <- function()
{
  ramosLista <- distinct(orgLista, select = Industry, .keep_all = TRUE) %>% arrange(Industry) %>% select(Industry)
  
  return(ramosLista)
}

#Organizações por ramo de atuação
#* @get /orgPorRamo
orgPorRamo <- function(ramo)
{
  listaPorRamo <- filter(orgLista, Industry==ramo)
  if(nrow(listaPorRamo) == 0){
    stop("RAMO INVALIDO OU REGISTRO INEXISTENTE", call. = FALSE, status = 400)
  }else{
    return(listaPorRamo)
  }
}