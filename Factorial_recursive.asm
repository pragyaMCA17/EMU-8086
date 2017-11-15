;ALP TO COMPUTE FACTORIAL OF NUMBER USING RECURRSION
DATA SEGMENT
    
    NUMBER      DW 03h
    FACT_RESULT DW 0h
    MSG DB 10,13,'Factorial Result is:  $'    
    
DATA ENDS

CODE SEGMENT

    ASSUME DS:DATA, CS:CODE ,
    
    START: MOV AX,DATA
           MOV DS,AX  
           
           
           MOV AX,01h               ; stores 01 in AX 
           
                     
           CALL factorial 
                  
           MOV DL,OFFSET MSG
           MOV AH,09h
           INT 21h 
           
           MOV DX,FACT_RESULT
           ADD DX,30h
           MOV AH,02h
           INT 21h 
           
           
           MOV AH,4ch               ;to cease program 
           INT 21h    
           
           factorial PROC  NEAR 
                            
                 CMP NUMBER,1        ; if n=1 , return 
                 JZ  EXIT
                 
                 MUL NUMBER          ; 
                 DEC NUMBER  
                 
                 CALL factorial      ;factorial(number-1)  called recurssively
          
           EXIT: MOV FACT_RESULT,AX
                     
           ret
            
           factorial ENDP 
               
           
    
CODE ENDS
END START