HTTP Fetching

This sample implements very simple HTTP fetching script. It takes the server address or
name, port and a resource path. The connection is established using non-blocking sockets.

- http.vbs, http.js
    Start it like this:
    cscript http.vbs <server> <port> <resource>
        server - server name or IP address
        port - usually 80
        resource - resource path
        
    The sample script sends GET request for the resource and uses the server name
    or address to compose a Host header.