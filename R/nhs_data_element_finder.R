# Let's have a wrapper to make it easier to use data dictionary
nhs_dd_master <- nhs_data_elements()

national_code_xpath <- c(nhs_dd_master$xpath_nat_code)
default_code_xpath <- c(nhs_dd_master$xpath_default_codes)
lookup_item <- "ADMINISTRATIVE CATEGORY CODE"




nhs_data_dictionary_wrapper <- function(lookup_item, type="codes"){

  if(lookup_item=="" | length(lookup_item) < 1){
    message("Run the nhs_data_elements function to find a lookup")
  }

  nhs_dd_master <- nhs_data_elements()
  .lookup_item <- enquo(lookup_item)


  if (type == "codes"){
    nhs_dd_master <- nhs_dd_master %>%
      filter(link_name == !!.lookup_item)

    nhs_dd_master_label <- as.character(lookup_item)
    national_code <- tableR(nhs_dd_master$full_url, nhs_dd_master$xpath_nat_code, title=lookup_item)
    default_code <-  tableR(nhs_dd_master$full_url, nhs_dd_master$xpath_default_codes, title=lookup_item)

    if(length(national_code)<1 | length(default_code)<1){
      print("National codes do not exist for this selection")
      stop()
    }

    return <- rbind(national_code, default_code)
  }

 return(return)
}


nhs_data_dictionary_wrapper(lookup_item, type="codes")
