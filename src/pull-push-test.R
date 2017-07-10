library(webrockets)
source("./src/helpers.R")
con <- bokeh_connect(host = "localhost:5006", session_id = "M8rrG88SEDZdpQV6WCLFIGePovySwa3s7685EE8HX6al")

doc <- bokeh_PULL_DOC(con)

new_doc <- doc[[3]]
new_con <- bokeh_connect(host = "localhost:5006", session_id = "mmtest")

reply <- bokeh_PUSH_DOC(new_con, new_doc) 
