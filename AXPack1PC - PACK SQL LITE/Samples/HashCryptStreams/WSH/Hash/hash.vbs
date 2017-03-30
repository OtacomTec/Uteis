
Function Main(errText)
    Dim I
    
    Main = False
    
    Dim alg, isFile, hSrc, hKey, hash, supOutput, dataMode
    isFile = False
    supOutput = False
    dataMode = "ANSI"
    
    Dim arg, su, sf, h
    
    Set su = CreateObject("newObjects.utilctls.StringUtilities")
    Set sf = CreateObject("newObjects.utilctls.SFMain")
    
    For I = 0 To WScript.Arguments.Count - 1
        arg = WScript.Arguments(I)
        Select Case Left(UCase(arg),2)
            Case "-A"
                I = I + 1
                alg = WScript.Arguments(I)
            Case "-F"
                isFile = True
                I = I + 1
                hSrc = WScript.Arguments(I)
            Case "-K"
                I = I + 1
                hKey = WScript.Arguments(I)
            Case "-X"
                I = I + 1
                hKey = su.HexToBin(WScript.Arguments(I))
            Case "-S"
                supOutput = True
            Case "-U"
                dataMode = "Unicode"
            Case "-B"
                dataMode = "Binary"
            Case Else
                If Not isFile Then
                    If IsEmpty(hSrc) Then
                        hSrc = WScript.Arguments(I)
                    Else
                        errText = "Input data has been already specified."
                        Exit Function
                    End If
                Else
                    errText = "Unexpected argument."
                    Exit Function
                End If
        End Select
    Next
    
    Set h = CreateObject("newObjects.crypt.HashObject")
    
    If IsEmpty(alg) Then
        errText = "Hash algorithm not specified (see -A option)."
        Exit Function
    End If
    
    h.InitHash alg
    
    If Not IsEmpty(hKey) Then
        h.Key = hKey
    End If
    
    If IsEmpty(hSrc) Then
        errText = "Input data not specified."
        Exit Function
    End If
    
    If isFile Then
        Dim file
        Set file = sf.OpenFile(hSrc,&H40)
        Select Case dataMode
            Case "ANSI"
                file.unicodeText = False
                While Not file.EOS
                    h.HashUpdate file.ReadText(256), 0
                Wend
            Case "Unicode"
                file.unicodeText = True
                While Not file.EOS
                    h.HashUpdate file.ReadText(256), -1
                Wend
            Case "Binary"
                While Not file.EOS
                    h.HashUpdate file.ReadBin(256)
                Wend
        End Select    
    Else
        Select Case dataMode
            Case "ANSI"
                h.HashUpdate hSrc, 0
            Case "Unicode"
                h.HashUpdate hSrc, -1
            Case "Binary"
                h.HashUpdate su.HexToBin(hSrc)
        End Select    
    End If        
    
    h.HashFinalize
    
    errText = h.Value
    Main = True
End Function

Dim d

If Main(d) Then
    WScript.Echo d
Else
    Wscript.Echo "Error: " & d
    
    WScript.Echo ""
    WScript.Echo "Usage:"
    WScript.Echo "cscript hash.vbs -A <alg> [-K | -X <key>] [-U | -B] [-S] -F <file> | <data>"
    WScript.Echo "  <alg> - Algorithm name (MD5, SHA1, SHA256 etc.)"
    WScript.Echo "  -K <key> - key specified as string"
    WScript.Echo "  -X <key> - binary key specified as hex string"
    WScript.Echo "  -U - The data/file is processed as UNICODE"
    WScript.Echo "  -B - The data/file is processed as Binary data"
    WScript.Echo "  -F <file> - input file"
    WScript.Echo "  <data> - inline data"
    WScript.Echo ""
    WScript.Echo "  By default the data is processed as ANSI text, if nor -U, nor -B is specified."
    WScript.Echo "  If key is specified HMAC is generated, if no key is specified the hash of the"
    WScript.Echo "  input data/file is generated."
End If
