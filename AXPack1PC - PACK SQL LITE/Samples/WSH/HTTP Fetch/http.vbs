If WScript.Arguments.length <> 3 Then
    WScript.Echo "Usage: cscript http.vbs <server> <port> <resource>"
    WScript.Echo "Sample: cscript http.vbs newobjects.com 80 ""/"""
    WScript.Quit
End If

' Create a socket object we will use later
Set nsMain = CreateObject("newObjects.net.NSMain")
Set tcp = nsMain.NewSocket

' Resolve the address passed as command line parameter and
' set the port number specified by the user
Set addr = nsMain.GetHost(WScript.Arguments(0))
addr.Port = WScript.Arguments(1)

' Initialize the socket (no parmeters needed because the
' defaults are: IP -> TCP connection)
If Not tcp.Socket Then
    WScript.Echo "Error: " & tcp.LastError
    WScript.Quit
End If
' Attempt connection
If Not tcp.Connect(addr) Then
    WScript.Echo "Error: " & tcp.LastError
    WScript.Quit
Else
    ' We are connected - lets prepare HTTP 1.0 request
    rqst = "GET " & WScript.Arguments(2) & " HTTP/1.0" & vbCrLf & "Host: " & WScript.Arguments(0) & vbCrLf & vbCrLf
    ' Show it - so we can see what we will send after a while
    WScript.Echo "Sending the following request:"
    WScript.Echo rqst
    ' Now create a stream and attach it
    Set strm = CreateObject("newObjects.utilctls.SFStream")
    strm.SetStream tcp
    ' Post the prepared request
    strm.WriteText rqst
    WScript.Echo "Waiting for response ..."
    WScript.Echo ""
    Do
        s = strm.ReadText(-2)
        WScript.Echo s
    Loop While s <> ""
    
    WScript.Echo "============= Stream ended =============="
    tcp.Close
End If


