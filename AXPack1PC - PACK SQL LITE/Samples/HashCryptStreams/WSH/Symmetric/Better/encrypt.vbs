' Windows Scripting Host example

If WScript.Arguments.length = 0 Then
    WSCript.Echo "Usage:"
    WSCript.Echo "cscript encrypt.vbs -key <key> -alg <algorithm> -in <infile> [-out <outfile>]"
    WSCript.Echo "  <key>       - the encryption key as hexdecimal"
    WSCript.Echo "  <algorithm> - the encryption algorithm"
    WSCript.Echo "  <infile>    - the input file"
    WSCript.Echo "  <outfile>   - the output file. If omitted infile.enc is created"
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

If key = "" Or alg = "" Or infileName = "" Then
    WScript.Echo "One of the required parameters is missing or empty"
    WScript.Echo "key=" & key
    WScript.Echo "alg=" & alg
    WScript.Echo "infile=" & infileName
End If
If outfileName = "" Then outfilename = infileName & ".enc"

Set crypt   = CreateObject("newObjects.crypt.Symmetric")
Set sf      = CreateObject("newObjects.utilctls.SFMain")
Set sfbd    = CreateObject("newObjects.utilctls.SFBinaryData")

WScript.Echo "Input file: " & infileName
Set infile  = sf.OpenFile(infileName,&H40)
WScript.Echo "Output file: " & outfileName
Set outfile = sf.CreateFile(outfileName)

crypt.Init alg
crypt.Key = key
crypt.PadType = -1

' Save the size of the input file first
' We use 4 byte field to hold an long integer (4 byte) number
' So allocate 4 bytes
sfbd.Size = 4
' Set a big enfdian byte order (not that little endian is bad ;)
sfbd.ByteOrder = &H02
sfbd.Unit(0,vbLong) = infile.Size
' Write it first in the output
outfile.WriteBin crypt.Encrypt(sfbd.Value,False)

' Encrypt the file
While Not infile.EOS
    chunk = infile.ReadBin(256)
    If Not infile.EOS Then
        cipher = crypt.Encrypt(chunk,False)
    Else
        cipher = crypt.Encrypt(chunk,True)
    End If
    ' Write to the output file
    outfile.WriteBin cipher    
Wend

WScript.Echo "Done"

infile.Close
outfile.Close