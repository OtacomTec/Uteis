<%
    If Request("Do").Count > 0 Then
        Set cfgObj = Server.CreateObject("newObjects.utilctls.ConfigFile")
        Set sf = Server.CreateObject("newObjects.utilctls.SFMain")
        Set binFile = sf.OpenFile(Server.MapPath(Request("BinFile")))
        Set cfg = cfgObj.ReadFromBinaryStream(binFile)
        cfgObj.Write Server.MapPath(Request("TxtFile")), cfg
    End If
%>
<HTML>
<BODY>
    <FORM METHOD="POST" ACTION="<%= Request.ServerVariables("SCRIPT_NAME") %>">
        Type file names only - the files will be read/created in the same directory (the asp file directory).
        <HR>
        Source file (binary): <INPUT TYPE="TEXT" NAME="BinFile" VALUE="sample.bin"><BR>
        Destination file (text config): <INPUT TYPE="TEXT" NAME="TxtFile" VALUE="sample1.cfg"><BR>
        <INPUT TYPE="SUBMIT" NAME="Do" VALUE="Transfer">
    </FORM>
    <HR>
    <A HREF="texttobin.asp">Go to Text to Bin conversion</A><BR>
    <A HREF="list.asp">Go to enumeration example</A><BR>
</BODY>
</HTML>