;ALP to convert 16 digits unpacked to packed  
DATA SEGMENT
    unpacked DB 1h,2h,3h,4h,5h,6h,7h,8h,9h,1h,2h,3h,4h,5h,6h,7h
    packed   DB 8 DUP(?)
    
DATA ENDS

CODE SEGMENT
    ASSUME DS: DATA CS:CODE
    
    START:
        MOV AX,DATA
        MOV DS,AX
        
        MOV SI,0
        MOV DI,SI
        XOR AX,AX
        MOV CX,08h  
        
        AGAIN:        
        MOV AX,WORD PTR unpacked[SI]      ;moves first two elements of unpacked array
        SHL AL,4
        SHR AX,4
        MOV packed[DI],AL
        ADD SI,2                          ;to access next two elements of unpacked array
        INC DI   
        LOOP AGAIN            
        
CODE ENDS
END START

        