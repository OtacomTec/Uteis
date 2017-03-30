<%
    If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
        ' Try to perfrom encryption with the given parametes.
        ' Note that this example does not protect you from mistakes, it is intended to
        ' show how the Symmetric object is used. The real world applications
        ' typically stick to a particlar algorithm and key length. In this example
        ' you need to know what you are doing - check the documentation to see
        ' what keys can be be used with each algorithm.
        
        ' I. Create the objects we will use, configure them and open the files.
        ' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
        ' Create a SFMain object
        Set sf = Server.CreateObject("newObjects.utilctls.SFMain")
        
        ' Open the original image (read only)
        Set infile = sf.OpenFile(Server.MapPath("original-image.gif"),&H40)
        
        ' Create the Symmetric object
        Set crypt = Server.CreateObject("newObjects.crypt.Symmetric")
        
        ' Set the algorithm
        crypt.Init Request("Alg")
        
        ' Set the key. This will fail if the key is not the correct length for the
        ' selected algorithm
        crypt.Key = Request("Key")
        
        ' Set padding type
        crypt.PadType = -1 ' Random bytes to fill the block - you can change that
        ' Note: This sample uses automatic padding. However some developers will
        ' prefer to do this themselves.
        
        ' As the algorithms are working with fixed size blocks the result
        ' may not match the size of the encrypted data. Thus we need to know the
        ' original size when we are decrypting. To keep the things simple in the
        ' example we will only save the size in a variable and then pass it to the
        ' decrypting page (see the IMG tag in the HTML code below)
        FileSize = infile.Size
        
        ' Now open the output file
        Set outfile = sf.CreateFile(Server.MapPath("encrypted-image.bin"))
        
        ' II. Perform the encryption
        ' ~~~~~~~~~~~~~~~~~~~~~~~~~~
        
        ' And now perform the encryption in a cycle passing chunks of data each time.
        While Not infile.EOS
            chunk = infile.ReadBin(256)
            If Not infile.EOS Then
                ' Do not finalize encryption until the last chunk of data
                cipher = crypt.Encrypt(chunk,False)
            Else
                ' This is the last chunk of data - finalize so that the
                ' last block can be padded (see the PadType above)
                cipher = crypt.Encrypt(chunk,True)
            End If
            ' Write to the output file
            outfile.WriteBin cipher    
        Wend
        
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
  see what key lengths are allowed for the algorithm you want to try.</p>
</form>
<p>The decrypted image:</p>
<p>
<IMG SRC="symdecrypt2.asp?Key=<%= Request("Key") %>&Size=<%= FileSize %>&Alg=<%= Request("Alg") %>">
</p>

symdecrypt2.asp?Key=<%= Request("Key") %>&Size=<%= FileSize %>&Alg=<%= Request("Alg") %>

</body>

</html>
