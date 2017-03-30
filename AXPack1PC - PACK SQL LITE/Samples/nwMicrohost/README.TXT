newObjects MicroHost samples
~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Samples list
~~~~~~~~~~~~

Sample1:
    Illustrates the basic user input/output in the MicroHost.
    
Sample2:
    Shows a simple usage of some of the Storages and Files 
    objects. In this case a directory is listed. Also demonstrates 
    how to force MicroHost to close after completing the script.
    
ConfigFile-Read:
    Reads UDS data from a data file in text format (also known as
    text configruations). You can use similar technique for 
    configuration purposes in your programs instead of INI files
    which are not supported on the Windows CE platforms.
    
ConfigFile-ReadWrite:
    Like previous but also saves the data read from the textual data
    file to binary stream (in this case a file is used as target). Note
    that ConfigFile object is configured to use the wide string version
    of the binary format. This version of the binary UDS format is 
    guaranteed to preserve any data saved entirely (as stated by the UDS
    standards).
    
ConfigFile-ReadBin:
    This is like ConfigFile-Read but reads a binary file (for example the
    file created by the previous sample). You will see that wide string 
    binary format is set here but note that when reading this is not needed
    the binary format is autmatically recognized. Therefore this is just a 
    good habbit - to configure the object for the format you actually want to 
    use in order to avoid any human made mistakes if you decide to add some
    writing code at a later time.
    
Recordcreate:
    Creates a file with 10 records (by default the file is named rec.bin). Each
    record is configured as follows 1-st field contains long integer, 2-nd field
    contains 8 character max ANSI string. Illustrates sequential writing. An 
    alternative technique in DB-like manner will be more similar to the next 
    sample but will use AddNew to add new records.
    
Recordread:
    Reads the file created by the previous sample (note you may need to run the
    previous sample first in order to create the file if it does not exist). This
    sample illustrates DB-like navigation. An alternative method based on sequential
    reading will be similar to the previous sample but will use Read instead of Write.

ScriptThread:
    Start the controller.vbs. It creates a thread and runs the thread.vbs in it.

composite2:
    Illustrates how to build a simple composite object.
    
Notes
~~~~~

The name of the object ConfigFile is preserved from earlier versions. We will
add alias names for this object in order to make it easilly recognizeable as
an UDS manager for scripting. The data saved/read through this object can be
read/saved from/to different sources. The binary format is intended for 
communication between applications and machines. It keeps enough information
withing the data to allow simplified version and full version of the format to
coexist without problems. This means the receiver of the data do not need to 
know what kind of version of the format is comming. This fact allows simplified
version (which saves the strings ANSI) to be used wherever no locale sensitive
data is transferred. In many cases application configurations need only ASCII
characters and there is no need to presrve them in UNICODE. This saves size,
of course, but be careful anyway if you expect to need any multilanguage text
data better use the wide string version of the format from the very beginning.
For more information see in the NDL (newObjects Development Library).

Record based access samples: There are two general ways to access records in
a flat file. The first of them is to configure the record and then navigate like in
a DB using MoveFirst, MoveNext and the other Move/Update/Reread etc. methods.
The other way is sequential - opening the stream, binding to it and then use only
Read (or Write) methods - which read (write) the next record after the previous.
The both techniques have their areas of application. You can use them both on
seekable streams (like files, memory streams, streams in OLE files), but you can
use only sequential access on non-seekable streams - for example network connection
streams obtained from an external object.