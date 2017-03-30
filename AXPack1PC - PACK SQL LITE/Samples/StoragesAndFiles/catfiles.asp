<%
    Dim main, imgStg, dataStrm, rootStg
    Set main = Server.CreateObject("newObjects.utilctls.SFMain.free")
    
    ' Library =================
    
        Sub CreateDataFile
            If main.IsStorageFile(Server.MapPath("datax.bin")) = 0 Then
                Set rootStg = main.CreateStorageFile(Server.MapPath("datax.bin"))
                Set imgStg = rootStg.CreateStorage("Images")
                Set dataStrm = rootStg.CreateStream("Data")
            Else
                Set rootStg = main.OpenStorageFile(Server.MapPath("datax.bin"))
                Set imgStg = rootStg.OpenStorage("Images")
                Set dataStrm = rootStg.OpenStream("Data")
            End If
        End Sub
        Sub OpenDataFile
            Application.Lock()
                If Not IsObject(Application("rootStg")) Then
                    CreateDataFile
                    Set Application("rootStg") = rootStg
                    Set Application("imgStg") = imgStg
                    Set Application("dataStrm") = dataStrm
                Else
                    Set rootStg = Application("rootStg")
                    Set imgStg = Application("imgStg")
                    Set dataStrm = Application("dataStrm")
                End if
            Application.Unlock()
        End Sub
    
        OpenDataFile
        
        Set rec = Server.CreateObject("newObjects.utilctls.SFRecord")
        rec.AddField "Used", vbBoolean
        rec.AddField "Name", vbString, 31
        rec.AddField "Age", vbLong
        rec.AddField "Sex", vbBoolean
        rec.AddField "Weight", vbInteger
        rec.AddField "Image", vbString, 33
        rec.BindTo dataStrm
        rec.Filter.unicodeText = False
        
        rec.MoveFirst
        
        Dim recCount
        recCount = rec.RecordCount
        
        Dim action
        If Request("Action").Count > 0 Then action = Request("Action")(1)
    
    ' =========================
    Sub Header
        %>
        <HTML>
        <BODY>
        <%
    End Sub    
    Sub Footer
        %>
        <HR>
        <A HREF="<%= Request.ServerVariables("SCRIPT_NAME") %>?Action=DeleteAll">Delete All</A> |
        <A HREF="<%= Request.ServerVariables("SCRIPT_NAME") %>">Refresh</A>
        </BODY>
        </HTML>
        <%
    End Sub
    Sub AddForm
        %>
        <FORM METHOD="POST" ACTION="<%= Request.ServerVariables("SCRIPT_NAME") %>?Action=Add">
            Name:<INPUT TYPE="TEXT" NAME="Name" VALUE=""> (up to 30 characters)<BR>
            Age:<INPUT TYPE="TEXT" NAME="Age" VALUE=""> (integer number)<BR>
            Sex:<INPUT TYPE="RADIO" NAME="Sex" VALUE="Male" CHECKED> male <INPUT TYPE="RADIO" NAME="Sex" VALUE="Female"> female<BR>
            Weight:<INPUT TYPE="TEXT" NAME="Weight" VALUE=""> (integer number)<BR>
            Image:<INPUT TYPE="FILE" NAME="Image" VALUE=""> (select a jpg or gif)<BR>
            <INPUT TYPE="SUBMIT" VALUE="Add">
        </FORM>
        <%
    End Sub
    Sub RecList(RecToDelete)
        rec.MoveFirst
        Dim nRec
        nRec = 0
        While Not dataStrm.EOS
            If rec("Used").Value Then
                If nRec = RecToDelete Then
                    imgStg.Remove rec("Image").Value
                    rec("Used") = False
                    rec.Update
                Else
                %>
                    <HR>
                    <IMG SRC="<%= Request.ServerVariables("SCRIPT_NAME") %>?Action=Image&Image=<%= rec("Image") %>"><BR>
                    Name: <B><%= rec("Name").Value %></B><BR>
                    Age: [<%= CLng(rec("Age").Value) %>]<BR>
                    Sex: <% If rec("Sex").Value Then Response.Write "Male" Else Response.Write "Female" %>
                    <BR>
                    Weight: [<%= CLng(rec("Weight").Value) %>]<BR>
                    <A HREF="<%= Request.ServerVariables("SCRIPT_NAME") %>?Action=Delete&Item=<%= nRec %>">Delete</A>
                <%
                End If
            End If
        rec.MoveNext
        nRec = nRec + 1
        Wend
    End Sub
    
    
    Select Case Action
        Case "Add"
            rec.Move 0, 2
            rec("Used").Value = True
            rec("Name").Value = Request("Name")
            rec("Age").Value = CLng(CStr(Request("Age")))
            If Request("Sex") = "Male" Then
                rec("Sex").Value = True
            Else
                rec("Sex").Value = False
            End If
            rec("Weight").Value = CInt(CStr(Request("Weight")))
            rec("Image").Value = main.GetFileName(Request("Image"))
            rec.Update
            
            Set strm2 = main.OpenFile(Request("Image"))
            Set strm = imgStg.CreateStream(main.GetFileName(Request("Image")))
            strm2.CopyTo strm,10000000
            Set strm2 = Nothing
            Set strm = Nothing
            AddForm
            Header
            RecList -1
            Footer
        Case "Delete"
            AddForm
            Header
            RecList CLng(Request("Item"))
            Footer
        Case "DeleteAll"
            dataStrm.Size = 0
            For Each I in imgStg.contents
                imgStg.Remove I.Name
            Next
            AddForm
            Header
            RecList -1
            Footer
        Case "Image"
            Response.ContentType = "image/" & LCase(main.GetExtensionName(Request("Image")))
            Set strm = imgStg.OpenStream(Request("Image"))
            Response.BinaryWrite strm.ReadBin(strm.Size)
            Set strm = Nothing
        Case Else
            AddForm
            Header
            RecList -1
            Footer
    End Select
%>


