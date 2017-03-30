<HTML>
<BODY>
<H4>Logical drives on this machine.</H4>
<%
    Set main = Server.CreateObject("newObjects.utilctls.SFMain")
    For Each drv In main.Drives
    %>
        <P>
            <%= drv.DriveLetter %>
            <BLOCKQUOTE>
                Type:<B> 
                <% 
                    Select Case drv.DriveType
                        Case 2
                            Response.Write "REMOVABLE"
                        Case 3
                            Response.Write "FIXED"
                        Case 4
                            Response.Write "REMOTE"
                        Case 5
                            Response.Write "CDROM"
                        Case 6
                            Response.Write "RAMDISK"
                        Case Else
                            Response.Write "(Unknown)"
                    End Select
                %></B><BR>
                File system: <%= drv.FileSystem %><BR>
                Free space: <%= drv.FreeSpace %><BR>
                Serial number: <%= drv.SerialNumber %><BR>
                Total size: <%= drv.TotalSize %><BR>
                Volume name: <%= drv.VolumeName %><BR>
            </BLOCKQUOTE>
        </P>
    <%
    Next
%>
</BODY>
</HTML>