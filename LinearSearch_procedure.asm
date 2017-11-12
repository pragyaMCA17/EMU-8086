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

        INPUT: MOV AH, 01H          ;inputting array elements
            INT 21H
            MOV array[SI], AX
            INC SI

        LOOP INPUT                   
                                    ; array made
        
        MOV DX, OFFSET MSG2         
        MOV AH, 09H
        INT 21H

        MOV AH, 01H                 ;inputs number to be searched
        INT 21H 
        MOV AH, 00H

        MOV DL, AL                   ;DL stores number to be searched
        
         
        MOV SP,OFFSET TOS
         
        MOV Table,OFFSET array
        MOV DX,element
        MOV Table+2,DX
        MOV DX,count 
        MOV Table+4,DX 
        MOV Table+6,OFFSET result
        MOV BX,OFFSET Table 
        
        MOV AX,01h 
        
        CALL FAR PTR Linear_Search   
        
        Linear_Search PROC FAR
            PUSH AX
            PUSH DX
            PUSH SI
            PUSH CX 
            PUSH DI
          
            MOV DI,[BX]        ;array address moved
            MOV SI,[BX+2]      ;element to be searched moved
            MOV CX,[BX+4]      ;count of array moved
            MOV DX,[BX+6]      ;result moved
            
            XOR AX,AX  
            
            AGAIN:
            MOV AX,[DI]
            CMP AX,SI           ;compares the element with the array elements
            ADD DI,2
            LOOPNE AGAIN 
            JCXZ NotFound 
             
            MOV AX,01h 
            MOV [DX],AX        ;result=01 , if element is found
            POP DI
            POP CX
            POP SI
            POP DX
            POP AX
            RET          
        NotFound: 
            MOV AX,00h                      
            MOV [DX],AX        ;result=00 ,number not found
            POP DI
            POP CX
            POP SI
            POP DX
            POP AX
            RET
            
        Linear_Search ENDP 
        
        CMP result,00
        JE OUTPUT   
        MOV DX, OFFSET MSG3
        MOV AH, 09H
        INT 21H 
        
        OUTPUT:
        MOV DX, OFFSET MSG4
        MOV AH, 09H
        INT 21H
        
            
CODE ENDS
END START
       
    
    