setwd("F:/Yurong Jiang/School/Master/[ 9 ]USC MSBA/18fall/DSO545 R & Python/homework/1")
fifa=read.csv("fifa_players.csv")

##1
mean(fifa$Age) ##the mean age of the players is 25.14454
min(fifa$Age)  ##the min age of the players is 16
max(fifa$Age)  ##the max age of the players is 47

##2
fifa[fifa$Age==16,1]
##the names of all 16-year old players:  K. Pierie  A. Gomes    E. Vignato  
##G. McEachran  L. Geertruida Javi Vazquez    J. Romero    E. Haland    
##M. Sprang   R. Strechie   L. Pintor  V. Barbero  J. Hove

##3
nrow(fifa[fifa$Nationality=="France" & fifa$Club=="Arsenal",])
##Answer:6

##4
nrow(fifa[fifa$Club=="Manchester United" & fifa$Age>=16 & fifa$Age<=19,])
##Answer:5

##5
manchester_united= fifa[fifa$Club=="Manchester United",c("Name","Age","Nationality")]
manchester_city= fifa[fifa$Club=="Manchester City",c("Name","Age","Nationality")]

##6(1)
nrow(manchester_united[manchester_united$Nationality=="England" ,])/nrow(manchester_united)
##44.11765% of English players in Manchester United

##6(2)
nrow(manchester_city[manchester_city$Nationality=="England" ,])/nrow(manchester_city)
##33.3333% of English players in Manchester City
##Manchester United club has higher percentage of players from England

##7
fifa$Value=as.numeric(as.character(fifa$Value))
mean(fifa[fifa$Value>=100 & fifa$Value<=150,2], na.rm=T)
## average age is 27.5

##8
fifa$Value.Range=ifelse(fifa$Value<102,"Below Average","Above Average")
# In the assignment submitted, I forgot to add "fifa$"before"Value.Range"


##9
table(fifa$Value.Range)
##the number of players in Below Average:7111
##the number of players in Above Average:2

##10
fifa$Age.Range=ifelse(fifa$Age<20,"Below 20 years",
                      ifelse(fifa$Age<25,"[20-25) years",
                             ifelse(fifa$Age<30,"[25-30) years","Above 30 years")))

##11(1)
Below.20.years = nrow(fifa[fifa$Age.Range=="Below 20 years" ,])/nrow(fifa)
##the percentage of players in "Below 20 years" group:11.19%

between.20.25 = nrow(fifa[fifa$Age.Range=="[20-25) years" ,])/nrow(fifa)
##the percentage of players in "[20-25) years" group:36.61%

between.25.30 = nrow(fifa[fifa$Age.Range=="[25-30) years" ,])/nrow(fifa)
##the percentage of players in "[25-30) years" group:33.64%

Above.30.years = nrow(fifa[fifa$Age.Range=="Above 30 years" ,])/nrow(fifa)
##the percentage of players in "Above 30 years" group:18.56%

##11(2)
highest.percentage = max(c(Below.20.years, between.20.25, between.25.30, Above.30.years))
ifelse(Below.20.years == highest.percentage, "Below.20.years",
       ifelse(between.20.25 == highest.percentage, "between.20.25",
              ifelse(between.25.30 == highest.percentage, "between.25.30","Above.30.years")))
##"between.20.25" group has the highest percentage
