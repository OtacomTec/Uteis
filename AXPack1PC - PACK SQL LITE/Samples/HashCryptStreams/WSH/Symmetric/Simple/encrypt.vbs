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

WScript.Echo "Input file: " & infileName
Set infile  = sf.OpenFile(infileName,&H40)
WScript.Echo "Output file: " & outfileName
Set outfile = sf.CreateFile(outfileName)

crypt.Init alg
crypt.Key = key
crypt.PadType = 0

' Do it in a single step
outfile.WriteBin crypt.Encrypt(infile.ReadBin(infile.Size))

WScript.Echo "Done"
WScript.Echo "Original file size: " & infile.Size
outfile.Close
Set outfile = sf.OpenFile(outfileName,&H40)
WScript.Echo "Encrypted file size: " & outfile.Size
WScript.Echo "  When decrypting you need to pass original size to the decrypting utility."

infile.Close
outfile.Close