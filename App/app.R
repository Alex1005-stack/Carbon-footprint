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
library(ggthemes)
library(giphyr)
library(shinyanimate)
library(readr)
library(shiny)
library(markdown)
library(tidyverse)
library(forcats)

# Read in data

Schools_endowment_payout <- read_rds("Schools_endowment payout.rds")
CCF_per_school <- read_rds("CCF_per_school.rds")
CCF_per_student_red <- read_rds("CCF_per_student_red.rds")

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
                 tabPanel("Carbon footprint - Schools",
                          
                 titlePanel("Carbon footprint 'inherited' via endowment per year"),
                 
                 #Select school from dropdown menu for development of annual carbon footprint 'inherited' via endowment
                 #  Multiple can be selected for comparison
                 # Default is total
                 
                 sidebarLayout(
                     sidebarPanel(
                         selectInput("Schools",label = strong("Schools"),
                                     choices = unique(CCF_per_school$Schools),
                                     selected = "Total",
                                     multiple = TRUE
                         )),
                     
                     # Show development
                     
                     mainPanel(
                         plotOutput("linePlot")
                     )
                 )
                 ),
                 tabPanel("Carbon footprint - Students",
                          
                          titlePanel("Individual carbon footprints - the relative importance of asset reallocation as a footprint reduction lever"),
                          
                          #Select school from dropdown menu for development of annual carbon footprint 'inherited' via endowment and accordingly what reduction could mean
                          # Default is total
                          
                          sidebarLayout(
                              sidebarPanel(
                                  radioButtons("Students",label = strong("Your school:"),
                                              choices = unique(CCF_per_student_red$Schools),
                                              selected = "FAS (College & GSAS & SEAS)"
                                  )),
                              
                              # Show aging curve plot
                              
                              mainPanel(
                                  plotOutput("barPlot")
                              )
                          )
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
        pie(transparent$value, labels = lbls, border = "white", col = c("#E69F00", "#999999"), init.angle = 270, main = "HMC publishes ownerhsip for .4 of its 40.9 bn USD in assets")+
        theme_fivethirtyeight()
        
    })
    
output$Endowment <- renderPlot({
        
    myPalette <- RColorBrewer::brewer.pal(5, "Set2") 
    lbls <- Schools_endowment_payout$School
    pct <- round(Schools_endowment_payout$Share_carbon_ownership*100)
    lbls <- paste(lbls, pct) # add percents to labels
    lbls <- paste(lbls,"%",sep="") # ad % to labels 
    pie(Schools_endowment_payout$Share_carbon_ownership, labels = lbls, border = "white", col = myPalette, main = "Share of endowment payout per school for FY2019 / Share of Corporate Carbon Footprint inhereted from endowment assets")
        
    })

output$Students <- renderPlot({
    
    Schools_endowment_payout %>%
        mutate(name = fct_reorder(School, Student_pop.x)) %>%
        ggplot( aes(x=name, y=Student_pop.x)) +
        geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.4) +
        coord_flip() +
        xlab("") +
        ylab("Students")+
        theme_fivethirtyeight()
})

#creating variables for line graph. Needs to be reactive.

# selected from drop down box

subset<-reactive({CCF_per_school%>% filter(Schools %in% input$Schools)})


output$linePlot <- renderPlot({
    
    # draws line plot for selected school
    
    ggplot(subset(), aes(x=subset()$Year, y=subset()$Carbon_footprint_in_MT, color = subset()$Schools))+
        #smoothed trend line and actual values with scale adapting according to selected elements  
         
        scale_y_continuous(expand = c(0, 0), limits = c(0,max(subset()$Carbon_footprint_in_MT+50)))+
        geom_smooth(alpha = 0.5)+
        geom_point(alpha = 0.8)+

        # Labels
        
        labs(x="", y = "'Inherited' carbon footprint in '000 MTs", color = "Schools",
             caption = "Data sources: Carbon Disclosure Project, HMC SEC filings, HMC annual reports, websites of asset managers, Bloomberg, own calculations")+
        
        # Aesthetics
        
        theme_fivethirtyeight()+
        theme(axis.title = element_text(colour = "black" ))
}
)


#creating variables for line graph. Needed to be reactive so that it changes
#as each player in the drop down menu is selected.

# needs to be reactive to be able to change with different names that are
# selected from drop down box

subset_2 <-reactive({CCF_per_student_red%>% filter(Schools %in% input$Students)})

output$barPlot <- renderPlot({
    
    
    ggplot(subset_2(), aes(x=subset_2()$Type, y=subset_2()$Carbon_footprint_in_MT, fill =subset_2()$Type))+
        geom_col(stat="identity", fill=ifelse(subset_2()$Carbon_footprint_in_MT >0,"#f68060","#007f00"), alpha=.6, width=.4) +
        coord_flip() +
        #smoothed trend line of performance  
        scale_y_continuous(limits = c(min(subset_2()$Carbon_footprint_in_MT-1),max(subset_2()$Carbon_footprint_in_MT+1)))+
        # actual datapoints and WARs from players career. 
        labs(x="", y = "Carbon footprint in MTs", color = "Type",
             caption = "The latest available data (displayed) is for 2017. Note: A reduction lever not included above is having one fewer child (-117.7 MT p.a.). Data sources: Wynes & Nicholas (2017): The climate mitigation gap, Carbon Disclosure Project, HMC SEC filings, HMC annual reports, websites of asset managers, Bloomberg, own calculations")+
        
        
        # for aesthetic purpose and including axis labels 
        
        
        theme_fivethirtyeight()+
        theme(axis.title = element_text(colour = "black" ))
}
)



}


# Run the application 
shinyApp(ui = ui, server = server)
