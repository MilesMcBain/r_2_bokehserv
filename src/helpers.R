library(jsonlite) 
MESSAGE_ID = 1

bokeh_connect <- function(host, session_id){
  ws_url <- paste0("ws://",host,"/ws?&bokeh-session-id=",session_id,"&bokeh-protocol-version=1.0")
  webrockets::ws_connect(url = ws_url)
}

bokeh_protocol_send <- function(connection, header, metadata = "{}", content = "{}"){
  webrockets::ws_send(connection, header)
  webrockets::ws_send(connection, metadata)
  webrockets::ws_send(connection, content)
  
  MESSAGE_ID <- MESSAGE_ID+1
  
  invisible(connection)
}

bokeh_send_PULL_DOC <- function(connection){
  header <- list(msgid = sprintf("%04i", MESSAGE_ID),
                 msgtype = "PULL-DOC-REQ")
  
  bokeh_protocol_send(connection, header = toJSON(header, auto_unbox = TRUE))
}

bokeh_send_PUSH_DOC <- function(connection, document){
  header <- list(msgid = sprintf("%04i", MESSAGE_ID),
                 msgtype = "PUSH-DOC")
  bokeh_protocol_send(connection, header = toJSON(header, auto_unbox = TRUE),
                      content = document)
}
  

bokeh_PULL_DOC <- function(connection){
  bokeh_send_PULL_DOC(connection)
  pull_response <- ws_receive_multiple(connection, 3) 
}

bokeh_PUSH_DOC <- function(connection, document){
  bokeh_send_PUSH_DOC(connection, document)
  push_response <- ws_receive_multiple(connection, 3)
}

