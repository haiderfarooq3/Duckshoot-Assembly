.model small
.stack 0100h
.data


highscores_file_name db "hscr.txt", 0
highscores_file_handle dw ?
filehandling_array db 10 dup(15 dup('-'),0Ah)
break db '$'
temp_filehandling_score dw 0
temp_filehandling_array db 15 dup('-'),0Ah
temp_filehandling_array2 db 15 dup('-'),0Ah
temp_index db 0

menu_text1 db '          _            _            $'
menu_text2 db '         | |          | |           $'
menu_text3 db '       __| |_   _  ___| | __        $'
menu_text4 db '      / _` | | | |/ __| |/ /        $'
menu_text5 db '     | (_| | |_| | (__|   <         $'
menu_text6 db '      \__,_|\__,_|\___|_|\_\        $'
menu_text7 db '     _                 _            $'
menu_text8 db '    | |               | |           $'
menu_text9 db ' ___| |__   ___   ___ | |_ ___ _ __ $'
menu_texta db '/ __|  _ \ / _ \ / _ \| __/ _ \  __|$'
menu_textb db '\__ \ | | | (_) | (_) | ||  __/ |   $'
menu_textc db '|___/_| |_|\___/ \___/ \__\___|_|   $'

instruct1 db 'MOVE MOUSE TO AIM AND SHOOT WITH LMB$'
instruct2 db 'SHOOT DUCKS ONLY TO BUILD UP SCORE$'
instruct3 db 'PRESS P TO GO BACK$'
instruct4 db 'PRESSING P WORKS EVERYWHERE IN GAME$'
 
menu_start db 'HUNT $'
menu_option db 'TUTORIAL $'
menu_quit db 'QUIT $'
menu_current_option db 1
menu_arrow db '==>$'
menu_arrow_empty db '    $'

name_ask_screen_text db 'ENTER NAME : $'
name_input db 10,0,10 dup(' ')
score db '0000$'
score_int dw 0
timer db '0000$'
timer_num db 0
ducks db '00$'
shots db '00$'
shots_backup db '00$'
round db 0
round_str db '0$'
bullets db 0
ig_name db 'NAME : $'
ig_score db 'SCORE : $'
ig_shots db 'SHOTS : $'
ig_ducks db 'DUCKS : $'
ig_round db 'ROUND : $'
ig_timer db 'TIMER : $'
ig_gameover db 'GAME OVER$'


counter1 dw 0
counter2 dw 0
counter3 dw 0
count dw ?
cordx dw ?
cordy dw ?

inputchar db 0
quit db 0

currx dw 0
currxl dw 40
curry dw 40
curryl dw 72
xlimit dw 218
lastmove db 0
duck_killed db 0
currx2 dw 0
currxl2 dw 40
curry2 dw 75
curryl2 dw 102
lastmove2 db 0
duck_killed2 db 0
currx3 dw 0
currxl3 dw 40
curry3 dw 105
curryl3 dw 137
lastmove3 db 0
duck_killed3 db 0
shots_alr_decreased db 0
shots_alr_decreased2 db 0
shots_alr_decreased3 db 0
secondcheck db 0

