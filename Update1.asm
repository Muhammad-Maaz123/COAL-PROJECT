INCLUDE Irvine32.inc

.DATA

startscreen   BYTE '  ',0ah,0dh
BYTE ' ',0ah,0dh
BYTE ' +============================================+',0ah,0dh
BYTE ' ||                                          ||',0ah,0dh
BYTE ' ||           !!!!!!!!           +++         ||',0ah,0dh
BYTE ' ||          !! !!!!!!!         +++++        ||',0ah,0dh
BYTE ' ||          !!!!!!!!!!      +++++++++++     ||',0ah,0dh
BYTE ' ||          !!!!!!!!!!        +     +       ||',0ah,0dh
BYTE ' ||          !!!!!                           ||',0ah,0dh
BYTE ' ||          !!!!!!!!                        ||',0ah,0dh
BYTE ' || !       !!!!!!            +-----+        ||',0ah,0dh
BYTE ' || !!    !!!!!!!!!!          |     |        ||',0ah,0dh
BYTE ' ||  !!!  !!!!!!!!! !         |2048 |        ||',0ah,0dh
BYTE ' ||   !!!!!!!!!!!!            |     |        ||',0ah,0dh
BYTE ' ||    !!!!!!!!!!!            +-----+        ||',0ah,0dh
BYTE ' ||     !!!!!!!!!                            ||',0ah,0dh
BYTE ' ||      !!!!!!!                             ||',0ah,0dh
BYTE ' ||       !!! !!                             ||',0ah,0dh
BYTE ' ||       !    !                             ||',0ah,0dh
BYTE ' ||       !!   !!                            ||',0ah,0dh
BYTE ' +============================================+',0ah,0dh, 0


winstring BYTE ' ', 0ah, 0dh
BYTE ' ',0ah,0dh
BYTE ' +============================================+', 0ah, 0dh
BYTE ' ||                                          ||', 0ah, 0dh
BYTE ' ||    __  __     ______     __  __          ||', 0ah, 0dh
BYTE ' ||   /\ \_\ \   /\  __ \   /\ \/\ \         ||', 0ah, 0dh
BYTE ' ||   \ \____ \  \ \ \/\ \  \ \ \_\ \        ||', 0ah, 0dh
BYTE ' ||    \/\_____\  \ \_____\  \ \_____\       ||', 0ah, 0dh
BYTE ' ||     \/_____/   \/_____/   \/_____/       ||', 0ah, 0dh
BYTE ' ||                                          ||', 0ah, 0dh
BYTE ' ||                                          ||', 0ah, 0dh
BYTE ' ||                                          ||', 0ah, 0dh
BYTE ' ||                                          ||', 0ah, 0dh
BYTE ' ||        __     __     __     __   __      ||', 0ah, 0dh
BYTE ' ||       /\ \  _ \ \   /\ \   /\ "-.\ \     ||', 0ah, 0dh
BYTE ' ||       \ \ \/ ".\ \  \ \ \  \ \ \-.  \    ||', 0ah, 0dh
BYTE ' ||        \ \__/".~\_\  \ \_\  \ \_\\"\_\   ||', 0ah, 0dh
BYTE ' ||         \/_/   \/_/   \/_/   \/_/ \/_/   ||', 0ah, 0dh
BYTE ' ||                                          ||', 0ah, 0dh
BYTE ' ||                                          ||', 0ah, 0dh
BYTE ' +============================================+', 0ah, 0dh, 0

gameoverstring BYTE ' ', 0ah, 0dh
BYTE ' ',0ah,0dh
BYTE ' +============================================+', 0ah, 0dh
BYTE ' ||                                          ||', 0ah, 0dh
BYTE ' || ______    ______    __    __    ______   ||', 0ah, 0dh
BYTE ' ||/\  ___\  /\  __ \  /\ "-./  \  /\  ___\  ||', 0ah, 0dh
BYTE ' ||\ \ \__ \ \ \  __ \ \ \ \-./\ \ \ \  __\  ||', 0ah, 0dh
BYTE ' || \ \_____\ \ \_\ \_\ \ \_\ \ \_\ \ \_____\||', 0ah, 0dh
BYTE ' ||  \/_____/  \/_/\/_/  \/_/  \/_/  \/_____/||', 0ah, 0dh
BYTE ' ||                                          ||', 0ah, 0dh
BYTE ' ||                                          ||', 0ah, 0dh
BYTE ' ||                                          ||', 0ah, 0dh
BYTE ' ||                                          ||', 0ah, 0dh
BYTE ' ||  ______    __   __  ______    ______     ||', 0ah, 0dh
BYTE ' || /\  __ \  /\ \ / / /\  ___\  /\  == \    ||', 0ah, 0dh
BYTE ' || \ \ \/\ \ \ \ \ /  \ \  __\  \ \  __<    ||', 0ah, 0dh
BYTE ' ||  \ \_____\ \ \__|   \ \_____\ \ \_\ \_\  ||', 0ah, 0dh
BYTE ' ||   \/_____/  \/_/     \/_____/  \/_/ /_/  ||', 0ah, 0dh
BYTE ' ||                                          ||', 0ah, 0dh
BYTE ' ||                                          ||', 0ah, 0dh
BYTE ' +============================================+', 0ah, 0dh, 0


