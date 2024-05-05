READ_ME.txt for:
Structured Computer Organization 6th Edition
By Andrew S. Tanenbaum and Todd Austin
ISBN: 0-13-291652-3
Copyright 2013 Pearson Education, Inc. All rights reserved.

--------------------------------------------------------------------------------

SYSTEM REQUIREMENTS:

Below is a list of Minimum System Requirements to run these applications. 

* To use the software supplied on this CD, you need to have 
   - A Pentium II 450-MHz  (or faster) processor
   - One of the following operating systems: 
    
      Microsoft(R) Windows(R)
        * XP Professional
        * XP Home Edition
        * XP Media Center Edition
        * 2000 Professional (SP3 or later required for installation)

      Linux on an x86 platform

      SPARC/Solaris (e.g., big endian) platforms
        * Solaris 10

      Macintosh
        * OS X 10.8

* 256 MB RAM
* 10 MB of available hard-disk space
* Screen Resolution 800 x 600 (minimum)
* Sun's Java(TM) JRE 1.4 or later (only required if the Mic-1 software is installed)

--------------------------------------------------------------------------------

CONTENTS OF THIS ZIP FILE

After you unzip the tanenbaum_sco6.zip file, you should see the following
directories and files:

* 8088_tra	(contains the 8088 assembler and tracer)
* Mic1MMV	(contains the Mic1 simulator)
* READ_ME.txt	(this file)

1. 8088 ASSEMBLER AND TRACER TOOLKIT

The 8088_tracer directory contains the 8088 Assembler and Tracer 
Toolkit, consisting of an assembler, simulator, and tracer for the Intel 
8088 family of processors. This toolkit is designed to teach the 
rudiments of assembly language programming. It has been carefully 
designed for educational use, and has been tested in classes for over 10 
years. No previous experience with assembly language programming 
is needed to use it. 

Using this toolkit, you can assemble x86 assembly language programs 
you have written, and then run the resulting binary programs on the 
included tracer (interpreter). Using the tracer, you can step through 
your programs one line at a time, run them to specific breakpoints, and 
perform other tasks to debug your programs and learn how the 8088 
processor works. 

The directory contains subdirectories that include versions of the 
software designed to work on the following platforms as follow:

* linux:	  Intel/Linux on x86 platforms
* windows:	  Microsoft Windows XP on x86 platforms
* solaris:	  Solaris on Sun SPARC platforms
* mac:		  OS X 10.8

Each of these directories has a READ_ME.txt file describing how to set it up.


2. MIC-1 MMV SIMULATION ENVIRONMENT

Mic-1 MMV is a program that provides a simulation environment for 
the Mic-1 machine discussed in Chapter 4. It is designed to show how 
one could implement a subset of JVM using microcode, as described 
in great detail in Chapter 4. 

Mic-1 MMV allows users to assemble IJVM programs and run them at 
various speeds, ranging from 1/4 of the clock cycle to nonstop. A 
graphical user interface shows what is happening in great detail, both 
at the IJVM level and at the microcode level. Users can also modify 
the microcode and test it. 

This software is written in Java and should run on any Java platform. It 
is highly graphical in nature, has a sophisticated user interface, and 
comes with extensive built-in documentation. To install it, copy the entire
Mic1MMV directory to your hard disk and then see the README.txt 
file contained in it for further instructions. 

This software was written by Richard M. Salter of Oberlin College, 
building on previous work by Ray Ontko. Any updates to Mic-1 MMV
will be available at: 

Important Note: The Mic-1 MMV SIMULATOR (V. 2.0) is licensed under the 
GNU General Public License, Version 2, June 1991. You can find the license 
in the following location on this CD-ROM: \Mic1MMV\lib\gnu.txt. 
Please review the license terms prior to installing the software. 

