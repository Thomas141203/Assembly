
		AREA TP2, CODE, READONLY;
		ENTRY
debut	MVN		r0,#10; A
		MOV		r1,#3; B
		MOV 	r2,#0; A*B res
		MOV		r3,#1; nb d'i
		MOV 	r4,#0; bool if res a besoin d'�tre chang� en neg (0 = non, 1 = oui)
		
		CMP		r0,#0
		CMPEQ	r1,#0
        BGT 	boucl; a et b pos+ res + (pas besoin d'�tre chang�) donc multiplication dans boucl
        
	    CMP	    r0,#0;
	    CMPEQ	r1,#0; 
        BLT 	boucl; a et b neg- res + ( pas besoin d'�tre chang� ) donc multiplication dans boucl
        
       	CMP		r0,#0; 
       	BLT 	boucl; Si A < 0 le r�sultat sera d�j� en neg-, pas besoin de changer le signe
        
        MOV		r4,#1; B < 0 alors le r�sultat sera en pos+ mais il a besoin d'�tre changer en neg- (on modifie le bool)
		MVN		r1,r1; On passe B de neg- � positif (n�c�ssaire pour le nombre d'i) 
		ADD		r1,r1,#1; on ajoute 1 car MVN fait le compl�ment � deux mais n'ajoute pas 1
		
boucl	CMP		r3,r1; tant que r3 ( nombre d'it�ration ) est diff�rent de B, on fait une it�ration
		BHI		endB;  
		ADD		r2,r2,r0; on ajoute A au r�sultat ( on va le faire B fois, ainsi on va faire A * B )
		ADD 	r3,r3,#1; on incr�mente notre compteur d'it�ration
		B		boucl;    

endB	CMP 	r4,#0; if(r4==0); on regarde si on a besoin de modifier notre res
		BEQ		fin; pas besoin
		MVN 	r2,r2; on passe notre res en neg-
		ADD 	r2,r2,#1; on ajoute 1 car MVN fait le compl�ment � deux mais n'ajoute pas 1

fin		SWI		0x123456;
		END