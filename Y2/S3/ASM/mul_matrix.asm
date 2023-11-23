MODEL SMALL
.STACK 100H
.DATA
M1 DB 1,1,1,1,1,1,1,1,1
M2 DB 1,1,1,1,1,1,1,1,1
PROD DB 0,0,0,0,0,0,0,0,0
.CODE
MAIN PROC
 MOV AX, @DATA
 MOV DS, AX
 MOV BP, OFFSET PROD
 MOV SI, OFFSET M1
 MOV DI, OFFSET M2
 MOV CH, 03H ; matrix dimension
 MOV CL, 03H
L1:
 MOV BL, CH
L2:
 MOV DL, 0
 MOV DH, CH
L3:
 MOV AL, [SI]
 MOV AH, [DI]
 MUL AH
 ADD DL, AL
 INC SI
 ADD DI, 03H
 DEC DH
 CMP DH, 0
 JNZ L3
 MOV [BP], DL
 INC BP
 SUB SI, 03H
 SUB DI, 09H
 INC DI
 DEC BL
 CMP BL, 0
 JNZ L2
 ADD SI, 03H
 MOV DI, OFFSET M2
 DEC CL
 CMP CL, 0
 JNZ L1
 MOV CX, 9
 MOV BP, OFFSET PROD
PRINT:
 MOV DX, [BP]
 ADD DX, 48
 MOV AH, 02H
 INT 21H
 INC BP
 LOOP PRINT
 ; Exit the program
 MOV AH, 4CH
 INT 21H
MAIN ENDP
END MAIN