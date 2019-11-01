#Problem 1
library(shiny)
library(ggplot2)
library(dplyr)
data = read.csv("recent_grads.csv")

grads= data %>%
  group_by(Major_category)%>%
  summarise(mean_women=mean(Women), mean_men=mean(Men), mean_employed=mean(Employed), 
            mean_unemployed=mean(Unemployed) )

ui = fluidPage(
  titlePanel("The Economic Guide To Picking A College Major",
             windowTitle = "The Economic Guide To Picking A College Major"),
  sidebarLayout(
    sidebarPanel(
      helpText("This is to visualize graduate students data"),
      textInput(inputId = "title", label = "Enter a title:", 
                value = ""),
      selectInput(inputId = "x_var", label = "X Variable", 
                  choices =  c(colnames(grads))),
      selectInput(inputId = "y_var", label = "Y Variable", 
                  choices =  c(colnames(grads)))
    ),
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)


server = function(input, output){
  
  output$plot = renderPlot({
    ggplot(grads, aes_string(x = input$x_var, 
                                y = input$y_var)) + 
      geom_col() + 
      ggtitle(input$title)
  })
}

shinyApp(ui, server)


#Problem 2
#1.You see with your brain:We don't fully see with our eyes; there is some processing that happens there, but mostly it is what happens in our brain that we think of as visual perception.
#2. Iconic memory is super fast. It happens without you consciously realizing it and is piqued when we look at the world around us. The important thing about iconic memory is that it is tuned to a set of preattentive attributes. Preattentive attributes are critical tools in your visual design tool belt, so we'll come back to those in a moment.
#3. Short-term memory has limitations. Specifically, people can keep about four chunks of visual Short-term memory has limitations. Specifically, people can keep about four chunks of visual. In this specific situation, one solution is to label the various data series directly. More generally, we want to form larger, coherent chunks of information so that we can fit them into the finite space in our audience's working memory.
#4. By combining the visual and verbal, we set ourselves up for success when it comes to triggering the formation of long-term memories in our audience.
#5. Preattentive attributes signal where to look:  if we use preattentive attributes strategically, they can help us enable our audience to see what we want them to see before they even know they're seeing it!
#6. Size: relative size denotes relative importance.
#7. Color: when used sparingly, color is one of the most powerful tools you have for drawing your audience's attention. A change in colors signals just that- a change. So leverage this when you want your audience to feel change for some reason, but never simply for the sake of novelty.
#8. In general, you should avoid using shades of red and shades of green together. Sometimes, though, there is useful connotation that comes with using red and green: red to denote the double-digit loss you want to draw attention to or green to highlight significant growth. 
#9. Color evokes emotion. Consider the tone you want to set with your data visualization or broader communication and choose a color (or colors) that help reinforce the emotion you want to arouse from your audience.
#10. Position on page: without other visual cues, most members of your audience will start at the top left of your visual or slide and scan with their eyes in zigzag motions across the screen or page. They see the top of the page first, which makes this precious real estate. Think about putting the most important thing here


