library(plotly)

p <- plot_ly(type = 'parcoords', line = list(color = 'blue'),
             dimensions = list(
               list(range = c(1,5),
                    constraintrange = c(1,2),
                    label = 'A', values = c(1,4)),
               list(range = c(1,5),
                    tickvals = c(1.5,3,4.5),
                    label = 'B', values = c(3,1.5)),
               list(range = c(1,5),
                    tickvals = c(1,2,4,5),
                    label = 'C', values = c(2,4),
                    ticktext = c('text 1', 'text 2', 'text 3', 'text 4')),
               list(range = c(1,5),
                    label = 'D', values = c(4,2))
             )
)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="parcoords-dimensions")
chart_link