<%
    ' Try to perform decryption. We will not check the correctness of the 
    ' request parameters, so if something is wrong this page will jus fail
    ' and no image will be shown
    
    ' Create a SFMain object
    Set sf = Server.CreateObject("newObjects.utilctls.SFMain")
    
    ' Open the encrypted file (read only)
    Set infile = sf.OpenFile(Server.MapPath("encrypted-image.bin"),&H40)
    
    ' Create the SFStreamCrypt object
    Set crypt = Server.CreateObject("newObjects.crypt.SFStreamCrypt")
        
    ' We will decrypt while writing it to a memory stream, thus we are going to use
    ' only the Write algorithm - so set up it. Set the algorithm        
    crypt.WriteAlgorithm = Request("Alg")
        
    ' Set the key. This will fail if the key is not the correct length for the
    ' selected algorithm
    crypt.WriteKey = Request("Key")
        
    ' Configure decryption on Write
    crypt.WriteDecrypt = True

    ' We will need to truncate the decrypted file to the right size. One of the simplest
    ' is to use temporary stream or file. It is not the most effective way, but in order to
    ' avoid the need to include in the example more objects lets use a memory stream
    Set mem = sf.CreateMemoryStream
    
    ' To make the decryption part of the file write operation we need to connect
    ' the SFStreamCrypt object with the memory stream and write through it. 
    ' Connect it
    Set crypt.Stream = mem
        
    ' In order to be able to write to the SFCryptStream we need to pack it into
    ' a SFStream object
    Set outstream = Server.CreateObject("newObjects.utilctls.SFStream")
    outstream.SetStream crypt
        
    ' And now read and write
    ' We need to read the entire file
    outstream.WriteBin infile.ReadBin(infile.Size)
        
    ' Finalize the decryption - i.e. tell the SFStreamCrypt there will be no
    ' more data.
    crypt.WriteFinalize
    
    ' Now we have everything decrypted, but remember we have 8 bytes our private data
    ' that contains the file size. We need to read it:
    Set bd = Server.CreateObject("newObjects.utilctls.SFBinaryData")
    mem.Pos = 0 ' Go to the beginning of the memory stream
    bd.Value = mem.ReadBin(8)
    ' And read the file size
    FileSize = bd.Unit(0,vbLong)
    
    ' Now we need to truncate the memory stream
    mem.Size = FileSize + 8 ' Adding the private size we used for storing the file size
    
    ' and send it to the browser
    mem.Pos = 8
    Response.ContentType = "image/gif"
    Response.BinaryWrite mem.ReadBin(mem.Size)
    
    ' Close everything
    mem.Close
    infile.Close
    ' The rest can be left to the automatic behaviour
%>
