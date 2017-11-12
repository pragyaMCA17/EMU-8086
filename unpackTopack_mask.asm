;ALP to convert 16 digits unpacked to packed using masking
DATA SEGMENT 
    unpacked DW 0102h,0304h,0506h,0708h
    packed   DB 4 DUP(0h) 
    mask     DB 00h
    
DATA ENDS

CODE SEGMENT
    ASSUME DS: DATA CS:CODE
    
    START:
        MOV AX,DATA
        MOV DS,AX
        
        MOV SI,0
        MOV DI,SI
        XOR AX,AX
        MOV CX,04h  
        
        AGAIN:        
        MOV AX,unpacked[SI]
        ROR AH,4
        ADD AL,AH
        AND AH,mask
        MOV packed[DI],AL
        ADD SI,02h
        INC DI   
        LOOP AGAIN    
        
CODE ENDS
END START

        