duck    DB 09h,09h,09h,09h,09h,09h,09h,09h     ;  0
        DB 09h,09h,09h,09h,09h,09h,09h,02h     ;  1
        DB 02h,0Fh,09h,09h,09h,04h,04h,09h     ;  2
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;  3
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;  4
        DB 09h,09h,09h,09h,09h,09h,02h,02h     ;  5
        DB 0Fh,0Fh,0Fh,04h,04h,04h,04h,09h     ;  6
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;  7
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;  8
        DB 09h,09h,09h,09h,09h,02h,02h,02h     ;  9
        DB 0Fh,0Fh,0Fh,04h,04h,04h,04h,09h     ; 10
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 11
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 12
        DB 09h,09h,09h,09h,09h,02h,02h,02h     ; 13
        DB 0Fh,09h,0Fh,02h,04h,04h,09h,09h     ; 14
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 15
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 16
        DB 09h,09h,09h,09h,09h,02h,02h,02h     ; 17
        DB 0Fh,09h,0Fh,02h,02h,09h,09h,09h     ; 18
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 19
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 20
        DB 09h,09h,09h,09h,09h,02h,02h,02h     ; 21
        DB 02h,0Fh,02h,02h,02h,09h,09h,09h     ; 22
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 23
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 24
        DB 09h,09h,09h,09h,09h,02h,02h,02h     ; 25
        DB 02h,02h,02h,02h,02h,09h,09h,09h     ; 26
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 27
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 28
        DB 09h,09h,09h,09h,02h,02h,02h,02h     ; 29
        DB 02h,02h,02h,02h,02h,09h,09h,09h     ; 30
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 31
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 32
        DB 09h,09h,09h,0Fh,0Fh,0Fh,02h,02h     ; 33
        DB 02h,02h,02h,02h,09h,09h,09h,09h     ; 34
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 35
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 36
        DB 09h,09h,02h,02h,02h,0Fh,0Fh,02h     ; 37
        DB 02h,02h,02h,09h,09h,09h,09h,09h     ; 38
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 39
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 40
        DB 09h,02h,02h,02h,02h,02h,0Fh,09h     ; 41
        DB 02h,02h,09h,09h,09h,09h,09h,09h     ; 42
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 43
        DB 09h,09h,09h,09h,09h,09h,02h,02h     ; 44
        DB 02h,02h,02h,02h,02h,02h,09h,09h     ; 45
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 46
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 47
        DB 09h,09h,09h,09h,08h,02h,02h,02h     ; 48
        DB 02h,02h,02h,02h,02h,02h,09h,09h     ; 49
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 50
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 51
        DB 09h,09h,09h,08h,02h,02h,02h,02h     ; 52
        DB 02h,02h,02h,02h,02h,09h,09h,09h     ; 53
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 54
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 55
        DB 09h,09h,08h,08h,08h,08h,02h,02h     ; 56
        DB 02h,02h,02h,02h,02h,09h,09h,09h     ; 57
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 58
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 59
        DB 09h,08h,08h,0Fh,08h,08h,08h,02h     ; 60
        DB 02h,02h,02h,02h,02h,02h,09h,09h     ; 61
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 62
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 63
        DB 07h,08h,0Fh,08h,08h,08h,08h,08h     ; 64
        DB 02h,02h,02h,02h,02h,02h,09h,09h     ; 65
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 66
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 67
        DB 08h,0Fh,08h,08h,08h,08h,08h,08h     ; 68
        DB 08h,02h,02h,02h,02h,02h,02h,09h     ; 69
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 70
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 71
        DB 0Fh,0Fh,08h,08h,08h,08h,08h,08h     ; 72
        DB 08h,02h,02h,02h,02h,02h,02h,09h     ; 73
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 74
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 75
        DB 08h,08h,08h,08h,08h,08h,08h,08h     ; 76
        DB 08h,0Fh,02h,02h,02h,02h,02h,02h     ; 77
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 78
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 79
        DB 08h,08h,08h,08h,08h,08h,08h,08h     ; 80
        DB 0Fh,0Fh,02h,02h,02h,02h,02h,02h     ; 81
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 82
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 83
        DB 09h,0Fh,08h,0Fh,08h,08h,08h,0Fh     ; 84
        DB 0Fh,09h,0Fh,02h,02h,02h,02h,02h     ; 85
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 86
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 87
        DB 09h,09h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh     ; 88
        DB 0Fh,0Fh,0Fh,02h,02h,02h,02h,02h     ; 89
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 90
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 91
        DB 09h,0Eh,0Eh,0Fh,0Fh,0Fh,0Fh,0Fh     ; 92
        DB 08h,09h,0Fh,02h,02h,02h,02h,02h     ; 93
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 94
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 95
        DB 0Eh,0Eh,0Eh,09h,09h,09h,0Eh,0Eh     ; 96
        DB 0Eh,09h,09h,0Fh,02h,02h,02h,02h     ; 97
        DB 02h,09h,09h,09h,09h,09h,09h,09h     ; 98
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ; 99
        DB 0Eh,08h,08h,09h,09h,0Eh,0Eh,0Eh     ;100
        DB 09h,09h,09h,0Fh,02h,02h,02h,02h     ;101
        DB 02h,09h,09h,09h,09h,09h,09h,09h     ;102
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;103
        DB 09h,08h,09h,09h,0Eh,0Eh,0Eh,0Eh     ;104
        DB 09h,09h,09h,0Fh,0Fh,02h,02h,02h     ;105
        DB 02h,09h,09h,09h,09h,09h,09h,09h     ;106
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;107
        DB 09h,09h,09h,09h,0Eh,0Eh,0Eh,0Eh     ;108
        DB 09h,09h,09h,09h,0Fh,02h,02h,02h     ;109
        DB 02h,02h,09h,09h,09h,09h,09h,09h     ;110
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;111
        DB 09h,09h,09h,09h,09h,0Eh,0Eh,09h     ;112
        DB 09h,09h,09h,09h,0Fh,0Fh,02h,02h     ;113
        DB 02h,02h,09h,09h,09h,09h,09h,09h     ;114
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;115
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;116
        DB 09h,09h,09h,09h,09h,0Fh,0Fh,0Fh     ;117
        DB 02h,02h,02h,09h,09h,09h,09h,09h     ;118
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;119
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;120
        DB 09h,09h,09h,09h,09h,09h,09h,0Fh     ;121
        DB 0Fh,0Fh,0Fh,09h,09h,09h,09h,09h     ;122
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;123
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;124
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;125
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;126
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;127
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;128
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;129
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;130
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;131
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;132
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;133
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;134
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;135
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;136
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;137
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;138
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;139
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;140
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;141
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;142
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;143
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;144
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;145
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;146
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;147
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;148
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;149
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;150
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;151
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;152
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;153
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;154
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;155
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;156
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;157
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;158
        DB 09h,09h,09h,09h,09h,09h,09h,09h     ;159

.code


main proc

	mov ax,@data
	mov ds,ax
    call MakeHighScoreFile
    call ReadHighScoreFile
	mainmenu:
	call draw_menu
	call MenuFunctionality
	cmp quit,1
	je gameloop_cont
	call draw_gamescreen
	
	mov ax,0
	int 33h
	mov ax, 1
	int 33h

	round_next:
	inc round
	call init_round
	cmp round,0
	jne round_cont
	call draw_gameoverscreen
	jmp mainmenu
	round_cont:
	jmp gameloop_cont
	
	gameloop:
		call move_sprites
		call hitchecks
		
		call draw_gamehud
		
		mov ah, 01h
		int 16h
		jz gameloop_cont
		
		cmp al,'p'
		je mainmenu
	
		gameloop_cont:
		
			cmp timer_num,0
			je time_up
			
			cmp shots[0],'0'
			jne time_left
			cmp shots[1],'0'
			jne time_left
			
			time_up:
			mov quit,1
			
			time_left:
		
			mov ah,2Ch
			int 21h
			
			cmp dh,secondcheck
			jl secondpassed
			add secondcheck,1
			cmp dh,secondcheck
			jl dec_secs_2
			
			secondpassed: 
				mov secondcheck,dh
				mov si,offset timer
				call dec_four_length
				dec timer_num
				jmp secondnotpassed
			dec_secs_2:
			sub secondcheck,1
			secondnotpassed:
			cmp quit,1
			je gameloop_exit
			
			cmp ducks[0],'0'
			jne gameloop
			cmp ducks[1],'0'
			jne gameloop
			
			jmp round_next
	
	gameloop_exit:
	
    call WriteHighScoreFile
	call draw_gameoverscreen
	
	mov al, 13h            
	mov ah, 00h
	int 10H

