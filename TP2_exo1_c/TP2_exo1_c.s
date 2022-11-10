		AREA TP2, CODE, READONLY;
		ENTRY
debut	MVN		r0,#11; A dividende
		MVN		r1,#3; B diviseur
		MOV 	r2,#1; A/B quotient
		MOV		r3,#1; reste
		MOV 	r4,#0; booleen si res a besoin d'�tre chang� en neg(0 = non, 1 = oui)
		
	    CMP 	r0,#0;  
	    CMPEQ	r1,#0; 
        BGE 	bouclI; a et b pos resultat pos (change pas)
        
	    CMP		r0,#0; if (r0<0) 
	    CMPEQ	r1,#0; if (r1<0)
		MVNLT	r0,r0; On passe A de neg � pos 
		ADDLT	r0,r0,#1; on ajoute 1 car MVN fait le compl�ment � deux mais n'ajoute pas 1
		MVNLT	r1,r1; On passe B de n�gatif � positif 
		ADDLT	r1,r1,#1; on ajoute 1 car MVN fait le compl�ment � deux mais n'ajoute pas 1
        BLT 	bouclI; a et b neg, res pos (change pas)
        
        
       	CMP		r0,#0; 
       	MOV		r4,#1; A < 0 alors le res sera neg (modifie le bool)
		MVN		r1,r1; On passe B de neg � pos (n�c�ssaire pour le nb d'i) 
       	MVNLT	r0,r0; A < 0 On passe A de n�g � pos 
		ADDLT	r0,r0,#1; on ajoute 1 car MVN fait le compl�ment � deux mais n'ajoute pas 1
       	BLT 	bouclI; Si A < 0 le res sera d�j� en neg donc change pas le signe
        
        MOV		r4,#1; B < 0 alors le r�sultat sera en positif mais il a besoin d'�tre changer en n�gatif ( on modifie le bool�en )
		MVN		r1,r1; On passe B de neg � pos (n�c�ssaire pour le nb d'i) 
		ADD		r1,r1,#1; on ajoute 1 car MVN fait le compl�ment � deux mais n'ajoute pas 1

bouclI  MOV		r5,r0; initialisation de temp A		
boucl	CMP		r5,r1; while Temp A > B
		BLE		endB;  
		SUB		r5,r5,r1; on d�duit temp A au res (on va faire A / B, B fois)
		ADD 	r2,r2,#1; on incr�mente cmpt d'i
		B		boucl;    

endB	SUB		r3,r1,r5; on calcul le reste
		MOVEQ	r4,#0; if(r4==0); on regarde si on a besoin de modifier notre r�sultat
		BEQ		fin; non pas besoin
		MVN 	r2,r2; on passe notre res en neg
		ADD 	r2,r2,#1; on ajoute 1 car MVN fait le compl�ment � deux mais n'ajoute pas 1

fin		SWI		0x123456;
		END  