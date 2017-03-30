Set nsMain = Host.CreateObject("newObjects.net.NSMain")

Sub Discover
    Set socket = nsMain.NewSocket
    b = socket.Socket("AF_IRDA","SOCK_STREAM","")
    If Not b Then
        Host.WriteLine "Error: " & socket.lastError
        Exit Sub
    End If
    
    Set opt = nsMain.NewOption
    opt.Level = "SOL_IRLMP"
    opt.Type = "IRLMP_ENUMDEVICES"
    Host.WriteLine "Looking up nearby IRDA devices ..."
    b = socket.GetOption(opt)
    If Not b Then
        Host.WriteLine "Error: " & socket.lastError
        Exit Sub
    End If
    Set devices = opt.Value
    Host.WriteLine "Devices found: " & devices.Count
    For I = 1 To devices.Count
        Set Addr = devices.Address(I)
        Host.WriteLine "  " & Addr.TextAddress & " [" & devices.DeviceName(I) & "]"
    Next
    socket.Close
End Sub

Do
    Discover    
    If Not Host.Ask("Look again?") Then Exit Do
Loop    