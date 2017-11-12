;ALP to perform Binary Search on the sorted array
DATA SEGMENT 
    array DB 01h,12h,23h,34h,45h,56h,67h  
    element DB 56h 
    X DB 02h
    message1 DW "Number found!$"
    message2 DW "Number not found!$" 
    
    
DATA ENDS   

CODE SEGMENT
    ASSUME DS:DATA CS:CODE
    
    
    
    START: 
        MOV AX,DATA
        MOV DS,AX
        XOR AX,AX
        MOV CX,0  
        
       
        
        MOV SI,0h
        MOV DI,06h 
        
        AGAIN:   
                             
            CMP DI,SI
            JNE LOOP1 
                           
            ADD SI, DI      ;if DI IS EQUAL TO SI
            MOV AX, SI
            DIV X            
            MOV CL,AL       ;Storing the midelement of new array 
            MOV CH,0h
            MOV BP,CX
            MOV AH,element
            CMP AH,array[BP]       
            JE  Found 
            
            LEA DX,message2      ;else element not found
            MOV AH,09h
            INT 21h
            MOV AH,4Ch
            MOV AL,01
            INT 21h 
           
            
            
            LOOP1:
            ADD SI, DI
            MOV AX, SI 
            DIV X
            MOV CL,AL              ;Storing the midelement of new array 
            MOV CH,0h   
            MOV BP,CX
            MOV AH,element
            CMP AH,array[BP]       ; compares element with array midelement calculated
            JG greater  
            JL smaller  
            
            Found:
            LEA DX,message1
            MOV AH,09h
            INT 21h 
            MOV AH,4Ch
            MOV AL,01
            INT 21h 
             
            
            greater: INC CL                ;if element to be searched is greater than midelement
                     MOV BL,CL
                     MOV BH,0h
                     MOV SI,BX
                    JMP AGAIN
                   
                               
            smaller:DEC CL                  ;if element to be searched is smaller than midelement
                    MOV BL,CL
                    MOV BH,0h
                    MOV DI,BX  
                    JMP AGAIN      
                    
                       
CODE ENDS
END START
                    
            
            
                    
            
            
            
        
    