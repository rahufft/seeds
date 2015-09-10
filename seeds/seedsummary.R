---
  title: "Seed Collection Summary"
author: "RA Hufft"
date: "September 10, 2015"
output: word_document
---
  
  This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:
  
  ```{r}
summary(cars)
```

You can also embed plots, for example:
  
  ```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
```{r}
#Bring in P://Seeds/seeds20150910
R_input_data/QR_r_input.csv
bloom<-read.csv(file.choose("P:\\Seeds\\"),        
                header = TRUE, as.is=TRUE)        
head(bloom)
names(bloom)
str(bloom)  #tells me column name, data type and examples

#Convert dates from character to date format and create variable with just year
bloom$Year<-as.numeric(substr(as.Date(bloom$Work.Date,"%m/%d/%Y"),1,4))
rowSums(table(bloom$Year, bloom$Work.Date))#tabulate number of observations in each year
y<-c(11, 9,0, 8, 6, 12, 1,0,0, 1,0,0, 3,0,0,0,0,0,
     4, 2, 2, 10, 35, 41, 62, 15, 17, 25, 1)#create column of #obs filling in missing years with 0
x<-c(1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995,1996, 1997, 1998,1999, 2000, 
     2001, 2002, 2003, 2004,2005, 2006,
     2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015)#create column with years, adding in missing years

#Number of Accessions per year figure
#This section creates a bar plot of the number of collections each Year
#colors() returns all available color names
plot(x,y)#check that data above look correct
barplot(y, col="grey", #names.arg=x, use this to label x axis if don't want to shift angle
        space=0, #creates no space between bars
        srt=45,adj=.5,
        main="Number of Seed Collections", xlab="Year")#create bar plot
text(1:29, par("usr")[1], labels=x, srt=90,adj=0, pos=1, cex=0.5, xpd=TRUE)#add labels and angle
#still need to figure out how to shift x labels above to the left so they aren't on the right side of each bar




plot(bloom$Year,bloom$Avg_Hi, main="Average High Temperature by Year",xlab="Year", ylab="Degrees Celsius")
abline(lm(bloom$Avg_Hi~bloom$Year))
summary(lm(bloom$Avg_Hi~bloom$Year))
#plot(lm(bloom$Avg_Hi~bloom$Year)) #check residuals for heteroscedasticity and nonlinearity

#This section runs linear regression on Avg Low temp by Year
#hist(bloom$Avg_Lo)
plot(bloom$Year,bloom$Avg_Lo, main="Average Low Temperature by Year",xlab="Year", ylab="Degrees Celsius")
abline(lm(bloom$Avg_Lo~bloom$Year))
summary(lm(bloom$Avg_Lo~bloom$Year))
#plot(lm(bloom$Avg_Lo~bloom$Year)) #check residuals for heteroscedasticity and nonlinearity

#This section runs linear regression on Precipitation by Year
#hist(bloom$Precip_mm)
plot(bloom$Year,bloom$Precip_mm, main="Precipitation by Year",xlab="Year", ylab="Precipitation (mm)")
abline(lm(bloom$Precip_mm~bloom$Year))
summary(lm(bloom$Precip_mm~bloom$Year))
#plot(lm(bloom$Precip_mm ~bloom$Year)) #check residuals for heteroscedasticity and nonlinearity
```