Z BYTE ? , 0 

;block  BYTE "     ", 0
block2 BYTE "       ", 0

num2    BYTE "   2   ", 0
num4    BYTE "   4   ", 0
num8    BYTE "   8   ", 0
num16   BYTE "  16   ", 0
num32   BYTE "  32   ", 0
num64   BYTE "  64   ", 0
num128  BYTE "  128  ", 0
num256  BYTE "  256  ", 0
num512  BYTE "  512  ", 0
num1024 BYTE " 1024  ", 0
num2048 BYTE " 2048  ", 0



x BYTE 4 DUP(2), 4 DUP(9), 4 DUP(16), 4 DUP(23)
y BYTE 4 DUP(4,15,26,37)

state BYTE 16 DUP(0)


.CODE
main PROC

    CALL Randomize
    CALL Clrscr
    MOV EDX, OFFSET startscreen
    CALL WriteString

    CALL ReadChar

    MOV EAX, 0
    MOV EDX, 0
    CALL Clrscr

	Call Generate
	Call Generate
	call draw


	in_the_game:

     	inc z
		mov edx, offset z
		call writeDec 

		mov ebx, 0
		CALL Readchar

	   .if (ah == 48h)
			JE  up
		.elseif ( ah == 50h)
			JE down
		.elseif( ah == 4Bh)
			JE left
		.elseif(ah == 4Dh)
			JE right
		.endif
		
		up :
			call operUP
			jmp L2continue
		down :
			call operdown
			jmp L2continue
		left :
			call operleft
			jmp L2continue
		right :
			call operright
			jmp L2continue
		
		L2continue :
		;call look

		call check_win
		call check_gameover
	JMP in_the_game
	EXIT

main ENDP

check_win PROC USES EAX ECX EDX ESI 
	mov eax, 0
	mov ecx, lengthof state
	mov esi, offset state
	winloop:
		mov al, [esi]
		.if (al == 11)
			JE win
		.endif
		inc si
	loop winloop
	RET


	win:
	mov eax, 1000
	call delay
	call clrscr
	mov edx, offset winstring
	call writestring
	EXIT

check_win ENDP
	
check_gameover PROC USES EAX EBX ECX EDX ESI
	mov esi, offset state
	mov ecx, lengthof state
	countzero:
		mov al, [esi]
		.if(al == 0)
			JZ CGreturn
		.endif
		inc esi
	loop countzero

	mov ecx, 4
	mov esi, offset state
	check_column:
		mov ah, [esi]
		mov al, [esi+4]
		mov bh, [esi+8]
		mov bl, [esi+12]
		.if(ah == al)
			JE CGreturn
		.elseif(al == bh)
			JE CGreturn
		.elseif (bh == bl)
			JE CGreturn
		.endif
		inc si
	loop check_column

	mov ecx, 4
	mov esi, offset state
	check_row:
		mov ah, [esi]
		mov al, [esi+1]
		mov bh, [esi+2]
		mov bl, [esi+3]
		.if(ah == al)
			JE CGreturn
		.elseif(al == bh)
			JE CGreturn
		.elseif(bh == bl)
			JE CGreturn
		.endif
		add esi, 4
	loop check_row

	mov eax, 1000
	call delay
	call clrscr
	mov edx, offset gameoverstring
	call writestring
	EXIT



	CGreturn :
	RET
check_gameover ENDP

move PROC
	mov dl, 0
	move0:
	cmp bh, 0
		JNZ move1
	mov bh, bl
	mov bl, 0
	
	move1:
	cmp al, 0
		JNZ move2
	mov al, bh
	mov bh, bl
	mov bl, 0
	move2:
	cmp ah,0
		JNZ move3
	mov ah, al
	mov al, bh
	mov bh, bl
	mov bl, 0

	move3:
	;.if(dl == 0)
	cmp dl, 0
		JNE movereturn
	;.elseif(ah == 0)
	cmp ah, 0
		JZ move4
	;.elseif(ah == al)
	cmp ah, al
		JNE move4
	inc ah
	mov al, 0

	move4:
	;.if(al == 0)
	cmp al, 0
		JZ move5
	;.elseif(al == bh)
	cmp al, bh
		JNE move5
	inc al
	mov bh, 0

	move5:
	;.if(bh == 0)
	cmp bh, 0
		JZ move6
    ;.elseif(bh == bl)
	cmp bh, bl
		JNE move6
	;.endif
	inc bh
	mov bl, 0
	move6:
	inc dl
	JMP move0
	movereturn :
	RET
