library(webrockets)
source("./src/helpers.R")
con <- bokeh_connect(host = "localhost:5006", session_id = "n5MEUfdxh7eJuqOFPxARB5cG47g4X7g8i2z5IdsQPTdu")

doc <- bokeh_PULL_DOC(con)

jsonlite::prettify(doc[3])

# ws.Connect();
# 
# // three dataframes. Although metadata and content are empty but they have to be there !
#   // header 
# ws.Send("{\"msgid\":\"0001\",\"msgtype\":\"PULL-DOC-REQ\"}");
# // metadata
# ws.Send("{}");
# //content
# ws.Send("{}");

