newObjects ScriptManager2 samples
MFC C++ Sample
=================================

NOTES
-----

Sample was built with MSVC 6.0. Just open the workspace and compile it. 
If you are going to modify some project settings keep precompiled headers
setting to "automatic" or don't use them.

PLAYING WITH THE SAMPLE
-----------------------

You can found sample scripts in the scripts subdirectory of the project. Form 
the edit menu choose "Set script" (or the right most toolbar button) and load 
a script. You can modify the script in-place and view what changes...

WHAT THE SAMPLE DOES
--------------------

It provides a document that supports automation and runs a script that uses it.
As a result - the script acts as like a simple metafile. In order to simplify
the sample major part of the code is in the document.

Document loads the script and provides a namespace called "canvas" to it. Script
must contain a function/Sub called "Draw". MFC View invokes it (through the 
document) on every onPaint message. This is a good illustration of the fact that
scripts (once loaded by the engine) are fast.


