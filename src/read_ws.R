library(webrockets)
source("./src/helpers.R")
con <- bokeh_connect(host = "localhost:5006", session_id = "lr45iEFbKrxhZLssMSx6YurzRe7c1bkA2y4C00kXojkq")

xmit_data <- ws_receive_multiple(ws_ptr = con, eventlimit = 30)

# ws.Connect();
# 
# // three dataframes. Although metadata and content are empty but they have to be there !
#   // header 
# ws.Send("{\"msgid\":\"0001\",\"msgtype\":\"PULL-DOC-REQ\"}");
# // metadata
# ws.Send("{}");
# //content
# ws.Send("{}");
