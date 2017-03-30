Set nsMain = Host.CreateObject("newObjects.net.NSMain")


Host.SetInput "www.newobjects.com 80 /"
Host.RequestInput "Fetch"

Function OnInput(t)
    Dim arr, socket, addr, addr1, strm
    
    If t = "" Then
        Exit Function
    End If
    
    arr = Split(t," ")
    If UBound(arr) < 2 Then
        Host.Msg "Wrong number of parameters!"
        Host.RequestInput "Fetch"
        Exit Function
    End If


    Set addr = nsMain.GetHost(arr(0))
    Host.Clear
    Host.WriteLine "Connecting to: [" & addr.TextAddress & "]"
    
    addr.Port = CLng(arr(1))
    
    Set socket = nsMain.NewSocket
    ' b = socket.Socket(2,1,6)
    b = socket.Socket
    If Not b Then
        Host.WriteLine "Error: " & socket.lastError
        Host.RequestInput "Fetch"
        Exit Function
    Else    
        b = socket.Connect(addr)
        If Not b Then
            Host.WriteLine "Error: " & socket.lastError
            Host.RequestInput "Fetch"
            Exit Function
        Else
            Set addr1 = socket.PeerAddress
            Host.WriteLine "Peer: [" & addr1.TextAddress & "]"
            Set addr1 = socket.SocketAddress
            Host.WriteLine "Socket: [" & addr1.TextAddress & "]"
            
            Set strm = Host.CreateObject("newObjects.utilctls.SFStream")
            strm.SetStream socket
            
            ' Post request
            Host.WriteLine "GET " & arr(1) & " HTTP/1.0" & vbCrLf & "Host: " & arr(0) & vbCrLf & vbCrLf
            strm.WriteText "GET " & arr(2) & " HTTP/1.0" & vbCrLf & "Host: " & arr(0) & vbCrLf & vbCrLf
            Host.WriteLine "Waiting for response:"
            Do
                s = strm.ReadText(-2)
                Host.WriteLine s
            Loop While s <> ""
                
            Host.WriteLine "============= Stream ended =============="
        End If
    End If
    socket.Close
    Host.RequestInput "Fetch another"
End Function




