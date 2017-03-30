' HTTP request parser
Function ParseHTTP(strm)
    Dim line, nLine, bErr, arr, temp
    On Error Resume Next
    nLine = 0
    bErr = False
    line = strm.ReadText(-1)
    ParseHTTP = ""
    While line <> ""
        If Err.Number <> 0 Then
            ParseHTTP = ""
            Exit Function
        End If
        ' Uncomment if you want to see all the request data
        ' WScript.Echo "  Parsing: " & line
        If Not bErr Then
            If nLine = 0 Then
                If UCase(Left(line,3)) <> "GET" Then
                    bErr = True
                Else
                    arr = Split(line," ")
                    temp = Right(arr(1),Len(arr(1)) - 1)
                    If temp = "" Then
                        ParseHTTP = "/"
                    Else
                        ParseHTTP = temp
                    End If
                End If
            End If
        End If
        nLine = nLine + 1
        line = strm.ReadText(-1)
    Wend
End Function
Function CheckRes(res,ext,mime)
    Dim extension
    If res = "/" Then
        ext = "html"
        mime = "text/html"
        CheckRes = "default.html"
        Exit Function
    End If
    If InStr(res,"/") > 0 Or InStr(res,"\") > 0 Then
        CheckRes = ""
        Exit Function
    End If
    extension = sf.GetExtensionName(res)
    Select Case UCase(extension)
        Case "HTM"
            mime = "text/html"
        Case "HTML"
            mime = "text/html"
        Case "GIF"
            mime = "image/gif"
        Case "JPG"
            mime = "image/jpeg"
        Case "VBS"
            mime = "text/plain"
        Case "JS"
            mime = "text/plain"
        Case Else
            mime = "application/octetstream"
            CheckRes = ""
            Exit Function
    End Select
    ext = extension
    CheckRes = res
End Function
Sub SendError(strm, s, t)
    On Error Resume Next
    strm.WriteText "HTTP/1.0 200 ERROR", 1
    strm.WriteText "Content-Type: text/html", 1
    strm.WriteText "", 1
    strm.WriteText "<HTML><BODY><H1>", 1
    strm.WriteText "Sample HTTP server error: " & s, 1
    strm.WriteText "<HR>", 1
    strm.WriteText "Your address: " & t.IPAddress & ":" & t.IPPort, 1
    strm.WriteText "</H1></BODY></HTML>", 1
End Sub

' MAIN CODE

' Check if the command line arguments are correct
If WScript.Arguments.length < 2 Then
    WScript.Echo "Usage: cscript http-srv.vbs bindaddress port"
    WScript.Echo "Sample: cscript srv.vbs 0.0.0.0 80"
    WScript.Quit
End If

' Create the main helper object of the NEtStreams library
Set NSMain = CreateObject("newObjects.net.NSMain")

' Create new socket which will be used for listening
Set listener = NSMain.NewSocket

' Create SFMain (file access object) which will be used to fetch the
' served resources from the local file system
Set sf = CreateObject("newObjects.utilctls.SFMain")

' Initialize the listener socket
b = listener.Socket("AF_INET","SOCK_STREAM","IPPROTO_TCP")
If Not b Then
    WScript.Echo "Cannot initialize the listener: " & listener.LastError
    WScript.Quit
End If

' Prepare the address for binding
Set bindAddress = NSMain.NewAddress
bindAddress.AddressFamilyName = "AF_INET"
bindAddress.Port = CLng(WScript.Arguments(1))
bindAddress.TextAddress = CStr(WScript.Arguments(0))

' Try to bind
b = listener.Bind(bindAddress)
If Not b Then
    WScript.Echo "Cannot bind to " & WScript.Arguments(0) & " on port " & WScript.Arguments(1)
    WScript.Echo "Error: " & listener.LastError
    WScript.Quit
End If

' BEgin listening
b = listener.Listen
If Not b Then
    WScript.Echo "Cannot listen: " & listener.LastError
    WScript.Quit
End If

WScript.Echo "Listening ..."

Dim res, resChecked, ext, mime
Do
    Set c = listener.Accept
    WScript.Echo "-> New connection accepted." 
    Set peerAddress = c.PeerAddress
    WScript.Echo "      Peer: [" & peerAddress.TextAddress & "]." 
    
    Set strm = CreateObject("newObjects.utilctls.SFStream")
    strm.SetStream c
    res = ParseHTTP(strm)
    If res = "" Then
        SendError strm, "Unsupported request", c
    Else
        On Error Resume Next
        resChecked = CheckRes(res,ext,mime)
        If resChecked = "" Then
            SendError strm, "Unsupported content type", c
        Else
            Set file = sf.OpenFile(resChecked,&H40)
            If Err.Number <> 0 Then
                On Error Goto 0
                SendError strm, "File not found", c
            Else
                ' Leaving this in on error in case the connection has been brocken
                strm.WriteText "HTTP/1.0 200 OK", 1
                strm.WriteText "Content-Type: " & mime, 1
                strm.WriteText "", 1
                file.CopyTo strm, file.Size
                On Error Goto 0
            End If
        End If
    End If
    c.Close
    WScript.Echo "<- Connection closed."
Loop