' Windows Scripting Host example

If WScript.Arguments.length = 0 Then
    WSCript.Echo "Usage:"
    WSCript.Echo "cscript decrypt2.vbs -key <key> -alg <algorithm> -in <infile> "
    WSCript.Echo "                    -out <outfile>"
    WSCript.Echo "  <key>       - the decryption key as hexdecimal"
    WSCript.Echo "  <algorithm> - the decryption algorithm"
    WSCript.Echo "  <infile>    - the input file"
    WSCript.Echo "  <outfile>   - the output file."
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

If key = "" Or alg = "" Or infileName = "" Or outfileName = "" Then
    WScript.Echo "One of the required parameters is missing or empty"
    WScript.Echo "key=" & key
    WScript.Echo "alg=" & alg
    WScript.Echo "infile=" & infileName
End If

Set crypt   = CreateObject("newObjects.crypt.Symmetric")
Set sf      = CreateObject("newObjects.utilctls.SFMain")
Set sfbd    = CreateObject("newObjects.utilctls.SFBinaryData")

WScript.Echo "Input file: " & infileName
Set infile  = sf.OpenFile(infileName,&H40)
WScript.Echo "Output file: " & outfileName
Set outfile = sf.CreateFile(outfileName)

crypt.Init alg
crypt.Key = key

' The encrypted file contains the original file size in its first 4 bytes
' However we cannot read just 4 bytes because the block size can be bigger
' (usually is). So, to ensure we need to read entire block in a memory stream.
Set mem = sf.CreateMemoryStream
mem.WriteBin crypt.Decrypt(infile.ReadBin(crypt.BlockSize),False)
' Now use the binary data object to consume te size
sfbd.Size = 4
mem.Pos = 0
sfbd.Value = mem.ReadBin(4)
' Now get what we need and write the rest to the output
sfbd.ByteOrder = &H02
FileSize = sfbd.Unit(0,vbLong)
' Write the rest of the block to the output
mem.CopyTo outfile, crypt.BlockSize ' The number of bytes just needs to be bigger than the actual content
' mem is no longer needed lets dispose of it explicitly (not actually needed, 
' it will be freed as the script completes anyway.
Set mem = Nothing

' Decrypt the rest
Do
    chunk = infile.ReadBin(256)
    If Not infile.EOS Then
        bindata = crypt.Decrypt(chunk,False)
    Else
        bindata = crypt.Decrypt(chunk,True)
    End If
    ' Write to the output file
    outfile.WriteBin bindata
Loop While Not infile.EOS
' Truncate the output file to the size we read before
outfile.Size = FileSize
WScript.Echo "Done"

infile.Close
outfile.Close