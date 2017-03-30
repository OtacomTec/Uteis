' Windows Scripting Host example

If WScript.Arguments.length = 0 Then
    WSCript.Echo "Usage:"
    WSCript.Echo "cscript decrypt.vbs -key <key> -alg <algorithm> -in <infile> "
    WSCript.Echo "                    -out <outfile> [-size <origsize>]"
    WSCript.Echo "  <key>       - the decryption key as hexdecimal"
    WSCript.Echo "  <algorithm> - the decryption algorithm"
    WSCript.Echo "  <infile>    - the input file"
    WSCript.Echo "  <outfile>   - the output file."
    WSCript.Echo "  <origsize>  - the original size to which to truncate the result."
    WScript.Quit
End If

' Utilitiy routines

    ' Get param by name
    Function GetCmdLineParam(ParamName)
        Dim I
        For I = 0 To WScript.Arguments.length - 1
            If "-" & UCase(ParamName) = UCase(WScript.Arguments(I)) Or _
                "/" & UCase(ParamName) = UCase(WScript.Arguments(I)) Then
                    If I >= WScript.Arguments.length - 1 Then
                        WScript.Echo "-" & ParamName & " requires value"
                        WScript.Quit
                    End If
                    GetCmdLineParam = WScript.Arguments(I + 1)
                    Exit Function
            End If                
        Next
        GetCmdLineParam = ""
    End Function


' Collect the parameters from the command line arguments
key         = GetCmdLineParam("key")
alg         = GetCmdLineParam("alg")
infileName  = GetCmdLineParam("in")
outfileName = GetCmdLineParam("out")
origSize    = GetCmdLineParam("size")

If key = "" Or alg = "" Or infileName = "" Or outfileName = "" Then
    WScript.Echo "One of the required parameters is missing or empty"
    WScript.Echo "key=" & key
    WScript.Echo "alg=" & alg
    WScript.Echo "infile=" & infileName
End If
If origSize = "" Then 
    origSize = 0
Else
    origSize = CLng(origSize)
End If


Set crypt   = CreateObject("newObjects.crypt.Symmetric")
Set sf      = CreateObject("newObjects.utilctls.SFMain")

Set infile  = sf.OpenFile(infileName,&H40)
Set outfile = sf.CreateFile(outfileName)

crypt.Init alg
crypt.Key = key

' Do it in single step
outfile.WriteBin crypt.Decrypt(infile.ReadBin(infile.Size))
If origSize <> 0 Then
    outfile.Size = origSize
    WScript.Echo "Output fille has been truncated to: " & origSize & " bytes"
End If
WScript.Echo "Done"

infile.Close
outfile.Close