' Create SFMain (file access object) which will be used to fetch the
' served resources from the local file system
Set sf = Host.CreateObject("newObjects.utilctls.SFMain")

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
        Host.WriteLine "  Parsing: " & line
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

Host.SetInput "0.0.0.0 80"
Host.RequestInput "Listen on"

Sub OnInput(t)
    Dim arr
    If t = "" Then
        Host.Exit
    End If
    arr = Split(t," ")
    If UBound(arr) < 1 Then
        Host.RequestInput "Listen on"
        Exit Sub
    End If

    ' Create the main helper object of the NEtStreams library
    Set NSMain = Host.CreateObject("newObjects.net.NSMain")
    
    ' Create new socket which will be used for listening
    Set listener = NSMain.NewSocket
    
    ' Initialize the listener socket
    b = listener.Socket("AF_INET","SOCK_STREAM","IPPROTO_TCP")
    If Not b Then
        Host.WriteLine "Cannot initialize the listener: " & listener.LastError
        Host.RequestInput "Listen on"
        Exit Sub
    End If
    
    ' Prepare the address for binding
    Set bindAddress = NSMain.NewAddress
    bindAddress.AddressFamilyName = "AF_INET"
    bindAddress.Port = CLng(arr(1))
    bindAddress.TextAddress = CStr(arr(0))
    
    ' Try to bind
    b = listener.Bind(bindAddress)
    If Not b Then
        Host.WriteLine "Cannot bind to " & arr(0) & " on port " & arr(1)
        Host.WiteLine "Error: " & listener.LastError
        Host.RequestInput "Listen on"
        Exit Sub
    End If
    
    ' BEgin listening
    b = listener.Listen
    If Not b Then
        Host.WriteLine "Cannot listen: " & listener.LastError
        Host.RequestInput "Listen on"
        Exit Sub
    End If
    
    Host.WriteLine "Listening ..."
    
    Dim res, resChecked, ext, mime
    Do
        Set c = listener.Accept
        Host.WriteLine "-> New connection accepted."
        Set strm = CreateObject("newObjects.utilctls.SFStream")
        strm.SetStream c
        res = ParseHTTP(strm)
        
        If res="EXIT.HTTP" Then
            Host.RequestInput "Listen on"
            Exit Sub
        End If
        
        If res = "" Then
            SendError strm, "Unsupported request", c
        Else
            On Error Resume Next
            resChecked = CheckRes(res,ext,mime)
            If resChecked = "" Then
                SendError strm, "Unsupported content type", c
            Else
                
                Set file = sf.OpenFile(Host.RuntimeParameter("ScriptPath") & "\" & resChecked,&H40)
                
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
        Host.WriteLine "<- Connection closed."
    Loop
End Sub    