mov ah,04ch
int 21h
main endp

move_sprites proc

	cmp round,4
	jne one_duck_move
	
		call move_sprite
		call move_sprite_2
		call move_sprite_3
		jmp move_sprites_exit
		
	one_duck_move:
		call move_sprite

move_sprites_exit:
ret
move_sprites endp


hitchecks proc

	mov ax, 3
	int 33h 
	
	cmp bx,1
	je lmbpressed
	
	mov shots_alr_decreased,0
	mov shots_alr_decreased2,0
	mov shots_alr_decreased3,0
	jmp hitchecks_exit
	
	lmbpressed:
	
	mov cordx,cx
	mov cordy,dx
	call playsound
		mov cx,cordx
		mov dx,cordy
	

	cmp round,4
	jne one_duck_hit
	
		call hitcheck
		mov cx,cordx
		mov dx,cordy
		call hitcheck2
		mov cx,cordx
		mov dx,cordy
		call hitcheck3
		jmp hitchecks_exit
		
	one_duck_hit:
		call hitcheck

hitchecks_exit:
ret
hitchecks endp

hitcheck3 proc
	
	shr cx,1
	
	cmp cx,50
	jl yeshit3
	cmp cx,currx3
	jl nohit3
	cmp cx,currxl3
	jg nohit3
	cmp dx,curry3
	jl nohit3
	cmp dx,curryl3
	jg nohit3
	
	mov cx,currx3
	mov dx,curry3
	call clear_sprite
	mov duck_killed3,1
	jmp yeshit3

nohit3:
cmp shots_alr_decreased,1
je yeshit3
mov si,offset shots
call dec_two_length
mov shots_alr_decreased,1
yeshit3:
ret
hitcheck3 endp

hitcheck2 proc
	
	shr cx,1
	
	cmp cx,50
	jl yeshit2
	cmp cx,currx2
	jl nohit2
	cmp cx,currxl2
	jg nohit2
	cmp dx,curry2
	jl nohit2
	cmp dx,curryl2
	jg nohit2
	
	mov cx,currx2
	mov dx,curry2
	call clear_sprite
	mov duck_killed2,1
	jmp yeshit2

nohit2:
cmp shots_alr_decreased,1
je yeshit2
mov si,offset shots
call dec_two_length
mov shots_alr_decreased,1
yeshit2:
ret
hitcheck2 endp

hitcheck proc
	
	shr cx,1
	
	cmp cx,50
	jl yeshit
	cmp cx,currx
	jl nohit
	cmp cx,currxl
	jg nohit
	cmp dx,curry
	jl nohit
	cmp dx,curryl
	jg nohit
	
	mov cx,currx
	mov dx,curry
	call clear_sprite
	mov duck_killed,1
	jmp yeshit

nohit:
cmp shots_alr_decreased,1
je yeshit
mov si,offset shots
call dec_two_length
mov shots_alr_decreased,1
yeshit:
ret
hitcheck endp

draw_menu proc  
                                                                                
	mov al, 13h            
	mov ah, 00h
	int 10H

	mov dl, 3
	mov dh, 2
	mov si,offset menu_text1
	call draw_text
	mov dl, 3
	mov dh, 3
	mov si,offset menu_text2
	call draw_text
	mov dl, 3
	mov dh, 4
	mov si,offset menu_text3
	call draw_text
	mov dl, 3
	mov dh, 5
	mov si,offset menu_text4
	call draw_text
	mov dl, 3
	mov dh, 6
	mov si,offset menu_text5
	call draw_text
	mov dl, 3
	mov dh, 8
	mov si,offset menu_text6
	call draw_text
	mov dl, 3
	mov dh, 9
	mov si,offset menu_text7
	call draw_text
	mov dl, 3
	mov dh, 10
	mov si,offset menu_text8
	call draw_text
	mov dl, 3
	mov dh, 11
	mov si,offset menu_text9
	call draw_text
	mov dl, 3
	mov dh, 12
	mov si,offset menu_texta
	call draw_text
	mov dl, 3
	mov dh, 13
	mov si,offset menu_textb
	call draw_text
	mov dl, 3
	mov dh, 14
	mov si,offset menu_textc
	call draw_text
	mov dl, 18
	mov dh, 18
	mov si,offset menu_start
	call draw_text
	mov dl, 16
	mov dh, 20
	mov si,offset menu_option
	call draw_text
	mov dl, 18
	mov dh, 22
	mov si,offset menu_quit
	call draw_text

ret
draw_menu endp

MenuFunctionality PROC

