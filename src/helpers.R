bokeh_connect <- function(host, session_id){
  ws_url <- paste0("ws://",host,"/ws?&bokeh-session-id=",session_id,"&bokeh-protocol-version=1.0")
  webrockets::ws_connect(url = ws_url)
}