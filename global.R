library(shiny)
library(shinydashboard)
library(readxl)
library(tidyverse)
library(ggmap)
library("rgdal")
library(leaflet)
library(ggplot2)
library(sp)
library(DT)
#setwd("/Users/simba/Desktop/data society stuff/telangana/drive")

shapeData <- readOGR("TS_MANDAL_BOUNDARIES_612.shp", stringsAsFactors = F)

#Adilabad

adilabad <- read_excel("Adilabad/MPTC Elections Adilabad 2019.xlsx")
colnames(adilabad) <- adilabad[1,]
adilabad <- adilabad[-1,]
adilabad$district <- "adilabad"

#Bhadradri

bhadradri <- read_excel("Bhadradri Kothagudem/Bhadradri MPTC Elections 2019.xlsx")
colnames(bhadradri) <- bhadradri[1,]
bhadradri <- bhadradri[-1,]
bhadradri$district <- "bhadradri kothagudem"

#jagtial

jagtial <- read_excel("Jagtial /ZPTC Eelction results (2019)/Jagtial MPTC Elections 2019.xlsx")
colnames(jagtial) <- jagtial[1,]
jagtial <- jagtial[-1,]
jagtial$district <- "jagtial"

#jangoan
jangaon <- read_excel("Jangaon /Jangaon MPTC Elections 2019.xlsx")
colnames(jangaon) <- jangaon[1,]
jangaon <- jangaon[-1,]
jangaon$district <- "jangaon"

#jayashankar bupalpally

jayashankar <- read_excel("Jangaon /Jangaon MPTC Elections 2019.xlsx")
colnames(jayashankar) <- jayashankar[1,]
jayashankar<- jayashankar[-1,]
jayashankar$district <- "jayashankar bhupalpally"

#jogulamba
jogulamba <- read_excel("Jogulamba /Jogulamba MPTC Elections 2019.xlsx")
colnames(jogulamba) <- jogulamba[1,]
jogulamba<- jogulamba[-1,]
jogulamba$district <- "jogulamba"

#kamareddy

#kamareddy <- read_excel("Kamareddy /Kamareddy MPTC Elections 2019.xlsx")
#View(Kamareddy_MPTC_Elections_2019)
#colnames(kamareddy) <- kamareddy[1,]
#kamareddy<- kamareddy[-1,]
#kamareddy$district <- "kamareddy"

#karminagar

karminagar<- read_excel("Karimnagar /Karimnagar MPTC Elections 2019.xlsx")
colnames(karminagar) <- karminagar[1,]
karminagar<- karminagar[-1,]
karminagar$district <- "karminagar"

#khammam
khammam<- read_excel("Khammam /Khammam MPTC Election results 2019.xlsx")
colnames(khammam) <- khammam[1,]
khammam<- khammam[-1,]
khammam$district <- "khammam"

#komaram bheem
komaram_bheem<- read_excel("Komaram Bheem Asifabad /Komaram Bheem MPTC Elections 2019.xlsx")
colnames(komaram_bheem) <- komaram_bheem[1,]
komaram_bheem<- komaram_bheem[-1,]
komaram_bheem$district <- "komaram_bheem"

#mahabubabad
mahabubabad<- read_excel("Mahabubabad /Mahabubabad MPTC Election results 2019.xlsx")
colnames(mahabubabad) <- mahabubabad[1,]
mahabubabad<- mahabubabad[-1,]
mahabubabad$district <- "mahabubabad"

#mahabubanagar
mahabubanagar<-read_excel("Mahabubnagar /Mahabubnagar MPTCElection results 2019.xlsx")
colnames(mahabubanagar) <- mahabubanagar[1,]
mahabubanagar<- mahabubanagar[-1,]
mahabubanagar$district <- "mahabubanagar"

#mancherial
mancherial<-read_excel("Mancherial /Mancherial MPTC Election results 2019.xlsx")
colnames(mancherial) <- mancherial[1,]
mancherial<- mancherial[-1,]
mancherial$district <- "mancherial"

#medak
medak<-read_excel("Medak /Medak MPTC Elections results 2019.xlsx")
colnames(medak) <- medak[1,]
medak<- medak[-1,]
medak$district <- "medak"

#medchal
medchal<-read_excel("Medchal-Malkajgiri/Medchal-Malkajgiri MPTC Election results 2019.xlsx")
colnames(medchal) <- medchal[1,]
medchal<- medchal[-1,]
medchal$district <- "medak"

#mulugu
mulugu<-read_excel("Mulugu /Mulugu MPTC Election results 2019.xlsx")
colnames(mulugu) <- mulugu[1,]
mulugu<- mulugu[-1,]
mulugu$district <- "mulugu"