menu_looper:
call DrawSelectionArrow

		mov ah, 6
		mov dl, 255
		int 21h
		jz menu_looper

        mov inputChar,al

        cmp inputChar,"w"
        je menu_up

        cmp inputChar,"s"
        je menu_down

        cmp inputChar,13
        je menu_enter 

        jmp menu_looper

        menu_up:
            call UpdateSelectionArrow
            dec menu_current_option
            
            cmp menu_current_option,0
            jne continue_drawing_menu_arrow1 

            mov menu_current_option,3

            continue_drawing_menu_arrow1:
            call DrawSelectionArrow
           
            jmp menu_looper

        menu_down:
            call UpdateSelectionArrow
            inc menu_current_option
            cmp menu_current_option,4
            jne continue_drawing_menu_arrow2

            mov menu_current_option,1

            continue_drawing_menu_arrow2:
            call DrawSelectionArrow
           
            jmp menu_looper

        menu_enter:
            cmp menu_current_option,1
            je start_selected_for_enter
            cmp menu_current_option,2
            je options_selected_for_enter
            cmp menu_current_option,3
            je quit_selected_for_enter
            jmp menu_looper

            start_selected_for_enter:
                call DrawNameAskScreen
                jmp MenuFunctionality_exit
            options_selected_for_enter:
				call draw_instructions
				call draw_menu
				jmp menu_looper
            quit_selected_for_enter:
				mov quit,1
				ret			
                
            jmp menu_looper

MenuFunctionality_exit:
ret 
MenuFunctionality ENDP

draw_instructions proc                                                                         
	mov al, 13h            
	mov ah, 00h
	int 10H

	mov dl, 3
	mov dh, 2
	mov si,offset menu_text1
	call draw_text
	mov dl, 3
	mov dh, 3
	mov si,offset menu_text2
	call draw_text
	mov dl, 3
	mov dh, 4
	mov si,offset menu_text3
	call draw_text
	mov dl, 3
	mov dh, 5
	mov si,offset menu_text4
	call draw_text
	mov dl, 3
	mov dh, 6
	mov si,offset menu_text5
	call draw_text
	mov dl, 3
	mov dh, 8
	mov si,offset menu_text6
	call draw_text
	mov dl, 3
	mov dh, 9
	mov si,offset menu_text7
	call draw_text
	mov dl, 3
	mov dh, 10
	mov si,offset menu_text8
	call draw_text
	mov dl, 3
	mov dh, 11
	mov si,offset menu_text9
	call draw_text
	mov dl, 3
	mov dh, 12
	mov si,offset menu_texta
	call draw_text
	mov dl, 3
	mov dh, 13
	mov si,offset menu_textb
	call draw_text
	mov dl, 3
	mov dh, 14
	mov si,offset menu_textc
	call draw_text
	mov dl, 2
	mov dh, 16
	mov si,offset instruct1
	call draw_text
	mov dl, 2
	mov dh, 18
	mov si,offset instruct2
	call draw_text
	mov dl, 2
	mov dh, 20
	mov si,offset instruct3
	call draw_text
	mov dl, 2
	mov dh, 22
	mov si,offset instruct4
	call draw_text
	
	instruct_looper:
		
		mov ah, 6
		mov dl, 255
		int 21h
		jz instruct_looper
		mov inputchar,al
		cmp inputchar,"p"
		jne instruct_looper
	
ret
draw_instructions endp

DrawNameAskScreen proc
                                                                        
	mov al, 13h            
	mov ah, 00h
	int 10H
	
	mov dl,10
	mov dh,10
	mov si,offset name_ask_screen_text
	call draw_text
	
	mov dx, offset name_input
	mov ah, 0ah
	int 21h
	xor bx, bx
	mov bl, name_input[1]
	mov name_input[bx+2], '$'
	mov dx, offset name_input + 2
	mov ah, 9
	int 21h 
	
	mov al, 13h            
	mov ah, 00h
	int 10H
	
	mov dl,0
	mov dh,0
	mov si,offset filehandling_array
	call draw_text
	
	
	
	mov ah,2Ch
	int 21h
	mov bh,dh
	
	hscrdelayer:
		mov ah,2Ch
		int 21h
		
		cmp dh,bh
		jl DrawNameAskScreen_exit
		add bh,5
		cmp dh,bh
		jg DrawNameAskScreen_exit
		sub bh,5
		jmp hscrdelayer

DrawNameAskScreen_exit:
ret
DrawNameAskScreen endp

draw_text PROC 
	mov bh,0
	mov ah,2
	int 10h
	mov dx,si
	mov ah,9
	int 21h
ret
draw_text endp

DrawSelectionArrow PROC

    mov dl,12

    cmp menu_current_option,1
    je start_selected
    cmp menu_current_option,2
    je options_selected
    cmp menu_current_option,3
    je quit_selected

    start_selected:
        mov dh,18
        jmp DrawSelectionArrow_exit

    options_selected:
        mov dh,20
        jmp DrawSelectionArrow_exit

    quit_selected:
        mov dh,22
        jmp DrawSelectionArrow_exit

    DrawSelectionArrow_exit:
		mov si,offset menu_arrow
		call draw_text
        ret
DrawSelectionArrow ENDP

UpdateSelectionArrow PROC

    mov dl,12

    cmp menu_current_option,1
    je start_selected_update
    cmp menu_current_option,2
    je options_selected_update
    cmp menu_current_option,3
    je quit_selected_update

    start_selected_update:
        mov dh,18
        jmp UpdateSelectionArrow_exit

    options_selected_update:
        mov dh,20
        jmp UpdateSelectionArrow_exit

    quit_selected_update:
        mov dh,22
        jmp UpdateSelectionArrow_exit

    UpdateSelectionArrow_exit:
		mov si,offset menu_arrow_empty
		call draw_text
        ret
UpdateSelectionArrow ENDP

