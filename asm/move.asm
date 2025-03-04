	.file	"move.c"
	.intel_syntax noprefix
	.text
	.globl	_squareX
	.data
	.align 4
_squareX:
	.long	50
	.globl	_squareY
	.align 4
_squareY:
	.long	50
	.globl	_squareSize
	.section .rdata,"dr"
	.align 4
_squareSize:
	.long	20
	.globl	_moveStep
	.align 4
_moveStep:
	.long	10
	.text
	.globl	_WndProc@16
	.def	_WndProc@16;	.scl	2;	.type	32;	.endef
_WndProc@16:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 132
	cmp	DWORD PTR [ebp+12], 256
	je	L2
	cmp	DWORD PTR [ebp+12], 256
	ja	L3
	cmp	DWORD PTR [ebp+12], 2
	je	L4
	cmp	DWORD PTR [ebp+12], 15
	jne	L3
	lea	eax, [ebp-100]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__BeginPaint@8
	call	eax
	sub	esp, 8
	mov	DWORD PTR [ebp-12], eax
	mov	DWORD PTR [esp], 0
	mov	eax, DWORD PTR __imp__CreateSolidBrush@4
	call	eax
	sub	esp, 4
	mov	DWORD PTR [ebp-16], eax
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__SelectObject@8
	call	eax
	sub	esp, 8
	mov	DWORD PTR [ebp-20], eax
	mov	eax, DWORD PTR _squareY
	mov	edx, 20
	lea	ebx, [eax+edx]
	mov	eax, DWORD PTR _squareX
	mov	edx, 20
	lea	ecx, [eax+edx]
	mov	edx, DWORD PTR _squareY
	mov	eax, DWORD PTR _squareX
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__Rectangle@20
	call	eax
	sub	esp, 20
	mov	eax, DWORD PTR [ebp-20]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__SelectObject@8
	call	eax
	sub	esp, 8
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__DeleteObject@4
	call	eax
	sub	esp, 4
	lea	eax, [ebp-100]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__EndPaint@8
	call	eax
	sub	esp, 8
	jmp	L5
L2:
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__GetClientRect@8
	call	eax
	sub	esp, 8
	cmp	DWORD PTR [ebp+16], 40
	je	L6
	cmp	DWORD PTR [ebp+16], 40
	ja	L7
	cmp	DWORD PTR [ebp+16], 39
	je	L8
	cmp	DWORD PTR [ebp+16], 39
	ja	L7
	cmp	DWORD PTR [ebp+16], 37
	je	L9
	cmp	DWORD PTR [ebp+16], 38
	jne	L7
	mov	eax, DWORD PTR _squareY
	mov	edx, 10
	sub	eax, edx
	test	eax, eax
	js	L15
	mov	eax, DWORD PTR _squareY
	mov	edx, 10
	sub	eax, edx
	mov	DWORD PTR _squareY, eax
	jmp	L15
L6:
	mov	eax, DWORD PTR _squareY
	mov	edx, 20
	add	eax, edx
	mov	edx, 10
	add	edx, eax
	mov	eax, DWORD PTR [ebp-24]
	cmp	edx, eax
	jg	L16
	mov	eax, DWORD PTR _squareY
	mov	edx, 10
	add	eax, edx
	mov	DWORD PTR _squareY, eax
	jmp	L16
L9:
	mov	eax, DWORD PTR _squareX
	mov	edx, 10
	sub	eax, edx
	test	eax, eax
	js	L17
	mov	eax, DWORD PTR _squareX
	mov	edx, 10
	sub	eax, edx
	mov	DWORD PTR _squareX, eax
	jmp	L17
L8:
	mov	eax, DWORD PTR _squareX
	mov	edx, 20
	add	eax, edx
	mov	edx, 10
	add	edx, eax
	mov	eax, DWORD PTR [ebp-28]
	cmp	edx, eax
	jg	L18
	mov	eax, DWORD PTR _squareX
	mov	edx, 10
	add	eax, edx
	mov	DWORD PTR _squareX, eax
	jmp	L18
L15:
	nop
	jmp	L7
L16:
	nop
	jmp	L7
L17:
	nop
	jmp	L7
L18:
	nop
L7:
	mov	DWORD PTR [esp+8], 1
	mov	DWORD PTR [esp+4], 0
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__InvalidateRect@12
	call	eax
	sub	esp, 12
	jmp	L5
L4:
	mov	DWORD PTR [esp], 0
	mov	eax, DWORD PTR __imp__PostQuitMessage@4
	call	eax
	sub	esp, 4
	jmp	L5
