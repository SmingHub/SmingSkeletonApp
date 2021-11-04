Sming Skeleton Application
==========================

.. highlight:: text

This is a skeleton application based on Sming Framework (aka Sming). 
This application is meant to be used as a starting place for those looking to get their feet wet with Sming.

Getting Started
---------------

The first step is to install Sming on your computer.
If you haven't done this already take a look at the `Sming documentation <https://sming.readthedocs.io/en/latest/getting-started/index.html>`_.

After that go to the root folder of the skeleton application and type::

   make help
   
You should see a list of available commands. For example you can see the current configuration by typing::

   make list-config
   
Compiling the current application can be done using::

   make
	
If the commands above worked for you then you can start coding your first Sming application.
For better productivity we recommend the use of Integrated Development Environment (IDE). 
Read `here <https://sming.readthedocs.io/en/latest/tools/index.html>`_ to see which IDEs are supported.

Now is time to open app/applications.cpp and start adding code to it. 
If you don't know how to continue take a look at `our samples <https://github.com/SmingHub/Sming/tree/develop/samples>`_.
The samples are a great way to learn the API and brush up your C/C++ skills.

Directory Layout
----------------

We recommend you to adhere to the provided directory layout.
The current skeleton application contains the following layout::

   |_ Application/
      |_ Makefile                   Just includes project.mk. Use it as it is without any modifications
      |_ component.mk               Application-specific configuration
      |_ Kconfig                    Graphical menu configuration
       |_ app/                      Default application source directory
       |     |_ application.cpp     Contains the main application logic
       |_ include/                  Default application include directory
       |_ libs/                     Third-party libraries used by your application. These can be added either as git submodules or copied directly.
       |     |_ .patches            Contains patches to third-party libraries. Useful to patch code coming as git submodule.
       |_ src/                      Additional application code should land here
       |     |_ Arch/               Architecture specific code. 
       .       |_ Esp32/            For example code that is in ``src/Arch/Esp32`` will be used in the compilation only when
       .       |_ ...               the applications is compiled with ``SMING_ARCH=Esp32``
       |_ docs/                     Documentation
       |_ tests/                    Tests			
       |_ out/                      All generated shared files are written here
          |_ Esp8266/               The Architecture
          |  |_ debug/              The build type
          |  |  |_ build/           Intermediate object files
          |  |  |_ firmware/        Target output files
          |  |  |_ lib/             Generated libraries
          |  |  |_ tools/           Generated tools
          |  |_ release/
          |     |_ ...
          |_ Host
             |_ ...

Tests
-----

TBD ...

Documentation
-------------

TBD ...
 