move_sprite_3 proc

	cmp duck_killed3,1
	je killed3

	mov ah,2Ch
	int 21h
	
	cmp dl,lastmove3
	jl domove3
	add lastmove3,8
	cmp dl,lastmove3
	jl dontmovemin3
	
	domove3:
	mov lastmove3,dl
	mov cx,currx3
	mov dx,curry3
	call clear_sprite
	
	inc currx3
	inc currxl3
	
	mov cx,currx3
	cmp cx,xlimit
	je despawn3
	
	mov cx,currx3
	mov dx,curry3
	call draw_sprite
	jmp dontmove
	
	killed3:
	mov cx,50
	scoreloop3:
		call inc_score
		LOOP scoreloop3
	mov duck_killed3,0
	despawn3:
	mov si,offset ducks
	call dec_two_length
	mov al,shots_backup[0]
	mov shots[0],al
	mov al,shots_backup[1]
	inc al
	mov shots[1],al
	mov currx3,0
	mov curry3,105
	mov currxl3,40
	mov curryl3,137
	jmp dontmove3
	
dontmovemin3:
sub lastmove3,8
dontmove3:
ret
move_sprite_3 endp

move_sprite_2 proc

	cmp duck_killed2,1
	je killed2

	mov ah,2Ch
	int 21h
	
	cmp dl,lastmove2
	jl domove2
	add lastmove2,8
	cmp dl,lastmove2
	jl dontmovemin2
	
	domove2:
	mov lastmove2,dl
	mov cx,currx2
	mov dx,curry2
	call clear_sprite
	
	inc currx2
	inc currxl2
	
	mov cx,currx2
	cmp cx,xlimit
	je despawn2
	
	mov cx,currx2
	mov dx,curry2
	call draw_sprite
	jmp dontmove2
	
	killed2:
	mov cx,50
	scoreloop2:
		call inc_score
		LOOP scoreloop2
	mov duck_killed2,0
	despawn2:
	mov si,offset ducks
	call dec_two_length
	mov al,shots_backup[0]
	mov shots[0],al
	mov al,shots_backup[1]
	inc al
	mov shots[1],al
	mov currx2,0
	mov curry2,75
	mov currxl2,40
	mov curryl2,102
	jmp dontmove2
	
dontmovemin2:
sub lastmove2,8
dontmove2:
ret
move_sprite_2 endp

move_sprite proc

	cmp duck_killed,1
	je killed

	mov ah,2Ch
	int 21h
	
	cmp dl,lastmove
	jl domove
	add lastmove,8
	cmp dl,lastmove
	jl dontmovemin
	
	domove:
	mov lastmove,dl
	mov cx,currx
	mov dx,curry
	call clear_sprite
	
	inc currx
	inc currxl
	
	mov cx,currx
	cmp cx,xlimit
	je despawn
	
	mov cx,currx
	mov dx,curry
	call draw_sprite
	jmp dontmove
	
	killed:
	mov cx,50
	scoreloop:
		call inc_score
		LOOP scoreloop
	add score_int,50
	mov duck_killed,0
	despawn:
	mov si,offset ducks
	call dec_two_length
	mov al,shots_backup[0]
	mov shots[0],al
	mov al,shots_backup[1]
	inc al
	mov shots[1],al
	mov currx,0
	mov curry,40
	mov currxl,40
	mov curryl,72
	jmp dontmove
	
dontmovemin:
sub lastmove,8
dontmove:
ret
move_sprite endp

draw_sprite proc
	
	
	mov si,0
	mov counter1,0
	mov counter2,0
	mov counter3,cx
	spriteloopo:
		spriteloopi:
			mov ah,0ch
			mov al,duck[si]
			int 10h
			inc cx
			inc counter2
			inc si
			cmp counter2,32
			jl spriteloopi
			
		mov counter2,0
		mov cx,counter3
		inc dx
		inc counter1
		cmp counter1,40
		jl spriteloopo
		
ret
draw_sprite endp

clear_sprite proc
		
	mov counter1,0
	mov counter2,0
	mov counter3,cx
	clearloopo:
		clearloopi:
			mov ah,0ch
			mov al,1001b
			int 10h
			inc cx
			inc counter2
			inc si
			cmp counter2,32
			jl clearloopi
			
		mov counter2,0
		mov cx,counter3
		inc dx
		inc counter1
		cmp counter1,40
		jl clearloopo
		
ret
clear_sprite endp

draw_gamehud proc

	mov dl,8
	mov dh,0
	mov si,offset score
	call draw_text
	mov dl,24
	mov dh,0
	mov si,offset shots
	call draw_text
	mov dl,36
	mov dh,0
	mov si,offset ducks
	call draw_text
	mov dl,8
	mov dh,1
	mov si,offset timer
	call draw_text
	mov al,round
	add al,'0'
	mov round_str[0],al
	mov dl,36
	mov dh,1
	mov si,offset round_str
	call draw_text

ret
draw_gamehud endp

