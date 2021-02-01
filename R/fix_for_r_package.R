
  link_name <- NULL
  mainweb <- "https://datadictionary.nhs.uk/data_elements_overview.html#dataElement_overview"

  list_links <- linkScrapeR(mainweb) #Returns the results of the linkScraperR

  if(nrow(list_links) <1){
    print("The list links has not been successful on this occassion. There is an issue with the linkScrapeR function")
    break
  }


  list_links <- list_links %>%
    dplyr::filter(link_name!="Data Elements",
                  stringr::str_detect(url, "data_elements"),
                  !stringr::str_detect(url, "https"),
                  nchar(link_name) > 1) #This code is needed to filter out spurious results

  # Create a composite string from the url
  extracted_string <- substr(list_links$url,
                             stringr::str_locate(list_links$url,"/")[1]+1,
                             as.numeric(length(list_links$url)))
  html_loc <- as.integer(unlist(as.data.frame(stringr::str_locate(extracted_string, ".html"))[1]))
  extracted_string_amend <- substr(extracted_string,1, html_loc-1)


  # Can I use the full url to extract current url context


  list_links$full_url <- as.character(paste0("https://datadictionary.nhs.uk/", list_links$url))
  list_links$xpath_nat_code <- paste0("//*[@id=", "\"element_",extracted_string_amend, '.national_codes\"]/div/div/table')
  list_links$xpath_also_known <- paste0("//*[@id=", "\"element_",extracted_string_amend, '.also_known_as\"]/div/div/table')

  #//*[@id="element_accessible_information_specific_information_format_code__snomed_ct_.also_known_as"]/div/div/table
  new_vec <- c()
  for (i in 1:2568){

    df <- list_links[i,]
    url <- df$full_url
    test <- NHSDataDictionaRy::linkScrapeR(df$full_url)
    test <- test %>%
      filter(str_detect(url, "national_codes"))

    flag <- ifelse(test$link_name=="National Codes",1,0)
    new_vec <- append(new_vec, flag)



  }


  #rm(list=c("list_links", "list_links_copy", "list_links_copy_str", "df"))
