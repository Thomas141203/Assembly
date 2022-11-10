        AREA    StrCopy, CODE, READONLY 

        ENTRY                     

start	MOV 	r0,#4;
		LDR 	r1,=src
		MOV		r2,#0
		MOV		r3,#0
		MOV 	r4,#0
		LDR		r5,=dst
        BL      boucl          

stop 

        MOV     r0, #0x18         
        LDR     r1, =0x20026      
        SWI     0x123456          

boucl	CMP		r2,r0 
		BEQ		inits
		SUB		r3,r0,r2
		SUB		r3,r3,#1
		LDRB	r4,[r1,r3]
		STRB	r4,[r5,r2]
		ADD 	r2,r2,#1
		B		boucl;   

inits	MOV		r2,#0
show	CMP 	r2,r0
		BGE 	stop
		LDRB 	r4,[r5,r2]
		ADD 	r2,r2,#1
		B 		show

        AREA    Strings, DATA, READWRITE 

src  DCB "Lul",0 
dst  DCB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;

