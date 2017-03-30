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
    
    ' And now read and decrypt the file. Put the decrypted data into the SFBinaryData
    ' object
    bindata.Value = crypt.Decrypt(infile.ReadBin(infile.Size))
        
    ' Truncate the data to the original size
    bindata.Size = FileSize
    
    ' And what remains to be done is send it back to the browser so it can be displayed.
    Response.ContentType = "image/gif"
    Response.BinaryWrite bindata.Value
    
    ' Close everything
    infile.Close
    ' The rest can be left to the automatic behaviour
%>
