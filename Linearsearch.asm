;ALP to perform Linear Search 
DATA SEGMENT
    array DB 01H,12H,34H,56H,22H,45H
    element DB 22H 
    message1 DW "NUMBER NOT FOUND !$" 
    message2 DW "NUMBER FOUND AT INDEX:  $"    
    
DATA ENDS

CODE SEGMENT
    ASSUME DS: DATA CS:CODE
    
    START:
        MOV AX,DATA
        MOV DS,AX
        
        XOR AX,AX 
        MOV SI,-1
        LEA BX,array
        MOV CX,06H
         
        AGAIN:
            INC SI
            MOV AL,BX[SI]
            CMP AL,element          ;compares the element with the array elements
            LOOPNE AGAIN 
            JCXZ NotFound 
             
            LEA DX, message2        ;number found    
            MOV AH,09H
            INT 21H  
            MOV BX,SI
            MOV DL,BL
            ADD DL,"0"               ;Make into a character
            MOV AH,02H
            INT 21H 
            MOV AH,4Ch
            MOV AL,01
            INT 21h 
            
            
        NotFound:                       ;number not found
            MOV DX,offset message1
            MOV AH,09H
            INT 21H 
            MOV AH,4Ch
            MOV AL,01
            INT 21h 
CODE ENDS
END START
       
    