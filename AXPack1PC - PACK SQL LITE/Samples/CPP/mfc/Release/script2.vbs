Dim arrX(50),arrY(50),arrR(50)
' Init the coordinates and sizes
Randomize
For I = 0 To 50
    arrX(I) = Int (Rnd(1) * 640 + 1)
    arrY(I) = Int (Rnd(1) * 480 + 1)
    arrR(I) = Int (Rnd(1) * 150 + 1)
Next

Sub DrawCircle(x,y,r)
    canvas.Ellipse x - r,y - r,x + r, y + r
End Sub

Sub DrawRect(x,y,r)
    canvas.Rect x - r,y - r,x + r, y + r
End Sub

Sub Draw (parameter)
    Dim I,X,Y,R
    canvas.lineWidth = 2
    For I = 0 To 50
        if I < 25 Then
            canvas.bgColor = vbYellow
            canvas.color = vbBlack
            DrawCircle arrX(I),arrY(I),arrR(I)
        Else
            canvas.bgColor = vbMagenta
            canvas.color = vbBlue
            DrawRect arrX(I),arrY(I),arrR(I)
        End If
    Next
    canvas.lineWidth = 4
    canvas.bgColor = vbWhite
    canvas.color = vbBlack
    canvas.Rect 5,5,408,50
    canvas.Write 10,10,"Sample script (VBScript)"
    canvas.Line 10,35,400,35
End Sub