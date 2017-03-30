<%
    Dim main
    Set main = Server.CreateObject("newObjects.utilctls.SFMain.free")
    If Not IsObject(Application("imgstg")) Then
        ' Open the file
        Application.Lock()
            If main.IsStorageFile(Server.MapPath("imgstg.bin")) = 0 Then
                Set Application("imgstg") = main.CreateStorageFile(Server.MapPath("imgstg.bin"))    
            Else
                Set Application("imgstg") = main.OpenStorageFile(Server.MapPath("imgstg.bin"))    
            End If
        Application.Unlock()
    End If
    
    Dim stg, strm, strm2
    Set stg = Application("imgstg")
    
    If Request("IMAGEADD").Count > 0 Then
        Set strm2 = main.OpenFile(Request("IMAGEADD"))
        Set strm = stg.CreateStream(main.GetFileName(Request("IMAGEADD")))
        strm2.CopyTo strm,10000000
        Set strm2 = Nothing
        Set strm = Nothing
    End If
    
    If Request("Image").Count > 0 Then
        Response.ContentType = "image/" & LCase(main.GetExtensionName(Request("Image")))
        Set strm = stg.OpenStream(Request("Image"))
        Response.BinaryWrite strm.ReadBin(strm.Size)
        Set strm = Nothing
    Else
        If Request("delete").Count > 0 Then
            stg.Remove(Request("delete"))
        End IF
        %>
            <HTML>
            <BODY>
                <FORM METHOD="POST" ACTION="<%= Request.ServerVariables("SCRIPT_NAME") %>">
                Add image: <INPUT NAME="IMAGEADD" TYPE="FILE">Select jpg or gif<BR><INPUT TYPE="SUBMIT" VALUE="ADD"><BR>
                <A HREF="<%= Request.ServerVariables("SCRIPT_NAME") %>">Refresh</A>
                </FORM>
                <HR>
                List of the images in the file:
                <HR>
                <%
                    
                    For Each strm In stg.contents
                        If strm.Type = 2 Then 
                            %>
                                <IMG SRC="<%= Request.ServerVariables("SCRIPT_NAME") %>?Image=<%= Server.URLEncode(strm.Name) %>">
                                <BR>
                                Delete: <A HREF="<%= Request.ServerVariables("SCRIPT_NAME") %>?delete=<%= Server.URLEncode(strm.Name) %>">
                                    <%= strm.Name %>
                                </A>
                                <HR>
                            <%
                        End If
                    Next
                %>
            </BODY>
            </HTML>
        <%
    End If
Set main = Nothing
Set stg = Nothing
%>

