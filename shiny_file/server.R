library(quantmod)
library(TTR)
library(ggplot2)
library(scales)
library(shiny)

shinyServer(
        function(input, output) {
                
                output$ostockcode <- renderPrint({input$stockcode})
                output$oexchange <- renderPrint({input$exchange})
                output$ofrom <- renderPrint({input$from})
                output$oto <- renderPrint({input$to})
                output$stock <- renderPrint({paste(input$stockcode,input$exchange,sep=".")})
                
                output$newplot <- renderPlot({ 
                        # set symbol
                        setSymbolLookup(stock=list(name=paste(input$stockcode,input$exchange,
                                                              sep="."),src='yahoo'))
                        
                        # download the data
                        df <- getSymbols(Symbols = "stock",
                                         from=input$from,
                                         to=input$to,
                                         env=environment(),
                                         auto.assign=FALSE)
                        names(df)<-c("Open","High","Low","Close","Volume","Adjusted")
                        # plot
                        chartSeries(df,TA = "addVo()",
                                    name =paste(input$stockcode,input$exchange,sep="."))
                })      
                
        }
)