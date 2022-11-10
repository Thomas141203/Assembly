        AREA    StrCopy, CODE, READONLY 
        ENTRY
start 
        LDR     r1, =srcstr       
        LDR     r0, =dststr       
        BL      strcopy          
stop 
        MOV     r0, #0x18         
        LDR     r1, =0x20026      
        SWI     0x123456          
strcopy                  
        LDRB    r2, [r1],#1; incr�mentation de 1 de r1       
        STRB    r2, [r0],#1   ; incr�mentation de 1 de r0   
        CMP     r2, #0            
        BNE     strcopy           
        MOV     pc,lr            
        AREA    Strings, DATA, READWRITE 

srcstr  DCB "First string - source",0 
dststr  DCB "Second string - destination",0 