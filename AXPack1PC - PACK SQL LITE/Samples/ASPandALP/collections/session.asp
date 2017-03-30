<%
    If Request("Clear").Count > 0 Then
        Session.Abandon
    End If

    If Not IsObject(Session("MyWords")) Then
        ' If there is no object there we will create one.
        ' We are creating the free-threaded version because of the ASP session requirements
        Set Session("MyWords") = Server.CreateObject("newObjects.utilctls.VarDictionary.free")
        ' We want to be able to add unnamed elements
        Session("MyWords").allowUnnamedValues = True
        ' And also it will be convenient to enumerate the values instead of their names (if
        ' we are going to use innamed values ... )
        Session("MyWords").enumItems = True
    End If
    
    If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
        Session("MyWords").Add "", Request("AWord")
    End If
    
%>
<html>

<head>
<title>VarDictionary</title>
</head>

<body>

<form method="POST" action="<%= Request.ServerVariables("SCRIPT_NAME") %>">
  <p>Write something and click add.</p>
  <p><input type="text" name="AWord" size="20"><input type="submit" value="Add"></p>
</form>
<A HREF="<%= Request.ServerVariables("SCRIPT_NAME") %>">Refresh</A> | 
<A HREF="<%= Request.ServerVariables("SCRIPT_NAME") %>?Clear=1">Clear</A>
<hr>
The values will be collected in a VarDictionary collection in the ASP Session. Here is the list:
<hr>
<% For Each I In Session("MyWords") %>
    <%= I %><BR>
<% Next %>
</body>
</html>
