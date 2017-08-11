library(rbokeh)
library(magrittr)

# rbokeh serialisation test
test_data <- data.frame(x = 1:10,
                        y = 1:10,
                        z = 1:10)

bokeh_figure <- rbokeh::figure(data = test_data) %>%
  rbokeh::ly_points(data = test_data, x = x, y = y, z = z)
rbokeh::print_model_json(bokeh_figure)

