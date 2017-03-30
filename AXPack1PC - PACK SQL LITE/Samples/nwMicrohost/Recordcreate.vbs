basepath = Host.RuntimeParameter("ScriptPath")

Sub  OnInput(s)
    Set sf = Host.CreateObject("newObjects.utilctls.SFMain")
    Set f = sf.CreateFile(s)
    Set r = Host.CreateObject("newObjects.utilctls.SFRecord")
    r.AddField "F1", vbLong
    r.AddField "F2", vbString, 8
    r.BindTo f
    r.Filter.unicodeText = False
    r.ReBind
    r.MoveFirst
    For I = 1 To 10
      Host.WriteLine I
      Randomize
      r("F1").Value = Rnd(3) * 10000
      r("F2").Value = "Value " & I
      r.Write
    Next
    r.UnBind
    f.Close
    Host.WriteLine "A file containing 10 records has been created."
End Sub

Host.SetInput basepath & "rec.bin"
Host.RequestInput "Output file"