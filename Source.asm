
 
 INCLUDE Irvine32.inc 
 
 .data 
 bvar byte ? ; 1 byte variable 
 wvar word ? ; 2 byte variable 
 dvar dword ? ; 4 byte variable 
 qvar qword ? ; 8 byte variable 
 .code 
 main PROC 
 
 mov eax, TYPE bvar ; eax = 1, size of bvar in bytes 17 mov ebx, TYPE wvar ; ebx = 2, size of wvar in bytes 18 mov ecx, TYPE dvar ; ecx = 4, size of dvar in bytes 19 mov edx, TYPE qvar ; eax = 8, size of qvar in bytes 
 
 call WaitMsg ; Press any key to continue... 
 exit 
 main ENDP 
 END main 
