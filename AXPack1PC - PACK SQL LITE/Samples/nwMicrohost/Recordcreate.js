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

var basepath = Host.RuntimeParameter("ScriptPath");

function OnInput(s) {
    var sf = Host.CreateObject("newObjects.utilctls.SFMain");
    var f = sf.CreateFile(s);
    var r = Host.CreateObject("newObjects.utilctls.SFRecord");
    r.AddField("F1", cvtLong);
    r.AddField("F2", cvtString, 8);
    r.BindTo(f);
    r.Filter.unicodeText = false;
    r.ReBind();
    r.MoveFirst();
    for (var i = 1; i <= 10; i++) {
      Host.WriteLine(i);
      r("F1").Value = Math.random() * 10000
      r("F2").Value = ("Value " + i);
      r.Write();
    }
    r.UnBind();
    f.Close();
    Host.WriteLine("A file containing 10 records has been created.");
}

Host.SetInput(basepath + "rec.bin");
Host.RequestInput("Output file");