# Italy deaths
deaths <- read.csv("IT_deaths.CSV", stringsAsFactors = FALSE)
deaths$date <- lubridate::as_date(deaths$date)
deaths$days <- seq(1,length(deaths$deaths))

# Population of Italy is 60.48 million
deaths$pop_adjust <- (deaths$deaths/64480000) * 1000000

#---- NY deaths ----------------------------------------------------------------
ny_deaths <- read.csv("NY_deaths.CSV", stringsAsFactors = FALSE)

ny_deaths$date <- lubridate::as_date(ny_deaths$date)
ny_deaths$days <- seq(1,length(ny_deaths$deaths))

# Population of NY State, 19.54 million
ny_deaths$pop_adjust <- (ny_deaths$deaths/19540000) * 1000000

# Plot deaths per million
#par(mfrow=c(2,2))
plot(ny_deaths$pop_adjust, 
     type = "o", 
     col = "blue", 
     xlab = "Days", 
     ylab = "Deaths per Million",
     xlim = c(0,36))

lines(deaths$pop_adjust, type = "o", col = "red")
title("Total Deaths per Million")
legend("left", c("NY", "Italy"), lty = c(1,1), lwd = c(2,2), col = c("blue", "red"))
dev.off()

#---- Total deaths -----------------------------------------------------------
plot(deaths$deaths, type = "o", col = "red", xlab = "Days", ylab = "Deaths")
lines(ny_deaths$deaths, type = "o", col = "blue")

title("Total Deaths")
legend("left", c("NY", "Italy"), lty = c(1,1), lwd = c(2,2), col = c("blue", "red"))
dev.off()
#---- Deaths per Day ------------------------------
plot(diff(deaths$deaths),
     type = "o",
     col = "red",
     xlab = "Days",
     ylab = "Deaths per Day")

lines(diff(ny_deaths$deaths),
      type = "o",
      col = "blue")

title("Deaths per Day")
legend("left", c("NY", "Italy"), lty = c(1,1), lwd = c(2,2), col = c("blue", "red"))
dev.off()
