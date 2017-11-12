; ALP To move one block of code to another memory location
DATA SEGMENT    
    
    MESSAGE DB 0DH, 0AH, 'PROGRAM TO MOVE FROM ONE MEMORY LOCATION TO OTHER USING
     ARRAY $'
     
    ARRAY1 DB 01h, 02h, 03h, 04h, 05h, 06h ,07h
    ARRAY2 DB 7 DUP(?)
        
DATA ENDS

CODE SEGMENT
    
    ASSUME DS:DATA, CS:CODE

    START:

        MOV AX, DATA
        MOV DS, AX   

        MOV SI, OFFSET ARRAY1
        MOV DI, OFFSET ARRAY2

        MOV CX, 07H

        AGAIN:
            MOV AL,[SI]
            MOV [DI],AL
    
            INC SI
            INC DI
            LOOP AGAIN
    
    MOV AX, 4C00H      ;to terminate the program 
    INT 21H
                      
END START 
CODE ENDS               