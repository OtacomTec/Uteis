Function GetTypeName(t)
    Select Case t
        Case vbLong
            GetTypeName = "int"
        Case vbString
            GetTypeName = "string"
        Case vbSingle
            GetTypeName = "float"
        Case vbDouble
            GetTypeName = "double"
        Case Else
            GetTypeName = "Unknown"
    End Select
End Function

Sub ListCfg(c,idnt)
    Dim I
    For I = 1 To c.Count
        If IsObject(c(I)) Then
            If c(I).Info.Type Then
                ' Section
                Host.WriteLine idnt & "{ " & c.Key(I) & ":"
                ListCfg c(I), idnt & "  "
                Host.WriteLine idnt & "} " & c.Key(I) & ";"
            Else
                ' Record
                Host.WriteLine idnt & c.Key(I) & "="
                ListCfg c(I), idnt & "  "
            End If
        Else
            Host.WriteLine idnt & "(" & GetTypeName(VarType(c(I))) & ") " & c(I)
        End If
    Next
End Sub

Sub OnInput(s)
    Host.Clear
    Set cf = Host.CreateObject("newObjects.utilctls.ConfigFile")
    Host.WriteLine "Reading file: " & s
    Set sf = Host.CreateObject("newObjects.utilctls.SFMain")
    Set f = sf.OpenFile(s,&H40)
    cf.PreserveStringsWide = True
    cf.PreserveUnsignedInt = True
    Set cfg = cf.ReadFromBinaryStream(f)
    f.Close
    ListCfg cfg, "  "
    Host.WriteLine "Complete."
End Sub
Host.SetInput Host.RuntimeParameter("ScriptPath") & "bin.cfg"
Host.RequestInput "File to read"
