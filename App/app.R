library(shinythemes)
library(ggridges)
library(ggthemes)
library(giphyr)
library(shinyanimate)
library(readr)
library(shiny)
library(markdown)
library(tidyverse)
library(forcats)

# A. Read in relevant data that we copied over from the clean-data file to App 

Schools_endowment_payout <- read_rds("Schools_endowment payout.rds")
CCF_per_school <- read_rds("CCF_per_school.rds")
CCF_per_student_red <- read_rds("CCF_per_student_red.rds")
Emitters <- read_rds("Emitter_table.rds")
CCF_per_year_average_all <- read_rds("CCF_per_year_average_all.rds")
CCF_per_year_average_HMC <- read_rds("CCF_per_year_average_HMC.rds")


#B. Defining user interface, including navigation bar, tabs, titles, user inputs and server reference for visualization. 


#B.1 Defining page in Navbar layout and yeti theme            
ui <- navbarPage("Carbon footprint inherited through the Harvard Endowment", theme = shinytheme("yeti"),

#B.2 Defining first panel, Carbon footprint inherited through the endowment fund with financing of operations for each of the schools and total                 
                 
                 tabPanel("Carbon footprint - Harvard Schools",
                 titlePanel("An investment in the past - Carbon footprint 'inherited' annually through endowment income made available for operations"),

#B.3 Defining potential user inputs in a sidebar 
    # Link to Srever via ID "Schools", define label of inputs as "School(s)"
    #Select schools from dropdown menu for development of annual carbon footprint 'inherited' via endowment
    # Default is total
    #  Multiple can be selected for comparison
    # Changing width of modules 2 for input tab and 10 for visualization

                 sidebarLayout(
                     sidebarPanel(
                         selectInput("Schools",label = strong("Add School(s):"),
                                     choices = unique(CCF_per_school$Schools),
                                     selected = "Total",
                                     multiple = TRUE
                         ), width = 2),
                     
#B.4 Define link to Server in the main panel 
                     
                     mainPanel(
                         plotOutput("linePlot")
                     , width = 10))),
            
#B.5 Define second panel on carbon footprint per student dependent on which school they are in (see above for details)

             tabPanel("Carbon footprint - Harvard Students",
                          
                          titlePanel("Carbon footprint per student - asset reallocation by far most important lever to reduce individual carbon footprint"),
                          
    #Select school from dropdown menu for development of annual carbon footprint 'inherited' via endowment and accordingly what reduction could mean
    # Default is FAS
                          
                          sidebarLayout(
                              sidebarPanel(
                                  radioButtons("Students",label = strong("Your school:"),
                                              choices = unique(CCF_per_student_red$Schools),
                                              selected = "FAS (College & GSAS & SEAS)"
                                  ), width = 2),
                              
    # Default is FAS
                              
                              mainPanel(
                                  plotOutput("barPlot")
                        , width = 10))),

#B.6 Define third panel on carbon footprint per portfolio company that could be matched with CDP data

                 tabPanel("Carbon footprint - portfolio companies (only 1% & in CDP data)",
                          DT::dataTableOutput("Emitters")
                 ),

#B.7 Define fourth panel on carbon footprint per company in portfolio on average in comparison to random samples of same size from CDP data

                 tabPanel("Comparison of portfolio average footprint",
                          
                          titlePanel("Matchable average Carbon footprint in portfolio compared to average of random sample in data set"),
                          
                          sidebarLayout(
                              sidebarPanel(
                                  radioButtons("Average",label = strong("Year"),
                                               choices = unique(CCF_per_year_average_HMC$Year),
                                               selected = 2017
                                  ), width = 2),
                              
                              # Show development
                              
                              mainPanel(
                                  plotOutput("averagePlot")
                              , width = 10)
                          )
                 ),

#B.7 Define fifth drop-down that includes detailed About and visualization of some key parameters
                 navbarMenu("About and key parameters",
                            tabPanel("About",
                                     includeMarkdown("About.md")
                            ),
                            tabPanel("SEC filings",
                                     plotOutput("SEC")
                            ),
                            tabPanel("Endowment payouts",
                                     plotOutput("Endowment")
                            ),
                            tabPanel("Student body",
                                     plotOutput("Students")
                            )
                 )

)


#C Define server logic that takes the data read in under A and builds the desired visualization to be interacted with and referred to in B