draw_gamescreen proc
                                                                                
	mov al, 13h            
	mov ah, 00h
	int 10H
	
	mov dl,0
	mov dh,0
	mov si,offset ig_score
	call draw_text
	mov dl,16
	mov dh,0
	mov si,offset ig_shots
	call draw_text
	mov dl,28
	mov dh,0
	mov si,offset ig_ducks
	call draw_text
	mov dl,0
	mov dh,1
	mov si,offset ig_timer
	call draw_text
	mov dl,28
	mov dh,1
	mov si,offset ig_round
	call draw_text

	mov cx,0
	mov dx,16
	mov counter1,0
	mov counter2,0
	looperouter1:
		looperinner1:
			mov al, 1001b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc counter2
			cmp counter2,320
			jl looperinner1
			
		mov counter2,0
		mov cx,0
		inc dx
		inc counter1
		cmp counter1,184
		jl looperouter1
	
	mov cx,0
	mov dx,152
	mov counter1,0
	mov counter2,0
	looperouter2:
		looperinner2:
			mov al, 1010b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc counter2
			cmp counter2,320
			jl looperinner2
			
		mov counter2,0
		mov cx,0
		inc dx
		inc counter1
		cmp counter1,48
		jl looperouter2
		
	mov cx,280
	mov dx,48
	mov counter1,0
	mov counter2,0
	looperouter3:
		looperinner3:
			mov al, 0110b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc counter2
			cmp counter2,32
			jl looperinner3
			
		mov counter2,0
		mov cx,280
		inc dx
		inc counter1
		cmp counter1,120
		jl looperouter3
		
	mov cx,250
	mov dx,32
	mov counter1,0
	mov counter2,0
	looperouter4:
		looperinner4:
			mov al, 0010b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc counter2
			cmp counter2,70
			jl looperinner4
			
		mov counter2,0
		mov cx,250
		inc dx
		inc counter1
		cmp counter1,72
		jl looperouter4
	

ret
draw_gamescreen endp

draw_gameoverscreen proc
                      
	mov al, 13h            
	mov ah, 00h
	int 10H
	
	mov dl, 14
	mov dh, 9
	mov si,offset ig_gameover
	call draw_text
	
	mov dl, 14
	mov dh, 11
	mov bh,0
	mov ah,2
	int 10h
	mov dx, offset name_input + 2
	mov ah, 9
	int 21h 
	
	mov dl, 24
	mov dh, 11
	mov si,offset score
	call draw_text
	
	mov ah,2Ch
	int 21h
	mov secondcheck,dh
	
	gameoverdelayer:
		mov ah,2Ch
		int 21h
		
		cmp dh,secondcheck
		jl draw_gameoverscreen_exit
		add secondcheck,5
		cmp dh,secondcheck
		jg draw_gameoverscreen_exit
		sub secondcheck,5
		jmp gameoverdelayer
		
draw_gameoverscreen_exit:
ret
draw_gameoverscreen endp
		
dec_two_length proc

	mov al,byte ptr[si+1]
	cmp al,'0'
	je check_higher_shots
	
	dec al
	mov [si+1],al
	jmp dec_shots_exit
	
	check_higher_shots:
		mov ah,byte ptr[si]
		cmp ah,'0'
		je dec_shots_exit
		
		mov al,'9'
		mov [si+1],al
		
		dec ah
		mov [si],ah

dec_shots_exit:
ret
dec_two_length endp	

inc_score proc

	mov al,score[3]
	cmp al,'9'
	je check_sec_score
	
	inc al
	mov score[3],al
	jmp inc_score_exit
	
	check_sec_score:
		mov ah,score[2]
		cmp ah,'9'
		je check_third_score
		
		mov al,'0'
		mov score[3],al
		
		inc ah
		mov score[2],ah
		jmp inc_score_exit
		
		check_third_score:
			mov ah,score[1]
			cmp ah,'9'
			je check_fourth_score
			
			mov al,'0'
			mov score[2],al
			mov score[3],al
			
			inc ah
			mov score[1],ah
			jmp inc_score_exit
			
			check_fourth_score:
				mov ah,score[0]
				cmp ah,'9'
				je inc_score_exit
				
				mov al,'0'
				mov score[1],al
				mov score[2],al
				mov score[3],al
				
				inc ah
				mov score[0],ah
				jmp inc_score_exit
				

inc_score_exit:

ret
inc_score endp

dec_four_length proc

	mov al,byte ptr[si+3]
	cmp al,'0'
	je check_sec_place
	
	dec al
	mov [si+3],al
	jmp dec_four_length_exit
	
	check_sec_place:
		mov ah,byte ptr[si+2]
		cmp ah,'0'
		je check_third_place
		
		mov al,'9'
		mov [si+3],al
		
		dec ah
		mov [si+2],ah
		jmp dec_four_length_exit
		
		check_third_place:
			mov ah,byte ptr[si+1]
			cmp ah,'0'
			je check_fourth_place
			
			mov al,'9'
			mov [si+2],al
			mov [si+3],al
			
			dec ah
			mov [si+1],ah
			jmp dec_four_length_exit
			
			check_fourth_place:
				mov ah,byte ptr[si]
				cmp ah,'0'
				je dec_four_length_exit
				
				mov al,'9'
				mov [si+1],al
				mov [si+2],al
				mov [si+3],al
				
				dec ah
				mov [si],ah
				jmp dec_four_length_exit
				

dec_four_length_exit:
ret
dec_four_length endp	
	
