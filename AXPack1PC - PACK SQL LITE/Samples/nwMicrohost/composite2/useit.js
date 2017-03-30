Host.Clear();
Host.WriteLine("Creating the composite object");
creator = Host.CreateObject("newObjects.utilctls.Pack1Creator");
MyObject = creator.CreateObject(Host.RuntimeParameter("ScriptPath") + "CompObj.cfg");
Host.WriteLine("Current value in MyProperty is: " + MyObject.MyProperty);
Host.WriteLine("Calling MyFunction with parameter \"Test\"");
Host.WriteLine("Result is: " + MyObject.MyFunction("Test"));
