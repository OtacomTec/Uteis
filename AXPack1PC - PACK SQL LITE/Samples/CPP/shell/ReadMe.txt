newObjects ScriptManager2
Console example

NOTES
=====

This is a "raw" example - C++ program written from scratch. It uses
only the C++ helper classes.

WHAT THE EXAMPLE DOES
=====================

It loads by default the script.js located in the current directory
and then works as like a simple shell. There are two internal commands:
exit and reload.

exit - exits the program
reload - reloads the script.

Other commands that can be used are actualy the names of the functions
in the script. Shell passes command line parameters to the script routines
and displays the return result.

As an example you can use the cd command implemented in the script.js as
follows:

cd C:\

It changes the current directory. enter help on the command line to list the
commands in the sample script.

You can add more commands to the shell by editing the script.js and defining
there another functions. Then use reload command to reload the script.

Example (console.exe) can be started with command line parameters:

console.exe script_language script_file

For example you can write a VBScript command file (myfile.vbs) and start the
console:

console.exe VBScript myfile.vbs

JSCript is much more suitable for the example but VBScript can be used too. 
Functions must return a string that will be displayed by the console.