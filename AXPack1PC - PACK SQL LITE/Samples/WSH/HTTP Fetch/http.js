if (WScript.Arguments.length != 3) {
    WScript.Echo("Usage: cscript http.vbs <server> <port> <resource>");
    WScript.Echo("Sample: cscript http.vbs newobjects.com 80 \"/\"");
    WScript.Quit();
}

// Create a socket object we will use later
var nsMain = new ActiveXObject("newObjects.net.NSMain");
var tcp = nsMain.NewSocket();

// Resolve the address passed as command line parameter and
// set the port number specified by the user
var addr = nsMain.GetHost(WScript.Arguments(0));
addr.Port = WScript.Arguments(1);

// Initialize the socket (no parmeters needed because the
// defaults are: IP -> TCP connection)
if (!tcp.Socket()) {
    WScript.Echo("Error: " + tcp.LastError);
    WScript.Quit();
}
// Attempt connection
if (!tcp.Connect(addr)) {
    WScript.Echo("Error: " + tcp.LastError);
    WScript.Quit();
} else {
    // We are connected - lets prepare HTTP 1.0 request
    var rqst = "GET " + WScript.Arguments(2) + " HTTP/1.0\r\nHost: " + WScript.Arguments(0) + "\r\n\r\n";
    // Show it - so we can see what we will send after a while
    WScript.Echo("Sending the following request:");
    WScript.Echo(rqst);
    // Now create a stream and attach it
    var strm = new ActiveXObject("newObjects.utilctls.SFStream");
    strm.SetStream(tcp);
    // Post the prepared request
    strm.WriteText(rqst);
    WScript.Echo("Waiting for response ...");
    WScript.Echo("");
    do {
        s = strm.ReadText(-2);
        WScript.Echo(s);
    } while (s != "");
    
    WScript.Echo("============= Stream ended ==============");
    tcp.Close();
}


