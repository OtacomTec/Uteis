Host.WriteLine "COMScriptThread sample"
' Create the objects we need
' The COMScriptThread object
Set st = Host.CreateObject("newObjects.utilctls.COMScriptThread")
' A SFMain object so we can read the script code for the 
' thread from a file
Set sf = Host.CreateObject("newObjects.utilctls.SFMain")
' Open the file with the script we will run in a thread
Set file = sf.OpenFile(Host.RuntimeParameter("ScriptPath") & "thread.vbs",&H40)
' Read the entire file
scriptText = file.ReadText(-2)
' Close it
Set file = Nothing

' We will use this variable to determine the state when an input from the user comes
Dim state
' For the sake of readability we will use text indicators
state = "Prepare" ' The next input will be parameter for action invocation

' Our thread is constructed to do its main work in a routine and not
' in the global part of the script. So, we can initialize it now and wait the 
' initialization to complete 

' Start the thread and wait up to 60 seconds for initialization
If st.Start("VBScript",scriptText,60000) Then
    ' Everything ok
    ' Now we should fill in the shared data the script will use
    Host.SetInput "10000"
    Host.RequestInput "Max number"
Else
    ' Fetch errors
    Host.WriteLine st.LastError
    Host.WriteLine "FAILURE"
End If

' Main work
Sub OnInput(str)
    Select Case state
        Case "Prepare"
            On Error Resume Next
            st("MaxNum") = CLng(str)
            If Err.Number <> 0 Then
                Host.WriteLine "You must enter an integer number bigger than zero"
                Host.RequestInput "Max number"
            Else
                On Error Goto 0
                If st.Execute("Calc") Then
                    Host.WriteLine "The calculation has been started."
                    state = "Wait" ' We will be waiting the thread to complete
                    Host.SetInput "Click the button to check the state of the calculation"
                    Host.RequestInput "Check state"
                Else
                    ' Error
                    Host.WriteLine st.LastError
                    st.Stop
                    ' Exiting ... no more actions scheduled
                End If
            End If
            On Error Goto 0
        Case "Wait"
            If st.Busy Then
                Host.Clear
                Host.WriteLine "The thread is still busy"
                Host.WriteLine "Current number is:" & st("Current")
                Host.WriteLine "Prime numbers found:" & st("PrimeCount")
                Host.SetInput "Click the button to check the state of the calculation"
                Host.RequestInput "Check state"
            Else
                If st.Success Then
                    ' Operation completed successfuly
                    Host.Clear
                    Host.WriteLine "Operation completed"
                    Host.WriteLine "Prime numbers found:" & st("PrimeCount")
                    state = "DoAgain"
                    Host.SetInput "Y"
                    Host.RequestInput "New calculation"
                Else
                    ' Error
                    Host.Clear
                    Host.WriteLine st.LastError
                    st.Stop
                End If
            End If
        Case "DoAgain"
            If UCase(str) = "Y" Then
                Host.SetInput st("MaxNum")
                Host.RequestInput "Max number"
                state = "Prepare"
            Else
                st.Stop
                ' No more actions - exiting
            End If
    End Select
End Sub
