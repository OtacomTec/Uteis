These files are supplied "AS IS" without any gurantee and promise for support.
You can use or modify them as needed. If you need to publish some of them 
changed/unchanged we will apprecate if you mention that the original came from us. 

These C++ helpers are supplied in order to help the C++ developers integrate
functionality of newObjects ActiveX Pack1 family components in their applications and
also to give the developers simple solution for dynamic automation usage (i.e.
non-static invocation of members through IDispatch interface) of any automation
enabled object.

OVERVIEW
~~~~~~~~

The C++ helper files in this directory cover two major areas and some misc. files:

1. Usage of COM automation features and scripting from an application:
    scpaggregateclnt.h
    scpaggregateclnt.cpp
    scphostclnt.h
    scphostclnt.cpp
    automationhlp.h
    automationhlp.cpp

2. Implementation of COM objects in applications:
    minicomimpl.h
    minicomimpl.cpp

3. Miscellaneous:
    a: ccRegKey.h - registry access classes (see the corresponding readme for more info)
    b: typeinfoex.h - for ATL applications only

USAGE
~~~~~

1. The files from 1 are hierarchy of 3 levels. You will need the file for the higher level
only - the others will be included implicitly. Thus you need to include the top .h file once
and include in the project the top .cpp file once.
NOTE! Review the include directives in the files! Depending on the way you want to use the 
files (in a common include directory or in certain project only) you may need to change them. 

The order in the hierarchy:
    - scpaggregate includes the rest
    - scphostclnt includes the automation helpers
    - automationhlp does not include anything else
    
2. The files from the minicom library will look familiar to the ATL programmers. However 
they supply only a little range of features and are at much lower level then ATL. In certain
situations (for example Windows CE 3.0) you may need something that will allow you implement
some COM classes in your EXE application and you may find that there is no ATL support
for this. In such cases this minicom library will give you something to begin with.
However this mini-library is for skilled C++ developers and is not recommended for developers
with little or no experience in extended usage of ATL.

3. typeinfoex.h Include it in the stdafx.h file of your ATL project. Then you can use it
instead of the standard TypeInfoHolder class. The benefit is that the resulting classes
will be able to work properly in dynamic environments (such as ALP autoruns) - the classes
in the module will try to load their type info from their resources first and only if this
fails they will check the regostry! The standard ATL implementation requires the classes to 
be registered with the system in order to expose functional automation functionality - with
this it is no longer needed. See the comments in the file for more information.

If you need to contact us mail to support@newobjects.com

Copyright 2001-2005 newObjects []