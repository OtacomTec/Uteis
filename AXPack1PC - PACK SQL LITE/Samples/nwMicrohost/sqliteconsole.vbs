Host.Clear
Set db = Host.CreateObject("newObjects.sqlite.dbutf8")
Host.RequestInput "Open/create DB"
If Host.ParameterCount(False) > 0 Then
  Host.SetInput Host.Parameter(1)
Else
  Host.SetInput "<enter full file path>"
End If


Set lastRecord = Host.CreateObject("newObjects.utilctls.VarDictionary")
Function CompareRecordHeads(r1,r2)
    If r1.Count <> r2.Count Then
        CompareRecordHeads = False
        Exit Function
    End If
    Dim I
    For I = 1 To r1.Count
        If r1.Key(I) <> r2.Key(I) Then
            CompareRecordHeads = False
            Exit Function
        End If
    Next
    If r1.Info.Count <> r2.Info.Count Then
        CompareRecordHeads = False
        Exit Function
    End If
    Dim ti1, ti2
    Set ti1 = r1.Info
    Set ti2 = r2.Info
    For I = 1 To ti1.Count
        If ti1(I) <> ti2(I) Then
            CompareRecordHeads = False
            Exit Function
        End If
    Next
    CompareRecordHeads = True
End Function
Sub PlaceHeader(newR)
    If CompareRecordHeads(newR,lastRecord) Then
        Exit Sub
    End If
    Set lastRecord = newR.Clone
    Dim I
    Dim str,str2
    str = ""
    str2 = ""
    For I = 1 To newR.Count
        str = str & newR.Key(I) & vbTab
        str2 = str2 & "[" & newR.Info(I) & "]" & vbTab
    Next
    Host.WriteLine str
    Host.WriteLine str2
    Host.WriteLine "------------------------------------------------------------------------"
End Sub

Function BuildPredef(s)
    Dim x,I
    x = Mid(s,2,Len(s)-1)
    Dim arr
    arr = Split(UCase(x)," ")
    If UBound(arr) < 1 Then
        BuildPredef = "Wrong command"
        Exit Function
    End If
    Dim str
    str = ""
    Dim b
    b = False
    On Error Resume Next
    Set r = db.Execute("PRAGMA table_info(" & arr(1) & ");")
    If Err.Number = 0 Then
        If r.Count > 0 Then b = True
    End If
    On Error Goto 0
    If b Then
        Select Case arr(0)
            Case "S"
                str = "SELECT "
                For I = 1 To r.Count
                    str = str & r(I)("name")
                    If I < r.Count Then str = str & ","
                Next
                str = str & " FROM " & arr(1) & " WHERE ... ;"
            Case "U"
                str = "UPDATE " & arr(1) & " SET "
                For I = 1 To r.Count
                    str = str & r(I)("name") & "="
                    If I < r.Count Then str = str & ","
                Next
                str = str & " WHERE ... ;"
            Case "D"
                str = "DELETE FROM " & arr(1) & " WHERE "
                For I = 1 To r.Count
                    str = str & r(I)("name") & " "
                    If I < r.Count Then str = str & " AND "
                Next
                str = str & ";"
            Case "I"
                str = "INSERT INTO " & arr(1) & " ("
                For I = 1 To r.Count
                    str = str & r(I)("name")
                    If I < r.Count Then str = str & ","
                Next
                str = str & ") VALUES ("
                For I = 1 To r.Count
                    If I < r.Count Then str = str & ","
                Next
                str = str & ");"
            Case "CT"
                str = "Error - table " & arr(1) & " already exists."
            Case "CR"
                str = "CREATE TRIGGER " & arr(1) & " ON ;"
            Case "CV"
                If UBound(arr) > 1 Then
                    str = "CREATE VIEW" & arr(1) & " AS SELECT * FROM " & arr(2) & " WHERE ...;"
                Else
                    str = "CREATE VIEW" & arr(1) & " AS SELECT * FROM ..."
                End If
        End Select
    Else
        Select Case arr(0)
            Case "S"
                str = "SELECT * FROM " & arr(1) & " WHERE ... ;"
            Case "U"
                str = "UPDATE " & arr(1) & " SET ... WHERE ...;"
            Case "D"
                str = "DELETE FROM " & arr(1) & " WHERE ...;"
            Case "I"
                str = "INSERT INTO " & arr(1) & " (...) VALUES (...);"
            Case "CT"
                str = "CREATE TABLE " & arr(1) & " ( );"
            Case "CR"
                str = "CREATE TRIGGER " & arr(1) & " ON ;"
            Case "CV"
                If UBound(arr) > 1 Then
                    str = "CREATE VIEW" & arr(1) & " AS SELECT * FROM " & arr(2) & " WHERE ...;"
                Else
                    str = "CREATE VIEW" & arr(1) & " AS SELECT * FROM ..."
                End If
        End Select
    End If
    BuildPredef = str
