Host.Clear
Host.WriteLine "JScript micro host sample"

' Enum command line parameters
Host.WriteLine "Param count: " & Host.ParameterCount(false)

for i = 1 To Host.ParameterCount(false)
    Host.WriteLine "Param" & i & "=" & Host.Parameter(i)
Next

Host.WriteLine "Sys Param count: " & Host.ParameterCount(true)

for i = 1 To Host.ParameterCount(true)
    Host.WriteLine "SysParam" & i & "=" & Host.SysParameter(i)
Next

Host.WriteLine "Asking for input"

Host.RequestInput "Enter something"

Sub OnInput(s)
    Host.WriteLine "You entered: " & s
    Host.Msg "And now exiting ... click ok"
    If s = "exit" Then Host.Exit
End Sub