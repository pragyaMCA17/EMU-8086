;ALP to convert 16 digits number from packed to unpacked form
DATA SEGMENT 
    packed     DB 12h,34h,45h,67h,78h,91h,34h,59h
    unpacked   DW 8 DUP(0h) 
    
DATA ENDS

CODE SEGMENT
    ASSUME DS: DATA CS:CODE
    
    START:
        MOV AX,DATA
        MOV DS,AX
        
        MOV SI,0
        MOV DI,SI
        MOV CX,08h  
        
        AGAIN: 
        XOR AX,AX       
        MOV AL,packed[SI]
        SHL AX,4
        SHR AL,4
        MOV unpacked[DI],AX
        ADD DI,02h
        INC SI   
        LOOP AGAIN
CODE ENDS
END START

        