End Function


Sub OnInput(sinput)
    Dim s
    s = sinput
    If UCase(s) = "EXIT" Then
        Exit Sub
    End If
    If db.IsOpened Then
        If UCase(s) = "SCHEMA" OR UCase(s) = "S" Then s = "SELECT * FROM sqlite_master;"
        If UCase(s) = "D" Then
            Host.SetInput "DELETE FROM ;"
            Host.RequestInput "Submit query"
            Exit Sub
        End If
        If UCase(s) = "U" Then
            Host.SetInput "UPDATE  SET  WHERE;"
            Host.RequestInput "Submit query"
            Exit Sub
        End If
        If UCase(s) = "I" Then
            Host.SetInput "INSERT INTO  ( ) VALUES ( );"
            Host.RequestInput "Submit query"
            Exit Sub
        End If
        If UCase(Left(s,1)) = "!" Then
            Host.SetInput BuildPredef(s)
            Host.RequestInput "Submit query"
            Exit Sub
        End If
        If UCase(s) = "H" Then
            Host.RequestInput "Submit query"
            Host.Clear
            Host.WriteLine  "SQLite console help"
            Host.WriteLine  "==================="
            Host.WriteLine  ""
            Host.WriteLine  "Write SQL statement and"
            Host.WriteLine  "submit it. The results"
            Host.WriteLine  "(if any will be listed"
            Host.WriteLine  "in the output window."
            Host.WriteLine  ""
            Host.WriteLine  "To exit clear the input"
            Host.WriteLine  "and type single word:"
            Host.WriteLine  "EXIT"
            Host.WriteLine  "and submit it."
            Host.WriteLine  "Shortcut commands are also"
            Host.WriteLine  "available:"
            Host.WriteLine  "S or SCHEMA - list db schema"
            Host.WriteLine  "U - UPDATE query template"
            Host.WriteLine  "I - Insert query template"
            Host.WriteLine  "D - Delete query template"
            Host.WriteLine  "!S <table> - Select statement for <table>"
            Host.WriteLine  "!U <table> - Update statement for <table>"
            Host.WriteLine  "!D <table> - DELETE statement for <table>"
            Host.WriteLine  "!I <table> - INSERT statement for <table>"
            Host.WriteLine  "!CT <table> - CREATE statement for <table>"
            Host.WriteLine  "!CR <trigger> - CREATE statement for <trigger>"
            Host.WriteLine  "!CV <view> <table> - CREATE VIEW statement for <view> over <table>"
            Host.WriteLine  "H - This help"
            Exit Sub
        End If
        On Error Resume Next
        Dim r
        Set r = db.Execute(s,1,0,4)
        If Err.Number <> 0 Then
            Host.Clear
            Host.WriteLine "Error occurred:" & vbCrLf & db.LastError
            Host.RequestInput "Submit query"
            Exit Sub
        Else
            On Error Goto 0
            Host.Clear
            Host.WriteLine "DB Engine encoding: " & r.Root & vbCrLf & "Last insert row=[" & r.Info & "]"
            Host.WriteLine "======================================================"
            Dim str
            If r.Count > 0 Then
                For I = 1 To r.Count
                    PlaceHeader r(I)
                    str = ""
                    For J = 1 To r(I).Count
                        str = str & r(I)(J) & vbTab
                    Next
                    Host.WriteLine str
                Next
            Else
                Host.WriteLine "Empty result. Your query have returned an empty set."
            End If
            Host.RequestInput "Submit query"
        End If
    Else
        If Not db.Open(sinput) Then
            Host.Clear
            Host.WriteLine "Cannot open/create the db: " & "\CF Card\test.db"
            Host.WriteLine "Error:" & vbCrLf & db.LastError
            Host.RequestInput "Open/create DB"
        Else
            Host.Clear
            Host.WriteLine "Successfuly opened the DB:"
            Host.WriteLine  "Type single H in the input"
            Host.WriteLine  "for help."
            Host.WriteLine sinput
            Host.SetInput "SELECT * FROM sqlite_master;"
            Host.RequestInput "Submit query"
        End If
    End If
End Sub