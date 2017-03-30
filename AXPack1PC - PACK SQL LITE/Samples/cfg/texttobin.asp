<%
    If Request("Do").Count > 0 Then
        Set cfgObj = Server.CreateObject("newObjects.utilctls.ConfigFile")
        Set cfg = cfgObj.Read(Server.MapPath(Request("TxtFile")))
        Set sf = Server.CreateObject("newObjects.utilctls.SFMain")
        Set binFile = sf.CreateFile(Server.MapPath(Request("BinFile")))
        cfgObj.WriteToBinaryStream binFile, cfg
    End If
%>
<HTML>
<BODY>
    <FORM METHOD="POST" ACTION="<%= Request.ServerVariables("SCRIPT_NAME") %>">
        Type file names only - the files will be read/created in the same directory (the asp file directory).
        <HR>
        Source file (text config): <INPUT TYPE="TEXT" NAME="TxtFile" VALUE="sample.cfg"><BR>
        Destination file (binary): <INPUT TYPE="TEXT" NAME="BinFile" VALUE="sample.bin"><BR>
        <INPUT TYPE="SUBMIT" NAME="Do" VALUE="Transfer">
    </FORM>
    <HR>
    <A HREF="bintotext.asp">Go to Bin to Text conversion</A>
    
</BODY>
</HTML>