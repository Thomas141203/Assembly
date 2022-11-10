		AREA TP2, CODE, READONLY;
		ENTRY
debut	MOV		r0,#0;
		MOV		r1,#1;
N		EQU		10;
boucl	CMP		r1,#N;
		BHI		fin;  
		ADD		r0,r0,r1;
		ADD		r1,r1,#1;
		B		boucl;       
fin		SWI		0x123456;
		END  