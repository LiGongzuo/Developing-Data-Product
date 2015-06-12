#setwd("C:/Users/Alan GZ Li/Documents/GitHub/Developing-Data-Product/shiny_file")
library(plyr)
library(quantmod)
library(TTR)
library(ggplot2)
library(scales)
library(shiny)


shinyUI(pageWithSidebar(
        headerPanel("Stock CandleStick Charts"),
        sidebarPanel(
                
                textInput('stockcode', 'Input the Stock code: ',"000002"),
                checkboxGroupInput("exchange", "Choose the Stock Exchange :",
                                   c("Shanghai" = "ss",
                                     "Shenzhen" = "sz",
                                     "Hongkong"="hk"),
                                   selected=c("sz")),
                dateInput("from", "Choose the date from:",value = '2015-01-02'),
                dateInput("to", "Choose the date to:"),
                
                submitButton('Submit')
        ),
        mainPanel(
                h3('how to get start?'),
                h4('1.The Stock CandleStick Charts App was created by Gongzuo Li (https://github.com/LiGongzuo), in order to plot the CandleStick charts of a stock in the specified period.'),
                h4('2.The stocks can come from ShanghaiShanghai Stock Exchange (ss), Shenzhen Stock Exchange(ss), Hong Kong Stock Exchange (hk)'),
                h4('3.You should choose the sctok and the date firstly and submit, then you can get the CandleStick charts below.'),
                
                
                h3('Your Choose:'),
                h4('the Stock code:'),
                verbatimTextOutput("ostockcode"),
                h4('the Stock Exchange:'),
                verbatimTextOutput("oexchange"),
                
                h4('date from:'),
                verbatimTextOutput("ofrom"),
                h4('date to:'),
                verbatimTextOutput("oto"),
               
                h3('The stock symbol:'),
                verbatimTextOutput("stock"),
                
                h3('The CandleStick Charts :'),
                plotOutput('newplot')
        )
))