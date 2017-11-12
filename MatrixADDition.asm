DATA SEGMENT
    Matrix1 DB 01h,02h,03h
            DB 04h,05h,06h
            DB 02h,01h,03h
    Matrix2 DB 01h,02h,03h
            DB 04h,05h,06h
            DB 02h,03h,01h  
    Matrix3 DB 9 DUP (?)
    
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA CS:CODE
    
    START:
        MOV AX,DATA
        MOV DS,AX
        XOR AX,AX
        MOV BP,0
        MOV DI,BP 
        MOV CX,3
        
    LOOP1: PUSH CX
           MOV CX,3 
           MOV DI,0
    
    LOOP2: MOV AL,Matrix1[BP][DI]
           ADC AL,Matrix2[BP][DI] 
           MOV Matrix3[BP][DI],AL
           INC DI
           LOOP LOOP2
           
           POP CX 
           ADD BP,3
           LOOP LOOP1
           
CODE ENDS
END START

           
           
           
           
        