		.586
		.model  flat

		.data
		mystr db 256 dup(?),0
		scndstr   db 256 DUP (?),0
		space    BYTE  " "
		displ    DWORD  0
		displ1    DWORD  0
		count    DWORD  0
		dots	 DB "..."
		ln		 DWORD  0
		newlen   DWORD  0

		.code
		public  _CHANGE
		EXTRN  _PRINT:proc
_CHANGE	proc
		push    EBP
		mov	  EBP,ESP
		

		mov   EBX,[EBP+8]
		cld
		mov   ln, EBX
		mov   ESI,[EBP+16]
		lea	  EDI,mystr
		mov   ECX,ln
		rep movsb

lea EDX,scndstr
		mov   ECX,ln
		cld
		mov   ESI,[EBP+16]
		lea	  EDI,mystr
cycle1: push ECX
		push ESI
		push EDI
		lea EDI,space
		cmpsb
		je spc
        inc displ
        jmp loopend
cycleend:loop cycle1
        jmp toend
    spc:mov ECX,displ
        sub ESI,displ
        sub ESI,1
        mov EBX,displ
		mov EAX,ESI
		mov ECX,ln
		lea EDI, space
		lea ESI, mystr
		cycle2:
			push ECX
			push ESI
			push EDI

			cmpsb
			je spc1
			inc displ1
			jmp cycle2end
			spc1:
			    
				mov ECX,displ1
				sub ESI,displ1
				sub ESI,1
				cmp ECX,EBX
				jne notequal
				mov EDI,EAX
				repe cmpsb
				jne notequal
				inc count
				mov displ1,0

			notequal:mov displ1,0
			cycle2end:
			pop EDI
			pop ESI
			pop ECX
			inc ESI
			loop cycle2
		mov displ,0	
		mov displ1,0
		cmp count,1
		jne  notuniqe 
	
		mov ESI,EAX
		mov EDI,EDX
		mov ECX,EBX
		add newlen, EBX
		inc newlen
		rep movsb
		push EAX
		mov EAX, ' '
		stosb
		pop EAX
		mov EDX,EDI
		mov count,0 
		jmp loopend

        notuniqe:
        lea ESI,dots
        mov EDI,EDX
        mov ECX,3
		add newlen, 3
		inc newlen
        rep movsb
        push EAX
		mov EAX, ' '
		stosb
		pop EAX
        mov EDX,EDI
        mov count,0    
loopend:pop EDI
		pop ESI
		pop ECX
		inc ESI
		jmp cycleend
		
	toend:
		mov ECX, newlen
		lea ESI, scndstr
		mov EDI, [EBP+12]
		rep movsb
		
		XOR EAX,EAX
		mov EAX,newlen
		push EAX
		call _PRINT

		mov ESP,EBP
		pop	  EBP
		ret	
_CHANGE	endp
		end


