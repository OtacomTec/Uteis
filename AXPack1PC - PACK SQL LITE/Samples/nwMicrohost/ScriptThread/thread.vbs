
Function CheckNum(n)
    Dim J
    For J = 2 To n - 1
        If (n Mod J) = 0 Then
            CheckNum = False
            Exit Function
        End If
    Next
    CheckNum = True
End Function
Sub Calc
    Dim MaxNum
    MaxNum = Context("MaxNum")
    Dim I
    Context("PrimeCount") = 0
    For I = 2 To MaxNum
        Context("Current") = I
        If CheckNum(I) Then
            Context("PrimeCount") = Context("PrimeCount") + 1
        End If
    Next
End Sub
