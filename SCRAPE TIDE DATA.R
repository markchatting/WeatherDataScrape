######	SCRAPE TIDE DATA	######	

library(rvest)
library(sqldf)


url_list <- c("INSERT_YOUR_URL_HERE")

my_html <- read_html(url_list)
country_name <- my_html %>%
     	html_nodes("h2") %>%
     	html_text()
my_tables <- html_nodes(my_html,"table")
country_table <- html_table(my_tables, fill = T)
test <- rbind(country_table[[3]], country_table[[4]], country_table[[5]],
			country_table[[6]], country_table[[7]], country_table[[8]], 
			country_table[[9]], country_table[[10]], country_table[[11]],
			country_table[[12]], country_table[[13]], country_table[[14]],
			country_table[[15]], country_table[[16]])
date <- rep(format(Sys.time(), "%d-%b-%Y %H.%M"), times = 14)
output <- cbind(test, date)

setwd("C://Users//markc//Documents")
write.table(output, "Tide_data.csv", sep = ",", col.names = !file.exists("Tide_data.csv"), append = T, row.names = F)


################################################################################################
################################################################################################

	#####	END	####

################################################################################################
################################################################################################

