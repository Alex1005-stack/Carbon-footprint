# A. In preparation for use of Shiny, transfer animation into Shiny directory

  #A. 1 Copy visualization data from clean-data directory into Shiny directory /App  
  file.remove("App/Schools_endowment payout.rds")
  file.copy(from = "clean-data/Schools_endowment payout.rds", to = "App/Schools_endowment payout.rds")
  file.remove("App/CCF_per_student_red.rds")
  file.copy(from = "clean-data/CCF_per_student_red.rds", to = "App/CCF_per_student_red.rds")
  file.remove("App/CCF_per_school.rds")
  file.copy(from = "clean-data/CCF_per_school.rds", to = "App/CCF_per_school.rds")
  file.remove("App/Emitter_table.rds")
  file.copy(from = "clean-data/Emitter_table.rds", to = "App/Emitter_table.rds")
  file.remove("App/CCF_per_year_average_HMC.rds")
  file.copy(from = "clean-data/CCF_per_year_average_HMC.rds", to = "App/CCF_per_year_average_HMC.rds")
  file.remove("App/CCF_per_year_average_all.rds")
  file.copy(from = "clean-data/CCF_per_year_average_all.rds", to = "App/CCF_per_year_average_all.rds")
  
  
  #A. 2 Copy about page   
    file.remove("App/About.md")
    file.copy(from = "About.md", to = "App/About.md")