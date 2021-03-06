Newline converter between Unix, Macintosh and MS-DOS ASCII files
==================

ASCII text files may contain different representations for newlines
depending on which operating system is being used. Conversion between
these formats is often necessary when working between several operating
systems.  The *flip* program converts newlines into any alternate format
given in the table below:

<table>
<tr>
<th>
Operating System
</th><th>
Newline bytes
</th>
</tr>
<tr>
<th>
Microsoft Windows / MS-DOS
</th><th>
0D<sub>h</sub> 0A<sub>h</sub>
</th>
</tr>
<tr>
<th>
Apple Macintosh OS 9 and earlier
</th><th>
0D<sub>h</sub>
</th>
</tr>
<tr>
<th>
Unix, Linux, Apple OS X
</th><th>
0A<sub>h</sub>
</th>
</tr>
</table>


Unix and Macintosh text files use a single byte to indicate a new
line of text. The character used in Unix is represented by the
hexadecimal number 0x0a (decimal number: 10) which you can see on
a Unix computer if you run a file through the [od
command](http://en.wikipedia.org/wiki/Od_(Unix)),

For example the command <tt>od -h flip.cpp</tt> will display bytes in 
the source file as hexadecimal numbers. Older Macs use 0x0d instead of 0x0a
for newlines. Note that "0x" is an indication C programming for 
hexadecimal numbers.

On the other hand for MS-DOS based computers, a new line of text
is generated by two characters: 0x0D followed by 0x0A.  These two characters
function similar to a typewriter: one character advances the paper one line
(linefeed) and the other character moves the current position to the
beginning of the line (carriage return).

If you edit a MS-DOS ASCII file in Unix you will often see the
characters ^M at the end of the line. This is the extra character
0x0d that is used to indicate a new line of text in MS-DOS. More
recent versions of vi and emacs automatically detect the newline
style of the file and will use that style when editing the file,
keeping the newlines consistent.  However if there is a mixture of
Unix and MS-DOS/Windows styled newlines, the ^M character will
display at the end of MS-DOS/Window lines.  Many Windows 95 (and
later) programs can recognize Unix text file newlines, so it is
usually not too much problem going the other way by using Unix text
files in MS-DOS.

If you edit a Mac-style text file in Unix (depending on the editor),
you will see the entire file on a single line with ^M characters
displayed where line-breaks should occur.

The flip command will convert between each of these types of newline formats. Here is the usage statement for the program:

   Usage: flip [-t|-u|-d|-m] filename[s]
      Converts ASCII files between Unix, MS-DOS/Windows, or Macintosh newline formats
   
      Options:
         -u  =  convert file(s) to Unix newline format (newline)
         -d  =  convert file(s) to MS-DOS/Windows newline format (linefeed + newline)
         -m  =  convert file(s) to Macintosh newline format (linefeed)
         -t  =  display current file type, no file modifications

If you want to see what format a file is in, type `flip -t filename`
and the program will return its analysis of the file. If the file
has a mixture of methods for new lines, then the flip program will
assign it to be a MS-DOS ASCII file. Analyzing or changing binary
files (such as executable programs or sound or picture files) with
the flip program does not make sense, since there may be 0x0a and
0x0d bytes in the file which are not intended to be new lines.
However, the flip program might be able to reverse the damage if
you ftp a binary file accidentally as an ASCII file.

The flip program will overwrite the old version of a file with the
specified format although the `-t` will not write anything since that
option is used only to determine the type of the file.



