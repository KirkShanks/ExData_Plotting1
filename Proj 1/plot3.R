
setwd("C:\\Users\\Kirk\\Documents\\Coursera\\Course 4 - Exploratory Data Analysis")

if(!file.exists("Proj 1")){dir.create("Proj 1")}

setInternet2(use = TRUE)


## Question 1

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- "Proj 1/Proj1.zip"

dataDownloaded <- date()

temp <- tempfile()
download.file(fileURL, temp)
DF <- read.table(unz(temp, filename = "household_power_consumption.txt")
                        , header = TRUE
                        , na.strings = "?"
                        , sep = ";"
                        , colClasses = "character"
                        , stringsAsFactors = FALSE)
unlink(temp)
rm(temp)

ElecPower <- subset(DF, Date %in% c("1/2/2007","2/2/2007"))
ElecPower["DateTime"] <- NA

ElecPower[,1] <- as.Date(ElecPower[,1], "%d/%m/%Y")
ElecPower[,3] <- as.numeric(ElecPower[,3])
ElecPower[,4] <- as.numeric(ElecPower[,4])
ElecPower[,5] <- as.numeric(ElecPower[,5])
ElecPower[,6] <- as.numeric(ElecPower[,6])
ElecPower[,7] <- as.numeric(ElecPower[,7])
ElecPower[,8] <- as.numeric(ElecPower[,8])
ElecPower[,9] <- as.numeric(ElecPower[,9])

ElecPower[,10] <- as.POSIXct(paste(ElecPower[,1],ElecPower[,2], sep=" "))

library(datasets)


# Plot 3

png(filename = "Proj 1/plot3.png"
    ,width = 480
    ,height = 480)

plot(ElecPower$DateTime
     ,ElecPower$Sub_metering_1
     ,type = "l"
     #      ,xaxt="n"
     ,xlab = ""
     ,ylab = "Energy sub metering"
     ,col = "black"
     ,ylim = c(0,38)
)

par(new=TRUE)

plot(ElecPower$DateTime
     ,ElecPower$Sub_metering_2
     ,type = "l"
     #      ,xaxt="n"
     ,xlab = ""
     ,ylab = "Energy sub metering"
     ,col = "red"
     ,ylim = c(0,38)
)

par(new=TRUE)

plot(ElecPower$DateTime
     ,ElecPower$Sub_metering_3
     ,type = "l"
     #      ,xaxt="n"
     ,xlab = ""
     ,ylab = "Energy sub metering"
     ,col = "blue"
     ,ylim = c(0,38)
)

legend("topright"
       ,col = c("black","red","blue")
       ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty = 1
       ,lwd = 2
       )

dev.off()