library(shiny)
library(plotly)
library(ggplot2)
library(dplyr)
library(glue)
library(readr)
library(kableExtra)
theme_set(theme_classic())


ui <- fluidPage(br(),
                h1("An App about Australia Coronavirus",align="center"),
                h3("About"),
                p("This app is created by Yiwen Liu and its purpose is to show the coronavirus data of daily cases and cumulative cases of different types in different states of Australia."),
                p("Thank", a(href="https://covid19datahub.io/articles/data.html","COVID-19 Data Hub"),"for providing the raw data."),
                br(),
                p("You can choose the date range between 2020-01-12 to 2020-10-02 to see the coronavirus data in Australia."),
                
                dateselection("2020-01-12","2020-10-02"),
                br(),
                
                sidebarLayout(
                  sidebarPanel(
                    p("Once you select one state in the list below,you would get an interactive plot about the daily cases of different types in the related state.The date of the plot is between the date range you choose at first.If you click a point on the plot,you will get the text about the type,date and number of cases this point represents."),
                    br(),
                    
                    selectInput(
                      "state", 
                      label= "State",
                      choices = c("Australian Capital Territory",
                                  "New South Wales", 
                                  "Northern Territory",
                                  "Queensland", 
                                  "South Australia", 
                                  "Tasmania",
                                  "Victoria", 
                                  "Western Australia"),
                      selected = "Victoria"),
                    br(),
                    br(),
                    br(),
                    br(),
                    br(),
                    br(),
                    br(),
                    br(),
                    br(),
                    br(),
                    br(),
                    
                    p("Once you select one type in the list below,you would get an interactive plot and a table,which both change according to the date range you choose at first and the type you select.The table summarizes the data which is from the last day you choose in the date range.The plot and table display the cumulative cases of the related type in different states of Australia."),
                    br(),
                    selectInput(
                      "type", 
                      label = "Type", 
                      choices = c("confirmed","recovered","deaths")
                    ),
                    br()
                  ),
                  
                  mainPanel(
                    plotlyOutput("dailyplot_covid19_AUS"),
                    verbatimTextOutput("plotlyClick"),
                    plotlyOutput("plot_covid19_AUS"),
                    br(),
                    tableOutput("table_covid19_AUS")
                  )
                ),
                
                includeCSS("styles.css")
)


server <- function(input, output,session) {
  
  output$dailyplot_covid19_AUS <- renderPlotly({
    temp1 <- coronavirus_region[(coronavirus_region$date >= as.Date(input$date[1])) & (coronavirus_region$date <= as.Date(input$date[2])), ]

    temp1 %>%
      filter(State == input$state)%>%
      plot_ly(x = ~ date,
              y = ~ daily_confirmed,
              type = "scatter",
              name="Daily confirmed",
              fillcolor="blue",
              alpha=0.5,
              source = "B")%>%
      add_trace(y = ~ daily_deaths, 
                name = "Daily deaths",
                fillcolor = "red") %>%
      add_trace(y = ~daily_recovered, 
                name = "Daily recovered", 
                fillcolor = "green") %>%
      layout(title = paste("Daily Distribution of Covid19 Cases in", input$state, sep = ' '),
             legend = list(x = 0.8, y = 0.9),
             yaxis = list(title = "Number of Cases"))%>%
      config(displayModeBar = FALSE)
  })
  
  output$plotlyClick <- renderPrint(event_data("plotly_click",source = "B"))
  
  output$plot_covid19_AUS <- renderPlotly({
    temp1 <- coronavirus_region[(coronavirus_region$date >= as.Date(input$date[1])) & (coronavirus_region$date <= as.Date(input$date[2])), ]
    plot_summary <- temp1 %>%
      group_by(State)%>%
      ggplot() +
      geom_point(data = temp1, aes_string(x = "date",y = input$type,color = "State")) +
      scale_x_date(date_breaks = "1 week") +
      theme(axis.text.x = element_text(size = 6,angle = 50,hjust = 1),
            legend.title = element_blank()
      )+
      ggtitle(paste("The Cumulative Number of", input$type, "Cases in Different States of Australia", sep = " "))
    
    ggplotly(plot_summary)%>%
      config(displayModeBar = FALSE)
  })
  
  output$table_covid19_AUS <- function(){
    temp2 <- coronavirus_region[(coronavirus_region$date == as.Date(input$date[2])), ]
    table_summary <- temp2%>%
      group_by(State, date) %>% 
      select("State","date",input$type)%>%
      arrange(State)
    
    table_summary%>%
      kable(align="c", caption = paste("The Cumulative Number of", input$type, "Cases in Different States of Australia(As of ",input$date[2], ")", sep = ' '))%>% 
      kable_styling()
  }
}

shinyApp(ui, server)
