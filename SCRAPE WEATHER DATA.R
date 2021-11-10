##############################################

##########	SCRAPE WEATHER DATA	##########	

##############################################


#install.packages("rvest")
#install.packages("sqldf")

library(rvest)
library(sqldf)


url_list <- c("INSERT_YOUR_URL_HERE")

my_html <- read_html(url_list)
country_name <- my_html %>%
     	html_nodes("h2") %>%
     	html_text()
my_tables <- html_nodes(my_html,"table")
country_table <- html_table(my_tables, fill = T)
test <- cbind(country_table[[1]][, 1], country_table[[1]][, 2], country_table[[1]][, 3],
			country_table[[1]][, 4], country_table[[1]][, 5], country_table[[1]][, 6], 
			country_table[[1]][, 7], country_table[[1]][, 8], country_table[[1]][, 9])
date <- rep(format(Sys.time(), "%d-%b-%Y %H.%M"), times = 16)
output <- cbind(test, date)

setwd("C://Users//markc//Documents")
write.table(output, "Weather_data.csv", sep = ",", col.names = !file.exists("Weather_data.csv"), append = T, row.names = F)


################################################################################################
################################################################################################

	#####	END	####

################################################################################################
################################################################################################

