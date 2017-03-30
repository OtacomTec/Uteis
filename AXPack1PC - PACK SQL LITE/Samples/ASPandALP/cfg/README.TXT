This sample shows how to load a configuration, then save 
it to a different storage. The easiest way to run this 
sample is with Active Local Pages. See this URL:
http://www.newobjects.com/alp

Open texttobin.asp first and use sample.cfg as source or 
modify it (or prepare your own sample configration).
This page will save it to a binary file - in binary 
format. Then open the bintotext.asp to extract the binary
configuration to text file again.

Then you can take a look at the list.asp which shows
how to explore loaded configuration. as you can see the
ConfigFile component supports different storages - text
files, binary streams/files and registry.

