#D. Creating a shiny app to run the animation as a webb application

# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# You can use whatever approach to the Shiny app that you like. 
# My advice is to start with a Navbar template, perhaps with two tabs: 
# About (where you write a sentence or two about where you got the data from) and Map.
library(ECharts2Shiny)
library(giphyr)
library(shinyanimate)
library(readr)
library(shiny)
library(markdown)
library(tidyverse)
library(forcats)

# 
Pie_SEC_share <- read_rds("Pie_SEC_share.rds")

#1. Defining user interface, here a navication bar. Note: link to server via outputID = "map" corresponding to output$map            
ui <- navbarPage("Carbon footprint",
                 navbarMenu("Overview key parameters",
                            tabPanel("SEC filings",
                                     plotOutput("SEC")
                            ),
                            tabPanel("Endowment payouts",
                                     plotOutput("Endowment")
                             ),
                            tabPanel("Student body",
                                     plotOutput("Students")
                             )
                        ),
                 tabPanel("Carbon footprint per School in MT",
                          DT::dataTableOutput("CO2Schools")
                 ),
                 tabPanel("Carbon footprint per student in MT",
                          DT::dataTableOutput("CO2Students")
                 ),
                 tabPanel("About",
                          includeMarkdown("About.md")
                 )
)


# Define server logic required to draw a histogram

server <- function(input, output) {

    output$SEC <- renderPlot({
       
        transparent <- data.frame(
            group = c("Published", "Unpublished"),
            value = c(405098000, 40900000000)
        )
        
        lbls <- transparent$group
        pct <- round(transparent$value/sum(transparent$value)*100)
        lbls <- paste(lbls, pct) # add percents to labels
        lbls <- paste(lbls,"%",sep="") # ad % to labels 
        Pie_SEC_share <- pie(transparent$value, labels = lbls, border = "white", col = c("#E69F00", "#999999"), init.angle = 270, main = "HMC publishes ownerhsip for .4 of its 40.9 bn USD in assets")
        
    })
    
output$Endowment <- renderPlot({
        
    Schools_endowment_payout <- read_rds("Schools_endowment payout.rds")
    
    myPalette <- RColorBrewer::brewer.pal(5, "Set2") 
    lbls <- Schools_endowment_payout$School
    pct <- round(Schools_endowment_payout$Share_carbon_ownership*100)
    lbls <- paste(lbls, pct) # add percents to labels
    lbls <- paste(lbls,"%",sep="") # ad % to labels 
    Pie_endowment_payout <- pie(Schools_endowment_payout$Share_carbon_ownership, labels = lbls, border = "white", col = myPalette, main = "Share of endowment payout per school for FY2019 / Share of Corporate Carbon Footprint inhereted from endowment assets")
        
    })

output$Students <- renderPlot({
    
    Schools_endowment_payout <- read_rds("Schools_endowment payout.rds")
    
    Schools_endowment_payout %>%
        mutate(name = fct_reorder(School, Student_pop.x)) %>%
        ggplot( aes(x=name, y=Student_pop.x)) +
        geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.4) +
        coord_flip() +
        xlab("") +
        ylab("Students")+
        theme_bw()
})

output$CO2Schools <- DT::renderDataTable({
    CCF_per_school <- read_rds("CCF_per_school.rds")
    DT::datatable(CCF_per_school)
})


output$CO2Students <- DT::renderDataTable({
    CCF_per_student <- read_rds("CCF_per_student.rds")
    DT::datatable(CCF_per_student)
})
}


# Run the application 
shinyApp(ui = ui, server = server)
