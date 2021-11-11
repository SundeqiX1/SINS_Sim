*************************************************************************

 Block hexsingle2num
 Created in Simulink r2007a

 Author: Daniel Martin Martin
 email: daniel.martin@savant-eyd.com

 SAVANT ENERGÍA Y DINÁMICA
 www.savant-eyd.com
 
 October 2008

*************************************************************************

 This block converts the 32 bits hex input into the corresponding FLOAT,
 using the IEEE 32 bits float format. 

*************************************************************************

 This block is based on the Matlab function hexsingle2num.m created by
 Mark Lubinski, which is based on the standard hex2num Matlab function.
 Check out Mark's function at:

 http://www.mathworks.com/matlabcentral/fileexchange/loadFile.do?objectId=6927&objectType=FILE

*************************************************************************





*************************************************************************

 WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING

*************************************************************************

 Hex numbers are treated as strings in Matlab and Simulink. Any Simulink
 block can only have numerical input or output so the 32 bits hex imput 
 needs to be converted into a number before sending it to this block. 
 This have to be done with the hex2num() function. This function will 
 trasnform our hex number into an integer, so it WONT be the desired 
 final number, but it will be fine for sending it to this block.

*************************************************************************

 So it is NECESSARY to use hex2num() on the previous block output before
 conecting it to this block.

*************************************************************************

In the ZIP file there is an example of the usage, so PLEASE check it out.

*************************************************************************





*************************************************************************

 WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING


During Execution Simulink will show you warnings messages. IGNORE THEM.

*************************************************************************