init_round proc

	cmp round,1
		jne next_round_1
		mov shots[0],'0'
		mov shots[1],'5'
		
		mov ducks[0],'0'
		mov ducks[1],'1'
		
		mov score[0],'0'
		mov score[1],'0'
		mov score[2],'0'
		mov score[3],'0'
		
		mov timer[0],'0'
		mov timer[1],'0'
		mov timer[2],'5'
		mov timer[3],'0'
		mov timer_num,50
		jmp init_round_exit
		
	next_round_1:
	cmp round,2
		jne next_round_2
		mov shots[0],'0'
		mov shots[1],'5'
		
		mov ducks[0],'0'
		mov ducks[1],'1'
		
		mov timer[0],'0'
		mov timer[1],'0'
		mov timer[2],'5'
		mov timer[3],'0'
		mov timer_num,50
		jmp init_round_exit
		
	next_round_2:
		cmp round,3
		jne next_round_3
		mov shots[0],'0'
		mov shots[1],'5'
		
		mov ducks[0],'0'
		mov ducks[1],'1'
		
		mov timer[0],'0'
		mov timer[1],'0'
		mov timer[2],'5'
		mov timer[3],'0'
		mov timer_num,50
		jmp init_round_exit
	
	next_round_3:
		cmp round,4
		jne next_round_4
		mov shots[0],'0'
		mov shots[1],'5'
		
		mov ducks[0],'0'
		mov ducks[1],'6'
		
		mov timer[0],'0'
		mov timer[1],'0'
		mov timer[2],'5'
		mov timer[3],'0'
		mov timer_num,50
		jmp init_round_exit
		
	next_round_4:
		mov round,0
		jmp init_round_exit

init_round_exit:
mov al,shots[0]
mov shots_backup[0],al
mov al,shots[1]
mov shots_backup[1],al
ret
init_round endp

swap proc

	mov al,[si]
	mov temp_filehandling_array[0],al
	mov al,[si+1]
	mov temp_filehandling_array[1],al
	mov al,[si+2]
	mov temp_filehandling_array[2],al
	mov al,[si+3]
	mov temp_filehandling_array[3],al
	mov al,[si+4]
	mov temp_filehandling_array[4],al
	mov al,[si+5]
	mov temp_filehandling_array[5],al
	mov al,[si+6]
	mov temp_filehandling_array[6],al
	mov al,[si+7]
	mov temp_filehandling_array[7],al
	mov al,[si+8]
	mov temp_filehandling_array[8],al
	mov al,[si+9]
	mov temp_filehandling_array[9],al
	mov al,[si+10]
	mov temp_filehandling_array[10],al
	mov al,[si+11]
	mov temp_filehandling_array[11],al
	mov al,[si+12]
	mov temp_filehandling_array[12],al
	mov al,[si+13]
	mov temp_filehandling_array[13],al
	mov al,[si+14]
	mov temp_filehandling_array[14],al
	
	mov al, temp_filehandling_array2[0]
	mov [si], al
	mov al, temp_filehandling_array2[1]
	mov [si + 1], al
	mov al, temp_filehandling_array2[2]
	mov [si + 2], al
	mov al, temp_filehandling_array2[3]
	mov [si + 3], al
	mov al, temp_filehandling_array2[4]
	mov [si + 4], al
	mov al, temp_filehandling_array2[5]
	mov [si + 5], al
	mov al, temp_filehandling_array2[6]
	mov [si + 6], al
	mov al, temp_filehandling_array2[7]
	mov [si + 7], al
	mov al, temp_filehandling_array2[8]
	mov [si + 8], al
	mov al, temp_filehandling_array2[9]
	mov [si + 9], al
	mov al, temp_filehandling_array2[10]
	mov [si + 10], al
	mov al, temp_filehandling_array2[11]
	mov [si + 11], al
	mov al, temp_filehandling_array2[12]
	mov [si + 12], al
	mov al, temp_filehandling_array2[13]
	mov [si + 13], al
	mov al, temp_filehandling_array2[14]
	mov [si + 14], al

	mov al, temp_filehandling_array[0]
	mov temp_filehandling_array2[0], al

	mov al, temp_filehandling_array[1]
	mov temp_filehandling_array2[1], al

	mov al, temp_filehandling_array[2]
	mov temp_filehandling_array2[2], al

	mov al, temp_filehandling_array[3]
	mov temp_filehandling_array2[3], al

	mov al, temp_filehandling_array[4]
	mov temp_filehandling_array2[4], al

	mov al, temp_filehandling_array[5]
	mov temp_filehandling_array2[5], al

	mov al, temp_filehandling_array[6]
	mov temp_filehandling_array2[6], al

	mov al, temp_filehandling_array[7]
	mov temp_filehandling_array2[7], al

	mov al, temp_filehandling_array[8]
	mov temp_filehandling_array2[8], al

	mov al, temp_filehandling_array[9]
	mov temp_filehandling_array2[9], al

	mov al, temp_filehandling_array[10]
	mov temp_filehandling_array2[10], al

	mov al, temp_filehandling_array[11]
	mov temp_filehandling_array2[11], al

	mov al, temp_filehandling_array[12]
	mov temp_filehandling_array2[12], al

	mov al, temp_filehandling_array[13]
	mov temp_filehandling_array2[13], al

	mov al, temp_filehandling_array[14]
	mov temp_filehandling_array2[14], al

	add si,16
dec cx
cmp cx,0

ret
swap endp

MakeHighScoreFile PROC

		mov al, 2
		mov dx, offset highscores_file_name
		mov ah, 3dh
		int 21h
		jc doesnt_exist
		mov highscores_file_handle, ax
		jmp exist
		
		doesnt_exist:
		
			mov ah, 3ch
			mov cx, 0
			mov dx, offset highscores_file_name
			mov ah, 3ch
			int 21h
			mov highscores_file_handle, ax

		exist:
ret
MakeHighScoreFile ENDP

ReadHighScoreFile PROC

    mov  bx,highscores_file_handle
    mov  dx,offset filehandling_array
    mov  cx,160
    mov ah,3Fh
	mov al,0
	int 21h
	
	mov bx,highscores_file_handle
	mov ah,3Eh
	int 21h

ret
ReadHighScoreFile ENDP