server <- function(input, output) {

#C.1 Visualizing the share of the Harvard endowment publicly accessible of total endowment
    
    output$SEC <- renderPlot({
       
        transparent <- data.frame(
            group = c("Published", "Unpublished"),
            value = c(405098000, 40900000000) #405098000 from HMC SEC filling on Q3 2019 / 40.9 billion from Q3 2019 articles in Crimson and in Harvard magazine
        )
        
        lbls <- transparent$group
        pct <- round(transparent$value/sum(transparent$value)*100)
        lbls <- paste(lbls, pct) # add percents to labels
        lbls <- paste(lbls,"%",sep="") # ad % to labels 
        pie(transparent$value, labels = lbls, border = "white", col = c("#E69F00", "#808080"), init.angle = 270, main = "In 2019 HMC published ownerhsip for .4 of its 40.9 bn USD in assets")
        
    })
    
output$Endowment <- renderPlot({

#C.2 Visualizing the share of the Harvard endowment payed out to each school (see 2 Data prep for source of data, assumptions, etc.)
    
    myPalette <- RColorBrewer::brewer.pal(5, "Set2") 
    lbls <- Schools_endowment_payout$School
    pct <- round(Schools_endowment_payout$Share_carbon_ownership*100)
    lbls <- paste(lbls, pct) # add percents to labels
    lbls <- paste(lbls,"%",sep="") # ad % to labels 
    pie(Schools_endowment_payout$Share_carbon_ownership, labels = lbls, border = "white", col = myPalette, main = "Share of endowment payout per school for FY2019")
        
    })

output$Students <- renderPlot({

#C.3 Visualizing student body (for details, assumptions, etc. see 2. Data prep)    
        
    Schools_endowment_payout %>%
        mutate(name = fct_reorder(School, Student_pop.x)) %>%
        ggplot( aes(x=name, y=Student_pop.x)) +
        geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.4) +
        geom_text(aes(x = name, y = Student_pop.x, label = Student_pop.x))+
        coord_flip() +
        labs(title = "Student body per Harvard School", x = "", y = "Students", caption = "Source: Carbon Disclosure Project 2014 - 2018, Bloomberg, HMC SEC filings, Harvard University Financial Report for Fiscal Year 2019, Fund management website, Financial Reports of Harvard Schools, Wesbites Harvard Schools, own Analysis.")+
        theme_fivethirtyeight()
})

#C.4 Visualizing carbon footprint per school (for details, assumptions, etc. see 2. Data prep) 

    # Define a reactive susbset that uses the user input in the school selector as a filter to create a data set that defines the changes in the graph 

subset<-reactive({CCF_per_school%>% filter(Schools %in% input$Schools)})


output$linePlot <- renderPlot({
    
    # draws line plot for selected school
    
    ggplot(subset(), aes(x=subset()$Year, y=subset()$Carbon_footprint_in_MT, color = subset()$Schools))+
        
    # define scale, y upper limit depends on max carbon footprint selected     
         
        scale_y_continuous(expand = c(0, 0), limits = c(0,max(subset()$Carbon_footprint_in_MT+100)))+
    
    # add geom smooth line        
        geom_smooth(alpha = 0.5)+
    
    # add actual data points    
        geom_point(alpha = 0.8)+
        geom_text(aes(x = subset()$Year, y = subset()$Carbon_footprint_in_MT+60, label = round(subset()$Carbon_footprint_in_MT,2)))+

    # add labels
        
        labs(x="Year", y = "'Inherited' carbon footprint in '000 MT", color = "Schools",
             caption = "Source: Carbon Disclosure Project 2014 - 2018, Bloomberg, HMC SEC filings, Harvard University Financial Report for Fiscal Year 2019, Fund management website, Financial Reports of Harvard Schools, Wesbites Harvard Schools, own Analysis.")+
        
        # Aesthetics
        
        theme_fivethirtyeight()+
        theme(axis.title = element_text(colour = "black", size = 12),
              plot.title = element_text(size = 14, hjust = 0),
              plot.subtitle = element_text(size = 10, hjust = 0),
              plot.caption = element_text(size = 10, hjust = 0))
}
)


#C.5 Visualizing carbon footprint per student (for details, assumptions, etc. see 2. Data prep) 

# Define a reactive susbset that uses the user input in the school buttons as a filter to create a data set that defines the changes in the graph 

subset_2 <-reactive({CCF_per_student_red%>% filter(Schools %in% input$Students)})

