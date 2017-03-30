<HTML>
<HEAD>
    <STYLE>
        TH  { border: 1px outset background-color: rgb(192,192,192) }
        TD  { border: 1px inset; background-color: rgb(224,224,224) }
        TABLE { border: 1px outset; background-color: rgb(224,224,224) }
        HR { size: 1px; color: rgb(0,0,0) }
        body { color: rgb(0,0,0); background-color: white; font-family: Arial; font-size: 10pt; }
    </STYLE>
</HEAD>
<BODY>
<%
    ' Determine the page parameters
    Dim path, file,action, self
    If Request("Path").Count > 0 Then path = Request("Path")(1) Else path = ""
    If Request("File").Count > 0 Then file = Request("file")(1) Else file = ""
    
    action = 0
    If path <> "" Then action = 1
    If file <> "" Then action = 2
    
    self = Request.ServerVariables("SCRIPT_NAME")
    
    Dim main,f,dir,item, arr
    
    Set main = Server.CreateObject("newObjects.utilctls.SFMain")
    
    ' Some Functions and Subs
    Sub ShowDrives
        For Each item In main.Drives
            %><A HREF="<%= self %>?path=<%= item.DriveLetter & ":\" %>"><%= item.DriveLetter & ":\" %></A> <%
        Next
    End Sub
    Function SubPath(name)
        If Right(path,1) <> "\" Then path = path & "\"
        SubPath = path & name
    End Function
    Function StgPath(name)
        If path = "" Then 
            StgPath = name
        Else
            StgPath = path & "\" & name
        End If
    End Function

    Select Case action
        Case 0
            ShowDrives
            %>
            <HR>
            <P>This is quite simple example that uses Storages and Files (SF) objects to browse the file system.
            The directories are displayed as links with bold font, the normal files as text only and
            the OLE compound files as links with itallic font.
            </P>
            <P>
            The OLE compound files will open in new window. Note that they have more relaxed rules about the
            naming of the inner streams and storages thus some of them may cause errors. The SF objects are capable
            to open any storage and stream in them but this may require tunning of the access rights, more care about
            the names and so on, but this is beyound the bounds of this example.
            </P>
            <%
        Case 1
            ShowDrives
            Set dir = main.OpenDirectory(path,0)
            %>
                <HR>
                Current path: <%= path %><HR>
                <TABLE BORDER="0">
                <TR>
                    <TH>Name</TH>
                    <TH>Size</TH>
                    <TH>Last accessed</TH>
                    <TH>Created</TH>
                    <TH>Last modified</TH>
                </TR>
                <%
                    For Each item In dir.contents
                        %><TR><TD nowrap><%
                            If item.Type = 1 Then
                                %>
                                    <B><A HREF="<%= self %>?path=<%= Server.URLEncode(SubPath(Item.Name)) %>"><%= Item.Name %></A></B>
                                <%
                            ElseIf item.Type = 2 Then
                                If main.IsStorageFile(SubPath(Item.Name)) = 1 Then
                                %>
                                    <I><A TARGET="_blank" HREF="<%= self %>?file=<%= Server.URLEncode(SubPath(Item.Name)) %>"><%= Item.Name %></A></I>
                                <%
                                Else
                                %>
                                    <%= Item.Name %>
                                <%
                                End If
                            Else
                                %><%
                            End If
                        %></TD>
                        <TD nowrap><%= Item.Size %></TD>
                        <TD nowrap><%= Item.Accessed %></TD>
                        <TD nowrap><%= Item.Created %></TD>
                        <TD nowrap><%= Item.Modified %></TD>
                        </TR>
                        <%
                    Next
                %>
                </TABLE>
            <%
        Case 2
            Set f0 = main.OpenStorageFile(file,&H10)
            Set f = f0
            If path <> "" Then
                arr = Split(path,"\")
                'Err.Raise 1,"TEST", "ARR: " & arr(0)
                For I = LBound(arr) To UBound(arr)
                    Set f = f.OpenStorage(arr(I),&H10)
                Next
            End IF
            %>
            Storage file: <%= file %><HR>
            <TABLE BORDER="0">
                <TR>
                    <TH>Name</TH>
                    <TH>Size</TH>
                    <TH>Last accessed</TH>
                    <TH>Created</TH>
                    <TH>Last modified</TH>
                </TR>
                <%
                    For Each item In f.contents
                        %><TR><TD nowrap><%
                            If item.Type = 1 Then
                                %>
                                    <B><A HREF="<%= self %>?file=<%= Server.URLEncode(file) %>&path=<%= StgPath(Item.Name) %>"><%= Item.Name %></A></B>
                                <%
                            ElseIf item.Type = 2 Then
                                
                                %>
                                    <%= Item.Name %>
                                <%
                            Else
                                %><%
                            End If
                        %></TD>
                        <TD nowrap><%= Item.Size %></TD>
                        <TD nowrap><%= Item.Accessed %></TD>
                        <TD nowrap><%= Item.Created %></TD>
                        <TD nowrap><%= Item.Modified %></TD>
                        </TR>
                        <%
                    Next
                %>
                </TABLE>
            <%

    End Select
%>
</BODY>
</HTML>