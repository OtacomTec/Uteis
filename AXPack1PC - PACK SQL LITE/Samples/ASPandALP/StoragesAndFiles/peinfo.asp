<!-- #include file="naxp1vbs.asp" -->
<%

Class CPEInfo
    Private strm, f, logic
    Private PEOffset, OptionalHeader
    Private Sub Class_Terminate
        Set strm = Nothing
        Set f = Nothing
        PEOffset = 0
    End Sub
    
    ' Description/translation functions
    Function GetCPUType(l)
        Select Case l
            Case 0
                GetCPUType = "Unknown"
            Case &H014C
                GetCPUType = "i386"
            Case &H014D
                GetCPUType = "i486"
            Case &H014E
                GetCPUType = "i586"
            Case &H0162
                GetCPUType = "MIPS (R2000, R3000)"
            Case &H0163
                GetCPUType = "MIPS (R6000)"
            Case &H0166
                GetCPUType = "MIPS (R4000)"
            Case Else
                GetCPUType = "Unknown entry: " & Hex(l)
        End Select
    End Function
    Function GetFlagsMeaning(l)
        Dim str
        str = ""
        
        If logic.BitAnd(l,&H1) <> 0 Then str = str & " IMAGE_FILE_RELOCS_STRIPPED,"
        If logic.BitAnd(l,&H2) <> 0 Then str = str & " IMAGE_FILE_EXECUTABLE_IMAGE,"
        If logic.BitAnd(l,&H4) <> 0 Then str = str & " IMAGE_FILE_LINE_NUMS_STRIPPED,"
        If logic.BitAnd(l,&H8) <> 0 Then str = str & " IMAGE_FILE_LOCAL_SYMS_STRIPPED,"
        If logic.BitAnd(l,&H10) <> 0 Then str = str & "IMAGE_FILE_AGGRESIVE_WS_TRIM,"
        If logic.BitAnd(l,&H80) <> 0 Then str = str & "IMAGE_FILE_BYTES_REVERSED_LO,"
        If logic.BitAnd(l,&H100) <> 0 Then str = str & "IMAGE_FILE_32BIT_MACHINE,"
        If logic.BitAnd(l,&H200) <> 0 Then str = str & "IMAGE_FILE_DEBUG_STRIPPED,"
        If logic.BitAnd(l,&H400) <> 0 Then str = str & "IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP,"
        If logic.BitAnd(l,&H800) <> 0 Then str = str & "IMAGE_FILE_NET_RUN_FROM_SWAP,"
        If logic.BitAnd(l,&H1000) <> 0 Then str = str & "IMAGE_FILE_SYSTEM,"
        If logic.BitAnd(l,&H2000) <> 0 Then str = str & "IMAGE_FILE_DLL,"
        If logic.BitAnd(l,&H4000) <> 0 Then str = str & "IMAGE_FILE_UP_SYSTEM_ONLY,"
        
        If Right(str,1) = "," Then str = Left(str,Len(str)-1)
        GetFlagsMeaning = str
    End Function
    Function SubSystemName(l)
        Select Case l
            Case 1
                SubSystemName = "Native (driver)"
            Case 2
                SubSystemName = "Win32 GUI"
            Case 3
                SubSystemName = "Win32 Console"
            Case 5
                SubSystemName = "OS/2 Console"
            Case 7
                SubSystemName = "POSIX Console"
            Case Else
                SubSystemName = "Unknown value"
        End Select
    End Function
    
    Sub Open(fName)
        Set sf = CreateObject("newobjects.utilctls.SFMain")
        Set strm = sf.OpenFile(fName,cSFExR)
        Set f = CreateObject("newobjects.utilctls.SFFilter")
        f.unicodeText = False
        Set logic = Server.CreateObject("newObjects.utilctls.TypeConvertor")
        
        ' PE Header location
        strm.Pos = &H3C
        f.buffSize = 4
        f.Read strm
        PEOffset = f.GetVar(vbLong,1)
        OptionalHeader = PEOffset + 24
    End Sub
    
    Public Property Get PEHeaderOffset
        PEHeaderOffset = PEOffset
    End Property
    Public Property Get Signature
        f.buffSize = 4
        strm.Pos = PEOffset
        f.Read strm
        Signature = f.GetVar(vbString,4)
    End Property
    Public Property Get CPU
        strm.Pos = PEOffset + 4
        f.buffSize = 2
        f.Read strm
        CPU = f.GetVar(cvtInteger,1)
    End Property
    Public Property Get SectionsCount
        strm.Pos = PEOffset + 6
        f.buffSize = 2
        f.Read strm
        SectionsCount = f.GetVar(cvtInteger,1)
    End Property
    Public Property Get DateStamp
        strm.Pos = PEOffset + 8
        f.buffSize = 4
        f.Read strm
        DateStamp = f.GetVar(cvtLong,1)
    End Property
    Public Property Get RemainingHeaderBytes
        strm.Pos = PEOffset + 20
        f.buffSize = 2
        f.Read strm
        RemainingHeaderBytes = f.GetVar(cvtInteger,1)
    End Property
    Public Property Get Flags
        strm.Pos = PEOffset + 22
        f.buffSize = 2
        f.Read strm
        Flags = f.GetVar(cvtInteger,1)
    End Property
    Public Property Get LinkerMajor
        strm.Pos = OptionalHeader + 2
        f.buffSize = 1
        f.Read strm
        LinkerMajor = f.GetVar(cvtByte,1)
    End Property
    Public Property Get LinkerMinor
        strm.Pos = OptionalHeader + 3
        f.buffSize = 1
        f.Read strm
        LinkerMinor = f.GetVar(cvtByte,1)
    End Property
    Public Property Get Magic
        strm.Pos = OptionalHeader
        f.buffSize = 2
        f.Read strm
        Magic = f.GetVar(cvtInteger,1)
    End Property
    Public Property Get EntryPoint
        strm.Pos = OptionalHeader + 16
        f.buffSize = 4
        f.Read strm
        EntryPoint = f.GetVar(cvtLong,1)
    End Property
    Public Property Get ImageBase
        strm.Pos = OptionalHeader + 28
        f.buffSize = 4
        f.Read strm
        ImageBase = f.GetVar(cvtLong,1)
    End Property
    Public Property Get SectionAlignment
        strm.Pos = OptionalHeader + 32
        f.buffSize = 4
        f.Read strm
        SectionAlignment = f.GetVar(cvtLong,1)
    End Property
    Public Property Get FileAlignment
        strm.Pos = OptionalHeader + 36
        f.buffSize = 4
        f.Read strm
        FileAlignment = f.GetVar(cvtLong,1)
    End Property
    Public Property Get OSMajor
        strm.Pos = OptionalHeader + 40
        f.buffSize = 2
        f.Read strm
        OSMajor = f.GetVar(cvtInteger,1)
    End Property
    Public Property Get OSMinor
        strm.Pos = OptionalHeader + 42
        f.buffSize = 2
        f.Read strm
        OSMinor = f.GetVar(cvtInteger,1)
    End Property
    Public Property Get SubMajor
        strm.Pos = OptionalHeader + 48
        f.buffSize = 2
        f.Read strm
        SubMajor = f.GetVar(cvtInteger,1)
    End Property
    Public Property Get SubMinor
        strm.Pos = OptionalHeader + 50
        f.buffSize = 2
        f.Read strm
        SubMinor = f.GetVar(cvtInteger,1)
    End Property
    Public Property Get SizeOfImage
        strm.Pos = OptionalHeader + 56
        f.buffSize =4
        f.Read strm
        SizeOfImage = f.GetVar(cvtLong,1)
    End Property
    Public Property Get HeadSize
        strm.Pos = OptionalHeader + 60
        f.buffSize =4
        f.Read strm
        HeadSize = f.GetVar(cvtLong,1)
    End Property
    Public Property Get Checksum
        strm.Pos = OptionalHeader + 64
        f.buffSize = 4
        f.Read strm
        Checksum = f.GetVar(cvtLong,1)
    End Property
    Public Property Get SubSystem
        strm.Pos = OptionalHeader + 68
        f.buffSize = 2
        f.Read strm
        SubSystem = f.GetVar(cvtInteger,1)
    End Property
    Public Property Get ImportDirectoryStart
        strm.Pos = OptionalHeader + 70 + 2 + 32
        f.buffSize = 4
        f.Read strm
        ImportDirectoryStart = f.GetVar(cvtLong,1)
    End Property
    Public Property Get ImportDirectorySize
        strm.Pos = OptionalHeader + 70 + 2 + 32 + 4
        f.buffSize = 4
        f.Read strm
        ImportDirectorySize = f.GetVar(cvtLong,1)
    End Property
    
