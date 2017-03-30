// Type constants (VBScript has then built-in - see vbXXX constants and VarType function)
    // Types supported by the SFField. SFRecord and SFFilter objects
    var     cvtEmpty                =   0;
    var     cvtByte                 =   17;
    var     cvtInteger              =   2;
    var     cvtLong                 =   3;
    var     cvtFloat                =   4;
    var     cvtDouble               =   5;
    var     cvtBoolean              =   11;
    var     cvtCurrency             =   6;
    var     cvtDate                 =   7;
    var     cvtString               =   8;
    var     cvtSByte                =   16;
    var     cvtUInteger             =   18;
    var     cvtULong                =   19;
    
var tc = Host.CreateObject("newObjects.utilctls.TypeConvertor");    

function GetTypeName(t) {
    switch(t) {
        case cvtLong:
            return "int";
        case cvtString:
            return "string";
        case cvtFloat:
            return "float";
        case cvtDouble:
            return "double";
        default:
            return "Unknown";
    }
}

function ListCfg(c,idnt) {
    var i;
    for(i = 1; i <= c.Count; i++) {
        if (typeof(c(i)) == "object") {
            if (c(i).Info.Type) {
                // Section
                Host.WriteLine(idnt + "{ " + c.Key(i) + ":");
                ListCfg(c(i), idnt + "  ");
                Host.WriteLine(idnt + "} " + c.Key(i) + ";");
            } else {
                // Record
                Host.WriteLine(idnt + c.Key(i) + "=");
                ListCfg(c(i), idnt + "  ");
            }
        } else {
            Host.WriteLine(idnt + "(" + GetTypeName(tc.VariantType(c(i))) + ") " + c(i));
        }
    }
}

function OnInput(s) {
    Host.Clear();
    var cf = Host.CreateObject("newObjects.utilctls.ConfigFile");
    Host.WriteLine("Reading file: " + s);
    var cfg = cf.Read(s);
    ListCfg(cfg, "  ");
    Host.WriteLine("Complete.");
}

Host.WriteLine(Host.RuntimeParameter("ScriptPath"));
Host.WriteLine(Host.RuntimeParameter("ScriptFile"));

Host.SetInput(Host.RuntimeParameter("ScriptPath") + "text.cfg");
Host.RequestInput("File to read");