MOVE ENDP

operup PROC USES ECX ESI EAX EDX
	mov esi, offset state
	mov ecx, 4
	mov edx, 0
	uploop:
		mov ah, [esi]
		mov al, [esi+4]
		mov bh, [esi+8]
		mov bl, [esi+12]
		call move
		;cmp ah, [esi] 
		.if(ah == [esi])
			JNE updiff
		;cmp al, [esi+4]
		.elseif(al == [esi+4])
			JNE updiff
		;cmp bh, [esi+8]
		.elseif(bh == [esi+8])
			JNE updiff
		;cmp bl,[esi+12]
		.elseif(bl == [esi+12])
			JNE updiff
		JMP upcontinue
		.endif
		updiff:
			inc dh

		upcontinue:
		mov [esi],    ah
		mov [esi+4],  al
		mov [esi+8],  bh
		mov [esi+12], bl
		inc si
	loop uploop
	
	.if(dh == 0)
		JE upNoChange
	.endif
	Call Generate
	Call Clrscr
	Call draw
	

	upNoChange :
	RET

operup ENDP

operdown PROC USES ECX ESI EAX EDX
	mov esi, offset state
	mov ecx, 4
	mov edx, 0
	downloop:
		mov dl, 1
		mov ah, [esi+12]
		mov al, [esi+8]
		mov bh, [esi+4]
		mov bl, [esi]
		call move
		.if(ah == [esi+12])
			JNE downdiff
		.elseif(al == [esi+8])
			JNE downdiff
		.elseif(bh == [esi+4])
			JNE downdiff
		.elseif(bl == [esi])
			JNE downdiff
		.else
	     	JMP downcontinue
		.endif
		downdiff:
			inc dh

		downcontinue:
		mov [esi+12], ah
		mov [esi+8],  al
		mov [esi+4],  bh
		mov [esi],    bl
		inc si
	loop downloop

    .if(dh == 0)
		JE downNoChange
	.endif
	Call Generate
	call Clrscr
	call draw

	downNoChange :
	RET
operdown ENDP

operleft PROC USES ECX ESI EAX EDX
	mov esi, offset state
	mov ecx, 4
	mov edx, 0
	leftloop:
		mov dl, 1
		mov ah, [esi]
		mov al, [esi+1]
		mov bh, [esi+2]
		mov bl, [esi+3]
		call move
		.if(ah == [esi])
			JNE leftdiff
		.elseif(al == [esi+1])
			JNE leftdiff
		.elseif(bh == [esi+2])
			JNE leftdiff
		.elseif(bl == [esi+3])
			JNE leftdiff
		.else
			JMP leftcontinue
		.endif
		leftdiff:
			inc dh

		leftcontinue:
		mov [esi],   ah
		mov [esi+1], al
		mov [esi+2], bh
		mov [esi+3], bl
		add si, 4
	loop leftloop

	.if(dh == 0)
		JE leftNoChange
	.endif
	Call Generate
	call Clrscr
	call draw

	leftNoChange :
	RET
operleft ENDP

operright PROC USES ECX ESI EAX EDX
	mov esi, offset state
	mov ecx, 4
	mov edx, 0
	rightloop:
		mov dl, 1
		mov ah, [esi+3]
		mov al, [esi+2]
		mov bh, [esi+1]
		mov bl, [esi]
		call move
		.if(ah == [esi+3])
			JNE rightdiff
		.elseif(al == [esi+2])
			JNE rightdiff
		.elseif(bh == [esi+1])
			JNE rightdiff
		.elseif(bl == [esi])
			JNE rightdiff
		.else
			JMP rightcontinue
		.endif
		rightdiff:
			inc dh

		rightcontinue:
		mov [esi+3],    ah
		mov [esi+2],  al
		mov [esi+1],  bh
		mov [esi], bl
		add si, 4
	loop rightloop

	.if(dh == 0)
		JE rightNoChange
	.endif
	Call Generate
	call Clrscr
	call draw

	rightNoChange :
	RET
operright ENDP

