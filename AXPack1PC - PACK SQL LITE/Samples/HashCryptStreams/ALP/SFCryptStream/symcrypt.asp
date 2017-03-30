<%
    If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
        ' Try to perfrom encryption with the given parametes.
        ' Note that this example does not protect you from mistakes, it is intended to
        ' show how the SFStreamCrypt object is used. The real world applications
        ' typically stick to a particlar algrithm and key length. In this example
        ' you need to know what you are doing - check the documentation to see
        ' what keys can be be used with each algorithm.
        
        ' Create a SFMain object
        Set sf = Server.CreateObject("newObjects.utilctls.SFMain")
        
        ' Open the original image (read only)
        Set infile = sf.OpenFile(Server.MapPath("original-image.gif"),&H40)
        
        ' Create the SFStreamCrypt object
        Set crypt = Server.CreateObject("newObjects.crypt.SFStreamCrypt")
        
        ' We will encrypt while saving the file, thus we are going to use
        ' only the Write algorithm - so set up it. Set the algorithm        
        crypt.WriteAlgorithm = Request("Alg")
        
        ' Set the key. This will fail if the key is not the correct length for the
        ' selected algorithm
        crypt.WriteKey = Request("Key")
        
        ' By default the Write algorithm is configured for encryption, but
        ' we will specify this explicitly for the sake of the example.
        crypt.WriteDecrypt = False
        
        ' As the algorithms are working with fixed size blocks the result
        ' may not match the size of the encrypted data. Thus we need to know the
        ' original size when we are decrypting. To keep the things simple in the
        ' example we will only save the size in a variable and then pass it to the
        ' decrypting page. 
        FileSize = infile.Size
        
        ' Now open the output file
        Set outfile = sf.CreateFile(Server.MapPath("encrypted-image.bin"))
        
        ' To make the encryption part of the file write operation we need to connect
        ' the SFStreamCrypt object with the output file and write through it. 
        ' Connect it
        Set crypt.Stream = outfile
        
        ' In order to be able to write to the SFCryptStream we need to pack it into
        ' a SFStream object
        Set outstream = Server.CreateObject("newObjects.utilctls.SFStream")
        outstream.SetStream crypt
        
        ' And now read and write
        outstream.WriteBin infile.ReadBin(infile.Size)
        
        ' Finalize the encryption - i.e. tell the SFStreamCrypt there will be no
        ' more data.
        crypt.WriteFinalize
        
        ' Close everything
        outfile.Close
        infile.Close
        ' The rest can be left to the automatic behaviour
    End If
%>
<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>New Page 1</title>
</head>

<body>

<p>The original images:</p>
<p><img border="0" src="original-image.gif"></p>
<form method="POST" action="<%= Request.ServerVariables("SCRIPT_NAME") %>">
  <p>Algorithm: <select size="1" name="Alg">
    <option value="AES">AES</option>
    <option value="DES">DES</option>
  </select>Key: <input type="text" name="Key" size="28"> <input type="submit" value="Encrypt and Decrypt"><br>
  The above image will be encrypted and saved as encrypted-image.bin. An IMG
  element&nbsp; is placed below this form which refers to symdecrypt.asp which
  decrypts the file and returns it as binary data directly. Note that no image
  will appear if you are using the sample for the first time.<br>
  Enter the key as hexdecimal number. The length of the key is important and
  depends on the algorithm, open the HashCryptStreams documentation&nbsp; and
  see what key lengths are allowed for the algorithm you want to try. </p>
</form>
<p>The decrypted image:</p>
<p>
<IMG SRC="symdecrypt.asp?Key=<%= Request("Key") %>&Size=<%= FileSize %>&Alg=<%= Request("Alg") %>">
</p>

symdecrypt.asp?Key=<%= Request("Key") %>&Size=<%= FileSize %>&Alg=<%= Request("Alg") %>

</body>

</html>