#nagarkurnool
nagarkurnool<-read_excel("Nagarkurnool /Nagarkurnool MPTC Election results 2019.xlsx")
colnames(nagarkurnool) <- nagarkurnool[1,]
nagarkurnool<- nagarkurnool[-1,]
nagarkurnool$district <- "nagarkurnool"

#nalgonda
nalgonda<- read_excel("Nalgonda /Nalgonda MPTC Elections result 2019.xlsx")
colnames(nalgonda) <- nalgonda[1,]
nalgonda<- nalgonda[-1,]
nalgonda$district <- "nalgonda"

#narayanpet
narayanpet<- read_excel("Narayanpet/Narayanpet MPTC Election results 2019.xlsx")
colnames(narayanpet) <- narayanpet[1,]
narayanpet<- narayanpet[-1,]
narayanpet$district <- "narayanpet"

#nirmal
nirmal<- read_excel("Nirmal /Nirmal MPTC Election results 2019.xlsx")
colnames(nirmal) <- nirmal[1,]
nirmal<- nirmal[-1,]
nirmal$district <- "nirmal"

#nizamabad
nizamabad<- read_excel("Nizamabad /Nizamabad MPTC Election results 2019.xlsx")
colnames(nizamabad) <- nizamabad[1,]
nizamabad<- nizamabad[-1,]
nizamabad$district <- "nizamabad"


#peddapalli
peddapalli<- read_excel("Peddapalli /Peddapalli MPTC Election results 2019.xlsx")
colnames(peddapalli) <- peddapalli[1,]
peddapalli<- peddapalli[-1,]
peddapalli$district <- "peddapalli"

#rajanna_sircilla
rajanna_sircilla<- read_excel("Rajanna Sircilla/Rajanna Sircilla MPTC Election Results 2019.xlsx")
colnames(rajanna_sircilla) <- rajanna_sircilla[1,]
rajanna_sircilla<- rajanna_sircilla[-1,]
rajanna_sircilla$district <- "rajanna_sircilla"

#rangareddy
rangareddy<- read_excel("Ranga reddy/Ranga Reddy MPTC Election Results 2019.xlsx")
colnames(rangareddy) <- rangareddy[1,]
rangareddy<- rangareddy[-1,]
rangareddy$district <- "rangareddy"

#sagareddy
sagareddy<-  read_excel("Sangareddy /Sangareddy MPTC Election Results 2019.xlsx")
colnames(sagareddy) <- sagareddy[1,]
sagareddy<- sagareddy[-1,]
sagareddy$district <- "sagareddy"

#siddipet
siddipet<- read_excel("Siddipet /Siddipet MPTC Election Results 2019.xlsx")
colnames(siddipet) <- siddipet[1,]
siddipet<- siddipet[-1,]
siddipet$district <- "siddipet"

#suryapet
suryapet<- read_excel("Suryapet /Suryapet MPTC Election Results 2019.xlsx")
colnames(suryapet) <- suryapet[1,]
suryapet<- suryapet[-1,]
suryapet$district <- "suryapet"

#vikarabad
vikarabad<- read_excel("Vikarabad/Vikarabad MPTC Election Results 2019.xlsx")
colnames(vikarabad) <- vikarabad[1,]
vikarabad<- vikarabad[-1,]
vikarabad$district <- "vikarabad"

#wanarpathy
wanarpathy<-read_excel("Wanaparthy /Wanaparthy MPTC Election Results 2019.xlsx")
colnames(wanarpathy) <- wanarpathy[1,]
wanarpathy<- wanarpathy[-1,]
wanarpathy$district <- "wanarpathy"

#warangal
warangal<-read_excel("Warangal /Warangal MPTC Election Results 2019.xlsx")
colnames(warangal) <- warangal[1,]
warangal<- warangal[-1,]
warangal$district <- "warangal"

#yadadri

yadadri<- read_excel("Yadadri Bhuvanagiri/Yadadri Bhongiri MPTC Election Results 2019.xlsx")
colnames(yadadri) <- yadadri[1,]
yadadri<- yadadri[-1,]
yadadri$district <- "yadadri"

data <- rbind(adilabad, bhadradri, jagtial, jangaon, jayashankar, jogulamba, karminagar, 
              khammam, komaram_bheem, mahabubabad, mahabubanagar, mancherial, medak, medchal, 
              mulugu, nagarkurnool, nalgonda, narayanpet, nirmal, nizamabad, rajanna_sircilla, 
              rangareddy, sagareddy, siddipet, suryapet, vikarabad, wanarpathy, yadadri)

#ZPTC
data_zptc <- read_csv("ZPTC elections telangana - Sheet1.csv")

#ULB

ulb <- read.csv("ULB data - Sheet1.csv")
ulb %>% group_by(District) %>% select(Municipal)