draw PROC USES ESI EDI EAX EBX ECX EDX
	mov esi, offset x
	mov edi, offset y
	mov ebx, offset state
	mov ecx, lengthof x

	L1 :
		mov eax, [ebx]
		.if(al == 0)
			JZ continue
		.endif
		call choosecolor

		mov dh, [esi]
		mov dl, [edi]
		mov ax, dx 
		call GotoXY
		;MOV EDX, OFFSET block
		;CaLL WriteString

		inc ah
		mov dx, ax
		call GotoXY
		MOV EDX, OFFSET block2
		CaLL WriteString

		inc ah
		mov dx, ax
		call GotoXY
		Call choosenumber
		CaLL WriteString

		inc ah
		mov dx, ax
		call GotoXY
		MOV EDX, OFFSET block2
		CaLL WriteString
		
		inc ah
		mov dx, ax
		;call GotoXY
		;MOV EDX, OFFSET block
		;CaLL WriteString

		call turnbackcolor
		continue :
		inc bx
		inc si
		inc di
	loop L1
	mov dh, 00
	mov dl, 10
	Call GotoXY
	RET
draw ENDP

turnbackcolor PROC USES EAX
	mov eax, white + black*16
	call settextcolor
	RET
turnbackcolor ENDP

choosecolor PROC
	cmp al, 1
	;.if(al == 1)
	cmp al, 1
        JNE color4
	;.endif
	mov eax, white + 9*16
    JMP setcolor
    color4:
    ;.if(al == 2)
	cmp al, 2
        JNE color8
	;.endif
	mov eax, white + 1*16
    JMP setcolor
	color8:
    ;.if(al == 3)
	cmp al, 3
        JNE color16
	;.endif
	mov eax, white + 6*16
    JMP setcolor
  color16:
    ;.if(al == 4)
	cmp al, 4
        JNE color32
	;.endif
	mov eax, white + 5*16
    JMP setcolor
	color32:
    ;.if(al == 5)
	cmp al, 5
        JNE color64
	;.endif
	mov eax, white + 12*16
    JMP setcolor
	color64:
    ;.if(al == 6)
	cmp al, 6
		JG color128
	;.endif
	mov eax, white + 4*16
    JMP setcolor
	color128:
	mov eax, black + 14*16
	setcolor:
	call settextcolor
    RET
choosecolor ENDP

choosenumber PROC USES EAX EBX
    mov al, [ebx]

    ;.if(al == 1)
	cmp al, 1
        JNE choose4
	;.endif
    mov edx, offset num2    
	RET
    choose4:
    ;.if(al == 2)
	cmp al, 2
        JNE choose8
	;.endif
    mov edx, offset num4
	RET
    choose8:
   ;.if(al == 3)
   cmp al, 3
        JNE choose16
	;.endif
    mov edx, offset num8
	RET
    choose16:
    ;.if(al == 4)
	cmp al, 4
        JNE choose32
	;.endif
    mov edx, offset num16
	RET
    choose32:
    ;.if(al == 5)
	cmp al, 5
        JNE choose64
	;.endif
    mov edx, offset num32
	RET
    choose64:
    ;.if(al == 6)
	cmp al, 6
        JNE choose128
	;.endif
    mov edx, offset num64
	RET
    choose128:
    ;.if(al == 7)
	cmp al, 7
        JNE choose256
	;.endif
    mov edx, offset num128
	RET
    choose256:
    ;.if(al == 8)
	cmp al, 8
        JNE choose512
	;.endif
    mov edx, offset num256
	RET
    choose512:
    ;.if(al == 9)
	cmp al, 9
        JNE choose1024
	;.endif
    mov edx, offset num512
	RET
    choose1024:
    ;.if(al == 10)
	cmp al, 10
        JNE choose2048
	;.endif
    mov edx, offset num1024
	RET
    choose2048:
    ;.if(al == 11)
	cmp al, 11
        JNE ChooseNumberReturn
	;.endif
    mov edx, offset num2048
	ChooseNumberReturn:
    RET
choosenumber ENDP

Generate PROC USES EAX EBX ECX
	redo :
	mov eax, 16
	call RandomRange
	mov ecx, eax
	mov ebx, offset state
	add ebx, ecx
	mov al, [ebx]
	;.if(al == 0)
	cmp al, 0
		JNE redo
	;.endif
	mov esi, offset X
	add esi, ecx
	mov edi, offset Y
	add edi, ecx

	mov eax, 4
	call RandomRange
	;.if(al == 3)
	cmp al, 3
		JE put4
	;.endif
	mov al, 1
	mov [ebx], al
	RET

	put4:
	mov al, 2
	mov [ebx], al
	RET
Generate ENDP
END main
