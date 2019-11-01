##start
library(ggplot2)
HeavenlyChocolates = read.csv('HeavenlyChocolates.csv')

#1
ggplot(HeavenlyChocolates, aes(x=Browser)) +
  geom_bar()+
  ggtitle('Browsers Used to Visit Heavenly Chocolate Website')

#2
ggplot(HeavenlyChocolates, aes(x=Time, y=Amount_Spent, color=Browser))+
  geom_point()+
  xlab('Time Spent')+
  ylab('Amount Spent')+
  ggtitle('Relationship between Time Spent Browsing and Amount Spent')

#3
ggplot(HeavenlyChocolates, aes(x=Day, fill=Browser))+
  geom_bar()+
  xlab('')+
  ggtitle('Number of Website Visitors per Day per Browser')

#4
AmountCat=ifelse(HeavenlyChocolates$Amount_Spent<=62, 'Low', 'High')

#5
ggplot(HeavenlyChocolates, aes(x=Browser, fill=AmountCat))+
  geom_bar()+
  facet_wrap(~Day) +
  ggtitle("Distribution of ¡®AmountCat¡® across Different Days of the Week")


#6
HeavenlyChocolates$Weekday=ifelse(HeavenlyChocolates$Day=='Sat'|HeavenlyChocolates$Day=='Sun', 'Weekend', 'Weekday')

ggplot(HeavenlyChocolates, aes(x=weekday, y = Amount_Spent)) +
  geom_bar(stat = 'summary', fun.y = 'mean') +
  xlab('') +
  ylab('Average Amount Spent') +
  ggtitle('Average Amount Spent by Visitors: Weekday vs. Weekend')


#7
syria=read.csv('syria_refugees.csv')
sorted_data=syria[order(-syria$refugees),]
top20=sorted_data[1:20,]
ggplot(top20, aes(x=refugees, y=reorder(Country, refugees))) + 
  geom_point()+
  xlab('Number of Syrian Refugees') +
  ylab('')+
  ggtitle('Syrian Refugee Crisis')

