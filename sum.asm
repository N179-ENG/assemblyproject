.model small
.data
    operation db "ENTER OPERATOR SUM =>1,SUB =>2,MUL => 3 :  ","$"
    num1 db 10,"Enter Num 1 :","$"
    num2 db 10,"Enter Num 2 :","$"
    result db 10 ,"The RESULT = ","$"
    sum db 0
    multy dw 1
.code
    MAIN PROC FAR
    .STARTUP
        lea dx ,operation
        CALL RINTMESSAGE
        call READCHAR
        cmp al,'2'
        jG C
        jL B
        call SUBPROC 
         jmp STOP
     B:
         call SUMPROC
         jmp STOP
     C:  
        call mulPROC
    STOP:
            .exit
    MAIN ENDP
    RINTMESSAGE PROC
        mov ah ,09h
        int 21h
        RET
    RINTMESSAGE ENDP
    READCHAR PROC
        mov ah ,01h
        int 21h
        RET
    READCHAR ENDP
    
    SUMPROC PROC
        lea dx,num1
        call RINTMESSAGE
        call READCHAR
        sub al,48
        add sum,al
        lea dx,num2
        call RINTMESSAGE
        call READCHAR
         sub al,48
        add sum,al
         lea dx,result
        call RINTMESSAGE
         mov dl,sum
         add dl,48
         mov ah,02h
         int 21h
         RET
    SUMPROC ENDP
    SUBPROC PROC
        lea dx,num1
        call RINTMESSAGE
        call READCHAR
        sub al,48
        mov sum,al
        lea dx,num2
        call RINTMESSAGE
        call READCHAR
         sub al,48
         sub sum,al
         lea dx,result
        call RINTMESSAGE
        mov dl,sum
         add dl,48
         mov ah,02h
         int 21h
         RET
    SUBPROC ENDP
    mulPROC PROC
        lea dx,num1
        call RINTMESSAGE
        call READCHAR
        sub ax,48
        mov multy,ax
        lea dx,num2
        call RINTMESSAGE
        call READCHAR
        sub ax,48
        mul multy
         lea dx,result
        call RINTMESSAGE
        mov dx,ax
        add dx,48
         mov ah,02h
         int 21h
         RET
     mulPROC ENDP
END MAIN