WriteHighScoreFile PROC

	mov al, 2
	mov dx, offset highscores_file_name
	mov ah, 3dh
	int 21h

    mov si,offset filehandling_array
    mov cx,10
    mov temp_index,0
    placer_loop:
        mov dl,'-'
        cmp [si],dl
        je place_here

        mov temp_filehandling_score,0
		mov ah,0
        mov al,byte ptr[si+10]
        sub ax,48
		mov bx,1000
        mul bx
        add temp_filehandling_score,ax
		mov ah,0
        mov al,byte ptr[si+11]
        sub ax,48
		mov bx,1000
        mul bx
        add temp_filehandling_score,ax
		mov ah,0
        mov al,byte ptr[si+12]
        sub ax,48
		mov bx,10
        mul bx
        add temp_filehandling_score,ax
		mov ah,0
        mov al,byte ptr[si+13]
        sub ax,48
        add temp_filehandling_score,ax

        mov ax,score_int
        cmp temp_filehandling_score,ax
        jbe place_here

        add si,16
        inc temp_index
    LOOP placer_loop

    
    mov bx,highscores_file_handle
	mov ah,3Eh
	int 21h
    ret


    place_here:
        mov al,[si]
        mov temp_filehandling_array2[0],al
        mov al,[si+1]
        mov temp_filehandling_array2[1],al
        mov al,[si+2]
        mov temp_filehandling_array2[2],al
        mov al,[si+3]
        mov temp_filehandling_array2[3],al
        mov al,[si+4]
        mov temp_filehandling_array2[4],al
        mov al,[si+5]
        mov temp_filehandling_array2[5],al
        mov al,[si+6]
        mov temp_filehandling_array2[6],al
        mov al,[si+7]
        mov temp_filehandling_array2[7],al
        mov al,[si+8]
        mov temp_filehandling_array2[8],al
        mov al,[si+9]
        mov temp_filehandling_array2[9],al
        mov al,[si+10]
        mov temp_filehandling_array2[10],al
        mov al,[si+11]
        mov temp_filehandling_array2[11],al
        mov al,[si+12]
        mov temp_filehandling_array2[12],al
        mov al,[si+13]
        mov temp_filehandling_array2[13],al
        mov al,[si+14]
        mov temp_filehandling_array2[14],al


        mov al,name_input[2]
        mov byte ptr [si],al
        mov al,name_input[3]
        mov byte ptr [si+1],al
        mov al,name_input[4]
        mov byte ptr [si+2],al
        mov al,name_input[5]
        mov byte ptr [si+3],al
        mov al,name_input[6]
        mov byte ptr [si+4],al
        mov al,name_input[7]
        mov byte ptr [si+5],al
        mov al,name_input[8]
        mov byte ptr [si+6],al
        mov al,name_input[9]
        mov byte ptr [si+7],al
        mov al,name_input[10]
        mov byte ptr [si+8],al
        mov al,name_input[11]
        mov byte ptr [si+9],al
        mov ax,score_int
        mov cl,'0'
        mov dx,0
        mov bx,0
        mov bl,10
        div bx
        add cl,dl
        mov byte ptr [si+13],cl
        mov cl,'0'
        mov dx,0
        mov bx,0
        mov bl,10
        div bx
        add cl,dl
        mov byte ptr [si+12],cl
        mov cl,'0'
        mov dx,0
        mov bx,0
        mov bl,10
        div bx
        add cl,dl
        mov byte ptr [si+11],cl
        mov cl,'0'
        add cl,al
        mov byte ptr [si+10],cl
        mov cl,'0'
        add cl,round
        mov byte ptr [si+14],cl

        add si,16

		mov ch,0
        mov cx,10
        sub cl,temp_index
        dec cx
        swapper_loop:
            call swap
        jne swapper_loop
		
	mov si,offset filehandling_array
	mov cx,160
	
	dollarloop:
		cmp byte ptr[si],'$'
		jne dollarloop_cont
		
		mov al,' '
		mov [si],al
		
		dollarloop_cont:
			inc si
			LOOP dollarloop
        

    mov  bx,highscores_file_handle
    mov  dx,offset filehandling_array
    mov  cx,160
    mov ah,40h
	mov al,0
	int 21h

    mov bx,highscores_file_handle
	mov ah,3Eh
	int 21h

ret
WriteHighScoreFile ENDP

playsound proc

		mov cx,0
		mov dx,1000
		mov ax,2000h

		MOV BX, AX          ; 1) Preserve the note value by storing it in BX.
		MOV AL, 182         ; 2) Set up the write to the control word register.
		OUT 43h, AL         ; 2) Perform the write.
		MOV AX, BX          ; 2) Pull back the frequency from BX.
		OUT 42h, AL         ; 2) Send lower byte of the frequency.
		MOV AL, AH          ; 2) Load higher byte of the frequency.
		OUT 42h, AL         ; 2) Send the higher byte.
		IN AL, 61h          ; 3) Read the current keyboard controller status.
		OR AL, 03h          ; 3) Turn on 0 and 1 bit, enabling the PC speaker gate and the data transfer.
		OUT 61h, AL         ; 3) Save the new keyboard controller status.
		MOV AH, 86h         ; 4) Load the BIOS WAIT, int15h function AH=86h.
		INT 15h             ; 4) Immediately interrupt. The delay is already in CX:DX.
		IN AL, 61h          ; 5) Read the current keyboard controller status.
		AND AL, 0FCh        ; 5) Turn off 0 and 1 bit, simply disabling the gate.
		OUT 61h, AL         ; 5) Write the new keyboard controller status.

ret
playsound endp

gamequit:
		
mov ah, 4ch
int 21h
end