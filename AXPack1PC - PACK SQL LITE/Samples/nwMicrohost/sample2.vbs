Host.Clear
Dim sf 
set sf = Host.CreateObject("newObjects.utilctls.sfMain")

Sub DoDir(s)
    set d= Sf.OpenDirectory(s)
    set c = d.contents
    for each I in c
     Host.WriteLine  i.name & vbtab & i.type  & vbtab & i.size
    next
End Sub

Sub OnInput(s)
    DoDir s
    If Host.Ask("List another directory?") Then
        Host.Clear
        Host.RequestInput "Enter directory"
    Else
        Host.Exit
    End If
End Sub

OnInput "\"