output$barPlot <- renderPlot({
    
    ggplot(subset_2(), 
           aes(x=subset_2()$Type, y=subset_2()$Carbon_footprint_in_MT, fill =subset_2
               ()$Type))+ # data set
        geom_col(stat="identity", 
                 fill=ifelse(subset_2()$Carbon_footprint_in_MT >0,"#f68060","#007f00"), 
                 alpha=.6, width=.4) + # Columnn graph with conditional fill formatting
        geom_text(aes(x = subset_2()$Type, y = subset_2()$Carbon_footprint_in_MT, 
                      label = abs(subset_2()$Carbon_footprint_in_MT)), # Adding text labels to the bars witha actual values 
                      color = ifelse(subset_2()$Carbon_footprint_in_MT >0,"#f68060","#007f00"))+ # Colors with conditional formatting
        coord_flip() +
        #smoothed trend line of performance  
        scale_y_continuous(limits = c(min(subset_2()$Carbon_footprint_in_MT-1),max(subset_2()$Carbon_footprint_in_MT+1)))+ # adaptive scales in min and max of y dependent on which school is selected
        
        # add labels
        labs(title = "Annual carbon footprint per student in 2017 and most important reduction levers", 
             x="", y = "Annual carbon footprint in MT", color = "Type",
             caption = "The latest available data (displayed) is for 2017. \n Note: A reduction lever not included above is having one fewer child (-117.7 MT p.a.). \n Sources: Wynes & Nicholas (2017): The climate mitigation gap, Carbon Disclosure Project 2014 - 2018, Bloomberg, HMC SEC filings, Harvard University Financial Report for Fiscal Year 2019, \n Fund management website, Financial Reports of Harvard Schools, Wesbites Harvard Schools, EPA Energy Review November 2019, own Analysis")+
        
        # Add aesthetics 
        
        theme_fivethirtyeight()+
        theme(axis.title = element_text(colour = "black", size = 10),
              plot.title = element_text(size = 14, hjust = 0),
              plot.subtitle = element_text(size = 10, hjust = 0),
              plot.caption = element_text(size = 10, hjust = 0))
}
)

#C.6 Creating data table for emitters (See 2 Data prep for assumptions, details etc.)

output$Emitters <- DT::renderDataTable({
    DT::datatable(Emitters, caption = "Source: Carbon Disclosure Project 2014 - 2018, Bloomberg, HMC SEC filings, Harvard University Financial Report for Fiscal Year 2019, Fund management website, Financial Reports of Harvard Schools, Wesbites Harvard Schools, own Analysis.")
})


#C.7 Bootstrapping random samples from CDP data and compare average to companies in HMC portfolio (See 2 Data prep for assumptions, details etc.) 

# Define two reactive susbsets that uses the user input in the school buttons as a filter to create a data set that defines the changes in the graph. One is for the the Graphs the other to highlight where the HMC portfolio lands

subset_3 <-reactive({CCF_per_year_average_all%>% filter(Year %in% input$Average)})
subset_4 <-reactive({CCF_per_year_average_HMC%>% filter(Year %in% input$Average)})


output$averagePlot <- renderPlot({

    #Pull out relevant HMC value from subset
    HMC <- subset_4()["Average_carbon_footprint_per_company"]%>%pull()
    
    ggplot(subset_3(), aes(x=subset_3()$Average_carbon_footprint_per_company, y =0)) +
        stat_density_ridges()+ # Visualization via stat_density_ridges
        scale_x_continuous(breaks = c(2000,4000,6000),limits = c(0,8500))+ # set x axis
        labs(title = "Average footprint of companies in Harvard endowment portfolio larger than from random CDP sample for each year", 
             subtitle = "1000 repetitions per year with size 562 (Companies in Harvard Management Company's SEC filing that could be matched to CDP data)", 
             x = "Carbon footprint in '000 MTs", y = "Frequency",
             caption = "Source: Carbon Disclosure Project 2014 - 2018, Bloomberg, HMC SEC filings, Harvard University Financial Report for Fiscal Year 2019, Fund management website Financial Reports of Harvard Schools, Wesbites Harvard Schools, own Analysis.")+
        geom_vline(xintercept = HMC,size = 1, color = "red")+
        geom_text(aes(x = HMC, y = 0, label = "Endowment average"),size=5, angle=90, vjust=1.1, hjust=-1, color = "red")+
        theme_fivethirtyeight()+
        theme(axis.title = element_text(colour = "black", size = 12),
              plot.title = element_text(size = 18, hjust = 0),
              plot.subtitle = element_text(size = 14, hjust = 0),
              plot.caption = element_text(size = 10, hjust = 0))
}
)
}


# Run the application 
shinyApp(ui = ui, server = server)
