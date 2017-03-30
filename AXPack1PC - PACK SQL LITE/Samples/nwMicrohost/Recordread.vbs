basepath = Host.RuntimeParameter("ScriptPath")

Sub  OnInput(s)
    Set sf = Host.CreateObject("newObjects.utilctls.SFMain")
    Set f = sf.OpenFile(s,&H40)
    Set r = Host.CreateObject("newObjects.utilctls.SFRecord")
    r.AddField "F1", vbLong
    r.AddField "F2", vbString, 8
    r.BindTo f
    r.Filter.unicodeText = False
    r.ReBind
    r.MoveFirst
    While Not f.EOS
      Host.WriteLine r("F2").Value & "=" & r("F1").Value
      r.MoveNext
    Wend
    r.UnBind
    f.Close
End Sub

Host.SetInput basepath & "rec.bin"
Host.RequestInput "Read file"