End Class    
    
%>
<HTML>
<BODY>
<FORM METHOD="GET" ACTION="<%= Request.ServerVariables("SCRIPT_NAME") %>">
    File: <INPUT TYPE="FILE" NAME="File"><BR>
    <INPUT TYPE="SUBMIT" VALUE="Info">
</FORM>
<%
    If Request("File").Count > 0 Then
        Set pe = New CPEInfo
        pe.Open Request("File")
        If pe.Signature <> "PE" Then
        %>
        Not a Portable Executable (PE)
        <%
        Else
            %>
            Header offset: <%= pe.PEHeaderOffset %><BR>
            Signature: <%= pe.Signature %><BR>
            CPU: <%= pe.GetCPUType(pe.CPU) %><BR>
            Sections: <%= pe.SectionsCount %><BR>
            Date stamp: <%= Hex(pe.DateStamp) %><BR>
            Remaining bytes in the header: <%= pe.RemainingHeaderBytes %><BR>
            Flags: <%= Hex(pe.Flags) %> (<%= pe.GetFlagsMeaning(pe.Flags) %>)<BR>
            Magic: <%= Hex(pe.Magic) %><BR>
            Linker: <%= pe.LinkerMajor & "." & pe.LinkerMinor %><BR>
            Entry Point (RVA): <%= Hex(pe.EntryPoint) %><BR>
            Image base: <%= Hex(pe.ImageBase) %><BR>
            Section alignment: <%= Hex(pe.SectionAlignment) %><BR>
            File alignment: <%= Hex(pe.FileAlignment) %><BR>
            OS version: <%= pe.OSMajor & "." & pe.OSMinor %><BR>
            Subsystem version: <%= pe.SubMajor & "." & pe.SubMinor %><BR>
            Size of image: <%= Hex(pe.SizeOfImage) %><BR>
            Headers size: <%= Hex(pe.HeadSize) %><BR>
            Cheksum: <%= Hex(pe.Checksum) %><BR>
            Subsystem: <%= pe.SubSystem & "," & pe.SubSystemName(pe.SubSystem) %><BR>
            ImpDir address: <%= Hex(pe.ImportDirectoryStart) %><BR>
            ImpDir size: <%= Hex(pe.ImportDirectorySize) %><BR>
        <%        
        End If
    End If
%>
</BODY>
</HTML>