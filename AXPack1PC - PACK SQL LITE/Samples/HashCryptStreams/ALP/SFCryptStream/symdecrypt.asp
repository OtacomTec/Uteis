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
        
    ' We will decrypt while reading the file, thus we are going to use
    ' only the Read algorithm - so set up it. Set the algorithm        
    crypt.ReadAlgorithm = Request("Alg")
        
    ' Set the key. This will fail if the key is not the correct length for the
    ' selected algorithm
    crypt.ReadKey = Request("Key")
        
    ' By default the Read algorithm is configured for decryption, but
    ' we will specify this explicitly for the sake of the example.
    crypt.ReadDecrypt = True

    ' Get the original file size from the request
    FileSize = CLng(Request("Size"))
    
    ' We will need to truncate the decrypted file to the right size. One of the simplest
    ' is to use temporary stream or file. It is not the most effective way, but in order to
    ' avoid the need to include in the example more objects lets use a memory stream
    Set mem = sf.CreateMemoryStream
    
    ' To make the decryption part of the file read operation we need to connect
    ' the SFStreamCrypt object with the input file and read through it. 
    ' Connect it
    Set crypt.Stream = infile
        
    ' In order to be able to read from the SFCryptStream we need to pack it into
    ' a SFStream object
    Set instream = Server.CreateObject("newObjects.utilctls.SFStream")
    instream.SetStream crypt
        
    ' And now read and write
    ' We need to read the entire file
    mem.WriteBin instream.ReadBin(infile.Size)
        
    ' Finalize the decryption - i.e. tell the SFStreamCrypt there will be no
    ' more data.
    crypt.ReadFinalize
    
    ' After finalizing perform one more read operation in order to transfer any remaining data
    ' We must attempt to read at least blocksize bytes in order to be sure that all the
    ' remaining data will be read. In this case we just use value greater than the block size of all the
    ' algoriths involved.
    bin = instream.ReadBin(256)
    If Not IsEmpty(bin) Then
        mem.WriteBin bin
    End If
    ' Well, this sounds stupid doesn't it? However there is no other way to fit into the 
    ' stream abstraction which makes the decryption during reading operations not convenient.
    ' So, it would have been better to implement the decryption as Write operation in the 
    ' memory stream. The other example in this directory does exactly that - it is version of
    ' this one implemented using more convenient techniques. Actually the encrypted data matches the
    ' block size thus even without finalization we should have everything decrypted, but relyig
    ' on this can cause mistakes if we are not careful, so we do the above.
    
    ' Now we need to truncate the memory stream
    mem.Size = FileSize
    
    ' and send it to the browser
    mem.Pos = 0
    Response.ContentType = "image/gif"
    Response.BinaryWrite mem.ReadBin(mem.Size)
    
    ' Close everything
    mem.Close
    infile.Close
    ' The rest can be left to the automatic behaviour
%>
