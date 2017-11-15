;ALP to perform matrix multiplication
DATA SEGMENT
    Matrix1 DB 01h,02h
            DB 03h,04h 
            DB 00h,01h
    Matrix2 DB 01h,02h,01h
            DB 02h,01h,00h
    Matrix3 DB 9 DUP(?)            ;product matrix
                
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA , CS:CODE  
    
    START: 
        MOV AX,DATA
        MOV DS,AX                ;DS register populated
    
        XOR AX,AX
        MOV BP,0 
        MOV DI,BP 
        MOV SI,0
        MOV CX,3
        MOV BX,0  
        MOV DX,0
     
    
    Loop1: 
        PUSH CX 
        MOV CX,3
        XOR AX,AX 
        
        MOV SI,0
        MOV DI,SI  
    
    Loop2:
        PUSH CX
        MOV CX,2 
        XOR AX,AX  
        push bx
        mov bx,0
        MOV di,0   
        push si 
    
    Loop3: 
        MOV DL,AL
        MOV AL,Matrix1[BP][DI] 
        PUSH DX
        MOV DL,Matrix2[SI][BX] 
        IMUL DL
        POP DX
        ADC AL,DL 
        INC DI
        ADD SI,3 
    
    LOOP Loop3 
    
    POP SI 
    POP BX  
    PUSH BP  
    MOV BP,BX
    MOV Matrix3[BP][SI],AL         ;Storing in the matrix 3 : product matrix   
    
    POP BP
    POP CX
    INC SI  
    
    LOOP Loop2
    
    POP CX
    ADD BP,2
    ADD BX,3 
    
    
    LOOP Loop1
    
CODE ENDS
END START