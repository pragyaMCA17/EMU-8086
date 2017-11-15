;ALP to perform Linear Search using procedure
DATA SEGMENT
    
    array DW 7 DUP(?)
    element DW ? 
    count   DW 07h 
    result  DW ?
    Table   DW 4 DUP(?)
    TOS LABEL WORD 
    MSG1 DW 0DH, 0AH,'ENTER THE ARRAY ELEMENTS:$'
    MSG2 DW 0DH, 0AH,'ENTER THE ELEMENT TO BE SEARCHED: $'
    MSG3 DW 0DH, 0AH,"NUMBER FOUND !$" 
    MSG4 DW 0DH, 0AH,"NUMBER NOT FOUND !$"    
    
DATA ENDS

CODE SEGMENT
    ASSUME DS: DATA CS:CODE SS:DATA
    
    START:
        MOV AX,DATA
        MOV DS,AX 
        MOV SS,AX
        
        MOV DX,OFFSET MSG1
        MOV AH,09H
        INT 21H
        
        XOR AX,AX
        MOV CX,count
        MOV SI,0
      
      
        INPUT: MOV AH, 01H          ;inputting array elements , elements stored in its ASCII form
            INT 21H 
            SUB AL,30h              ; to convert from ASCII codes ,we subtract 30h 
            MOV AH,00
            MOV array[SI], AX
            INC SI                
	        INC SI
            LOOP INPUT                   
                                    ; array made
       
        
        MOV DX, OFFSET MSG2         
        MOV AH, 09H
        INT 21H

        MOV AH, 01H                 ;inputs number to be searched
        INT 21H 
        SUB AL,30h  
        MOV AH, 00H
        MOV element, AX              ; stores number to be searched
        
        
         
        MOV Table,OFFSET array      ;address of array moved
        MOV Table+2,OFFSET element
        MOV Table+4,OFFSET count
        MOV Table+6,OFFSET result  ;address of result variable                                                           
         
        MOV BX,OFFSET Table         ; address of Table-of-Parameters stored in BX    
        
        CALL Linear_Search   
        
        
        MOV DX, OFFSET MSG4
        MOV AH, 09H
        INT 21H  
        mov ah,4ch                      ;to cease the program execution , if element not found
        int 21h 
        
        
        
        OUTPUT:
        MOV DX, OFFSET MSG3
        MOV AH, 09H
        INT 21H  
        
        mov ah,4ch                      ;to cease the program execution , if element is found
        int 21h
              
        Linear_Search PROC near
            PUSH AX
            PUSH DX
            PUSH SI
            PUSH CX 
            PUSH DI
                     
                     
            
            MOV DI,[BX+4]      ;count of array moved
            MOV CX,[DI]
            
            MOV SI,[BX+2]      ;element to be searched moved
            
             
            MOV DI,[BX]        ;array address moved
            
             
            XOR AX,AX  
            
            AGAIN:
            MOV AX,[DI]
            ADD DI,2      
            MOV DX,[SI]
            CMP AX,DX 
            JE  OUTPUT          ;compares the element with the array element
            LOOP AGAIN
         
            
            POP DI
            POP CX
            POP SI
            POP DX
            POP AX   
            
            
            RET
            
        Linear_Search ENDP   
        
        
            
CODE ENDS
END START
       
    
    