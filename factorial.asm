;ALP to find factorial of a number
DATA SEGMENT
    NUMBER DW 03h
    FACT_RESULT DW 0h
    
DATA ENDS
    
CODE SEGMENT 
    ASSUME DS : DATA , CS: CODE
    
    START :
            
            MOV AX,DATA
            MOV DS,AX
            
            XOR AX,AX
            MOV CX,NUMBER
             
            MOV AX,01 
            
             
            
       NEXT:MUL CX
            LOOP NEXT 
            
            MOV FACT_RESULT,AX

CODE ENDS 
END START
