// Printf realization
// Sample:
// WScript.Echo("%15l%10r%10r%10r%10r".format(new Array("NAME","TYPE","LENGTH","PRECISION","SCALE")) );
// Format description:
//  Use format string and attached format function.
//  Pass to it array of printed arguments
//  Format specifiers are:
//  %[width]align
//  width   - optional field width
//  align   - l or r - specifies text alignment
String.prototype.formatLength = function (n,left) {
    var str = "";
    var i;
    if (this.length < n) {
        if (left) {
            str += this;
            for (i = 0; i < (n - this.length); i ++) str += " ";            
        } else {
            for (i = 0; i < (n - this.length); i ++) str += " ";
            str += this;                        
        }
    } else {
        if (left) {
            str = this.slice(this.length-n-1,-1);    
        } else {
            str = this.slice(0,n-1);
        }
    }
    return str;
}
String.prototype.format = function(arrArgs) {
    var fmt = this;
    var re = /(%\d*[lr]{1})/gi;
    var reNum = /\d+/gi;
    var fmtParts = fmt.split(re);
    var fmtArgs = fmt.match(re);
    var nP = 0, nA = 0,nAFirst = 0;
    var str = "";
    var fmtArgWidth;
    var Width;
    var strTemp;
    
    if (fmtParts == null) fmtParts = new Array();
    if (fmtArgs == null) fmtArgs = new Array();    
    
    if (fmt.charAt(0) == "%") nAFirst = 1;
    while (nP < fmtArgs.length || nA < fmtParts.length) {
        if (nA < (nP + nAFirst)) {
            if (nA < fmtArgs.length) {
                 if (nA < arrArgs.length) {
                    fmtArgWidth = fmtArgs[nA].match(reNum);
                    if (fmtArgWidth != null) Width = new Number(fmtArgWidth[0]);
                    else Width = 0;
                    strTemp = new String(arrArgs[nA]);
                    if (fmtArgs[nA].charAt(fmtArgs[nA].length - 1) == "l") {
                        str += strTemp.formatLength(Width,true);
                    } else {
                        str += strTemp.formatLength(Width,false);                    
                    }
                 }
            }
            nA ++;
        } else {
            if (nP < fmtParts.length) {
                str += fmtParts[nP];
            }
            nP ++;
        }
    }
    return str;
}
function sprintf(str) {
	var arr = new Array();
	for (i = 1; i < sprintf.arguments.length; i++) {
		arr[arr.length] = sprintf.arguments[i];
	}
	return str.format(arr);
}


var fso = new ActiveXObject("Scripting.FileSystemObject");
var folder = fso.GetFolder(".");

function about() {
    return "Sample script shell 1.0";
}
function ver() { return about(); }
function pwd() {
    return (folder.Path);
}
function cd (f) {
    var i;
    var fld;
    switch (f) {
        case "..":
            folder = folder.ParentFolder
        break;
        case ".":
            // Do nothing
        break;
        default:
            // try subfolders
            try {
                fld = fso.GetFolder(folder.Path + "\\" + f);
                folder = fld
            } catch (e) {
                // Try absolute
                try {
                    fld = fso.GetFolder(f);
                    folder = fld;
                } catch (e) {
                    return ("Nonexistent folder:\n" + f);
                }
            }

    }
    return ("Current folder:\n" + folder.Path);
}
function ls(opt) {
    var  bFiles = true;
    var  bDirs = true;
    var  nType = 0;
    var  i;
    var  enm;
    var  item;
    var  str = "";
    if (opt != null) {
        if (opt.indexOf("d") >= 0) bFiles = false;
        if (opt.indexOf("f") >= 0) bDirs = false;
        if (opt.indexOf("s") >= 0) nType = 1;
    }
    var dt;

    switch (nType) {
        case 1:
            if (bFiles) {
                enm = new Enumerator(folder.Files);
                for (;!enm.atEnd(); enm.moveNext()) {
                    item = enm.item();
                    str += sprintf("%39l\n",item.Name);
                }
            }
            if (bDirs) {
                enm = new Enumerator(folder.SubFolders);
                for (;!enm.atEnd(); enm.moveNext()) {
                    item = enm.item();
                    str += sprintf("%39l\n",item.Name);
                }
            }
        break;
        default:
            if (bFiles) {
                enm = new Enumerator(folder.Files);
                for (;!enm.atEnd(); enm.moveNext()) {
                    item = enm.item();
                    dt = (new Date(item.DateLastModified)).toLocaleString();
                    str += sprintf("%25l %10r %20l %20l\n",item.Name,item.Size,item.Type,dt);
                }
            }
            if (bDirs) {
                enm = new Enumerator(folder.SubFolders);
                for (;!enm.atEnd(); enm.moveNext()) {
                    item = enm.item();
                    dt = (new Date(item.DateLastModified)).toLocaleString();
                    str += sprintf("%25l %10r %20l %20l\n","[" + item.Name + "]"," ",item.Type,dt);
                }
            }
    }
    return str;
}

function ld() {
    var s, n, t, e, x;
    e = new Enumerator(fso.Drives);
    s = "";
    for (; !e.atEnd(); e.moveNext())  {
        x = e.item();
        n = "";
        switch (x.DriveType) {
            case 0: t = "Unknown"; break;
            case 1: t = "Removable";
                if (x.IsReady) n = x.VolumeName;
                else n = "(not ready)";
                break;
            case 2: t = "Fixed"; 
                n = x.VolumeName;
                break;
            case 3: t = "Network"; 
                n = x.ShareName;
                break;
            case 4: t = "CD-ROM"; 
                if (x.IsReady) n = x.VolumeName;
                else n = "(not ready)";
                break;
            case 5: t = "RAM Disk"; break;
                
        }
        if (x.IsReady) {
            s += sprintf("%3l %10l %20l %15r %15r %8l\n",x.DriveLetter,t,n,x.TotalSize,x.FreeSpace,x.FileSystem);
        } else {
            s += sprintf("%3l %10l %20l\n",x.DriveLetter,t,n);
        }
    }
    return s;
}
function help() {
    var str = "";
    str += "pwd     Current directory\n";
    str += "ver     Version information (or about)\n";
    str += "cd      Change directory\n";
    str += "ls      List folder contents\n";
    str += "        options: f-files d-directories s-short\n";
    str += "        sample: ls ds\n";
    str += "ld      List drives\n";
    str += "help    Help information\n";
    str += "exit    Exit the shell\n";
    str += "reload  Reload script\n";

    return str;
}
