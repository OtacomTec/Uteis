newObjects ActiveX Pack 1 Family (AXPack1)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Version 2.5.0

This is an universal Readme.txt file for AXPack1. Depending on which
package you have downloaded some of the mentioned files may or may
not be present in it. As multiplatform ActiveX collection AXPack1
is available for download in many different froms. For the complete
list of the available downloads please go to:

http://www.newobjects.com/product.asp?Category=63&Story=317

There are currently 2 download packages with integrated setup for
the most popular platforms. One for Desktop PC only and another
for both Desktop PC and Pocket PC devices. The binaries for all the
other platfroms are available as ZIP files containing the DLL and
EXE files only. If you want to integrate AXPack1 or part of it
into the distribution packages of your application download one
or more (as needed) of these binary-only packages and include the
DLL/EXE files in your setup solution. All the DLL are self-register
COM DLL and the nwmicrohost.exe does not need any registration 
(just copy it). If you are currently looking for a setup solution
you may consider the light-weight ALPInstall which is free.

PC (Desktop) and Pocket PC INSTALLATION-s
Note: To start the pocket pc installation you must run it from:
Start menu/programs/newObjects/ActiveX Pack1/Install to Windows CE device
This is available only in the combined desktop/pocket pc distribution.

HOW TO INSTALL ON PLATFORMS FOR WHICH NO INSTALL IS SUPPLIED
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

AxPack1 can be installed manually with minimal effort. To do so
unpack and download (or unpack on the device) the binaries-only
ZIP appropriate for your device/pc in an empty directory on the
pc/device. Use a file manager to go to that directory and start
nwmicrohost.exe. Use "Register COM DLL" from its Tools menu to
register the DLL which you are going to use (if not sure - 
register them all). The pack can be installed anywhere - in the
main memory or on a memory card. Note that on Pocket PC you
must put it in a first level subdirectory because otherwise
you wont be able to browse to it and register the DLL-s (this
is because of the limitations of the Pocket PC system open file 
dialog).

DOCUMENTATION
~~~~~~~~~~~~~

The documentation is not included in any of the download packages.
You need to download it separately from:
http://www.newobjects.com/ndl


BRIEF OVERVIEW
~~~~~~~~~~~~~~

0. What's new
1. General notes
2. Inheritance and component list
3. Deployment
4. General notes
5. System requirements
6. Pocket PC/Windows CE notes
7. newObjects Microhost notes

0. What's new history
~~~~~~~~~~~~~~~~~~~~~
(August 2006)
    - SQLite3 COM - SQLite3 based embedded database engine and
        interface to it. Interesting features: Work with
        query parameters, parametrized Views and Triggers,
        faster than SQLite COM, smaller db file size ...
    - HashCryptStreams - the first version of cryptography and
        hash functions collection of components. Implements them
        as both stand-alone classes and Stream filters. Currently
        supported algorithms: Hash/HashMAC: MD5, SHA-1/256;
        Symmetric cryptography: DES, AES; Asymetric: RSA
    - Several little improvements to various classes in the
        AXPack1 core (newobjectspack1.dll).    

(February 2005)
    The most important changes are:
     - A new class - StringUtilities
     The AXPack1 now contains in separate DLL-s (included in 
     this download):
     - NetStreams - TCP/IP and IRDA communications
     - SQLite COM - Standa alone, zero-config, SQL compliant
       database engine.
    
    From now on the AXPack1 family is distributed as whole -
    all the DLL and EXE files are always packed together. If
    you are building an application that uses only part of them
    it is up to you to remove the unused DLL/EXE files from
    your application's installation/distribution. To keep the
    AXPack1 family intact we recommend you keep all of them
    as long as the size is not a concern. 
    
    The documentation is no longer included in this download, you
    must obtain it separately. This guarantees that it will be
    refreshed more frequently and will be able to include content
    suggested by other developers for a shorter time.
    Download it here:
    http://www.newobjects.com/product.asp?Category=68

(September 2004)
    Aside of a few insignificant improvements in the existing
    objects 4 new objects have been added. They are simple but
    may be very important in applications using threads and/or
    mixed applications - for example projects built in C++ that
    support script hosting for functionality extensions. So, the
    DLL most significant version values has not been increased.
    
    The new objects are: COMSleeper, Event, Mutex and Semaphore.
    
    Also a new library of the ActiveX Pack1 family has been 
    released - NetStreams:
    http://www.newobjects.com/product.asp?ID=67
    
    It is designed to work with ActiveX Pack1 to extend its
    abilities to network and IRDA connections. Thus one of the
    most popular features in the pack (file/stream access in 
    text, binary and record based modes) is now available also for
    networking.

