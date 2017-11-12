;ALP to calculate the sum of elements of array 

DATA SEGMENT 
    
    array DD 00000001H,00000002H,00000003H,00000004H
    sum_array DD 0H
    
DATA ENDS 

CODE SEGMENT  
    
    ASSUME DS: DATA CS:CODE
    
    START: 
    
        MOV AX,DATA
        MOV DS,AX
        
        XOR AX,AX
        MOV SI,0  
        MOV CX,04  
        MOV BX, OFFSET array 
        
        AGAIN:
            ADD AX,BX[SI]           ;lower order word of ith element of array
            ADC DX,BX[SI+2]         ;higher order word of ith element of array
            ADD SI,4
            LOOP AGAIN   
            
            
        MOV WORD PTR sum_array,AX       ; stores lower order word of array sum
        MOV WORD PTR sum_array+2,DX     ; stores higher word of array sum
        
CODE ENDS
END START

            
             
    