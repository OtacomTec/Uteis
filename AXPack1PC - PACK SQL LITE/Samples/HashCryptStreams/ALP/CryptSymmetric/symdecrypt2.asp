<%
    ' Try to perform decryption. We will not check the correctness of the 
    ' request parameters, so if something is wrong this page will just fail
    ' and no image will be shown
    
    ' Create a SFMain object
    Set sf = Server.CreateObject("newObjects.utilctls.SFMain")
    
    ' Open the encrypted file (read only)
    Set infile = sf.OpenFile(Server.MapPath("encrypted-image.bin"),&H40)
    
    ' Create the Symmetric object
    Set crypt = Server.CreateObject("newObjects.crypt.Symmetric")
        
    ' Set the algorithm
    crypt.Init Request("Alg")
        
    ' Set the key. This will fail if the key is not the correct length for the
    ' selected algorithm
    crypt.Key = Request("Key")
        
    ' Get the original file size from the request so we can truncate the decrypted data to 
    ' the size of the original (used several lines below)
    FileSize = CLng(Request("Size"))
    
    ' We will need to truncate the decrypted file to the right size. 
    ' In this example we will use the SFBinaryData object
    Set bindata = Server.CreateObject("newObjects.utilctls.SFBinaryData")
    
    Response.ContentType = "image/gif"
    ' And now read and decrypt the file. Put the decrypted data into the SFBinaryData
    ' object. 
    chunkSize = 256
    While Not infile.EOS
        chunk = infile.ReadBin(chunkSize)
        If Not infile.EOS Then
            bindata.Value = crypt.Decrypt(chunk,False)
            FileSize = FileSize - bindata.Size
        Else
            ' While finalization is not necessary as long as the chunk size X times
            ' the algorithm block size it is better to use finalization in order to
            ' free ourselves from the responsibility to choose appropriate chunk size for
            ' each algorithm.
            bindata.Value = crypt.Decrypt(chunk,True)
            bindata.Size = FileSize
        End If
        ' ALP and IIS do not like empty values written in the output
        ' so we need to ensure they are not empty
        If bindata.Size Then Response.BinaryWrite bindata.Value    
    Wend
        
    ' Close everything
    infile.Close
    ' The rest can be left to the automatic behaviour
%>