(May 2004)
    Micro script host (PC and Pocket PC) is added to help 
    developers test scripts and perform scriptable tasks on
    Any Win32 platform using the same interface.

(December 2003)

    - COMScriptThread - easy to use way to run active scripts
     in separate thread. 
    - SFBinaryData - powerful management of binary data in memory
    - Composite components. Which provide the applications with
        ability to integrate scripts and other COM objects in one
        single object. The composites can be constructed dynamically
        or/and can be registered in the registry or/and described
        in definition files etc. (included)
    - Windows shell shortcuts manager (desktop versions only). 
    - Apartment/Thread objects. Create new thread or COM apartment
        from scripts and run/create components or scripts in it.
    - Version information extractor. 


1.General notes
~~~~~~~~~~~~~~~

This product is FREEWARE. You are free to incorporate it in
any application. Support is guaranteed only to customers
of newObjects commercial products that include these
components as integral part (currently ALP, ASP Compiler and
IE ScriptBar - see the site for more recent information).

The DLL files are installed on PC systems in the:
 Program files\Common files\newObjects\ActiveX 
directory and are registered with the system.

Please note that this collection of ActiveX components
is extended all the time. The documentation may not include
description of some of the latest components mentioned on
some news groups or in personal conversations.

It may be helpful to download the Active Local Pages 
(it includes this DLL too) where more samples can be found
with it (http://www.newobjects.com/alp). A few samples 
designed for the Micro Script Host (packed here) are available
to allow the developers start up even without any other active
script enabled tool available.

2.Inheritance:
~~~~~~~~~~~~~~

The AXPack1 core DLL includes and is offical form of distribution of
our former (prior 2003):
- ScriptManager2 component and DLL
- newObjectsCollections.dll
- Misc Utility activex DLL-s

Now many other components are included and they are all packed
togehter. This gives performance benefits and also lowers the
total size.

In the list below the platfoms for which the components are available
are also described.

Component list:
    
    AXPack1 core (newobjectspack1.dll):

	1. ConfigFile - manage structured data. Supports save/restore
	  to: Text files, Binary streams, Registry (PC,PocketPC,CE.NET)
	2. CustomLock - Custom synchronization  (PC,PocketPC,CE.NET)
	3. IniFile - Legacy ini files support. New applications should
	  prefer registry or other storages through ConfigFile (PC only)
	4. ScriptAggregate - Run active scripts in mixed languages as one (PC,PocketPC,CE.NET)
	5. ScriptManager2 - Run active scripts. (PC, PocketPC, CE.NET)
	6. SFDirStorage - IStorage support for FS directories (PC, PocketPC, CE.NET)
	7. SFDrive - System drives. (PC, PocketPC*, CE.NET*)
	8. SFField - works with SFRecord (PC,PocketPC, CE.NET)
	9. SFFileStream - Support for IStream for FS files. (PC, PocketPC, CE.NET)
	10.SFFilter - helper/translator for binary access to streams (PC, PocketPC, CE.NET)
	11.SFMain - Main Storages and files object. (PC,PocketPC*, CE.NET*)
	12.SFRecord - Record based/DB-like access to streams/files (PC, PocketPC, CE.NET)
	13.SFShellLink - Shell shortcuts manager (new) (PC)
	14.SFStorage - Storage wraper (abstract access to folder like objects) (PC,PocketPC, CE.NET)
	15.SFStream - Stream wraper (abstract access to file like objects) (PC,PocketPC, CE.NET)
	16.TypeConvertor - Type conversion and bit wise operations (PC, PocketPC, CE.NET)
	17.UtilStringList - String list collection (PC,PocketPC, CE.NET)
	18.VarDictionary - Universal collection/dictionary for structured data (PC,PocketPC, CE.NET)
	19.VaryDisp - Composite objects dynamic creator (new) (PC, PocketPC, CE.NET)
	20.VaryDispCreator - Composite objects creator from definition (new) (PC, PocketPC, CE.NET)
	21.COMThread - Execute methods/scripts in separate thread (PC, PocketPC**, CE.NET**)
	22.COMApartment - Create custom COM apartment (PC, PocketPC***, CE.NET***)
	23.Pack1Creator - Advanced COM object creation features (PC, PocketPC, CE.NET)
	24.SFBinaryData - Management of binary data in memory (PC, PocketPC, CE.NET)
	25.COMScriptThread - Run active scripts in separate thread in the background (PC, PocketPC, CE.NET)
	26.COMSleeper - Suspend a thread/application execution for som time (PC, Pocket PC, CE.NET)
	27.Event - Synchronization between threads and processes (PC, Pocket PC, CE.NET)
	28.Mutex - Synchronization between threads and processes (PC, Pocket PC, CE.NET)
	29.Semaphore - Synchronization and utilization limiting (PC, Pocket PC, CE.NET)
	30.StringUtilities - C library like string formatting and more (PC, Pocket PC, CE.NET)
	
	NetStreams library (NetStreams.DLL):
	
	1. NSMain - The library root, create the other components, host lookups etc. (PC, Pocket PC, CE.NET)
	2. SocketStream - Handles client or server end of IP or IRDA connection (PC, Pocket PC, CE.NET)
	3. SocketAddress - Represents node address - IP, IRDA, IPv6 (PC, Pocket PC, CE.NET)
	4. IRDADeviceInfo - Information about found IRDA device (PC, Pocket PC, CE.NET)
	5. SockOpt - Encapsulates socket option read/set to/from a SocketStream (PC, Pocket PC, CE.NET)
	6. SocketSelectHelper - Makes the socket state queries easier (PC, Pocket PC, CE.NET)
	
	SQLite COM database (SQLITECOMUTF8.DLL)
	
	1. SQLiteCOM - Implements the database engine and the interface to it (PC, Pocket PC, CE.NET)
	
	SQLite3 COM database (SQLITECOMUTF8.DLL)
	
	1. SQLite3COM - Implements the database engine and the interface to it (PC, Pocket PC, CE.NET)
	
	HashCryptStreams (HashCryptStreams.dll)
	
	1. HashObject - Hash and HMAC functions
	2. SFStreamDigest - Hash and HMAC stream filter
	3. Symmetric - Symmetric cryptography algorithms
	4. SFStreamCrypt - Symmetric cryptography algorithms stream filter
	5. RSA - RSA algorithm and key generation facilities
	6. Number - Big number arithmetics.
    
    nwmicrohost.exe (PC, Pocket PC, CE.NET):
    
	Micro Script Host - supports VBScript and JScript. Provides simple 
	interface for the hosted scripts - input/output. It supports the 
	same set of functinality on PC, Pocket PC and CE.NET. Note that the application
	itself is able to register/unregister COM DLL-s (See the Tools menu) and
	can be used to register manually COM DLL-s.
    

	Several supporting components are internal only - see documentation. They are returned
	by certain methods of other objects when needed.
	
	-------------
	* Windows CE versions of these components do not support all the features of
	the PC version because of the platform limitations 

	** On Windows CE can be used only for COM components not scripts

	*** On Windows CE it is more or less just a stub. Windows CE does not 
	support single threaded	COM apartments.


3.Deployment:
~~~~~~~~~~~~~

If you include AXPack1 DLL/EXE files in the distribution packages 
of your application please install them in the same directory as this
setup does. This will ensure each setup program will check
its version correctly. On Windows CE there is no standard 
installation directory. However it is recommended to use the 
Program files\AXPack1 directory if the space is not an 
issue (depends on the device architecture). All the files will 
work correctly from memory cards and other sotrage devices as well -
you can design your installations to put them wherever it is 
convenient for you.

4.Notes:
~~~~~~~~

Shortcuts to the samples and SDK directories will be created in 
the start menu. You will find a TLB and IDL files there. Usually
you will not need them because the type library is included in 
the DLL files themselves. The TLB can be used in C++ project
#import clauses.

There are script files with the constants used by the library
objects in the SDK directory. They are formatted for ASP but by
removing the ASP tags you can include/paste them in any other
VBScript or JScript environment.

All the components are ALPFrame compatible in autorun mode.
E.g. in contrast to the most ActiveX these libraries are self
dependent and load their type library information without
checking the registry. This allows building automation/scripting 
solutions without registering the DLL files on the local machine.
For more information see http://www.newobjects.com/alp and
ALPFrame topics in the ALP documentation.

5. System requirements
~~~~~~~~~~~~~~~~~~~~~~

PC Version:
	Windows 95 or later. On Windows 95 and NT4 IE4 should be
	already installed to allow full functionality.
	Note: The functionality required is in fact support
	for free-threaded COM apartments. IE comes also with
	the DCOM update (DCOM support is not a requirement, but
	without it some usage techniques may be unavailable).

Windows CE/CE.NET version:
	Windows CE 3.0 or later. Note that the DLL files for a
	given CE version are compatible with all the devices based 
	on it (for example CE 4.2 DLL-s will work on Pocket PC 2003
	and Smartphone 2003 and later). However the nwmicrohost.exe
	(Micro Script Host) is different in the different 
	distributions and adapted to the corresponding platform. 
	Therefore it is strongly recommended to download the version
	for the specific device even if the variation neutral DLL
	will do. For example the smartphones do not have touch 
	screens and the nwmicrohost.exe from the neutral packages
	will not be usable there - the smartphone editions contain
	different implementation of nwmicrohost.exe that uses the
	smartphone user interface. Similar is the situation with
	the Pocket PC where the special Pocket PC editions have
	nwmicrohost.exe optimized for Pocket PC platforms.

	Notice: There is currently no need of special Windows CE 5.0
	version - use the CE.NET 4.2 binaries on any Windows CE.NET. 
	To keep the number of the binaries as small as possible 
	special versions are issued only if necessary:
	- because of feature.
	- because of significant performance improvements.
	

Windows CE 2.11:
	Not officially supported. However AXPack1 can be (and is) compiled
	for most of the Windows CE 2.11 platforms - ask if you need such 
	binaries, they are not published on the WEB site anymore.
	
	Q: Why CE 2.11 and earlier is not officially supported?
	A: The COM support on CE 2.11 and earlier lacks some features
	    and is unstable in some specific cases. AXPack1 source
	    code contains conditional compilation directives that exclude
	    the missing features, but still, we cannot guarantee the
	    correct behavior of the components on Windows CE 2.11 and earlier.

6. Pocket PC/Windows CE notes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

By design the ActiveX Pack1 family is supposed to depend on core Windows 
components only. therefore it is compatible with the target platforms 
without need of any additional system updates. Considering the market 
situation we selected as base platform Windows CE 3.0 (for a support 
starting point). In fact over 99% of the CE devices used today use CE 3.0
 or later. Thus we obeyed the platform limitations and the main (default) 
version of the ActiveX Pack1 is built to support Windows CE 3.0 and later.

However later platforms and some OEM versions of the Windows CE support some 
of the desired features not available as core OS components on CE 3.0. So
we decided to support additional versions of the AXPack1 Family 
which are available as sperate downloads or on demand for those who want 
to use the pack on such devices. Additional versions are available for older 
OS versions (prior to CE 3.0) but without any support or guarantee. In Windows 
CE versions prior to 3.0 there are certain gaps in the COM support that make 
some features unavailable or unstable.  

How much the functionality is affected by the CE 3.0 limitations?
Almost all the features available on PC are supported. There are only a 
few features not available or implemented with some limitations - such as 
version info, shortcut management and advanced COM (no appartment threaded 
model is available on CE and apartments are used mostly in order to gain 
symbolic compatibility of the application with both desktop and CE devices).
The Standard SDK for CE.NET established a nice standard for all the CE.NET
based devices (except some rare variations with very sepcific application).
However the Standard SDK does not include Internet Explorer or the Shell 
libraries and a couple of rarely used other features as part of it. Thus the
features not available in it are not included in the standard binaries in order
to keep them compatible with ALL the Windows CE.NET devices. This concerns
only secondary features such as Shell link creation support, some special 
system path constants, the version information method in SFMain object and 
the IniFiles support (You can use ConfigFile for configuration purposes - 
it provides better features than the traditional INI files).

One example: There is no gurantee that version information API-s are available
 on Pocket PC 2000 while on Pocket PC 2002 they are already core part of the OS. 
The main version of the DLL will stick to Pocket PC 2000 but PPC 2002 
(and later) are available as separate download in which version information
is supported. Thus the main version will run on ALL the Pocket PC's beginning with
PPC 2000 while the advanced version is also available for those who develop 
software for newer versions of the OS only and will give them access to a few more 
features.

If you need a special version that includes some of the excluded features
for a specific hardware device you develop, please first make sure the 
corresponding OS features are included, then contact us for support. We may 
need the SDK generated by the Platform builder for your specific device 
in order to build special binaries for you.

7. nwmicrohost.exe
~~~~~~~~~~~~~~~~~~~

There is no standard OS supplied scripting host on Windows CE. Even on the
Desktop Windows OS-es the Windows Scripting Host is not always installed. 
This caused us to include a free minimal script host utility to allow the 
developers test scripts and perform some management tasks (administrative 
and other tasks using scripts).

The host supports exactly the same functionality on PC and CE and scripts
may run without changes on any supported platform as long as they depend
on core fetures and components available on each platform. For example if
certain script uses ActiveX pack1 family only - it will be able to do the 
same on any PC or CE device.

Copyright 2000-2006 newObjects []
This README file has been last reviewed on 14 Aug 2006


