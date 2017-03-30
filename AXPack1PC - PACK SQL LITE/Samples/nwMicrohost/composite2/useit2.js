Host.Clear();
Host.WriteLine("Creating the composite object");
creator = Host.CreateObject("newObjects.utilctls.Pack1Creator");
MyObject = creator.CreateObject(Host.RuntimeParameter("ScriptPath") + "CompObj.cfg");
Host.WriteLine("Current value in MyProperty is: " + MyObject.MyProperty);

Host.RequestInput("Enter something")

function OnInput(s) {
    MyObject.MyProperty = s
    Host.WriteLine("We just set the MyProperty to: " + s);
    Host.WriteLine("Read it again: " + MyObject.MyProperty);
    Host.WriteLine("Call the MyFuntion again: " + MyObject.MyFunction("Test"));
    if (Host.Ask("Do it again?")) {
        Host.RequestInput("Enter something");
    }
}


