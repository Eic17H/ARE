GETTING STARTED WITH THE 8088 ASSEMBLER AND TRACER TOOLKIT FOR 32-BIT WINDOWS XP

I. PLACING THE FILES

Unzip the distribution zip file to a directory (folder) on Windows, for
example, c:\sco. 

You are going to need the command prompt now, so locate and start it:

        Click Start > Programs > Accessories > Command Prompt.

If you find the default prompt string too long, type:

        prompt win: 

to change it to win:, but any other string will do as well.

To get to the windows distribution, type:

        cd c:\sco\8088_tra

Note that Windows uses backslash to separate the components of the path name, whereas
UNIX systems use slash.

To see what is there, type:

        dir

You should see the following directories:

* .
* ..
* as_src
* bin
* examples
* exercises
* trce_src

You should also see these files:

* asinstal.bat
* READ_ME.txt
* release.txt
* syscalnr.h  


II. CONFIGURING YOUR SYSTEM

In this part of the installation process, you make sure Windows' ansi.sys driver is 
available to the 8088 Assembler and Tracer Toolkit. To do so, you must first
locate ansi.sys, and then locate and (possibly) edit another file named config.nt. 
Follow these steps:

1. Locate ansi.sys using Windows' file search feature. For example, in Windows XP,
   click Start > Search > For Files and directories. Make a note of where you found ansi.sys. 

2. Locate config.nt, and open it with a text editor such as Notepad. (Do NOT use 
   a word processor such as Word, which would add formatting that would prevent 
   the file from being read properly.).

   On many systems, config.nt will be in the same directory as ansi.sys. If not, you can 
   find it with Windows' file search feature. 

3. In config.nt, look for a line containing a device indication command that directs
   Windows to look for the ansi.sys file in the location you found it. Depending on 
   your system, the line may resemble one of these examples:

       device=%SystemRoot%\system32\ansi.sys
   or 
       device=%SystemRoot%\system32\ansi.sys
   or
       device=%SystemRoot%\system\ansi.sys

4. If no such line appears, add one, in the following format:

       device=c:\??????\ansi.sys

   (where ?????? is replaced by the path name where ansi.sys appears on your system)

5. Save the config.nt file.

6. Reboot your computer and open the command window again.


III. TESTING YOUR CONFIGURATION

1. Change to the examples directory with

        cd c:\sco\8088_tra\windows\examples

   You can verify where you are by typing just cd (with no argument). This is equivalent
   to the UNIX pwd command.

2. Run the first example program. Type: 

	t88 HlloWrld

3. You should see the x86 registers in the upper left corner of the screen.
   You should see the source program on the right. The arrow should be
   pointing to the instruction: 

        MOV CX,de-hw

4. Hit the Enter (or Return) key. The arrow should move to the next
   instruction:
  
        PUSH CX

5. Hit Enter five more times. Each time the arrow advances to the next
   instruction. After the fifth hit, text should appear in the output
   window, which is below the registers and program code. It should say:

        Hello World
   or
        Hello World\n

6. Hit Enter five more times. The tracer will exit and you should get a
   command prompt.

7. If this appears, it looks like everything is working. You are ready
   to use this tool. See Appendix C.8 in the book for more examples.

IV. USING THE 8088 ASSEMBLER AND TRACER TOOLKIT

A. INTRODUCTION

This section contains notes intended to help you quickly begin working with
the 8088 Assembler and Tracer Toolkit. For more detailed instructions,
please see Appendix C of the book. 

Now go back up one level by typing:

        cd ..

Here you will find five directories. Their contents are as follows:

* as_src      Source code for the assembler
* bin	      The Linux executable programs as88, s88, and t88
* examples    Example programs with source and executables
	      For your convenience, as88, s88, and t88 are copied here
* exercises   Some programs you can learn from: deskcalc, display, mempager
* trce_src    Source code for the interpreter, s88, and the tracer, t88
	      The difference is that t88 is interactive; s88 is not

Also present (in all directories) are . and .. , which are called dot and dot dot.
The former is the current directory. The latter is its parent directory.

B. ASSEMBLING YOUR ASSEMBLY LANGUAGE PROGRAMS

Assembler source files have an extension ".s". To create a binary for a
source named "project.s", enter the command:

	as88 project

This performs the assembly, and generates three files:

	project.88	The 8088 binary

	project.#	A file which links the file positions in the
			source file to the positions in the binary file)

	project.$	A copy of the source file which contains included
			secondary sources and satisfies preferred
			conventions for the assembly process

It is best to do this in the examples directory. Once you have assembled project.s, you
can trace it with

        t88 project

The tracer subwindow for the source file displays the "project.$" version.
Instead of using t88, you can use s88. This just runs the program without
displaying the registers and source code as it is running.

C. COMPILATION OF THE ASSEMBLER AND TRACER TOOLS

If you are a beginner, this is probably going to be too difficult for you. You might
want to practice on a Linux system, where it is easier. If you like big challenges, get yourself
the gcc compiler and investigate trce_src and as_src, where the sources to the tracer and assembler
are located. Study the make.bat files, which are scripts that build the tools.

Good Luck,
Evert Wattel
Vrije Universiteit, Amsterdam
evert@cs.vu.nl (or e.wattel@few.vu.nl)