L3:
	mov	eax, DWORD PTR [ebp+20]
	mov	DWORD PTR [esp+12], eax
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__DefWindowProcA@16
	call	eax
	sub	esp, 16
	jmp	L14
L5:
	mov	eax, 0
L14:
	mov	ebx, DWORD PTR [ebp-4]
	leave
	ret	16
	.section .rdata,"dr"
LC0:
	.ascii "MyWindow\0"
LC1:
	.ascii "Error!\0"
LC2:
	.ascii "Window Registration Failed!\0"
LC3:
	.ascii "Moving Square\0"
LC4:
	.ascii "Window Creation Failed!\0"
	.text
	.globl	_WinMain@16
	.def	_WinMain@16;	.scl	2;	.type	32;	.endef
_WinMain@16:
	push	ebp
	mov	ebp, esp
	sub	esp, 136
	mov	DWORD PTR [ebp-60], 48
	mov	DWORD PTR [ebp-56], 3
	mov	DWORD PTR [ebp-52], OFFSET FLAT:_WndProc@16
	mov	DWORD PTR [ebp-48], 0
	mov	DWORD PTR [ebp-44], 0
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [ebp-40], eax
	mov	DWORD PTR [esp+4], 32512
	mov	DWORD PTR [esp], 0
	mov	eax, DWORD PTR __imp__LoadIconA@8
	call	eax
	sub	esp, 8
	mov	DWORD PTR [ebp-36], eax
	mov	DWORD PTR [esp+4], 32512
	mov	DWORD PTR [esp], 0
	mov	eax, DWORD PTR __imp__LoadCursorA@8
	call	eax
	sub	esp, 8
	mov	DWORD PTR [ebp-32], eax
	mov	DWORD PTR [ebp-28], 6
	mov	DWORD PTR [ebp-24], 0
	mov	DWORD PTR [ebp-20], OFFSET FLAT:LC0
	mov	DWORD PTR [esp+4], 32512
	mov	DWORD PTR [esp], 0
	mov	eax, DWORD PTR __imp__LoadIconA@8
	call	eax
	sub	esp, 8
	mov	DWORD PTR [ebp-16], eax
	lea	eax, [ebp-60]
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__RegisterClassExA@4
	call	eax
	sub	esp, 4
	test	ax, ax
	jne	L20
	mov	DWORD PTR [esp+12], 48
	mov	DWORD PTR [esp+8], OFFSET FLAT:LC1
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC2
	mov	DWORD PTR [esp], 0
	mov	eax, DWORD PTR __imp__MessageBoxA@16
	call	eax
	sub	esp, 16
	mov	eax, 0
	jmp	L25
L20:
	mov	DWORD PTR [esp+44], 0
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp+40], eax
	mov	DWORD PTR [esp+36], 0
	mov	DWORD PTR [esp+32], 0
	mov	DWORD PTR [esp+28], 600
	mov	DWORD PTR [esp+24], 600
	mov	DWORD PTR [esp+20], -2147483648
	mov	DWORD PTR [esp+16], -2147483648
	mov	DWORD PTR [esp+12], 13565952
	mov	DWORD PTR [esp+8], OFFSET FLAT:LC3
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC0
	mov	DWORD PTR [esp], 0
	mov	eax, DWORD PTR __imp__CreateWindowExA@48
	call	eax
	sub	esp, 48
	mov	DWORD PTR [ebp-12], eax
	cmp	DWORD PTR [ebp-12], 0
	jne	L22
	mov	DWORD PTR [esp+12], 48
	mov	DWORD PTR [esp+8], OFFSET FLAT:LC1
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC4
	mov	DWORD PTR [esp], 0
	mov	eax, DWORD PTR __imp__MessageBoxA@16
	call	eax
	sub	esp, 16
	mov	eax, 0
	jmp	L25
L22:
	mov	eax, DWORD PTR [ebp+20]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__ShowWindow@8
	call	eax
	sub	esp, 8
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__UpdateWindow@4
	call	eax
	sub	esp, 4
	jmp	L23
L24:
	lea	eax, [ebp-88]
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__TranslateMessage@4
	call	eax
	sub	esp, 4
	lea	eax, [ebp-88]
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__DispatchMessageA@4
	call	eax
	sub	esp, 4
L23:
	mov	DWORD PTR [esp+12], 0
	mov	DWORD PTR [esp+8], 0
	mov	DWORD PTR [esp+4], 0
	lea	eax, [ebp-88]
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__GetMessageA@16
	call	eax
	sub	esp, 16
	test	eax, eax
	jg	L24
	mov	eax, DWORD PTR [ebp-80]
L25:
	leave
	ret	16
	.ident	"GCC: (Rev2, Built by MSYS2 project) 14.2.0"
