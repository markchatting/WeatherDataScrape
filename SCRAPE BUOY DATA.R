######################################

######	SCRAPE BUOY DATA	######	

######################################

library(rvest)
library(sqldf)

url <- c("INSERT_YOUR_URL_HERE")

my_html <- read_html(url)
country_name <- my_html %>%
     	html_nodes("h2") %>%
     	html_text()
my_tables <- html_nodes(my_html,"table")
country_table <- html_table(my_tables, fill = T)[[2]]
output <- t(append(country_table[[2]], format(Sys.time(), "%d-%b-%Y %H.%M")))


setwd("C://Users//markc//Documents")
write.table(output, "Buoy_data.csv", sep = ",", col.names = !file.exists("Buoy_data.csv"), append = T, row.names = F)

##########################################
##########################################

	#####	END	####

##########################################
##########################################

