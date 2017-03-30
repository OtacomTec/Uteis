Host.Clear();
Host.WriteLine("JScript micro host sample");

// Enum command line parameters
Host.WriteLine("Param count: " + Host.ParameterCount(false));
for (i = 1; i <= Host.ParameterCount(false);i++) {
    Host.WriteLine("Param" + i + "=" + Host.Parameter(i));
}
Host.WriteLine("Sys Param count: " + Host.ParameterCount(true));
for (i = 1; i <= Host.ParameterCount(true);i++) {
    Host.WriteLine("SysParam" + i + "=" + Host.SysParameter(i));
}

Host.WriteLine("Asking for input");

Host.RequestInput("Enter something");

function OnInput(s) {
    Host.WriteLine("You entered: " + s);
    Host.Msg("And now exiting ... click ok");
    if (s == "exit") Host.Exit();
}