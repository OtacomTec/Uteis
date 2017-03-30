Host.Clear();
var sf;
sf = Host.CreateObject("newObjects.utilctls.SFMain");

function DoDir(s) {
    var d = sf.OpenDirectory(s);
    var c = d.contents;
    var i
    for (i = 1; i <= c.Count; i++) {
        Host.WriteLine(c(i).name + "\t" + c(i).type + "\t" + c(i).size);
    }
}

function OnInput(s) {
    DoDir(s);
    if (Host.Ask("List another directory?")) {
        Host.Clear();
        Host.RequestInput("Enter directory");
    } else {
        Host.Exit();
    }
}

OnInput("\\");