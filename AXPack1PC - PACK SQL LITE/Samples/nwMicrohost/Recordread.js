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
    var f = sf.OpenFile(s,0x40);
    var r = Host.CreateObject("newObjects.utilctls.SFRecord");
    r.AddField("F1", cvtLong);
    r.AddField("F2", cvtString, 8);
    r.BindTo(f);
    r.Filter.unicodeText = false;
    r.ReBind();
    r.MoveFirst();
    while (!f.EOS) {
      Host.WriteLine(r("F2").Value + "=" + r("F1").Value);
      r.MoveNext();
    }
    r.UnBind();
    f.Close();
}

Host.SetInput(basepath + "rec.bin");
Host.RequestInput("Read file");