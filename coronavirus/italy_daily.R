deaths <- read.csv("IT_deaths.CSV", stringsAsFactors = FALSE)

deaths$date <- lubridate::as_date(deaths$date)

deaths$days <- seq(1,length(deaths$deaths))

plot(deaths$deaths, type = "o")

deaths$linear_fit <- deaths$days * 381.75
lines(deaths$linear_fit, col = "red")
deaths$linear_fit <- deaths$days * 304
lines(deaths$linear_fit, col = "red")

#---- NY deaths ----------------------------------------------------------------
ny_deaths <- read.csv("NY_deaths.CSV", stringsAsFactors = FALSE)

ny_deaths$date <- lubridate::as_date(ny_deaths$date)
ny_deaths$days <- seq(1,length(ny_deaths$deaths))
lines(ny_deaths$deaths, type = "o", col = "blue")
