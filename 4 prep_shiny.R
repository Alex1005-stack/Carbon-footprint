# C. In preparation for use of Shiny, transfer animation into Shiny directory

    # So you probably need another file, perhaps prep_shiny.R. This is a simple 
    # R script with, perhaps, only one command, something using file_copy() to copy 
    # map.rds from graphics/ into the Shiny app directory. Is it overkill to have a file 
    # with only one command? Perhaps. But, in your final project, you may need to do a bunch
    # of different prep work for the Shiny app. We need a record of what that prep does and 
    # how it does it.
 
  #1. Copy graphs from graphics directory into Shiny directory   
  file.remove("App/Schools_endowment payout.rds")
  file.copy(from = "clean-data/Schools_endowment payout.rds", to = "App/Schools_endowment payout.rds")
  file.remove("App/CCF_per_student_red.rds")
  file.copy(from = "clean-data/CCF_per_student_red.rds", to = "App/CCF_per_student_red.rds")
  file.remove("App/CCF_per_school.rds")
  file.copy(from = "clean-data/CCF_per_school.rds", to = "App/CCF_per_school.rds")
  
  ?
  #2. Copy about page   
    file.copy(from = "About.md", to = "App/About.md")