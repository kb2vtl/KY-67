; Disassembly of the file "C:\Documents and Settings\Michael Gottlieb\Desktop\KY-67\ky-67.bin"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Saturday, 31 of December 2016 at 07:20 PM
; 
; 8000h - 807fh NSC810 RAM (128 bytes)
; 8080h - 8099h NSC810 registers (IO and timers)
;
; 8000 series addresses used
; 8000h		
; 8001h
; 8002h
; 8003h
; 8004h
; 8005h
; 8006h
; 8007h
; 8008h
; 800bh
; 800ch
; 800dh
; 800eh
; 800fh
; 8010h		
; 8011h
; 8012h
; 8013h
; 8014h
; 8015h
; 8016h
; 8017h
; 8018h
; 8019h
; 801ah
; 801bh
; 801ch
; 801dh
; 801eh
; 801fh
; 8020h		
; 8023h
; 8024h
; 8025h
; 8026h
; 8027h
; 8028h
; 8029h
; 802ah
; 802bh
; 807fh		Stack pointer, can go down to 802ch
; 8080h		IO port A  (see NSC810)
; 8081h		IO port B
; 8082h		IO port C
; 8084h		DDR A
; 8085h		DDR B
; 8086h		DDR C
; 8087h		mode definition
; 808ah		port C bit clear
; 808eh		port C bit set
; 8090h		timer 0 Low Byte
; 8091h		timer 0 High Byte
; 8092h		timer 1 Low Byte
; 8093h		timer 1 High Byte
; 8095h		start timer 0
; 8096h		stop timer 1
; 8097h		start timer 1
; 8098h		timer 0 mode
; 8099h		timer 1 mode
;

0000 f3        di      						; power-on reset, disable interrupts
0001 c38000    jp      0080h				; jump to 80

0034 dde9      jp      (ix)

0038 f3        di            				; INTR/ Mode 1, disable interrupts
0039 c38000    jp      0080h				; jump to 80

003c fde9      jp      (iy)

0080 c3d215    jp      15d2h				; startup

0083 00        nop     						; from 16de
0084 c30d07    jp      070dh
0087 00        nop     						; from 0731
0088 c31b08    jp      081bh
;*******************************************************************************************
; called from 13cc
0100 0e00      ld      c,00h				
0102 3a0b80    ld      a,(800bh)			;
0105 217001    ld      hl,0170h				; data at 0170
0108 be        cp      (hl)
0109 2807      jr      z,0112h
010b 380f      jr      c,011ch
010d 23        inc     hl
010e 23        inc     hl
010f 0c        inc     c
0110 18f6      jr      0108h
0112 3a0c80    ld      a,(800ch)			;
0115 e60f      and     0fh
0117 23        inc     hl
0118 be        cp      (hl)
0119 3801      jr      c,011ch
011b 0c        inc     c
011c 3a1980    ld      a,(8019h)
011f e60f      and     0fh
0121 b9        cp      c
0122 2834      jr      z,0158h
0124 3a1980    ld      a,(8019h)
0127 e6f0      and     0f0h
0129 b1        or      c
012a 321980    ld      (8019h),a
012d 3e01      ld      a,01h
012f 0622      ld      b,22h
0131 cd5415    call    1554h				;
0134 3e01      ld      a,01h
0136 cdd507    call    07d5h				;
0139 3e00      ld      a,00h
013b 0622      ld      b,22h
013d cd5415    call    1554h				;
0140 218001    ld      hl,0180h
0143 0600      ld      b,00h
0145 09        add     hl,bc
0146 7e        ld      a,(hl)
0147 0620      ld      b,20h
0149 cd5415    call    1554h				;
014c 3e01      ld      a,01h
014e cdd507    call    07d5h				;
0151 3e00      ld      a,00h
0153 0620      ld      b,20h
0155 cd5415    call    1554h				;
0158 3a0b80    ld      a,(800bh)
015b fe58      cp      58h
015d 0e03      ld      c,03h
015f 3008      jr      nc,0169h
0161 fe40      cp      40h
0163 0e12      ld      c,12h
0165 3002      jr      nc,0169h
0167 0e11      ld      c,11h
0169 79        ld      a,c
016a 0620      ld      b,20h
016c cd5415    call    1554h				;
016f c9        ret     
;*************************************************************************
; data used at 0105
0170		   db	   031h, 003h, 032h, 003h, 033h, 007h, 035h, 009h
0178		   db	   039h, 000h, 044h, 006h, 059h, 001h, 099h, 009h
0180		   db	   02ch, 024h, 028h, 020h, 00ch, 004h, 008h, 000h

;**************************************************************************
; called from 07fa, 097f, 0f43, 0f71, 0f98, 0fcd, 1005, 1031, 1073, 101d, 1440, 144c, 14be, 
0188 57        ld      d,a					
0189 3a0280    ld      a,(8002h)
018c aa        xor     d
018d 5f        ld      e,a
018e 282d      jr      z,01bdh
0190 7a        ld      a,d
0191 320280    ld      (8002h),a
0194 cb63      bit     4,e
0196 2804      jr      z,019ch
0198 cb5b      bit     3,e
019a 2004      jr      nz,01a0h
019c cba2      res     4,d
019e cb9a      res     3,d
01a0 cb53      bit     2,e
01a2 2804      jr      z,01a8h
01a4 cb4b      bit     1,e
01a6 2004      jr      nz,01ach
01a8 cb92      res     2,d
01aa cb8a      res     1,d
01ac 7a        ld      a,d
01ad 0680      ld      b,80h
01af cd5415    call    1554h				;
01b2 3e01      ld      a,01h
01b4 cdd507    call    07d5h				;
01b7 7a        ld      a,d
01b8 e621      and     21h
01ba cd5415    call    1554h				;
01bd c9        ret     
;***********************************************************************
; where is this called from?
01be f3        di      
01bf e5        push    hl
01c0 c5        push    bc
01c1 f5        push    af
01c2 3e00      ld      a,00h
01c4 d3bb      out     (0bbh),a
01c6 212680    ld      hl,8026h
01c9 cbae      res     5,(hl)
01cb 0613      ld      b,13h
01cd cdb10c    call    0cb1h
01d0 320080    ld      (8000h),a
01d3 f3        di      
01d4 3e0c      ld      a,0ch
01d6 d3bb      out     (0bbh),a
01d8 f1        pop     af
01d9 c1        pop     bc
01da e1        pop     hl
01db fb        ei      
01dc c9        ret     
;*******************************************************************************
; called from 161c, 1624, 1631, 1687, 16c4, 181b, 182a, 1e1b, 1e3f, 1f0f, 1f4b, 2023, 21a2
01dd e5        push    hl					
01de c5        push    bc
01df 47        ld      b,a
01e0 b7        or      a
01e1 280a      jr      z,01edh
01e3 21050f    ld      hl,0f05h
01e6 2b        dec     hl
01e7 7c        ld      a,h
01e8 b5        or      l
01e9 20fb      jr      nz,01e6h
01eb 10f6      djnz    01e3h
01ed c1        pop     bc
01ee e1        pop     hl
01ef c9        ret
;******************************************************************************
; called from 0725, 16db
01f0 c5        push    bc					
01f1 f5        push    af
01f2 3e0a      ld      a,0ah
01f4 0648      ld      b,48h
01f6 cd5415    call    1554h				; 
01f9 0649      ld      b,49h
01fb cd5415    call    1554h				;
01fe 064a      ld      b,4ah
0200 cd5415    call    1554h				;
0203 064b      ld      b,4bh
0205 cd5415    call    1554h				;
0208 064c      ld      b,4ch
020a cd5415    call    1554h				;
020d f1        pop     af
020e c1        pop     bc
020f c9        ret   
;********************************************************************************
; called by 0391, 03bc, 0b42
0210 f5        push    af					
0211 3e00      ld      a,00h
0213 329980    ld      (8099h),a			; set timer 1 mode
0216 3e05      ld      a,05h
0218 329980    ld      (8099h),a			; set timer 1 mode
021b 3e05      ld      a,05h
021d 329280    ld      (8092h),a			; set timer 1 low byte
0220 f1        pop     af
0221 f5        push    af
0222 3e01      ld      a,01h
0224 d22902    jp      nc,0229h
0227 3e02      ld      a,02h
0229 329380    ld      (8093h),a			; set timer 1 high byte
022c 329780    ld      (8097h),a			; start timer 1
022f f1        pop     af
0230 c9        ret     
;********************************************************************************
; called by 06f6
0231 3a0180    ld      a,(8001h)			
0234 b7        or      a
0235 2822      jr      z,0259h
0237 fe01      cp      01h
0239 2010      jr      nz,024bh
023b 0612      ld      b,12h
023d cdb10c    call    0cb1h				;
0240 cb57      bit     2,a
0242 2005      jr      nz,0249h
0244 cd190b    call    0b19h				;
0247 181e      jr      0267h
0249 180e      jr      0259h
024b 0612      ld      b,12h
024d cdb10c    call    0cb1h				;
0250 cb5f      bit     3,a
0252 2005      jr      nz,0259h
0254 cd8503    call    0385h				;
0257 180e      jr      0267h
0259 3e00      ld      a,00h
025b 329680    ld      (8096h),a			; stop timer 1
025e 320580    ld      (8005h),a
0261 320680    ld      (8006h),a
0264 320480    ld      (8004h),a
0267 c9        ret     
;*******************************************************************************
; called from 06ec
0268 0641      ld      b,41h				
026a cdb10c    call    0cb1h				;
026d cb6f      bit     5,a
026f 280e      jr      z,027fh
0271 212680    ld      hl,8026h
0274 cb5e      bit     3,(hl)
0276 2013      jr      nz,028bh
0278 cbde      set     3,(hl)
027a cd4f05    call    054fh				;
027d 180c      jr      028bh
027f 212680    ld      hl,8026h
0282 cb5e      bit     3,(hl)
0284 2805      jr      z,028bh
0286 cb9e      res     3,(hl)
0288 cdf503    call    03f5h				;
028b 0643      ld      b,43h
028d cdb10c    call    0cb1h				;
0290 cb67      bit     4,a
0292 200e      jr      nz,02a2h
0294 212680    ld      hl,8026h
0297 cb66      bit     4,(hl)
0299 2013      jr      nz,02aeh
029b cbe6      set     4,(hl)
029d cd4f05    call    054fh				;
02a0 180c      jr      02aeh
02a2 212680    ld      hl,8026h
02a5 cb66      bit     4,(hl)
02a7 2805      jr      z,02aeh
02a9 cba6      res     4,(hl)
02ab cd4f05    call    054fh				;
02ae 210f80    ld      hl,800fh
02b1 cb76      bit     6,(hl)
02b3 2808      jr      z,02bdh
02b5 cdf503    call    03f5h				;
02b8 3e00      ld      a,00h
02ba 320f80    ld      (800fh),a
02bd c9        ret     
;***************************************************************************
; called from 0817, 1415, 1495
02be 211880    ld      hl,8018h				
02c1 cb7e      bit     7,(hl)
02c3 2804      jr      z,02c9h
02c5 cb76      bit     6,(hl)
02c7 28fc      jr      z,02c5h
02c9 211780    ld      hl,8017h
02cc cba6      res     4,(hl)
02ce 7e        ld      a,(hl)
02cf 0613      ld      b,13h
02d1 cd5415    call    1554h				;
02d4 3e00      ld      a,00h
02d6 321880    ld      (8018h),a
02d9 c9        ret     
;**************************************************************************
; called from 0728
02da 3e00      ld      a,00h				
02dc 0610      ld      b,10h
02de cd5415    call    1554h				;
02e1 3e20      ld      a,20h
02e3 0611      ld      b,11h
02e5 cd5415    call    1554h				;
02e8 3e01      ld      a,01h
02ea cdd507    call    07d5h				;
02ed 3e21      ld      a,21h
02ef 0611      ld      b,11h
02f1 cd5415    call    1554h				;
02f4 3e30      ld      a,30h
02f6 0612      ld      b,12h
02f8 cd5415    call    1554h				;
02fb 3e00      ld      a,00h
02fd 0613      ld      b,13h
02ff cd5415    call    1554h				;
0302 3e34      ld      a,34h
0304 0680      ld      b,80h
0306 cd5415    call    1554h				;
0309 3e01      ld      a,01h
030b cdd507    call    07d5h				;
030e 3e20      ld      a,20h
0310 0680      ld      b,80h
0312 cd5415    call    1554h				;
0315 0611      ld      b,11h
0317 cdb10c    call    0cb1h				;
031a cb6f      bit     5,a
031c 28f9      jr      z,0317h
031e 0611      ld      b,11h
0320 cdb10c    call    0cb1h				;
0323 cb6f      bit     5,a
0325 2812      jr      z,0339h
0327 0643      ld      b,43h
0329 cdb10c    call    0cb1h				;
032c e60f      and     0fh
032e fe06      cp      06h
0330 2005      jr      nz,0337h
0332 212680    ld      hl,8026h
0335 cbc6      set     0,(hl)
0337 18e5      jr      031eh
0339 3e10      ld      a,10h
033b 0613      ld      b,13h
033d cd5415    call    1554h				;
0340 0611      ld      b,11h
0342 cdb10c    call    0cb1h				;
0345 cb6f      bit     5,a
0347 28f9      jr      z,0342h
0349 3e00      ld      a,00h
034b 0613      ld      b,13h
034d cd5415    call    1554h				;
0350 3e00      ld      a,00h
0352 321480    ld      (8014h),a
0355 3e21      ld      a,21h
0357 321580    ld      (8015h),a
035a 3e30      ld      a,30h
035c 321680    ld      (8016h),a
035f 3e00      ld      a,00h
0361 321780    ld      (8017h),a
0364 3e34      ld      a,34h
0366 320280    ld      (8002h),a
0369 c9        ret     
;************************************************************************
; called by 11cd, 123b
036a e5        push    hl					
036b d5        push    de
036c c5        push    bc
036d f5        push    af
036e 50        ld      d,b
036f 59        ld      e,c
0370 47        ld      b,a
0371 7e        ld      a,(hl)
0372 4f        ld      c,a
0373 1a        ld      a,(de)
0374 b9        cp      c
0375 2008      jr      nz,037fh
0377 23        inc     hl
0378 13        inc     de
0379 10f6      djnz    0371h
037b f1        pop     af
037c b7        or      a
037d 1802      jr      0381h
037f f1        pop     af
0380 37        scf     
0381 c1        pop     bc
0382 d1        pop     de
0383 e1        pop     hl
0384 c9        ret     
;**************************************************************************
; called by 0254
0385 210580    ld      hl,8005h				
0388 cb7e      bit     7,(hl)
038a 2817      jr      z,03a3h
038c cb76      bit     6,(hl)
038e 282f      jr      z,03bfh
0390 b7        or      a
0391 cd1002    call    0210h				;
0394 210680    ld      hl,8006h
0397 3e08      ld      a,08h
0399 cdb513    call    13b5h				;
039c 3e00      ld      a,00h
039e 320580    ld      (8005h),a
03a1 181c      jr      03bfh
03a3 210680    ld      hl,8006h
03a6 cb7e      bit     7,(hl)
03a8 2804      jr      z,03aeh
03aa cb76      bit     6,(hl)
03ac 2811      jr      z,03bfh
03ae 210580    ld      hl,8005h
03b1 3e08      ld      a,08h
03b3 cdb513    call    13b5h				;
03b6 3e00      ld      a,00h
03b8 320680    ld      (8006h),a
03bb 37        scf     
03bc cd1002    call    0210h				;
03bf c9        ret     
;********************************************************************************
; called from 0a7e, 0cfc
03c0 c5        push    bc					
03c1 47        ld      b,a
03c2 e60f      and     0fh
03c4 4f        ld      c,a
03c5 78        ld      a,b
03c6 1f        rra     
03c7 1f        rra     
03c8 1f        rra     
03c9 1f        rra     
03ca e60f      and     0fh
03cc 87        add     a,a
03cd 47        ld      b,a
03ce 87        add     a,a
03cf 87        add     a,a
03d0 80        add     a,b
03d1 81        add     a,c
03d2 c1        pop     bc
03d3 c9        ret     
;********************************************************************************
; called from 1615
03d4 e5        push    hl					
03d5 c5        push    bc
03d6 f5        push    af
03d7 0641      ld      b,41h
03d9 cdb10c    call    0cb1h				;
03dc cb6f      bit     5,a
03de 2811      jr      z,03f1h
03e0 0648      ld      b,48h
03e2 0e05      ld      c,05h
03e4 7e        ld      a,(hl)
03e5 e60f      and     0fh
03e7 f620      or      20h
03e9 cd5415    call    1554h				;
03ec 23        inc     hl
03ed 04        inc     b
03ee 0d        dec     c
03ef 20f3      jr      nz,03e4h
03f1 f1        pop     af
03f2 c1        pop     bc
03f3 e1        pop     hl
03f4 c9        ret
;********************************************************************************
; called from 0288, 02b5, 0439, 0fd0, 1456, 161f 
03f5 c5        push    bc					
03f6 f5        push    af
03f7 3e00      ld      a,00h
03f9 064d      ld      b,4dh
03fb cd5415    call    1554h				;
03fe f1        pop     af
03ff c1        pop     bc
0400 c9        ret  
;********************************************************************************
; called from 1627
0401 c5        push    bc					
0402 f5        push    af
0403 3e20      ld      a,20h
0405 064d      ld      b,4dh
0407 cd5415    call    1554h				;
040a f1        pop     af
040b c1        pop     bc
040c c9        ret  
;********************************************************************************
; called by 1230
040d 212880    ld      hl,8028h				
0410 cb7e      bit     7,(hl)
0412 2819      jr      z,042dh
0414 3a2680    ld      a,(8026h)
0417 cb4f      bit     1,a
0419 2808      jr      z,0423h
041b 211480    ld      hl,8014h
041e cbe6      set     4,(hl)
0420 cd8715    call    1587h				;
0423 3e00      ld      a,00h
0425 322980    ld      (8029h),a
0428 3e00      ld      a,00h
042a 322880    ld      (8028h),a
042d c9        ret     
;********************************************************************************
; called by 122b
042e 3a2980    ld      a,(8029h)			
0431 cb7f      bit     7,a
0433 281e      jr      z,0453h
0435 cb77      bit     6,a
0437 2844      jr      z,047dh
0439 cdf503    call    03f5h				;
043c 211480    ld      hl,8014h
043f cba6      res     4,(hl)
0441 cd8715    call    1587h				;
0444 212880    ld      hl,8028h
0447 3e1f      ld      a,1fh
0449 cdb513    call    13b5h				;
044c 3e00      ld      a,00h
044e 322980    ld      (8029h),a
0451 182a      jr      047dh
0453 3a2880    ld      a,(8028h)
0456 cb7f      bit     7,a
0458 2804      jr      z,045eh
045a cb77      bit     6,a
045c 281f      jr      z,047dh
045e cd4f05    call    054fh				;
0461 3a2680    ld      a,(8026h)
0464 cb4f      bit     1,a
0466 2808      jr      z,0470h
0468 211480    ld      hl,8014h
046b cbe6      set     4,(hl)
046d cd8715    call    1587h				;
0470 212980    ld      hl,8029h
0473 3e1f      ld      a,1fh
0475 cdb513    call    13b5h				;
0478 3e00      ld      a,00h
047a 322880    ld      (8028h),a
047d 3e00      ld      a,00h
047f 320180    ld      (8001h),a
0482 211780    ld      hl,8017h
0485 cb96      res     2,(hl)
0487 7e        ld      a,(hl)
0488 0613      ld      b,13h
048a cd5415    call    1554h				;
048d c9        ret     
;******************************************************************************
; called from 11d3, 129b
048e 010000    ld      bc,0000h				
0491 110000    ld      de,0000h
0494 3a2380    ld      a,(8023h)
0497 cb47      bit     0,a
0499 2801      jr      z,049ch
049b 04        inc     b
049c cb4f      bit     1,a
049e 2801      jr      z,04a1h
04a0 04        inc     b
04a1 cb57      bit     2,a
04a3 2801      jr      z,04a6h
04a5 04        inc     b
04a6 cb5f      bit     3,a
04a8 2801      jr      z,04abh
04aa 04        inc     b
04ab cb67      bit     4,a
04ad 2801      jr      z,04b0h
04af 04        inc     b
04b0 3e01      ld      a,01h
04b2 b8        cp      b
04b3 2064      jr      nz,0519h
04b5 3a2480    ld      a,(8024h)
04b8 cb47      bit     0,a
04ba 2801      jr      z,04bdh
04bc 0c        inc     c
04bd cb4f      bit     1,a
04bf 2801      jr      z,04c2h
04c1 0c        inc     c
04c2 cb57      bit     2,a
04c4 2801      jr      z,04c7h
04c6 0c        inc     c
04c7 cb5f      bit     3,a
04c9 2801      jr      z,04cch
04cb 0c        inc     c
04cc cb67      bit     4,a
04ce 2801      jr      z,04d1h
04d0 0c        inc     c
04d1 cb6f      bit     5,a
04d3 2801      jr      z,04d6h
04d5 0c        inc     c
04d6 cb77      bit     6,a
04d8 2801      jr      z,04dbh
04da 14        inc     d
04db cb7f      bit     7,a
04dd 2801      jr      z,04e0h
04df 14        inc     d
04e0 3e01      ld      a,01h
04e2 b9        cp      c
04e3 2034      jr      nz,0519h
04e5 3a2580    ld      a,(8025h)
04e8 cb67      bit     4,a
04ea 2801      jr      z,04edh
04ec 14        inc     d
04ed cb77      bit     6,a
04ef 2801      jr      z,04f2h
04f1 14        inc     d
04f2 cb7f      bit     7,a
04f4 2801      jr      z,04f7h
04f6 14        inc     d
04f7 3e01      ld      a,01h
04f9 ba        cp      d
04fa 201d      jr      nz,0519h
04fc 3a2580    ld      a,(8025h)
04ff e60c      and     0ch
0501 fe0c      cp      0ch
0503 2814      jr      z,0519h
0505 3a1f80    ld      a,(801fh)
0508 e603      and     03h
050a fe03      cp      03h
050c 280b      jr      z,0519h
050e 212380    ld      hl,8023h
0511 011d80    ld      bc,801dh
0514 3e03      ld      a,03h
0516 cd9408    call    0894h				;
0519 c9        ret     
;*************************************************************************
; called by 120e, 12a1
051a e5        push    hl					
051b 7e        ld      a,(hl)
051c fe30      cp      30h
051e 3824      jr      c,0544h
0520 fe76      cp      76h
0522 3020      jr      nc,0544h
0524 e60f      and     0fh
0526 fe0a      cp      0ah
0528 301a      jr      nc,0544h
052a 23        inc     hl
052b 7e        ld      a,(hl)
052c e60f      and     0fh
052e fe0a      cp      0ah
0530 3012      jr      nc,0544h
0532 23        inc     hl
0533 7e        ld      a,(hl)
0534 fe00      cp      00h
0536 2815      jr      z,054dh
0538 fe25      cp      25h
053a 2811      jr      z,054dh
053c fe50      cp      50h
053e 280d      jr      z,054dh
0540 fe75      cp      75h
0542 2809      jr      z,054dh
0544 e1        pop     hl
0545 e5        push    hl
0546 3e11      ld      a,11h
0548 77        ld      (hl),a
0549 23        inc     hl
054a 77        ld      (hl),a
054b 23        inc     hl
054c 77        ld      (hl),a
054d e1        pop     hl
054e c9        ret     
;*********************************************************************
; called from 027a, 029d, 02ab, 045e, 1211, 12e4, 1340, 135d
054f e5        push    hl					
0550 c5        push    bc
0551 f5        push    af
0552 0641      ld      b,41h
0554 cdb10c    call    0cb1h				;
0557 cb6f      bit     5,a
0559 2847      jr      z,05a2h
055b 210f80    ld      hl,800fh
055e 3e2f      ld      a,2fh
0560 cd5606    call    0656h				;
0563 210b80    ld      hl,800bh
0566 7e        ld      a,(hl)
0567 1f        rra     
0568 1f        rra     
0569 1f        rra     
056a 1f        rra     
056b e60f      and     0fh
056d f620      or      20h
056f 0648      ld      b,48h
0571 cd5415    call    1554h				;
0574 7e        ld      a,(hl)
0575 e60f      and     0fh
0577 f620      or      20h
0579 0649      ld      b,49h
057b cd5415    call    1554h				;
057e 23        inc     hl
057f 7e        ld      a,(hl)
0580 e60f      and     0fh
0582 f620      or      20h
0584 064a      ld      b,4ah
0586 cd5415    call    1554h				;
0589 23        inc     hl
058a 7e        ld      a,(hl)
058b 1f        rra     
058c 1f        rra     
058d 1f        rra     
058e 1f        rra     
058f e60f      and     0fh
0591 f620      or      20h
0593 064b      ld      b,4bh
0595 cd5415    call    1554h				;
0598 7e        ld      a,(hl)
0599 e60f      and     0fh
059b f620      or      20h
059d 064c      ld      b,4ch
059f cd5415    call    1554h				;
05a2 f1        pop     af
05a3 c1        pop     bc
05a4 e1        pop     hl
05a5 c9        ret     
;*********************************************************************************
; called from 13cf
05a6 0e00      ld      c,00h				
05a8 3a0b80    ld      a,(800bh)
05ab 21cf05    ld      hl,05cfh				; data at 05cf
05ae be        cp      (hl)
05af 2807      jr      z,05b8h
05b1 380f      jr      c,05c2h
05b3 23        inc     hl
05b4 23        inc     hl
05b5 0c        inc     c
05b6 18f6      jr      05aeh
05b8 3a0c80    ld      a,(800ch)
05bb e60f      and     0fh
05bd 23        inc     hl
05be be        cp      (hl)
05bf 3801      jr      c,05c2h
05c1 0c        inc     c
05c2 21e505    ld      hl,05e5h
05c5 0600      ld      b,00h
05c7 09        add     hl,bc
05c8 7e        ld      a,(hl)
05c9 06b3      ld      b,0b3h
05cb cd5415    call    1554h				;
05ce c9        ret     
;************************************************************************************
; data used at 05ab
05cf 35        db      035h, 000h, 040h, 000h, 045h, 005h, 051h, 000h, 056h   
05d8 05        db      005h, 062h, 000h, 067h, 005h, 073h, 000h, 099h, 009h
05e1 99        db	   099h, 009h, 099h, 009h, 000h, 080h, 040h, 020h, 010h
05ea 08        db      008h, 004h, 002h, 001h, 001h, 001h
;**********************************************************************************
; called by 06b5, 06bb
05f0 7e        ld      a,(hl)				
05f1 cb7f      bit     7,a
05f3 2811      jr      z,0606h
05f5 cb77      bit     6,a
05f7 200d      jr      nz,0606h
05f9 e63f      and     3fh
05fb 47        ld      b,a
05fc 3a0e80    ld      a,(800eh)
05ff e63f      and     3fh
0601 b8        cp      b
0602 2002      jr      nz,0606h
0604 cbf6      set     6,(hl)
0606 c9        ret     
;*********************************************************************************
; called from 13d2
0607 0e00      ld      c,00h				
0609 3a0b80    ld      a,(800bh)
060c 213806    ld      hl,0638h				; data at 0638
060f be        cp      (hl)
0610 2807      jr      z,0619h
0612 380f      jr      c,0623h
0614 23        inc     hl
0615 23        inc     hl
0616 0c        inc     c
0617 18f6      jr      060fh
0619 3a0c80    ld      a,(800ch)
061c e60f      and     0fh
061e 23        inc     hl
061f be        cp      (hl)
0620 3801      jr      c,0623h
0622 0c        inc     c
0623 214c06    ld      hl,064ch
0626 0600      ld      b,00h
0628 09        add     hl,bc
0629 7e        ld      a,(hl)
062a 47        ld      b,a
062b 3a1480    ld      a,(8014h)
062e e6f0      and     0f0h
0630 b0        or      b
0631 321480    ld      (8014h),a
0634 cd8715    call    1587h				;
0637 c9        ret     
;*********************************************************************************
; data used at 060c
0638           db	   033h, 000h, 037h, 000h, 042h, 000h, 047h, 005h
0640           db      053h, 000h, 056h, 000h, 060h, 000h, 065h, 000h
0648           db      070h, 005h, 099h, 009h, 000h, 001h, 002h, 003h
0650           db      004h, 008h, 009h, 00ah, 00bh, 00ch
;****************************************************************************
; called by 0560, 0b29, 0b59
0656 47        ld      b,a					
0657 3a0e80    ld      a,(800eh)
065a 80        add     a,b
065b e63f      and     3fh
065d f680      or      80h
065f 77        ld      (hl),a
0660 c9        ret     
;*****************************************************************************
; where is this called from?
0661 f3        di      
0662 e5        push    hl
0663 c5        push    bc
0664 f5        push    af
0665 3e00      ld      a,00h
0667 d3bb      out     (0bbh),a
0669 211380    ld      hl,8013h
066c 7e        ld      a,(hl)
066d 3c        inc     a
066e e63f      and     3fh
0670 77        ld      (hl),a
0671 210380    ld      hl,8003h
0674 cdd613    call    13d6h				;
0677 210580    ld      hl,8005h
067a cdd613    call    13d6h				;
067d 210680    ld      hl,8006h
0680 cdd613    call    13d6h				;
0683 211880    ld      hl,8018h
0686 cdd613    call    13d6h				;
0689 212880    ld      hl,8028h
068c cdd613    call    13d6h				;
068f 212980    ld      hl,8029h
0692 cdd613    call    13d6h				;
0695 212a80    ld      hl,802ah
0698 cdd613    call    13d6h				;
069b 212b80    ld      hl,802bh
069e cdd613    call    13d6h				;
06a1 3a1380    ld      a,(8013h)
06a4 e60f      and     0fh
06a6 fe08      cp      08h
06a8 2014      jr      nz,06beh
06aa 210e80    ld      hl,800eh
06ad 7e        ld      a,(hl)
06ae 3c        inc     a
06af e63f      and     3fh
06b1 77        ld      (hl),a
06b2 210480    ld      hl,8004h
06b5 cdf005    call    05f0h				;	
06b8 210f80    ld      hl,800fh
06bb cdf005    call    05f0h				;
06be 3a2680    ld      a,(8026h)
06c1 e603      and     03h
06c3 2020      jr      nz,06e5h
06c5 0640      ld      b,40h
06c7 cdb10c    call    0cb1h				;
06ca eeff      xor     0ffh
06cc e61f      and     1fh
06ce 47        ld      b,a
06cf 3a1280    ld      a,(8012h)
06d2 b8        cp      b
06d3 200b      jr      nz,06e0h
06d5 0643      ld      b,43h
06d7 cdb10c    call    0cb1h				;
06da eeff      xor     0ffh
06dc e60f      and     0fh
06de 2805      jr      z,06e5h
06e0 212680    ld      hl,8026h
06e3 cbd6      set     2,(hl)
06e5 3a1380    ld      a,(8013h)
06e8 e603      and     03h
06ea fe01      cp      01h
06ec cc6802    call    z,0268h				;
06ef 3a1380    ld      a,(8013h)
06f2 e603      and     03h
06f4 fe03      cp      03h
06f6 cc3102    call    z,0231h				;
06f9 3ed0      ld      a,0d0h
06fb 328180    ld      (8081h),a			; write d0h to port B
06fe 3e00      ld      a,00h
0700 328180    ld      (8081h),a			; write 00h to port B
0703 f3        di      
0704 3e0c      ld      a,0ch
0706 d3bb      out     (0bbh),a
0708 f1        pop     af
0709 c1        pop     bc
070a e1        pop     hl
070b fb        ei      
070c c9        ret     
;**************************************************************************************
; from 0084
070d 3e00      ld      a,00h				
070f d3bb      out     (0bbh),a
0711 317f80    ld      sp,807fh
0714 fd216106  ld      iy,0661h
0718 dd21be01  ld      ix,01beh
071c cdd008    call    08d0h				;
071f cdcb0b    call    0bcbh				;
0722 cd2509    call    0925h				;
0725 cdf001    call    01f0h				;
0728 cdda02    call    02dah				;
072b f3        di      
072c 3e0c      ld      a,0ch
072e d3bb      out     (0bbh),a
0730 fb        ei      
0731 c38700    jp      0087h				;
;**************************************************************************************
; called from 0990, 0fc3, 0ff6, 1459
0734 211580    ld      hl,8015h				
0737 7e        ld      a,(hl)
0738 cbaf      res     5,a
073a 0611      ld      b,11h
073c cd5415    call    1554h				;
073f cbd7      set     2,a
0741 cd5415    call    1554h				;
0744 77        ld      (hl),a
0745 210380    ld      hl,8003h
0748 3e0d      ld      a,0dh
074a cdb513    call    13b5h				;
074d 3e1e      ld      a,1eh
074f 212a80    ld      hl,802ah
0752 cdb513    call    13b5h				;
0755 cb76      bit     6,(hl)
0757 203f      jr      nz,0798h
0759 0653      ld      b,53h
075b cdb10c    call    0cb1h				;
075e cb4f      bit     1,a
0760 28f3      jr      z,0755h
0762 cdb10c    call    0cb1h				;
0765 cb4f      bit     1,a
0767 28ec      jr      z,0755h
0769 cdb10c    call    0cb1h				;
076c cb4f      bit     1,a
076e 28e5      jr      z,0755h
0770 211580    ld      hl,8015h
0773 cbce      set     1,(hl)
0775 7e        ld      a,(hl)
0776 0611      ld      b,11h
0778 cd5415    call    1554h				;
077b 06b1      ld      b,0b1h
077d cd5415    call    1554h				;
0780 211580    ld      hl,8015h
0783 cbde      set     3,(hl)
0785 7e        ld      a,(hl)
0786 0611      ld      b,11h
0788 cd5415    call    1554h				;
078b 211780    ld      hl,8017h
078e cbee      set     5,(hl)
0790 7e        ld      a,(hl)
0791 0613      ld      b,13h
0793 cd5415    call    1554h				;
0796 180e      jr      07a6h
0798 211580    ld      hl,8015h
079b 7e        ld      a,(hl)
079c cb97      res     2,a
079e cbef      set     5,a
07a0 77        ld      (hl),a
07a1 0611      ld      b,11h
07a3 cd5415    call    1554h				;
07a6 c9        ret     
;********************************************************************************
; called from 135a
07a7 3a1f80    ld      a,(801fh)			
07aa e60c      and     0ch
07ac 2826      jr      z,07d4h
07ae cb57      bit     2,a
07b0 2812      jr      z,07c4h
07b2 210d80    ld      hl,800dh
07b5 7e        ld      a,(hl)
07b6 c625      add     a,25h
07b8 27        daa     
07b9 77        ld      (hl),a
07ba 2b        dec     hl
07bb 7e        ld      a,(hl)
07bc ce00      adc     a,00h
07be 27        daa     
07bf e60f      and     0fh
07c1 77        ld      (hl),a
07c2 1810      jr      07d4h
07c4 210d80    ld      hl,800dh
07c7 7e        ld      a,(hl)
07c8 d625      sub     25h
07ca 27        daa     
07cb 77        ld      (hl),a
07cc 2b        dec     hl
07cd 7e        ld      a,(hl)
07ce de00      sbc     a,00h
07d0 27        daa     
07d1 e60f      and     0fh
07d3 77        ld      (hl),a
07d4 c9        ret     
;***************************************************************************************
; called from 0136, 014e, 01b4, 02ea, 0306, 0bf5, 0da2, 0dc1, 1103, 14fa, 1505, 16e7, 16f9, 183f, 1c9e,   
; 1cee, 1d36, 1d42, 1d60, 1d91, 1dae, 1fbe, 1ff3, 2145, 2156,
07d5 e5        push    hl					
07d6 c5        push    bc
07d7 47        ld      b,a
07d8 b7        or      a
07d9 280a      jr      z,07e5h
07db 218001    ld      hl,0180h
07de 2b        dec     hl
07df 7c        ld      a,h
07e0 b5        or      l
07e1 20fb      jr      nz,07deh
07e3 10f6      djnz    07dbh
07e5 c1        pop     bc
07e6 e1        pop     hl
07e7 c9        ret     
;****************************************************************************************
; called from 0854
07e8 211780    ld      hl,8017h				
07eb cb96      res     2,(hl)
07ed 7e        ld      a,(hl)
07ee 0613      ld      b,13h
07f0 cd5415    call    1554h				;
07f3 3e00      ld      a,00h
07f5 320180    ld      (8001h),a
07f8 3e34      ld      a,34h
07fa cd8801    call    0188h				;
07fd 212680    ld      hl,8026h
0800 cbbe      res     7,(hl)
0802 0611      ld      b,11h
0804 cdb10c    call    0cb1h				;
0807 cb6f      bit     5,a
0809 200f      jr      nz,081ah
080b cde812    call    12e8h				;
080e 0611      ld      b,11h
0810 cdb10c    call    0cb1h				;
0813 cb6f      bit     5,a
0815 28f7      jr      z,080eh
0817 cdbe02    call    02beh				;
081a c9        ret     
;************************************************************
; from 0088
081b cdd711    call    11d7h				
081e 211e80    ld      hl,801eh
0821 cb76      bit     6,(hl)
0823 281a      jr      z,083fh
0825 0610      ld      b,10h
0827 cdb10c    call    0cb1h				;
082a cb6f      bit     5,a
082c 280c      jr      z,083ah
082e 211480    ld      hl,8014h
0831 cb6e      bit     5,(hl)
0833 2005      jr      nz,083ah
0835 cdb80f    call    0fb8h				;
0838 1830      jr      086ah
083a cd170f    call    0f17h				;
083d 182b      jr      086ah
083f 0611      ld      b,11h
0841 cdb10c    call    0cb1h				;
0844 cb5f      bit     3,a
0846 2805      jr      z,084dh
0848 cd6b09    call    096bh				;
084b 181d      jr      086ah
084d 211e80    ld      hl,801eh
0850 cb7e      bit     7,(hl)
0852 2805      jr      z,0859h
0854 cde807    call    07e8h				;
0857 1811      jr      086ah
0859 0611      ld      b,11h
085b cdb10c    call    0cb1h				;
085e cb6f      bit     5,a
0860 2005      jr      nz,0867h
0862 cded13    call    13edh				;
0865 1803      jr      086ah
0867 cd3510    call    1035h				;
086a c31b08    jp      081bh
;**************************************************************************************
; called by 1357
086d 3a1f80    ld      a,(801fh)			
0870 e603      and     03h
0872 281f      jr      z,0893h
0874 cb47      bit     0,a
0876 2807      jr      z,087fh
0878 3a0b80    ld      a,(800bh)
087b 3c        inc     a
087c 27        daa     
087d 1805      jr      0884h
087f 3a0b80    ld      a,(800bh)
0882 3d        dec     a
0883 27        daa     
0884 fe76      cp      76h
0886 2002      jr      nz,088ah
0888 3e30      ld      a,30h
088a fe29      cp      29h
088c 2002      jr      nz,0890h
088e 3e75      ld      a,75h
0890 320b80    ld      (800bh),a
0893 c9        ret     
;*************************************************************************
; called by 0516, 0eeb, 10fe, 12b9
0894 e5        push    hl					
0895 d5        push    de
0896 c5        push    bc
0897 f5        push    af
0898 50        ld      d,b
0899 59        ld      e,c
089a 0600      ld      b,00h
089c 4f        ld      c,a
089d edb0      ldir    
089f f1        pop     af
08a0 c1        pop     bc
08a1 d1        pop     de
08a2 e1        pop     hl
08a3 c9        ret     
;**************************************************************************
; called by 120b
08a4 e5        push    hl					
08a5 d5        push    de
08a6 c5        push    bc
08a7 f5        push    af
08a8 b7        or      a
08a9 280a      jr      z,08b5h
08ab 47        ld      b,a
08ac cd9a0c    call    0c9ah				;
08af 77        ld      (hl),a
08b0 23        inc     hl
08b1 13        inc     de
08b2 05        dec     b
08b3 20f7      jr      nz,08ach
08b5 f1        pop     af
08b6 c1        pop     bc
08b7 d1        pop     de
08b8 e1        pop     hl
08b9 c9        ret     
;***************************************************************************
; called by 12e1, 13ac
08ba e5        push    hl					
08bb d5        push    de
08bc c5        push    bc
08bd f5        push    af
08be b7        or      a
08bf 280a      jr      z,08cbh
08c1 47        ld      b,a
08c2 7e        ld      a,(hl)
08c3 cdb615    call    15b6h				;
08c6 13        inc     de
08c7 23        inc     hl
08c8 05        dec     b
08c9 20f7      jr      nz,08c2h
08cb f1        pop     af
08cc c1        pop     bc
08cd d1        pop     de
08ce e1        pop     hl
08cf c9        ret     
;***************************************************************************
; called from 071c
08d0 062a      ld      b,2ah				
08d2 2100c0    ld      hl,0c000h
08d5 112a00    ld      de,002ah
08d8 c5        push    bc
08d9 e5        push    hl
08da 7e        ld      a,(hl)
08db e60f      and     0fh
08dd 4f        ld      c,a
08de 19        add     hl,de
08df 7e        ld      a,(hl)
08e0 e60f      and     0fh
08e2 47        ld      b,a
08e3 19        add     hl,de
08e4 7e        ld      a,(hl)
08e5 e60f      and     0fh
08e7 b9        cp      c
08e8 2804      jr      z,08eeh
08ea b8        cp      b
08eb 2801      jr      z,08eeh
08ed 79        ld      a,c
08ee e1        pop     hl
08ef e5        push    hl
08f0 77        ld      (hl),a
08f1 19        add     hl,de
08f2 77        ld      (hl),a
08f3 19        add     hl,de
08f4 77        ld      (hl),a
08f5 e1        pop     hl
08f6 c1        pop     bc
08f7 23        inc     hl
08f8 10de      djnz    08d8h
08fa 062a      ld      b,2ah
08fc 2180c0    ld      hl,0c080h
08ff 112a00    ld      de,002ah
0902 c5        push    bc
0903 e5        push    hl
0904 7e        ld      a,(hl)
0905 e60f      and     0fh
0907 4f        ld      c,a
0908 19        add     hl,de
0909 7e        ld      a,(hl)
090a e60f      and     0fh
090c 47        ld      b,a
090d 19        add     hl,de
090e 7e        ld      a,(hl)
090f e60f      and     0fh
0911 b9        cp      c
0912 2804      jr      z,0918h
0914 b8        cp      b
0915 2801      jr      z,0918h
0917 79        ld      a,c
0918 e1        pop     hl
0919 e5        push    hl
091a 77        ld      (hl),a
091b 19        add     hl,de
091c 77        ld      (hl),a
091d 19        add     hl,de
091e 77        ld      (hl),a
091f e1        pop     hl
0920 c1        pop     bc
0921 23        inc     hl
0922 10de      djnz    0902h
0924 c9        ret     
;***********************************************************************************
; called from 0722
0925 3e00      ld      a,00h				
0927 328780    ld      (8087h),a			; set port mode definition
092a 3e00      ld      a,00h
092c 328480    ld      (8084h),a			; set DDR A to all inputs
092f 3eff      ld      a,0ffh
0931 328580    ld      (8085h),a			; set DDR B to all outputs
0934 3e00      ld      a,00h
0936 328180    ld      (8081h),a			; write 00h to port B
0939 3e27      ld      a,27h
093b 328680    ld      (8086h),a			; set DDR C port direction
093e 3e02      ld      a,02h
0940 328280    ld      (8082h),a			; write 02h to port C
0943 3e00      ld      a,00h
0945 329880    ld      (8098h),a			; set timer 0 mode
0948 329980    ld      (8099h),a			; set timer 1 mode
094b 3e05      ld      a,05h
094d 329880    ld      (8098h),a			; set timer 0 mode
0950 329980    ld      (8099h),a			; set timer 1 mode
0953 3e05      ld      a,05h
0955 329080    ld      (8090h),a			; set timer 0 low byte
0958 3e0d      ld      a,0dh
095a 329180    ld      (8091h),a			; set timer 0 high byte
095d 3e0d      ld      a,0dh
095f 328180    ld      (8081h),a			; write 0dh to port B
0962 3e00      ld      a,00h
0964 328180    ld      (8081h),a			; write 00h to port B
0967 329580    ld      (8095h),a			; start timer 0
096a c9        ret     
;*************************************************************************************
; called from 0848
096b 211780    ld      hl,8017h				
096e cbc6      set     0,(hl)
0970 cb96      res     2,(hl)
0972 7e        ld      a,(hl)
0973 0613      ld      b,13h
0975 cd5415    call    1554h				;
0978 3e00      ld      a,00h
097a 320180    ld      (8001h),a
097d 3e34      ld      a,34h
097f cd8801    call    0188h				;
0982 212680    ld      hl,8026h
0985 cbbe      res     7,(hl)
0987 0611      ld      b,11h
0989 cdb10c    call    0cb1h				;
098c cb4f      bit     1,a
098e 280f      jr      z,099fh
0990 cd3407    call    0734h				;
0993 0611      ld      b,11h
0995 cdb10c    call    0cb1h				;
0998 cb4f      bit     1,a
099a 20f7      jr      nz,0993h
099c cded14    call    14edh				;
099f 0611      ld      b,11h
09a1 cdb10c    call    0cb1h				;
09a4 cb5f      bit     3,a
09a6 20df      jr      nz,0987h
09a8 211780    ld      hl,8017h
09ab cb86      res     0,(hl)
09ad 7e        ld      a,(hl)
09ae 0613      ld      b,13h
09b0 cd5415    call    1554h				;
09b3 c9        ret     
;***********************************************************************
; called by 1221
09b4 211d80    ld      hl,801dh				
09b7 7e        ld      a,(hl)
09b8 cb67      bit     4,a
09ba 200c      jr      nz,09c8h
09bc 23        inc     hl
09bd 7e        ld      a,(hl)
09be cb7f      bit     7,a
09c0 2006      jr      nz,09c8h
09c2 23        inc     hl
09c3 7e        ld      a,(hl)
09c4 cb67      bit     4,a
09c6 2807      jr      z,09cfh
09c8 3a1e80    ld      a,(801eh)
09cb e63f      and     3fh
09cd 1805      jr      09d4h
09cf 3a1d80    ld      a,(801dh)
09d2 e60f      and     0fh
09d4 0e0e      ld      c,0eh
09d6 fe01      cp      01h
09d8 281a      jr      z,09f4h
09da 0e0d      ld      c,0dh
09dc fe02      cp      02h
09de 2814      jr      z,09f4h
09e0 0e0b      ld      c,0bh
09e2 fe04      cp      04h
09e4 280e      jr      z,09f4h
09e6 0e07      ld      c,07h
09e8 fe08      cp      08h
09ea 2808      jr      z,09f4h
09ec 0e00      ld      c,00h
09ee fe10      cp      10h
09f0 2802      jr      z,09f4h
09f2 0e0f      ld      c,0fh
09f4 3a1d80    ld      a,(801dh)
09f7 cb77      bit     6,a
09f9 2804      jr      z,09ffh
09fb cb6f      bit     5,a
09fd 2802      jr      z,0a01h
09ff cbe9      set     5,c
0a01 211680    ld      hl,8016h
0a04 7e        ld      a,(hl)
0a05 e6d0      and     0d0h
0a07 b1        or      c
0a08 77        ld      (hl),a
0a09 0612      ld      b,12h
0a0b cd5415    call    1554h				;
0a0e 211e80    ld      hl,801eh
0a11 cb76      bit     6,(hl)
0a13 280d      jr      z,0a22h
0a15 211680    ld      hl,8016h
0a18 cba6      res     4,(hl)
0a1a 7e        ld      a,(hl)
0a1b 0612      ld      b,12h
0a1d cd5415    call    1554h				;
0a20 1816      jr      0a38h
0a22 211680    ld      hl,8016h
0a25 cbe6      set     4,(hl)
0a27 7e        ld      a,(hl)
0a28 0612      ld      b,12h
0a2a cd5415    call    1554h				;
0a2d 211480    ld      hl,8014h
0a30 cbae      res     5,(hl)
0a32 7e        ld      a,(hl)
0a33 0610      ld      b,10h
0a35 cd5415    call    1554h				;
0a38 211e80    ld      hl,801eh
0a3b cb7e      bit     7,(hl)
0a3d 2805      jr      z,0a44h
0a3f 212780    ld      hl,8027h
0a42 cbc6      set     0,(hl)
0a44 211f80    ld      hl,801fh
0a47 cb7e      bit     7,(hl)
0a49 2812      jr      z,0a5dh
0a4b 211780    ld      hl,8017h
0a4e cbce      set     1,(hl)
0a50 7e        ld      a,(hl)
0a51 0613      ld      b,13h
0a53 cd5415    call    1554h				;
0a56 212780    ld      hl,8027h
0a59 cb86      res     0,(hl)
0a5b 180b      jr      0a68h
0a5d 211780    ld      hl,8017h
0a60 cb8e      res     1,(hl)
0a62 7e        ld      a,(hl)
0a63 0613      ld      b,13h
0a65 cd5415    call    1554h				;
0a68 c9        ret     
;****************************************************************************************
; called from 13c9
0a69 010000    ld      bc,0000h				
0a6c 3a0c80    ld      a,(800ch)
0a6f e60f      and     0fh
0a71 fe03      cp      03h
0a73 3806      jr      c,0a7bh
0a75 0c        inc     c
0a76 fe08      cp      08h
0a78 3801      jr      c,0a7bh
0a7a 0c        inc     c
0a7b 3a0b80    ld      a,(800bh)
0a7e cdc003    call    03c0h				;
0a81 fe3e      cp      3eh
0a83 380c      jr      c,0a91h
0a85 21fc0a    ld      hl,0afch
0a88 09        add     hl,bc
0a89 d63e      sub     3eh
0a8b cb27      sla     a
0a8d 4f        ld      c,a
0a8e 09        add     hl,bc
0a8f 181a      jr      0aabh
0a91 fe2b      cp      2bh
0a93 380c      jr      c,0aa1h
0a95 21d50a    ld      hl,0ad5h
0a98 09        add     hl,bc
0a99 d62b      sub     2bh
0a9b cb27      sla     a
0a9d 4f        ld      c,a
0a9e 09        add     hl,bc
0a9f 180a      jr      0aabh
0aa1 21ba0a    ld      hl,0abah				; data at 0aba
0aa4 09        add     hl,bc
0aa5 d61e      sub     1eh
0aa7 cb27      sla     a
0aa9 4f        ld      c,a
0aaa 09        add     hl,bc
0aab 7e        ld      a,(hl)
0aac 321a80    ld      (801ah),a
0aaf 0630      ld      b,30h
0ab1 cd5415    call    1554h				;
0ab4 0623      ld      b,23h
0ab6 cd5415    call    1554h				;
0ab9 c9        ret     
;************************************************************************************
; data used at 0aa1
0aba   		   db	   0f9h, 0f7h, 0f4h, 0f2h, 0efh, 0ech, 038h, 0e6h
0ac2           db	   0e2h, 0deh, 0d9h, 0d5h, 0d0h, 0cch, 0c6h, 0c1h
0aca 		   db	   0bah, 0b4h, 0adh, 0a6h, 093h, 097h, 08fh, 087h
0ad2 		   db	   07dh, 073h, 068h

0ad5     	   db	   0fah, 0f8h, 0f6h, 0f5h, 0f3h, 0f1h, 0efh, 0edh
0add 		   db	   0ebh, 0e9h, 0e6h, 0e4h, 0e1h, 0dfh, 0dbh, 0d9h
0ae5 		   db	   0d5h, 0d2h, 0ceh, 0cbh, 0c7h, 0c4h, 0bfh, 0bch
0aed 		   db	   0b7h, 0b3h, 0adh, 0a9h, 0a3h, 09fh, 099h, 094h
0af5 		   db	   08dh, 087h, 080h, 07ah, 073h, 06ch, 064h

0afc    	   db	   0f6h, 0f5h, 0f4h, 0f3h, 0f1h, 0f0h, 0eeh, 0edh
0b04 		   db	   0ebh, 0e9h, 0e7h, 0e5h, 0e3h, 0e2h, 0e0h, 0deh
0b0c    	   db	   0dch, 0dah, 0d7h, 0d5h, 0d2h, 0d0h, 0cdh, 0cbh
0b14  		   db	   0c8h, 0c6h, 0c3h, 0c1h, 0bdh

;*************************************************************************************
; called by 0244
0b19 210580    ld      hl,8005h				
0b1c cb7e      bit     7,(hl)
0b1e 2816      jr      z,0b36h
0b20 cb76      bit     6,(hl)
0b22 2838      jr      z,0b5ch
0b24 210480    ld      hl,8004h
0b27 3e09      ld      a,09h
0b29 cd5606    call    0656h				;
0b2c 3e00      ld      a,00h
0b2e 320580    ld      (8005h),a
0b31 329680    ld      (8096h),a			; stop timer 1
0b34 1826      jr      0b5ch
0b36 210480    ld      hl,8004h
0b39 cb7e      bit     7,(hl)
0b3b 2817      jr      z,0b54h
0b3d cb76      bit     6,(hl)
0b3f 281b      jr      z,0b5ch
0b41 b7        or      a
0b42 cd1002    call    0210h				;
0b45 210580    ld      hl,8005h
0b48 3e08      ld      a,08h
0b4a cdb513    call    13b5h				;
0b4d 3e00      ld      a,00h
0b4f 320480    ld      (8004h),a
0b52 1808      jr      0b5ch
0b54 3e02      ld      a,02h
0b56 210480    ld      hl,8004h
0b59 cd5606    call    0656h				;
0b5c c9        ret     
;*************************************************************************************
; called from 0f27, 0ff9, 1035
0b5d 0611      ld      b,11h				
0b5f cdb10c    call    0cb1h				;
0b62 cb57      bit     2,a
0b64 281f      jr      z,0b85h
0b66 217400    ld      hl,0074h
0b69 2b        dec     hl
0b6a 7c        ld      a,h
0b6b b5        or      l
0b6c 20fb      jr      nz,0b69h
0b6e 0611      ld      b,11h
0b70 cdb10c    call    0cb1h				;
0b73 cb57      bit     2,a
0b75 2807      jr      z,0b7eh
0b77 212780    ld      hl,8027h
0b7a cbce      set     1,(hl)
0b7c 180c      jr      0b8ah
0b7e 212780    ld      hl,8027h
0b81 cb8e      res     1,(hl)
0b83 1805      jr      0b8ah
0b85 212780    ld      hl,8027h
0b88 cb8e      res     1,(hl)
0b8a 210380    ld      hl,8003h
0b8d cb76      bit     6,(hl)
0b8f 2805      jr      z,0b96h
0b91 3e00      ld      a,00h
0b93 320380    ld      (8003h),a
0b96 0612      ld      b,12h
0b98 cdb10c    call    0cb1h				;
0b9b cb47      bit     0,a
0b9d 2026      jr      nz,0bc5h
0b9f 210380    ld      hl,8003h
0ba2 cb7e      bit     7,(hl)
0ba4 201f      jr      nz,0bc5h
0ba6 217400    ld      hl,0074h
0ba9 2b        dec     hl
0baa 7c        ld      a,h
0bab b5        or      l
0bac 20fb      jr      nz,0ba9h
0bae 0612      ld      b,12h
0bb0 cdb10c    call    0cb1h				;
0bb3 cb47      bit     0,a
0bb5 2007      jr      nz,0bbeh
0bb7 212780    ld      hl,8027h
0bba cbd6      set     2,(hl)
0bbc 180c      jr      0bcah
0bbe 212780    ld      hl,8027h
0bc1 cb96      res     2,(hl)
0bc3 1805      jr      0bcah
0bc5 212780    ld      hl,8027h
0bc8 cb96      res     2,(hl)
0bca c9        ret     
;*********************************************************************************
; called from 071f
0bcb 062c      ld      b,2ch				
0bcd 210080    ld      hl,8000h
0bd0 3e00      ld      a,00h
0bd2 77        ld      (hl),a
0bd3 23        inc     hl
0bd4 10fc      djnz    0bd2h
0bd6 0e00      ld      c,00h
0bd8 0641      ld      b,41h
0bda cdb10c    call    0cb1h				;
0bdd cb6f      bit     5,a
0bdf 2802      jr      z,0be3h
0be1 cbd9      set     3,c
0be3 0643      ld      b,43h
0be5 cdb10c    call    0cb1h				;
0be8 cb67      bit     4,a
0bea 2002      jr      nz,0beeh
0bec cbe1      set     4,c
0bee 3e23      ld      a,23h
0bf0 328680    ld      (8086h),a			; set DDR C port direction
0bf3 3e02      ld      a,02h
0bf5 cdd507    call    07d5h				;
0bf8 3a8280    ld      a,(8082h)			; read port C
0bfb cb57      bit     2,a
0bfd 2802      jr      z,0c01h
0bff cbf1      set     6,c
0c01 3e27      ld      a,27h
0c03 328680    ld      (8086h),a			; set DDR C port direction
0c06 79        ld      a,c
0c07 322680    ld      (8026h),a
0c0a 3eff      ld      a,0ffh
0c0c 321980    ld      (8019h),a
0c0f 211d80    ld      hl,801dh
0c12 3e30      ld      a,30h
0c14 77        ld      (hl),a
0c15 23        inc     hl
0c16 3e01      ld      a,01h
0c18 77        ld      (hl),a
0c19 23        inc     hl
0c1a 3e80      ld      a,80h
0c1c 77        ld      (hl),a
0c1d 3e11      ld      a,11h
0c1f 210880    ld      hl,8008h
0c22 77        ld      (hl),a
0c23 23        inc     hl
0c24 77        ld      (hl),a
0c25 23        inc     hl
0c26 77        ld      (hl),a
0c27 c9        ret     
;*********************************************************************************
; called by 0e3e, 0e82
0c28 e5        push    hl					
0c29 c5        push    bc
0c2a 3e00      ld      a,00h
0c2c d3bb      out     (0bbh),a
0c2e 3eff      ld      a,0ffh
0c30 328580    ld      (8085h),a			; set DDR B to all outputs
0c33 78        ld      a,b
0c34 328180    ld      (8081h),a			; write to port B
0c37 062e      ld      b,2eh
0c39 10fe      djnz    0c39h
0c3b 212680    ld      hl,8026h
0c3e cbee      set     5,(hl)
0c40 3e00      ld      a,00h
0c42 320080    ld      (8000h),a
0c45 3e04      ld      a,04h
0c47 d3bb      out     (0bbh),a
0c49 3e02      ld      a,02h
0c4b 328a80    ld      (808ah),a			; bit clear port C
0c4e 328e80    ld      (808eh),a			; bit set port C
0c51 019d2a    ld      bc,2a9dh
0c54 212680    ld      hl,8026h
0c57 cb6e      bit     5,(hl)
0c59 2805      jr      z,0c60h
0c5b 0b        dec     bc
0c5c 78        ld      a,b
0c5d b1        or      c
0c5e 20f4      jr      nz,0c54h
0c60 3e0c      ld      a,0ch
0c62 d3bb      out     (0bbh),a
0c64 212680    ld      hl,8026h
0c67 cbae      res     5,(hl)
0c69 3a0080    ld      a,(8000h)
0c6c c1        pop     bc
0c6d e1        pop     hl
0c6e c9        ret     
;***************************************************************************************
; called by 1166, 117e
0c6f c5        push    bc					
0c70 f5        push    af
0c71 3a2680    ld      a,(8026h)
0c74 e640      and     40h
0c76 2816      jr      z,0c8eh
0c78 3a1480    ld      a,(8014h)
0c7b e6f0      and     0f0h
0c7d 0610      ld      b,10h
0c7f cd5415    call    1554h				;
0c82 3e04      ld      a,04h
0c84 328e80    ld      (808eh),a			; bit set port C
0c87 0650      ld      b,50h
0c89 10fe      djnz    0c89h
0c8b 328a80    ld      (808ah),a			; bit clear port C
0c8e 0610      ld      b,10h
0c90 cdb10c    call    0cb1h				;
0c93 e61f      and     1fh
0c95 4f        ld      c,a
0c96 f1        pop     af
0c97 79        ld      a,c
0c98 c1        pop     bc
0c99 c9        ret     
;****************************************************************************
; called by 08ac
0c9a c5        push    bc					
0c9b f5        push    af
0c9c cbfb      set     7,e
0c9e 1a        ld      a,(de)
0c9f 17        rla     
0ca0 17        rla     
0ca1 17        rla     
0ca2 17        rla     
0ca3 e6f0      and     0f0h
0ca5 47        ld      b,a
0ca6 cbbb      res     7,e
0ca8 1a        ld      a,(de)
0ca9 e60f      and     0fh
0cab b0        or      b
0cac 47        ld      b,a
0cad f1        pop     af
0cae 78        ld      a,b
0caf c1        pop     bc
0cb0 c9        ret     
;******************************************************************************
; called from 023d, 024d, 026a, 028d, 0317, 0320, 0329, 0342, 03d9, 0554, 06c7, 06d7, 075b 
; 0762, 0769, 0804, 0810, 0827, 0841, 085b, 0989, 0995, 09a1, 0b5f, 0b70, 0b98, 0bb0, 0bda
; 0be5, 0c90, 0dfd, 0e04, 0e0b, 0fdf, 0fe8, 1056, 10be, 110a, 1114, 1135, 1148, 1259, 1271
; 13ef, 140e, 1472, 1485, 148e, 14a8, 1533, 1636, 1690, 16c9, 16f0, 170e, 1b55, 1b8b, 1b9e
; 1cd1, 1cfc, 1d1a, 1d47, 1d6f, 1dd3, 1e62, 1e82, 1eaa, 1eca, 1ef3, 1efe, 21a7, 21c7
0cb1 c5        push    bc					
0cb2 f5        push    af
0cb3 f3        di      
0cb4 3eff      ld      a,0ffh
0cb6 328580    ld      (8085h),a			; set DDR B to all outputs
0cb9 3e00      ld      a,00h
0cbb 328480    ld      (8084h),a			; set DDR A to all inputs
0cbe 78        ld      a,b
0cbf 328180    ld      (8081h),a			; write to port B
0cc2 062e      ld      b,2eh
0cc4 10fe      djnz    0cc4h
0cc6 3a8080    ld      a,(8080h)			; get port A
0cc9 4f        ld      c,a
0cca 3e00      ld      a,00h
0ccc 328180    ld      (8081h),a			; write 00h to port B
0ccf fb        ei      
0cd0 f1        pop     af
0cd1 79        ld      a,c
0cd2 c1        pop     bc
0cd3 c9        ret   
;******************************************************************************  
; called by 13c0
0cd4 110000    ld      de,0000h				
0cd7 210d80    ld      hl,800dh
0cda 7e        ld      a,(hl)
0cdb 87        add     a,a
0cdc 27        daa     
0cdd 3001      jr      nc,0ce0h
0cdf 1c        inc     e
0ce0 b7        or      a
0ce1 2801      jr      z,0ce4h
0ce3 14        inc     d
0ce4 2b        dec     hl
0ce5 7e        ld      a,(hl)
0ce6 e60f      and     0fh
0ce8 87        add     a,a
0ce9 27        daa     
0cea 83        add     a,e
0ceb 27        daa     
0cec 5f        ld      e,a
0ced e60f      and     0fh
0cef 87        add     a,a
0cf0 82        add     a,d
0cf1 57        ld      d,a
0cf2 7b        ld      a,e
0cf3 1f        rra     
0cf4 1f        rra     
0cf5 1f        rra     
0cf6 1f        rra     
0cf7 e60f      and     0fh
0cf9 5f        ld      e,a
0cfa 2b        dec     hl
0cfb 7e        ld      a,(hl)
0cfc cdc003    call    03c0h				;
0cff 87        add     a,a
0d00 83        add     a,e
0d01 5f        ld      e,a
0d02 060c      ld      b,0ch
0d04 0eea      ld      c,0eah
0d06 7e        ld      a,(hl)
0d07 fe53      cp      53h
0d09 3004      jr      nc,0d0fh
0d0b 0608      ld      b,08h
0d0d 0e15      ld      c,15h
0d0f 7b        ld      a,e
0d10 81        add     a,c
0d11 5f        ld      e,a
0d12 7a        ld      a,d
0d13 80        add     a,b
0d14 fe17      cp      17h
0d16 3803      jr      c,0d1bh
0d18 d614      sub     14h
0d1a 1c        inc     e
0d1b fe03      cp      03h
0d1d 3003      jr      nc,0d22h
0d1f c614      add     a,14h
0d21 1d        dec     e
0d22 57        ld      d,a
0d23 e60f      and     0fh
0d25 0652      ld      b,52h
0d27 cd5415    call    1554h				;
0d2a 7a        ld      a,d
0d2b 1f        rra     
0d2c 1f        rra     
0d2d 1f        rra     
0d2e 1f        rra     
0d2f e60f      and     0fh
0d31 f610      or      10h
0d33 cd5415    call    1554h				;
0d36 7b        ld      a,e
0d37 e60f      and     0fh
0d39 f620      or      20h
0d3b cd5415    call    1554h				;
0d3e 7b        ld      a,e
0d3f 1f        rra     
0d40 1f        rra     
0d41 1f        rra     
0d42 1f        rra     
0d43 e60f      and     0fh
0d45 f630      or      30h
0d47 cd5415    call    1554h				;
0d4a 3e40      ld      a,40h
0d4c cd5415    call    1554h				;
0d4f 3e50      ld      a,50h
0d51 cd5415    call    1554h				;
0d54 3e60      ld      a,60h
0d56 cd5415    call    1554h				;
0d59 3e71      ld      a,71h
0d5b cd5415    call    1554h				;
0d5e c9        ret     
;*********************************************************************************************
; called from 13c6
0d5f 3a0b80    ld      a,(800bh)			
0d62 fe62      cp      62h
0d64 3808      jr      c,0d6eh
0d66 0e40      ld      c,40h
0d68 1608      ld      d,08h
0d6a 1e0a      ld      e,0ah
0d6c 1812      jr      0d80h
0d6e fe43      cp      43h
0d70 3808      jr      c,0d7ah
0d72 0e20      ld      c,20h
0d74 1620      ld      d,20h
0d76 1e09      ld      e,09h
0d78 1806      jr      0d80h
0d7a 0e10      ld      c,10h
0d7c 1600      ld      d,00h
0d7e 1e08      ld      e,08h
0d80 3a1980    ld      a,(8019h)
0d83 e6f0      and     0f0h
0d85 b9        cp      c
0d86 cad20d    jp      z,0dd2h
0d89 3a1980    ld      a,(8019h)
0d8c e60f      and     0fh
0d8e b1        or      c
0d8f 321980    ld      (8019h),a
0d92 3e00      ld      a,00h
0d94 0631      ld      b,31h
0d96 cd5415    call    1554h				;
0d99 3e04      ld      a,04h
0d9b 0622      ld      b,22h
0d9d cd5415    call    1554h				;
0da0 3e01      ld      a,01h
0da2 cdd507    call    07d5h				;
0da5 3e08      ld      a,08h
0da7 0631      ld      b,31h
0da9 cd5415    call    1554h				;
0dac 3e00      ld      a,00h
0dae 0622      ld      b,22h
0db0 cd5415    call    1554h				;
0db3 7a        ld      a,d
0db4 0621      ld      b,21h
0db6 cd5415    call    1554h				;
0db9 7b        ld      a,e
0dba 0631      ld      b,31h
0dbc cd5415    call    1554h				;
0dbf 3e01      ld      a,01h
0dc1 cdd507    call    07d5h				;
0dc4 3e00      ld      a,00h
0dc6 0621      ld      b,21h
0dc8 cd5415    call    1554h				;
0dcb 3e08      ld      a,08h
0dcd 0631      ld      b,31h
0dcf cd5415    call    1554h				;
0dd2 c9        ret     
;********************************************************************************
; called by 1243
0dd3 3a1580    ld      a,(8015h)			
0dd6 f606      or      06h
0dd8 321580    ld      (8015h),a
0ddb 0611      ld      b,11h
0ddd cd5415    call    1554h				;
0de0 3e01      ld      a,01h
0de2 0621      ld      b,21h
0de4 cd5415    call    1554h				;
0de7 3e08      ld      a,08h
0de9 0622      ld      b,22h
0deb cd5415    call    1554h				;
0dee 3e1f      ld      a,1fh
0df0 212a80    ld      hl,802ah
0df3 cdb513    call    13b5h				;
0df6 cb76      bit     6,(hl)
0df8 c2e30e    jp      nz,0ee3h
0dfb 0653      ld      b,53h
0dfd cdb10c    call    0cb1h				;
0e00 cb4f      bit     1,a
0e02 28f2      jr      z,0df6h
0e04 cdb10c    call    0cb1h				;
0e07 cb4f      bit     1,a
0e09 28eb      jr      z,0df6h
0e0b cdb10c    call    0cb1h				;
0e0e cb4f      bit     1,a
0e10 28e4      jr      z,0df6h
0e12 3a1a80    ld      a,(801ah)
0e15 d630      sub     30h
0e17 4f        ld      c,a
0e18 210880    ld      hl,8008h
0e1b 3e11      ld      a,11h
0e1d 77        ld      (hl),a
0e1e 23        inc     hl
0e1f 77        ld      (hl),a
0e20 23        inc     hl
0e21 77        ld      (hl),a
0e22 3e00      ld      a,00h
0e24 321180    ld      (8011h),a
0e27 321c80    ld      (801ch),a
0e2a 57        ld      d,a
0e2b 5f        ld      e,a
0e2c 212680    ld      hl,8026h
0e2f cb56      bit     2,(hl)
0e31 c2ee0e    jp      nz,0eeeh
0e34 79        ld      a,c
0e35 82        add     a,d
0e36 14        inc     d
0e37 0623      ld      b,23h
0e39 cd5415    call    1554h				;
0e3c 0624      ld      b,24h
0e3e cd280c    call    0c28h				;
0e41 fe40      cp      40h
0e43 3810      jr      c,0e55h
0e45 bb        cp      e
0e46 2809      jr      z,0e51h
0e48 380b      jr      c,0e55h
0e4a 5f        ld      e,a
0e4b 7a        ld      a,d
0e4c 321180    ld      (8011h),a
0e4f 1804      jr      0e55h
0e51 7a        ld      a,d
0e52 321c80    ld      (801ch),a
0e55 7a        ld      a,d
0e56 fe60      cp      60h
0e58 2805      jr      z,0e5fh
0e5a 81        add     a,c
0e5b feff      cp      0ffh
0e5d 20cd      jr      nz,0e2ch
0e5f 3e00      ld      a,00h
0e61 321080    ld      (8010h),a
0e64 321b80    ld      (801bh),a
0e67 57        ld      d,a
0e68 7b        ld      a,e
0e69 cb2f      sra     a
0e6b 5f        ld      e,a
0e6c cb2f      sra     a
0e6e 83        add     a,e
0e6f 5f        ld      e,a
0e70 212680    ld      hl,8026h
0e73 cb56      bit     2,(hl)
0e75 c2ee0e    jp      nz,0eeeh
0e78 79        ld      a,c
0e79 82        add     a,d
0e7a 14        inc     d
0e7b 0623      ld      b,23h
0e7d cd5415    call    1554h				;
0e80 0624      ld      b,24h
0e82 cd280c    call    0c28h				;
0e85 d608      sub     08h
0e87 0610      ld      b,10h
0e89 3c        inc     a
0e8a bb        cp      e
0e8b 2804      jr      z,0e91h
0e8d 10fa      djnz    0e89h
0e8f 1810      jr      0ea1h
0e91 3a1180    ld      a,(8011h)
0e94 ba        cp      d
0e95 3806      jr      c,0e9dh
0e97 7a        ld      a,d
0e98 321080    ld      (8010h),a
0e9b 1804      jr      0ea1h
0e9d 7a        ld      a,d
0e9e 321b80    ld      (801bh),a
0ea1 7a        ld      a,d
0ea2 fe60      cp      60h
0ea4 2805      jr      z,0eabh
0ea6 81        add     a,c
0ea7 feff      cp      0ffh
0ea9 20c5      jr      nz,0e70h
0eab 3a1080    ld      a,(8010h)
0eae b7        or      a
0eaf 2815      jr      z,0ec6h
0eb1 57        ld      d,a
0eb2 3a1b80    ld      a,(801bh)
0eb5 b7        or      a
0eb6 280e      jr      z,0ec6h
0eb8 ba        cp      d
0eb9 380b      jr      c,0ec6h
0ebb 92        sub     d
0ebc b7        or      a
0ebd 1f        rra     
0ebe 57        ld      d,a
0ebf 3a1080    ld      a,(8010h)
0ec2 82        add     a,d
0ec3 81        add     a,c
0ec4 181a      jr      0ee0h
0ec6 3a1180    ld      a,(8011h)
0ec9 b7        or      a
0eca 2817      jr      z,0ee3h
0ecc 57        ld      d,a
0ecd 3a1c80    ld      a,(801ch)
0ed0 ba        cp      d
0ed1 3004      jr      nc,0ed7h
0ed3 1600      ld      d,00h
0ed5 1804      jr      0edbh
0ed7 92        sub     d
0ed8 b7        or      a
0ed9 1f        rra     
0eda 57        ld      d,a
0edb 3a1180    ld      a,(8011h)
0ede 82        add     a,d
0edf 81        add     a,c
0ee0 321a80    ld      (801ah),a
0ee3 210b80    ld      hl,800bh
0ee6 010880    ld      bc,8008h
0ee9 3e03      ld      a,03h
0eeb cd9408    call    0894h				;
0eee 3a1a80    ld      a,(801ah)
0ef1 0623      ld      b,23h
0ef3 cd5415    call    1554h				;
0ef6 0630      ld      b,30h
0ef8 cd5415    call    1554h				;
0efb 3e00      ld      a,00h
0efd 0621      ld      b,21h
0eff cd5415    call    1554h				;
0f02 3e00      ld      a,00h
0f04 0622      ld      b,22h
0f06 cd5415    call    1554h				;
0f09 3a1580    ld      a,(8015h)
0f0c e6f9      and     0f9h
0f0e 321580    ld      (8015h),a
0f11 0611      ld      b,11h
0f13 cd5415    call    1554h				;
0f16 c9        ret     
;****************************************************************************
; called by 083a
0f17 211780    ld      hl,8017h				
0f1a cb96      res     2,(hl)
0f1c 7e        ld      a,(hl)
0f1d 0613      ld      b,13h
0f1f cd5415    call    1554h				;
0f22 212680    ld      hl,8026h
0f25 cbbe      res     7,(hl)
0f27 cd5d0b    call    0b5dh				;
0f2a 212780    ld      hl,8027h
0f2d cb56      bit     2,(hl)
0f2f 281c      jr      z,0f4dh
0f31 211480    ld      hl,8014h
0f34 cbee      set     5,(hl)
0f36 7e        ld      a,(hl)
0f37 0610      ld      b,10h
0f39 cd5415    call    1554h				;
0f3c 3e01      ld      a,01h
0f3e 320180    ld      (8001h),a
0f41 3e0c      ld      a,0ch
0f43 cd8801    call    0188h				;
0f46 212780    ld      hl,8027h
0f49 cb86      res     0,(hl)
0f4b 184e      jr      0f9bh
0f4d 212780    ld      hl,8027h
0f50 cb4e      bit     1,(hl)
0f52 2827      jr      z,0f7bh
0f54 211480    ld      hl,8014h
0f57 cbee      set     5,(hl)
0f59 7e        ld      a,(hl)
0f5a 0610      ld      b,10h
0f5c cd5415    call    1554h				;
0f5f 211d80    ld      hl,801dh
0f62 cb6e      bit     5,(hl)
0f64 2804      jr      z,0f6ah
0f66 3e02      ld      a,02h
0f68 1802      jr      0f6ch
0f6a 3e00      ld      a,00h
0f6c 320180    ld      (8001h),a
0f6f 3e34      ld      a,34h
0f71 cd8801    call    0188h				;
0f74 212780    ld      hl,8027h
0f77 cb86      res     0,(hl)
0f79 1820      jr      0f9bh
0f7b 3e00      ld      a,00h
0f7d 320180    ld      (8001h),a
0f80 211480    ld      hl,8014h
0f83 cbae      res     5,(hl)
0f85 7e        ld      a,(hl)
0f86 0610      ld      b,10h
0f88 cd5415    call    1554h				;
0f8b 212780    ld      hl,8027h
0f8e cb46      bit     0,(hl)
0f90 2804      jr      z,0f96h
0f92 3e34      ld      a,34h
0f94 1802      jr      0f98h
0f96 3e0c      ld      a,0ch
0f98 cd8801    call    0188h				;
0f9b c9        ret     
;**********************************************************************************
; called by 126c, 1285
0f9c f5        push    af					
0f9d c5        push    bc
0f9e e5        push    hl
0f9f 211480    ld      hl,8014h
0fa2 cbae      res     5,(hl)
0fa4 7e        ld      a,(hl)
0fa5 0610      ld      b,10h
0fa7 cd5415    call    1554h				;
0faa cbef      set     5,a
0fac cd5415    call    1554h
0faf cbaf      res     5,a
0fb1 cd5415    call    1554h				;
0fb4 e1        pop     hl
0fb5 c1        pop     bc
0fb6 f1        pop     af
0fb7 c9        ret     
;************************************************************************************
; called from 0835
0fb8 211780    ld      hl,8017h				
0fbb cb96      res     2,(hl)
0fbd 7e        ld      a,(hl)
0fbe 0613      ld      b,13h
0fc0 cd5415    call    1554h				;
0fc3 cd3407    call    0734h				;
0fc6 3a0280    ld      a,(8002h)
0fc9 e6f8      and     0f8h
0fcb f602      or      02h
0fcd cd8801    call    0188h				;
0fd0 cdf503    call    03f5h				;
0fd3 212680    ld      hl,8026h
0fd6 cbbe      res     7,(hl)
0fd8 212780    ld      hl,8027h
0fdb cb86      res     0,(hl)
0fdd 0641      ld      b,41h
0fdf cdb10c    call    0cb1h				;
0fe2 cb57      bit     2,a
0fe4 203c      jr      nz,1022h
0fe6 0610      ld      b,10h
0fe8 cdb10c    call    0cb1h				;
0feb cb6f      bit     5,a
0fed 2833      jr      z,1022h
0fef 211580    ld      hl,8015h
0ff2 cb6e      bit     5,(hl)
0ff4 2803      jr      z,0ff9h
0ff6 cd3407    call    0734h				;
0ff9 cd5d0b    call    0b5dh				;
0ffc 212780    ld      hl,8027h
0fff cb56      bit     2,(hl)
1001 280c      jr      z,100fh
1003 3e0b      ld      a,0bh
1005 cd8801    call    0188h				;
1008 3e01      ld      a,01h
100a 320180    ld      (8001h),a
100d 1811      jr      1020h
100f 3e00      ld      a,00h
1011 320180    ld      (8001h),a
1014 212780    ld      hl,8027h
1017 cb4e      bit     1,(hl)
1019 2805      jr      z,1020h
101b 3e32      ld      a,32h
101d cd8801    call    0188h				;
1020 18bb      jr      0fddh
1022 3e00      ld      a,00h
1024 320180    ld      (8001h),a
1027 cded14    call    14edh				;
102a 3a0280    ld      a,(8002h)
102d e6f8      and     0f8h
102f f604      or      04h
1031 cd8801    call    0188h				;
1034 c9        ret     
;*****************************************************************************
; called by 0867
1035 cd5d0b    call    0b5dh				
1038 211f80    ld      hl,801fh
103b cb66      bit     4,(hl)
103d 2032      jr      nz,1071h
103f 212780    ld      hl,8027h
1042 cb56      bit     2,(hl)
1044 2027      jr      nz,106dh
1046 212780    ld      hl,8027h
1049 cb4e      bit     1,(hl)
104b 2812      jr      z,105fh
104d 211d80    ld      hl,801dh
1050 cb6e      bit     5,(hl)
1052 281d      jr      z,1071h
1054 0611      ld      b,11h
1056 cdb10c    call    0cb1h				;
1059 cb67      bit     4,a
105b 2814      jr      z,1071h
105d 180e      jr      106dh
105f 211d80    ld      hl,801dh
1062 cb6e      bit     5,(hl)
1064 2007      jr      nz,106dh
1066 211f80    ld      hl,801fh
1069 cb76      bit     6,(hl)
106b 2804      jr      z,1071h
106d 3e0c      ld      a,0ch
106f 1802      jr      1073h
1071 3e34      ld      a,34h
1073 cd8801    call    0188h				;
1076 212780    ld      hl,8027h
1079 cb56      bit     2,(hl)
107b 2804      jr      z,1081h
107d 3e01      ld      a,01h
107f 1814      jr      1095h
1081 212780    ld      hl,8027h
1084 cb4e      bit     1,(hl)
1086 280b      jr      z,1093h
1088 211d80    ld      hl,801dh
108b cb6e      bit     5,(hl)
108d 2804      jr      z,1093h
108f 3e02      ld      a,02h
1091 1802      jr      1095h
1093 3e00      ld      a,00h
1095 320180    ld      (8001h),a
1098 211f80    ld      hl,801fh
109b cb7e      bit     7,(hl)
109d 2004      jr      nz,10a3h
109f 0e00      ld      c,00h
10a1 1837      jr      10dah
10a3 212780    ld      hl,8027h
10a6 cb56      bit     2,(hl)
10a8 2007      jr      nz,10b1h
10aa 210380    ld      hl,8003h
10ad cb7e      bit     7,(hl)
10af 2804      jr      z,10b5h
10b1 0e04      ld      c,04h
10b3 1825      jr      10dah
10b5 211d80    ld      hl,801dh
10b8 cb6e      bit     5,(hl)
10ba 2011      jr      nz,10cdh
10bc 0611      ld      b,11h
10be cdb10c    call    0cb1h				;
10c1 cb47      bit     0,a
10c3 2804      jr      z,10c9h
10c5 0e04      ld      c,04h
10c7 1811      jr      10dah
10c9 0e00      ld      c,00h
10cb 180d      jr      10dah
10cd 212780    ld      hl,8027h
10d0 cb4e      bit     1,(hl)
10d2 2804      jr      z,10d8h
10d4 0e04      ld      c,04h
10d6 1802      jr      10dah
10d8 0e00      ld      c,00h
10da 3a1780    ld      a,(8017h)
10dd e6fb      and     0fbh
10df b1        or      c
10e0 321780    ld      (8017h),a
10e3 0613      ld      b,13h
10e5 cd5415    call    1554h				;
10e8 c9        ret     
;********************************************************************************
; called by 11d7, 137d
10e9 3a2680    ld      a,(8026h)			
10ec cb47      bit     0,a
10ee 2806      jr      z,10f6h
10f0 cd5712    call    1257h				;
10f3 c3d611    jp      11d6h
10f6 212380    ld      hl,8023h
10f9 012080    ld      bc,8020h
10fc 3e03      ld      a,03h
10fe cd9408    call    0894h				;
1101 3e01      ld      a,01h
1103 cdd507    call    07d5h				;
1106 1600      ld      d,00h
1108 0640      ld      b,40h
110a cdb10c    call    0cb1h				;
110d eeff      xor     0ffh
110f e63f      and     3fh
1111 4f        ld      c,a
1112 0641      ld      b,41h
1114 cdb10c    call    0cb1h				;
1117 eeff      xor     0ffh
1119 f5        push    af
111a e60f      and     0fh
111c fe00      cp      00h
111e 2002      jr      nz,1122h
1120 1610      ld      d,10h
1122 f1        pop     af
1123 17        rla     
1124 17        rla     
1125 f5        push    af
1126 e6c0      and     0c0h
1128 b1        or      c
1129 322380    ld      (8023h),a
112c f1        pop     af
112d 17        rla     
112e 17        rla     
112f f5        push    af
1130 e6c0      and     0c0h
1132 4f        ld      c,a
1133 0642      ld      b,42h
1135 cdb10c    call    0cb1h				;
1138 eeff      xor     0ffh
113a e63f      and     3fh
113c b1        or      c
113d 322480    ld      (8024h),a
1140 f1        pop     af
1141 17        rla     
1142 17        rla     
1143 e6c0      and     0c0h
1145 4f        ld      c,a
1146 0643      ld      b,43h
1148 cdb10c    call    0cb1h				;
114b eeff      xor     0ffh
114d 47        ld      b,a
114e e60f      and     0fh
1150 cb60      bit     4,b
1152 2802      jr      z,1156h
1154 cbef      set     5,a
1156 b1        or      c
1157 b2        or      d
1158 322580    ld      (8025h),a
115b 3a2580    ld      a,(8025h)
115e cb77      bit     6,a
1160 2004      jr      nz,1166h
1162 cb7f      bit     7,a
1164 284e      jr      z,11b4h
1166 cd6f0c    call    0c6fh				;
1169 cb67      bit     4,a
116b 2847      jr      z,11b4h
116d 212680    ld      hl,8026h
1170 cb4e      bit     1,(hl)
1172 200a      jr      nz,117eh
1174 cbce      set     1,(hl)
1176 211480    ld      hl,8014h
1179 cbe6      set     4,(hl)
117b cd8715    call    1587h				;
117e cd6f0c    call    0c6fh				;
1181 0e20      ld      c,20h
1183 cb47      bit     0,a
1185 2802      jr      z,1189h
1187 0e00      ld      c,00h
1189 e60e      and     0eh
118b fe00      cp      00h
118d 2002      jr      nz,1191h
118f cbc1      set     0,c
1191 fe02      cp      02h
1193 2002      jr      nz,1197h
1195 cbc9      set     1,c
1197 fe04      cp      04h
1199 2002      jr      nz,119dh
119b cbd1      set     2,c
119d fe06      cp      06h
119f 2002      jr      nz,11a3h
11a1 cbd9      set     3,c
11a3 fe08      cp      08h
11a5 2002      jr      nz,11a9h
11a7 cbe1      set     4,c
11a9 3a2380    ld      a,(8023h)
11ac e6c0      and     0c0h
11ae b1        or      c
11af 322380    ld      (8023h),a
11b2 1811      jr      11c5h
11b4 212680    ld      hl,8026h
11b7 cb4e      bit     1,(hl)
11b9 280a      jr      z,11c5h
11bb cb8e      res     1,(hl)
11bd 211480    ld      hl,8014h
11c0 cba6      res     4,(hl)
11c2 cd8715    call    1587h				;
11c5 212380    ld      hl,8023h
11c8 012080    ld      bc,8020h
11cb 3e03      ld      a,03h
11cd cd6a03    call    036ah				;
11d0 daf610    jp      c,10f6h
11d3 cd8e04    call    048eh				;
11d6 c9        ret     
;************************************************************************************************
; from 124b, 1253, called from 081b
11d7 cde910    call    10e9h				
11da 3a1280    ld      a,(8012h)
11dd e61f      and     1fh
11df 4f        ld      c,a
11e0 3a1d80    ld      a,(801dh)
11e3 e61f      and     1fh
11e5 b9        cp      c
11e6 282c      jr      z,1214h
11e8 321280    ld      (8012h),a
11eb 1100c0    ld      de,0c000h
11ee 1f        rra     
11ef 3815      jr      c,1206h
11f1 1103c0    ld      de,0c003h
11f4 1f        rra     
11f5 380f      jr      c,1206h
11f7 1106c0    ld      de,0c006h
11fa 1f        rra     
11fb 3809      jr      c,1206h
11fd 1109c0    ld      de,0c009h
1200 1f        rra     
1201 3803      jr      c,1206h
1203 110cc0    ld      de,0c00ch
1206 210b80    ld      hl,800bh
1209 3e03      ld      a,03h
120b cda408    call    08a4h				;
120e cd1a05    call    051ah				;
1211 cd4f05    call    054fh				;
1214 3a1f80    ld      a,(801fh)
1217 e60f      and     0fh
1219 c4fc12    call    nz,12fch				;
121c 212680    ld      hl,8026h
121f cb96      res     2,(hl)
1221 cdb409    call    09b4h				;
1224 3a0b80    ld      a,(800bh)
1227 fe11      cp      11h
1229 2005      jr      nz,1230h
122b cd2e04    call    042eh				;
122e 1816      jr      1246h
1230 cd0d04    call    040dh				;
1233 210b80    ld      hl,800bh
1236 010880    ld      bc,8008h
1239 3e03      ld      a,03h
123b cd6a03    call    036ah				;
123e 3006      jr      nc,1246h
1240 cdc013    call    13c0h				;
1243 cdd30d    call    0dd3h				;
1246 3a0b80    ld      a,(800bh)
1249 fe11      cp      11h
124b cad711    jp      z,11d7h				;
124e 3a0880    ld      a,(8008h)
1251 fe11      cp      11h
1253 cad711    jp      z,11d7h				;
1256 c9        ret     
;**************************************************************************************
; called by 10f0
1257 0610      ld      b,10h				
1259 cdb10c    call    0cb1h				;
125c cb6f      bit     5,a
125e cae712    jp      z,12e7h
1261 212080    ld      hl,8020h
1264 1600      ld      d,00h
1266 0e06      ld      c,06h
1268 1e08      ld      e,08h
126a cb02      rlc     d
126c cd9c0f    call    0f9ch				;
126f 0610      ld      b,10h
1271 cdb10c    call    0cb1h				;
1274 cb82      res     0,d
1276 cb6f      bit     5,a
1278 2802      jr      z,127ch
127a cbc2      set     0,d
127c 1d        dec     e
127d 20eb      jr      nz,126ah
127f 7a        ld      a,d
1280 77        ld      (hl),a
1281 23        inc     hl
1282 0d        dec     c
1283 20e3      jr      nz,1268h
1285 cd9c0f    call    0f9ch				;
1288 212380    ld      hl,8023h
128b cbbe      res     7,(hl)
128d 212480    ld      hl,8024h
1290 cb76      bit     6,(hl)
1292 2807      jr      z,129bh
1294 cbb6      res     6,(hl)
1296 212580    ld      hl,8025h
1299 cbfe      set     7,(hl)
129b cd8e04    call    048eh				;
129e 212080    ld      hl,8020h
12a1 cd1a05    call    051ah				;
12a4 7e        ld      a,(hl)
12a5 fe11      cp      11h
12a7 283e      jr      z,12e7h
12a9 3a1f80    ld      a,(801fh)
12ac e6f0      and     0f0h
12ae 321f80    ld      (801fh),a
12b1 212080    ld      hl,8020h
12b4 010b80    ld      bc,800bh
12b7 3e03      ld      a,03h
12b9 cd9408    call    0894h				;
12bc 3a1d80    ld      a,(801dh)
12bf e61f      and     1fh
12c1 1100c0    ld      de,0c000h
12c4 1f        rra     
12c5 3815      jr      c,12dch
12c7 1103c0    ld      de,0c003h
12ca 1f        rra     
12cb 380f      jr      c,12dch
12cd 1106c0    ld      de,0c006h
12d0 1f        rra     
12d1 3809      jr      c,12dch
12d3 1109c0    ld      de,0c009h
12d6 1f        rra     
12d7 3803      jr      c,12dch
12d9 110cc0    ld      de,0c00ch
12dc 212080    ld      hl,8020h
12df 3e03      ld      a,03h
12e1 cdba08    call    08bah				;
12e4 cd4f05    call    054fh				;
12e7 c9        ret     
;***************************************************************************************
; called by 080b, 1409, 145c
12e8 211780    ld      hl,8017h				
12eb cbe6      set     4,(hl)
12ed 7e        ld      a,(hl)
12ee 0613      ld      b,13h
12f0 cd5415    call    1554h				;
12f3 211880    ld      hl,8018h
12f6 3e10      ld      a,10h
12f8 cdb513    call    13b5h				;
12fb c9        ret     
;***************************************************************************************
; called from 1219
12fc 3a2680    ld      a,(8026h)			
12ff cb4f      bit     1,a
1301 c2b413    jp      nz,13b4h
1304 3a1d80    ld      a,(801dh)
1307 cb7f      bit     7,a
1309 c2b413    jp      nz,13b4h
130c cb67      bit     4,a
130e 2008      jr      nz,1318h
1310 3a1e80    ld      a,(801eh)
1313 cb7f      bit     7,a
1315 cab413    jp      z,13b4h
1318 3a0b80    ld      a,(800bh)
131b fe11      cp      11h
131d 2021      jr      nz,1340h
131f 3a1f80    ld      a,(801fh)
1322 e60a      and     0ah
1324 280e      jr      z,1334h
1326 210b80    ld      hl,800bh
1329 3e75      ld      a,75h
132b 77        ld      (hl),a
132c 3e00      ld      a,00h
132e 23        inc     hl
132f 77        ld      (hl),a
1330 23        inc     hl
1331 77        ld      (hl),a
1332 180c      jr      1340h
1334 210b80    ld      hl,800bh
1337 3e30      ld      a,30h
1339 77        ld      (hl),a
133a 3e00      ld      a,00h
133c 23        inc     hl
133d 77        ld      (hl),a
133e 23        inc     hl
133f 77        ld      (hl),a
1340 cd4f05    call    054fh				;
1343 212b80    ld      hl,802bh
1346 3e0a      ld      a,0ah
1348 cdb513    call    13b5h				;
134b 3e02      ld      a,02h
134d 320780    ld      (8007h),a
1350 3a2b80    ld      a,(802bh)
1353 cb77      bit     6,a
1355 2826      jr      z,137dh
1357 cd6d08    call    086dh				;
135a cda707    call    07a7h				;
135d cd4f05    call    054fh				;
1360 3a0780    ld      a,(8007h)
1363 fe00      cp      00h
1365 200a      jr      nz,1371h
1367 212b80    ld      hl,802bh
136a 3e0a      ld      a,0ah
136c cdb513    call    13b5h				;
136f 180c      jr      137dh
1371 212b80    ld      hl,802bh
1374 3e30      ld      a,30h
1376 cdb513    call    13b5h				;
1379 210780    ld      hl,8007h
137c 35        dec     (hl)
137d cde910    call    10e9h				;
1380 3a1f80    ld      a,(801fh)
1383 e60f      and     0fh
1385 20c9      jr      nz,1350h
1387 3a1d80    ld      a,(801dh)
138a e61f      and     1fh
138c 1100c0    ld      de,0c000h
138f 1f        rra     
1390 3815      jr      c,13a7h
1392 1103c0    ld      de,0c003h
1395 1f        rra     
1396 380f      jr      c,13a7h
1398 1106c0    ld      de,0c006h
139b 1f        rra     
139c 3809      jr      c,13a7h
139e 1109c0    ld      de,0c009h
13a1 1f        rra     
13a2 3803      jr      c,13a7h
13a4 110cc0    ld      de,0c00ch
13a7 210b80    ld      hl,800bh
13aa 3e03      ld      a,03h
13ac cdba08    call    08bah				;
13af 3e00      ld      a,00h
13b1 322b80    ld      (802bh),a
13b4 c9        ret     
;*********************************************************************************************
; called from 0399, 03b3, 0449, 0475, 074a, 0752, 0b4a, 0df3, 12f8, 1348, 136c, 1376, 146d, 1529
13b5 47        ld      b,a					
13b6 3a1380    ld      a,(8013h)
13b9 80        add     a,b
13ba e63f      and     3fh
13bc f680      or      80h
13be 77        ld      (hl),a
13bf c9        ret     
;*********************************************************************************************
; called from 1240, 1f45
13c0 cdd40c    call    0cd4h				;
13c3 cdc214    call    14c2h				;
13c6 cd5f0d    call    0d5fh				;
13c9 cd690a    call    0a69h				;
13cc cd0001    call    0100h				;
13cf cda605    call    05a6h				;
13d2 cd0706    call    0607h				;
13d5 c9        ret     
;*********************************************************************************************
; called by 0674, 067a, 0680, 0686, 068c, 0692, 0698, 069e
13d6 7e        ld      a,(hl)				
13d7 cb7f      bit     7,a
13d9 2811      jr      z,13ech
13db cb77      bit     6,a
13dd 200d      jr      nz,13ech
13df e63f      and     3fh
13e1 47        ld      b,a
13e2 3a1380    ld      a,(8013h)
13e5 e63f      and     3fh
13e7 b8        cp      b
13e8 2002      jr      nz,13ech
13ea cbf6      set     6,(hl)
13ec c9        ret     
;**********************************************************************************************
; called by 0862
13ed 0611      ld      b,11h				
13ef cdb10c    call    0cb1h				;
13f2 cb57      bit     2,a
13f4 2825      jr      z,141bh
13f6 3a0280    ld      a,(8002h)
13f9 cb57      bit     2,a
13fb 281e      jr      z,141bh
13fd 3a2680    ld      a,(8026h)
1400 cb7f      bit     7,a
1402 2017      jr      nz,141bh
1404 212680    ld      hl,8026h
1407 cbfe      set     7,(hl)
1409 cde812    call    12e8h				;
140c 0611      ld      b,11h
140e cdb10c    call    0cb1h				;
1411 cb6f      bit     5,a
1413 28f7      jr      z,140ch
1415 cdbe02    call    02beh				;
1418 c3c114    jp      14c1h
141b 211780    ld      hl,8017h
141e cb96      res     2,(hl)
1420 7e        ld      a,(hl)
1421 0613      ld      b,13h
1423 cd5415    call    1554h				;
1426 212680    ld      hl,8026h
1429 cbbe      res     7,(hl)
142b 211f80    ld      hl,801fh
142e cb66      bit     4,(hl)
1430 2007      jr      nz,1439h
1432 211d80    ld      hl,801dh
1435 cb6e      bit     5,(hl)
1437 200c      jr      nz,1445h
1439 3e00      ld      a,00h
143b 320180    ld      (8001h),a
143e 3e32      ld      a,32h
1440 cd8801    call    0188h				;
1443 180a      jr      144fh
1445 3e01      ld      a,01h
1447 320180    ld      (8001h),a
144a 3e0d      ld      a,0dh
144c cd8801    call    0188h				;
144f 211580    ld      hl,8015h
1452 cb6e      bit     5,(hl)
1454 280b      jr      z,1461h
1456 cdf503    call    03f5h				;
1459 cd3407    call    0734h				;
145c cde812    call    12e8h				;
145f 182b      jr      148ch
1461 3a1d80    ld      a,(801dh)
1464 cb6f      bit     5,a
1466 2024      jr      nz,148ch
1468 212a80    ld      hl,802ah
146b 3e1f      ld      a,1fh
146d cdb513    call    13b5h				;
1470 0612      ld      b,12h
1472 cdb10c    call    0cb1h				;
1475 cb4f      bit     1,a
1477 2813      jr      z,148ch
1479 3a2a80    ld      a,(802ah)
147c cb77      bit     6,a
147e 28f0      jr      z,1470h
1480 cded14    call    14edh				;
1483 0611      ld      b,11h
1485 cdb10c    call    0cb1h				;
1488 cb6f      bit     5,a
148a 28f9      jr      z,1485h
148c 0611      ld      b,11h
148e cdb10c    call    0cb1h				;
1491 cb6f      bit     5,a
1493 28ba      jr      z,144fh
1495 cdbe02    call    02beh				;
1498 211580    ld      hl,8015h
149b cb6e      bit     5,(hl)
149d 2013      jr      nz,14b2h
149f 211d80    ld      hl,801dh
14a2 cb6e      bit     5,(hl)
14a4 2009      jr      nz,14afh
14a6 0611      ld      b,11h
14a8 cdb10c    call    0cb1h				;
14ab cb4f      bit     1,a
14ad 20f7      jr      nz,14a6h
14af cded14    call    14edh				;
14b2 3e00      ld      a,00h
14b4 320180    ld      (8001h),a
14b7 3a0280    ld      a,(8002h)
14ba e6f8      and     0f8h
14bc f604      or      04h
14be cd8801    call    0188h				;
14c1 c9        ret     
;*************************************************************************************
; called from 13c3
14c2 06b0      ld      b,0b0h				
14c4 3e00      ld      a,00h
14c6 cd5415    call    1554h				;
14c9 3e10      ld      a,10h
14cb cd5415    call    1554h				;
14ce 3e2b      ld      a,2bh
14d0 cd5415    call    1554h				;
14d3 3e36      ld      a,36h
14d5 cd5415    call    1554h				;
14d8 3e40      ld      a,40h
14da cd5415    call    1554h				;
14dd 3e50      ld      a,50h
14df cd5415    call    1554h				;
14e2 3e64      ld      a,64h
14e4 cd5415    call    1554h				;
14e7 3e70      ld      a,70h
14e9 cd5415    call    1554h				;
14ec c9        ret     
;**************************************************************************************
; called by 099c, 1027, 1480, 14af
14ed 211580    ld      hl,8015h				
14f0 cb9e      res     3,(hl)
14f2 7e        ld      a,(hl)
14f3 0611      ld      b,11h
14f5 cd5415    call    1554h				;
14f8 3e01      ld      a,01h
14fa cdd507    call    07d5h				;
14fd cb96      res     2,(hl)
14ff 7e        ld      a,(hl)
1500 cd5415    call    1554h				;
1503 3e01      ld      a,01h
1505 cdd507    call    07d5h				;
1508 cb8e      res     1,(hl)
150a 7e        ld      a,(hl)
150b cd5415    call    1554h				;
150e 211780    ld      hl,8017h
1511 cbae      res     5,(hl)
1513 7e        ld      a,(hl)
1514 0613      ld      b,13h
1516 cd5415    call    1554h				;
1519 211580    ld      hl,8015h
151c cbee      set     5,(hl)
151e 7e        ld      a,(hl)
151f 0611      ld      b,11h
1521 cd5415    call    1554h				;
1524 210380    ld      hl,8003h
1527 3e0d      ld      a,0dh
1529 cdb513    call    13b5h				;
152c c9        ret     
;**********************************************************************************************
; called from 1649, 1654, 1663, 166f, 1675, 1682, 1df1, 1df9, 1e01, 1e09, 1e16, 1e39, 1e5a, 1e7d, 1ea5
; 1ec5, 1eec, 1f0a, 17b8, 17cf, 17e6, 17ec, 17f3
152d e5        push    hl					
152e c5        push    bc
152f f5        push    af
1530 48        ld      c,b
1531 0641      ld      b,41h
1533 cdb10c    call    0cb1h				;
1536 41        ld      b,c
1537 cb6f      bit     5,a
1539 2815      jr      z,1550h
153b 78        ld      a,b
153c fe06      cp      06h
153e 3010      jr      nc,1550h
1540 b7        or      a
1541 280d      jr      z,1550h
1543 3e4d      ld      a,4dh
1545 90        sub     b
1546 47        ld      b,a
1547 f1        pop     af
1548 f5        push    af
1549 e60f      and     0fh
154b f620      or      20h
154d cd5415    call    1554h				;
1550 f1        pop     af
1551 c1        pop     bc
1552 e1        pop     hl
1553 c9        ret   

;******************************************************************************  
; called from 0131, 013d, 0149, 0155, 016c, 01af, 01ba, 01f6, 01fb, 0200, 0205, 020a, 02d1, 02de, 
; 02e5, 02f1, 02f8, 02ff, 0306, 0312, 033d, 034d, 03e9, 03fb, 0407, 048a, 0571, 057b, 0586, 0595, 
; 059f, 05cb, 073c, 0741, 0778, 077d, 0788, 0793, 07a3, 07f0, 0975, 09b0, 0a0b, 0a1d, 0a2a, 0a35, 
; 0a53, 0a65, 0ab1, 0ab6, 0c7f, 0d27, 0d33, 0d3b, 0d47, 0d4c, 0d51, 0d56, 0d5b, 0d96, 0d9d, 0da9, 
; 0db0, 0db6, 0dbc, 0dc8, 0dcf, 0ddd, 0de4, 0deb, 0e39, 0e7d, 0ef3, 0ef8, 0eff, 0f06, 0f13, 0f1f, 
; 0f39, 0f5c, 0f88, 0fa7, 0fb1, 0fc0, 10e5, 12f0, 1423, 14c6, 14cb, 14d0, 14d5, 14da, 14df, 14e4, 
; 14e9, 14f5, 1500, 150b, 1516, 1521, 154d, 1597, 15ab, 15b0, 1733, 1745, 174a, 1756, 17fb, 1802, 
; 180c, 1816, 1822, 1831, 1be1, 1bf5, 1c0f, 1c69, 1c99, 1ca5, 1cac, 1ce9, 1cf5, 1d12, 1d31, 1d3d, 
; 1d5b, 1d67, 1d8c, 1d98, 1da9, 1db5, 1f9b, 1fa2, 1fee, 1ffa, 2010, 2017, 201e, 2028, 202f, 2070, 
; 210b, 2145, 2151, 215d, 2304, 232b, 
1554 c5        push    bc					
1555 f5        push    af
1556 f3        di      
1557 78        ld      a,b
1558 328180    ld      (8081h),a			; write to port B
155b 3eff      ld      a,0ffh
155d 328480    ld      (8084h),a			; set DDR A to all outputs
1560 f1        pop     af
1561 f5        push    af
1562 328080    ld      (8080h),a			; write to port A
1565 062e      ld      b,2eh
1567 10fe      djnz    1567h
1569 3e01      ld      a,01h
156b 328a80    ld      (808ah),a			; bit clear port C
156e 062e      ld      b,2eh
1570 10fe      djnz    1570h
1572 3e01      ld      a,01h
1574 328280    ld      (8082h),a			; write 01h to port C
1577 062e      ld      b,2eh
1579 10fe      djnz    1579h
157b 3e00      ld      a,00h
157d 328480    ld      (8084h),a			; set DDR A to all inputs
1580 328180    ld      (8081h),a			; write to port B
1583 fb        ei      
1584 f1        pop     af
1585 c1        pop     bc
1586 c9        ret   
;******************************************************************************    
; called from 0420, 0441, 046d, 0634, 117b, 11c2
1587 c5        push    bc					
1588 f5        push    af
1589 3a2680    ld      a,(8026h)
158c e640      and     40h
158e 2816      jr      z,15a6h
1590 3a1480    ld      a,(8014h)
1593 e6f0      and     0f0h
1595 0610      ld      b,10h
1597 cd5415    call    1554h				;
159a 3e04      ld      a,04h
159c 328e80    ld      (808eh),a			; bit set port C
159f 0650      ld      b,50h
15a1 10fe      djnz    15a1h
15a3 328a80    ld      (808ah),a			; bit clear port C
15a6 3a1480    ld      a,(8014h)
15a9 0610      ld      b,10h
15ab cd5415    call    1554h				;
15ae 06a0      ld      b,0a0h
15b0 cd5415    call    1554h				;
15b3 f1        pop     af
15b4 c1        pop     bc
15b5 c9        ret     
;*******************************************************************************
; called by 08c3
15b6 e5        push    hl					
15b7 d5        push    de
15b8 f5        push    af
15b9 eb        ex      de,hl
15ba 112a00    ld      de,002ah
15bd 77        ld      (hl),a
15be 19        add     hl,de
15bf 77        ld      (hl),a
15c0 19        add     hl,de
15c1 77        ld      (hl),a
15c2 23        inc     hl
15c3 23        inc     hl
15c4 1f        rra     
15c5 1f        rra     
15c6 1f        rra     
15c7 1f        rra     
15c8 19        add     hl,de
15c9 77        ld      (hl),a
15ca 19        add     hl,de
15cb 77        ld      (hl),a
15cc 19        add     hl,de
15cd 77        ld      (hl),a
15ce f1        pop     af
15cf d1        pop     de
15d0 e1        pop     hl
15d1 c9        ret     
;**********************************************************************************
15d2 c35f18    jp      185fh				; power-up to here
;**********************************************************************************
15d5 00        nop     						; jump table?  Or series to be done?
15d6 cdb91d    call    1db9h				;
15d9 cdeb1a    call    1aebh				;
15dc cdf717    call    17f7h				;
15df cd4f17    call    174fh				;
15e2 cdb91b    call    1bb9h				;
15e5 cd131c    call    1c13h				;
15e8 cd921c    call    1c92h				;
15eb cd3818    call    1838h				;
15ee cd151f    call    1f15h				;
15f1 cdb221    call    21b2h				;
15f4 cdac22    call    22ach				;
15f7 c39e16    jp      169eh				;

;******************************************************************************
; from 1ae8, 1bb5, 1d9f, 20df, 20ed, 2100, 2121, 213b, 229f end of table driven jumps cleanup or escape?
15fa 5f        ld      e,a					
15fb 3e00      ld      a,00h
15fd 328780    ld      (8087h),a			; set port mode definition
1600 328480    ld      (8084h),a			; set DDR A to all inputs
1603 328180    ld      (8081h),a			; write to port B
1606 3eff      ld      a,0ffh
1608 328580    ld      (8085h),a			; set DDR B to all outputs
160b 3e03      ld      a,03h
160d 328280    ld      (8082h),a			; write 03h to port C
1610 3e27      ld      a,27h
1612 328680    ld      (8086h),a			; set DDR C port direction
1615 cdd403    call    03d4h				;
1618 0604      ld      b,04h
161a 3e02      ld      a,02h
161c cddd01    call    01ddh				;
161f cdf503    call    03f5h				;
1622 3e02      ld      a,02h
1624 cddd01    call    01ddh				;
1627 cd0104    call    0401h				;
162a 10ee      djnz    161ah
162c c32f16    jp      162fh
;******************************************************************************
; called from 1974, (162c)
162f 3e0a      ld      a,0ah				
1631 cddd01    call    01ddh				;
1634 0643      ld      b,43h
1636 cdb10c    call    0cb1h				;
1639 cb4f      bit     1,a
163b ca4516    jp      z,1645h
163e cb47      bit     0,a
1640 c2d916    jp      nz,16d9h				;
1643 e1        pop     hl
1644 c9        ret    
1645 0605      ld      b,05h
1647 3e0a      ld      a,0ah
1649 cd2d15    call    152dh				;
164c 10fb      djnz    1649h
164e d5        push    de
164f 7a        ld      a,d
1650 e607      and     07h
1652 0601      ld      b,01h
1654 cd2d15    call    152dh				;
1657 7a        ld      a,d
1658 cb3f      srl     a
165a cb3f      srl     a
165c cb3f      srl     a
165e 57        ld      d,a
165f e607      and     07h
1661 0602      ld      b,02h
1663 cd2d15    call    152dh				;
1666 7a        ld      a,d
1667 cb3f      srl     a
1669 cb3f      srl     a
166b cb3f      srl     a
166d 0603      ld      b,03h
166f cd2d15    call    152dh				;
1672 7b        ld      a,e
1673 0604      ld      b,04h
1675 cd2d15    call    152dh				;
1678 cb3f      srl     a
167a cb3f      srl     a
167c cb3f      srl     a
167e cb3f      srl     a
1680 0605      ld      b,05h
1682 cd2d15    call    152dh				;
1685 3e14      ld      a,14h
1687 cddd01    call    01ddh				;
168a d1        pop     de
168b cd5f17    call    175fh				;
168e 0643      ld      b,43h
1690 cdb10c    call    0cb1h				;
1693 cb5f      bit     3,a
1695 cc9521    call    z,2195h				;
1698 cb4f      bit     1,a
169a c28e16    jp      nz,168eh
169d c9        ret   
;******************************************************************************************  
; called from 15f7 table
169e 3e00      ld      a,00h				
16a0 328780    ld      (8087h),a			; set port mode definition
16a3 328480    ld      (8084h),a			; set DDR A to all inputs
16a6 328180    ld      (8081h),a			; write 00h to port B
16a9 3eff      ld      a,0ffh
16ab 328580    ld      (8085h),a			; set DDR B to all outputs
16ae 328280    ld      (8082h),a			; write ffh to port C
16b1 3e27      ld      a,27h
16b3 328680    ld      (8086h),a			; set DDR C port direction
16b6 21d416    ld      hl,16d4h
16b9 0605      ld      b,05h
16bb 7e        ld      a,(hl)
16bc cd2d15    call    152dh				; restart CPU?  why a call not a jump?
16bf 23        inc     hl
16c0 10f9      djnz    16bbh
16c2 3e05      ld      a,05h
16c4 cddd01    call    01ddh				;
16c7 0643      ld      b,43h
16c9 cdb10c    call    0cb1h				;
16cc cb5f      bit     3,a
16ce cc9521    call    z,2195h				;
16d1 c3db16    jp      16dbh

16d4 2828      jr      z,16feh
16d6 2828      jr      z,1700h
16d8 28

16d9 e1        pop     hl					; from 1640
16da e1        pop     hl
16db cdf001    call    01f0h				;
16de c38300    jp      0083h				;
;*************************************************************************************
; called from 1c2d, 1c44, 1c74, 1f20, 1f52, 1f6b, 1f88, 1fad, 1fdb, 2041, 2082, 20a0, 20be
16e1 f5        push    af					
16e2 78        ld      a,b
16e3 328180    ld      (8081h),a			; write to port B
16e6 f1        pop     af
16e7 cdd507    call    07d5h				;
16ea c9        ret     
;*************************************************************************************
; called from 1723, 2199
16eb c5        push    bc					
16ec d5        push    de
16ed 50        ld      d,b
16ee 0613      ld      b,13h
16f0 cdb10c    call    0cb1h				;
16f3 7a        ld      a,d
16f4 328180    ld      (8081h),a			; write to port B
16f7 3e02      ld      a,02h
16f9 cdd507    call    07d5h				;
16fc 3e04      ld      a,04h
16fe d3bb      out     (0bbh),a
1700 3e02      ld      a,02h
1702 328a80    ld      (808ah),a			; bit clear port C
1705 328e80    ld      (808eh),a			; bit set port C
1708 0640      ld      b,40h
170a 10fe      djnz    170ah
170c 0613      ld      b,13h
170e cdb10c    call    0cb1h				;
1711 47        ld      b,a
1712 7a        ld      a,d
1713 328180    ld      (8081h),a			; write to port B
1716 3e80      ld      a,80h
1718 d3bb      out     (0bbh),a
171a 78        ld      a,b
171b d1        pop     de
171c c1        pop     bc
171d fb        ei      
171e c9        ret     

171f 0601      ld      b,01h
1721 c9        ret     
;************************************************************************************
; called from 1bd1, 1bea, 1c30, 1c47, 1c59, 1c77, 1f23, 1f5b, 1f74, 1f8b, 1fb0,
; 1fc7, 1fd0, 2044, 205d, 2085, 20a3, 20c1, 2246, 22c6, 22e6, 230d, 2334
1722 c5        push    bc					
1723 cdeb16    call    16ebh				;
1726 47        ld      b,a
1727 93        sub     e
1728 da2d17    jp      c,172dh
172b 7a        ld      a,d
172c 90        sub     b
172d 78        ld      a,b
172e c1        pop     bc
172f c9        ret     
;*************************************************************************************
; called from 2009, 2036, 2054, 2077, 2095, 20b3, 20d1, 2115, 212f, 21c2, 222e, 2235, 223c
; 22a8, 22b6, 22bd, 22d6, 22dd, 22f6, 22fd, 231d, 2324, 2375, 2294
1730 c5        push    bc					
1731 0610      ld      b,10h
1733 cd5415    call    1554h				;
1736 3e04      ld      a,04h
1738 328e80    ld      (808eh),a			; bit set port C
173b 0650      ld      b,50h
173d 10fe      djnz    173dh
173f 328a80    ld      (808ah),a			; bit clear port C
1742 0610      ld      b,10h
1744 79        ld      a,c
1745 cd5415    call    1554h				;
1748 06a0      ld      b,0a0h
174a cd5415    call    1554h				;
174d c1        pop     bc
174e c9        ret     
;**************************************************************************************
; called from 15df table
174f 3e04      ld      a,04h				
1751 328e80    ld      (808eh),a			; bit set port C
1754 06a0      ld      b,0a0h
1756 cd5415    call    1554h				;
1759 3e04      ld      a,04h
175b 328a80    ld      (808ah),a			; bit clear port C
175e c9        ret     
;*************************************************************************************
; called from 168b, 219d
175f d5        push    de					
1760 210000    ld      hl,0000h
1763 0e00      ld      c,00h
1765 7a        ld      a,d
1766 e60f      and     0fh
1768 ca8017    jp      z,1780h
176b 47        ld      b,a
176c 118813    ld      de,1388h
176f 19        add     hl,de
1770 d27417    jp      nc,1774h
1773 0c        inc     c
1774 10f9      djnz    176fh
1776 0604      ld      b,04h
1778 cb19      rr      c
177a cb1c      rr      h
177c cb1d      rr      l
177e 10f8      djnz    1778h
1780 d1        pop     de
1781 7a        ld      a,d
1782 cb3f      srl     a
1784 cb3f      srl     a
1786 cb3f      srl     a
1788 cb3f      srl     a
178a ca9a17    jp      z,179ah
178d 47        ld      b,a
178e 0e00      ld      c,00h
1790 118813    ld      de,1388h
1793 19        add     hl,de
1794 d29817    jp      nc,1798h
1797 0c        inc     c
1798 10f9      djnz    1793h
179a 0604      ld      b,04h
179c cb19      rr      c
179e cb1c      rr      h
17a0 cb1d      rr      l
17a2 10f8      djnz    179ch
17a4 11e803    ld      de,03e8h
17a7 0e00      ld      c,00h
17a9 37        scf     
17aa 3f        ccf     
17ab ed52      sbc     hl,de
17ad dab417    jp      c,17b4h
17b0 0c        inc     c
17b1 c3a917    jp      17a9h
17b4 19        add     hl,de
17b5 79        ld      a,c
17b6 0604      ld      b,04h
17b8 cd2d15    call    152dh				;
17bb 116400    ld      de,0064h
17be 0e00      ld      c,00h
17c0 37        scf     
17c1 3f        ccf     
17c2 ed52      sbc     hl,de
17c4 dacb17    jp      c,17cbh
17c7 0c        inc     c
17c8 c3c017    jp      17c0h
17cb 19        add     hl,de
17cc 79        ld      a,c
17cd 0603      ld      b,03h
17cf cd2d15    call    152dh				;
17d2 110a00    ld      de,000ah
17d5 0e00      ld      c,00h
17d7 37        scf     
17d8 3f        ccf     
17d9 ed52      sbc     hl,de
17db dae217    jp      c,17e2h
17de 0c        inc     c
17df c3d717    jp      17d7h
17e2 19        add     hl,de
17e3 79        ld      a,c
17e4 0602      ld      b,02h
17e6 cd2d15    call    152dh				;
17e9 7d        ld      a,l
17ea 0601      ld      b,01h
17ec cd2d15    call    152dh				;
17ef 3e0a      ld      a,0ah
17f1 0605      ld      b,05h
17f3 cd2d15    call    152dh				;
17f6 c9        ret     
;*************************************************************************************
; called from 15dc table
17f7 3e00      ld      a,00h				
17f9 0610      ld      b,10h
17fb cd5415    call    1554h				;
17fe 3e21      ld      a,21h
1800 0611      ld      b,11h
1802 cd5415    call    1554h				;
1805 321580    ld      (8015h),a
1808 3e30      ld      a,30h
180a 0612      ld      b,12h
180c cd5415    call    1554h				;
180f 321680    ld      (8016h),a
1812 3e00      ld      a,00h
1814 0680      ld      b,80h
1816 cd5415    call    1554h				;
1819 3e01      ld      a,01h
181b cddd01    call    01ddh				;
181e 3e12      ld      a,12h
1820 0613      ld      b,13h
1822 cd5415    call    1554h				;
1825 321780    ld      (8017h),a
1828 3e01      ld      a,01h
182a cddd01    call    01ddh				;
182d 3e02      ld      a,02h
182f 0613      ld      b,13h
1831 cd5415    call    1554h				;
1834 321780    ld      (8017h),a
1837 c9        ret     
;***************************************************************************************
; called from 15eb table
1838 3e00      ld      a,00h				
183a 328680    ld      (8086h),a			; set DDR C port direction
183d 3e02      ld      a,02h
183f cdd507    call    07d5h				;
1842 3a8280    ld      a,(8082h)			; write to port C
1845 47        ld      b,a
1846 3e27      ld      a,27h
1848 328680    ld      (8086h),a			; set DDR C port direction
184b 78        ld      a,b
184c e604      and     04h
184e ca5918    jp      z,1859h
1851 3e00      ld      a,00h
1853 322680    ld      (8026h),a
1856 c35e18    jp      185eh
1859 3e40      ld      a,40h
185b 322680    ld      (8026h),a
185e c9        ret     
;*****************************************************************************************
; POST part 1, processor register tests
;
185f af        xor     a					; power on entry point
1860 d3bb      out     (0bbh),a				; write zero to port 0bbh
1862 3e55      ld      a,55h				; load 55h to A
1864 fe55      cp      55h					; is A = 55h?
1866 c2f218    jp      nz,18f2h				; jump if not, looks like the first test of a basic processor POST
1869 47        ld      b,a
186a 4f        ld      c,a
186b 57        ld      d,a
186c 5f        ld      e,a					; load 55h to registers b, c, d, e
186d dd210000  ld      ix,0000h
1871 fd210000  ld      iy,0000h
1875 210000    ld      hl,0000h				; set these to 0
1878 09        add     hl,bc
1879 dd09      add     ix,bc
187b fd09      add     iy,bc
187d ed47      ld      i,a
187f ed57      ld      a,i
1881 b7        or      a
1882 ddf9      ld      sp,ix
1884 ed72      sbc     hl,sp
1886 c2f218    jp      nz,18f2h				; jump if fail
1889 fdf9      ld      sp,iy
188b 39        add     hl,sp
188c ed42      sbc     hl,bc
188e c2f218    jp      nz,18f2h				; jump if fail
1891 19        add     hl,de
1892 94        sub     h
1893 c2f218    jp      nz,18f2h				; jump if fail
1896 7c        ld      a,h
1897 95        sub     l
1898 c2f218    jp      nz,18f2h				; jump if fail
189b 7d        ld      a,l
189c fe55      cp      55h
189e c2ab18    jp      nz,18abh				; successful exit from POST part 1
18a1 3eaa      ld      a,0aah
18a3 feaa      cp      0aah
18a5 c2f218    jp      nz,18f2h				; jump if fail
18a8 c36918    jp      1869h				; keep looping on tests
;*******************************************************************************************
; POST part 2, more processor tests
;
18ab d9        exx     						; past POST part 1 go here
18ac 08        ex      af,af'
18ad 3e55      ld      a,55h
18af fe55      cp      55h
18b1 c2f218    jp      nz,18f2h				; jump if fail
18b4 47        ld      b,a
18b5 4f        ld      c,a
18b6 57        ld      d,a
18b7 5f        ld      e,a
18b8 dd210000  ld      ix,0000h
18bc fd210000  ld      iy,0000h
18c0 210000    ld      hl,0000h
18c3 09        add     hl,bc
18c4 dd09      add     ix,bc
18c6 fd09      add     iy,bc
18c8 b7        or      a
18c9 ddf9      ld      sp,ix
18cb ed72      sbc     hl,sp
18cd c2f218    jp      nz,18f2h				; jump if fail
18d0 fdf9      ld      sp,iy
18d2 39        add     hl,sp
18d3 ed42      sbc     hl,bc
18d5 c2f218    jp      nz,18f2h				; jump if fail
18d8 19        add     hl,de
18d9 94        sub     h
18da c2f218    jp      nz,18f2h				; jump if fail
18dd 7c        ld      a,h
18de 95        sub     l
18df c2f218    jp      nz,18f2h				; jump if fail
18e2 7d        ld      a,l
18e3 fe55      cp      55h
18e5 c2f718    jp      nz,18f7h				; exit from POST part 2
18e8 3eaa      ld      a,0aah
18ea feaa      cp      0aah
18ec c2f218    jp      nz,18f2h				; jump if fail
18ef c3b418    jp      18b4h				; keep looping on tests

18f2 1e01      ld      e,01h				; POST failure has 01 in e
18f4 c31a19    jp      191ah
;*******************************************************************************************
; POST RAM test
;
18f7 210080    ld      hl,8000h				; POST part 2 ok gets here.  8000h seems to be RAM
18fa 0680      ld      b,80h				; b=80h
18fc 3e01      ld      a,01h				; a=01h
18fe 4f        ld      c,a					; c=01h
18ff 77        ld      (hl),a				; 8000h=01h
1900 7e        ld      a,(hl)
1901 b9        cp      c					; read back 8000h and compare
1902 c21219    jp      nz,1912h				; indicate RAM failure
1905 07        rlca    						; rotate accum left circular
1906 4f        ld      c,a
1907 fe01      cp      01h
1909 c2ff18    jp      nz,18ffh				; check all bits
190c 23        inc     hl
190d 10ed      djnz    18fch				; keep looping, check all bits or all RAM?
190f c37c19    jp      197ch			

1912 1e02      ld      e,02h				; looks like 02 in e is a RAM failure
1914 cde51a    call    1ae5h				;
1917 c37c19    jp      197ch			

191a 317f80    ld      sp,807fh				; POST fail gets here with 01h in e.  Stack is at 807fh
191d 21d515    ld      hl,15d5h
1920 e5        push    hl
1921 0605      ld      b,05h
1923 0e48      ld      c,48h
1925 217719    ld      hl,1977h				; data at 1977h
1928 56        ld      d,(hl)
1929 af        xor     a					; clear a (there is no clear instruction)
192a 328780    ld      (8087h),a			; set port mode definition
192d 328180    ld      (8081h),a			; write 00h to port B
1930 3eff      ld      a,0ffh
1932 328480    ld      (8084h),a			; set DDR A to all outputs
1935 328580    ld      (8085h),a			; set DDR B to all outputs
1938 328280    ld      (8082h),a			; write ffh to port C
193b 3e27      ld      a,27h
193d 328680    ld      (8086h),a			; set DDR C port direction
1940 79        ld      a,c
1941 328180    ld      (8081h),a			; write 48h to port B
1944 3e04      ld      a,04h
1946 3d        dec     a
1947 c24619    jp      nz,1946h				; short delay loop
194a 3e01      ld      a,01h
194c 328a80    ld      (808ah),a			; bit clear port C
194f 7a        ld      a,d
1950 328080    ld      (8080h),a			; Send data at 1977 to port A, fail message?
1953 3e0a      ld      a,0ah
1955 3d        dec     a
1956 c25519    jp      nz,1955h				; short delay loop
1959 3e01      ld      a,01h
195b 328e80    ld      (808eh),a			; bit set port C
195e 3e04      ld      a,04h
1960 3d        dec     a
1961 c26019    jp      nz,1960h				; short delay loop
1964 3e00      ld      a,00h
1966 328480    ld      (8084h),a			; set DDR A to all inputs
1969 328180    ld      (8081h),a			; write 00h to port B
196c 0c        inc     c
196d 23        inc     hl
196e 10b8      djnz    1928h				; keep looping each time retrieving 1978h, 1979h etc?
1970 217c19    ld      hl,197ch	
1973 e5        push    hl
1974 c32f16    jp      162fh

1977 212a20    db	   021h, 02ah, 020h, 025h, 02ah				; data used several places

197c 317f80    ld      sp,807fh
197f 21d515    ld      hl,15d5h
1982 e5        push    hl
1983 2100c0    ld      hl,0c000h
1986 0600      ld      b,00h
1988 7e        ld      a,(hl)
1989 57        ld      d,a
198a cd9519    call    1995h				;
198d 7a        ld      a,d
198e 77        ld      (hl),a
198f 23        inc     hl
1990 10f6      djnz    1988h
1992 c3b119    jp      19b1h
;***************************************************************************************
; called by 198a
1995 3e01      ld      a,01h				
1997 4f        ld      c,a
1998 77        ld      (hl),a
1999 7e        ld      a,(hl)
199a e60f      and     0fh
199c b9        cp      c
199d c2a819    jp      nz,19a8h
19a0 07        rlca    
19a1 4f        ld      c,a
19a2 fe10      cp      10h
19a4 c29819    jp      nz,1998h
19a7 c9        ret     
19a8 e1        pop     hl
19a9 3e03      ld      a,03h
19ab cde51a    call    1ae5h				;
19ae c3b119    jp      19b1h
19b1 3ac0c0    ld      a,(0c0c0h)
19b4 57        ld      d,a
19b5 3a00c0    ld      a,(0c000h)
19b8 5f        ld      e,a
19b9 3e05      ld      a,05h
19bb 32c0c0    ld      (0c0c0h),a
19be 3e00      ld      a,00h
19c0 32c000    ld      (00c0h),a
19c3 32c040    ld      (40c0h),a
19c6 32c080    ld      (80c0h),a
19c9 d3c0      out     (0c0h),a
19cb 3ac0c0    ld      a,(0c0c0h)
19ce e60f      and     0fh
19d0 fe05      cp      05h
19d2 c2f819    jp      nz,19f8h
19d5 3e55      ld      a,55h
19d7 320080    ld      (8000h),a
19da 3e00      ld      a,00h
19dc 320000    ld      (0000h),a
19df 320040    ld      (4000h),a
19e2 3200c0    ld      (0c000h),a
19e5 7a        ld      a,d
19e6 32c0c0    ld      (0c0c0h),a
19e9 7b        ld      a,e
19ea 3200c0    ld      (0c000h),a
19ed 3a0080    ld      a,(8000h)
19f0 fe55      cp      55h
19f2 c2f819    jp      nz,19f8h
19f5 c3001a    jp      1a00h
19f8 3e04      ld      a,04h
19fa cde51a    call    1ae5h				;
19fd c3001a    jp      1a00h
1a00 3e00      ld      a,00h
1a02 328780    ld      (8087h),a			; set port mode definition
1a05 328180    ld      (8081h),a			; write 00h to port B
1a08 3eff      ld      a,0ffh
1a0a 328580    ld      (8085h),a			; set DDR B to all outputs
1a0d 0e01      ld      c,01h
1a0f 3eff      ld      a,0ffh
1a11 328480    ld      (8084h),a			; set DDR A to all outputs
1a14 79        ld      a,c
1a15 328080    ld      (8080h),a			; write to port A
1a18 060a      ld      b,0ah
1a1a 10fe      djnz    1a1ah
1a1c 3e00      ld      a,00h
1a1e 328480    ld      (8084h),a			; set DDR A to all inputs
1a21 3a8080    ld      a,(8080h)			; read port A
1a24 b9        cp      c
1a25 c2321a    jp      nz,1a32h
1a28 07        rlca    
1a29 4f        ld      c,a
1a2a fe01      cp      01h
1a2c c20f1a    jp      nz,1a0fh
1a2f c33e1a    jp      1a3eh
1a32 57        ld      d,a
1a33 217719    ld      hl,1977h				; data at 1977
1a36 3e05      ld      a,05h
1a38 cde51a    call    1ae5h				;
1a3b c33e1a    jp      1a3eh
1a3e 0e01      ld      c,01h
1a40 3e0f      ld      a,0fh
1a42 328580    ld      (8085h),a			; set DDR B as inputs and outputs
1a45 79        ld      a,c
1a46 328180    ld      (8081h),a			; write to port B
1a49 060a      ld      b,0ah
1a4b 10fe      djnz    1a4bh
1a4d 3e00      ld      a,00h
1a4f 328580    ld      (8085h),a			; set DDR B to all inputs
1a52 3a8180    ld      a,(8081h)			; read port B
1a55 e60f      and     0fh
1a57 b9        cp      c
1a58 c2651a    jp      nz,1a65h
1a5b 07        rlca    
1a5c 4f        ld      c,a
1a5d fe10      cp      10h
1a5f c2401a    jp      nz,1a40h
1a62 c3711a    jp      1a71h
1a65 57        ld      d,a
1a66 217719    ld      hl,1977h				; data at 1977
1a69 3e06      ld      a,06h
1a6b cde51a    call    1ae5h				;
1a6e c3711a    jp      1a71h
1a71 3e20      ld      a,20h
1a73 328680    ld      (8086h),a			; set DDR C port direction
1a76 3e00      ld      a,00h
1a78 329880    ld      (8098h),a			; set timer 0 mode
1a7b 329980    ld      (8099h),a			; set timer 1 mode
1a7e 3e05      ld      a,05h
1a80 329880    ld      (8098h),a			; set timer 0 mode
1a83 329980    ld      (8099h),a			; set timer 1 mode
1a86 3e05      ld      a,05h
1a88 329080    ld      (8090h),a			; set timer 0 low byte
1a8b 329280    ld      (8092h),a			; set timer 1 low byte
1a8e 3e0d      ld      a,0dh
1a90 329180    ld      (8091h),a			; set timer 0 high byte
1a93 329380    ld      (8093h),a			; set timer 1 low byte
1a96 06ff      ld      b,0ffh
1a98 329580    ld      (8095h),a			; start timer 0
1a9b 10fe      djnz    1a9bh
1a9d 3a9080    ld      a,(8090h)			; read timer 0 low byte
1aa0 4f        ld      c,a
1aa1 3a9180    ld      a,(8091h)			; read timer 0 high byte
1aa4 47        ld      b,a
1aa5 b7        or      a
1aa6 c2b41a    jp      nz,1ab4h
1aa9 79        ld      a,c
1aaa fe10      cp      10h
1aac f2b41a    jp      p,1ab4h
1aaf fe0a      cp      0ah
1ab1 f2bf1a    jp      p,1abfh
1ab4 3e07      ld      a,07h
1ab6 217719    ld      hl,1977h				; data at 1977
1ab9 cde51a    call    1ae5h				;
1abc c3bf1a    jp      1abfh
1abf 06ff      ld      b,0ffh
1ac1 329780    ld      (8097h),a			; start timer 1
1ac4 10fe      djnz    1ac4h
1ac6 329680    ld      (8096h),a			; stop timer 1
1ac9 3a9280    ld      a,(8092h)			; read timer 1 low byte
1acc 4f        ld      c,a
1acd 3a9380    ld      a,(8093h)			; read timer 1 high byte
1ad0 47        ld      b,a
1ad1 b7        or      a
1ad2 c2df1a    jp      nz,1adfh
1ad5 79        ld      a,c
1ad6 fe10      cp      10h
1ad8 f2df1a    jp      p,1adfh
1adb 79        ld      a,c
1adc fe0a      cp      0ah
1ade f0        ret     p
1adf 3e08      ld      a,08h
1ae1 cde51a    call    1ae5h					;
1ae4 c9        ret     
;***************************************************************************
; called from 1914, 19ab, 19fa, 1a38, 1a6b, 1ab9, 1ae1
1ae5 217719    ld      hl,1977h					; data at 1977
1ae8 c3fa15    jp      15fah

;***************************************************************************
; called from 15d9 table
1aeb 3e00      ld      a,00h					
1aed 329880    ld      (8098h),a			; set timer 0 mode
1af0 3eff      ld      a,0ffh
1af2 328580    ld      (8085h),a			; set DDR B to all outputs
1af5 3ed0      ld      a,0d0h
1af7 328180    ld      (8081h),a			; write d0h to port B
1afa 3e00      ld      a,00h
1afc 328180    ld      (8081h),a			; write 00h to port B
1aff 3e08      ld      a,08h
1b01 d3bb      out     (0bbh),a
1b03 fd21201b  ld      iy,1b20h
1b07 fb        ei      
1b08 00        nop     
1b09 fd21261b  ld      iy,1b26h
1b0d 3e80      ld      a,80h
1b0f 329880    ld      (8098h),a			; set timer 0 mode
1b12 3e00      ld      a,00h
1b14 329880    ld      (8098h),a			; set timer 0 mode
1b17 0610      ld      b,10h
1b19 10fe      djnz    1b19h
1b1b 3e02      ld      a,02h
1b1d c3391b    jp      1b39h
1b20 e1        pop     hl
1b21 3e01      ld      a,01h
1b23 c3391b    jp      1b39h
1b26 e1        pop     hl
1b27 3ed0      ld      a,0d0h
1b29 328180    ld      (8081h),a			; write d0h to port B
1b2c 3e00      ld      a,00h
1b2e 328180    ld      (8081h),a			; write 00h to port B
1b31 fd21201b  ld      iy,1b20h
1b35 fb        ei      
1b36 c3461b    jp      1b46h
1b39 f3        di      
1b3a 5f        ld      e,a
1b3b 3e00      ld      a,00h
1b3d d3bb      out     (0bbh),a
1b3f 7b        ld      a,e
1b40 cdb21b    call    1bb2h				;
1b43 c34b1b    jp      1b4bh
1b46 f3        di      
1b47 3e00      ld      a,00h
1b49 d3bb      out     (0bbh),a
1b4b 3eff      ld      a,0ffh
1b4d 328680    ld      (8086h),a			; set DDR C port direction
1b50 328280    ld      (8082h),a			; write ffh to port C
1b53 0613      ld      b,13h
1b55 cdb10c    call    0cb1h				;
1b58 3e04      ld      a,04h
1b5a d3bb      out     (0bbh),a
1b5c dd21771b  ld      ix,1b77h
1b60 fb        ei      
1b61 00        nop     
1b62 dd217d1b  ld      ix,1b7dh
1b66 3e02      ld      a,02h
1b68 328a80    ld      (808ah),a			; bit clear port C
1b6b 328e80    ld      (808eh),a			; bit set port C
1b6e 0610      ld      b,10h
1b70 10fe      djnz    1b70h
1b72 3e04      ld      a,04h
1b74 c3961b    jp      1b96h
1b77 e1        pop     hl
1b78 3e03      ld      a,03h
1b7a c3961b    jp      1b96h
1b7d e1        pop     hl
1b7e 78        ld      a,b
1b7f c6f6      add     a,0f6h
1b81 fa891b    jp      m,1b89h
1b84 3e04      ld      a,04h
1b86 c3961b    jp      1b96h
1b89 0613      ld      b,13h
1b8b cdb10c    call    0cb1h				;
1b8e dd21771b  ld      ix,1b77h
1b92 fb        ei      
1b93 c3a51b    jp      1ba5h
1b96 f3        di      
1b97 5f        ld      e,a
1b98 3e00      ld      a,00h
1b9a d3bb      out     (0bbh),a
1b9c 0613      ld      b,13h
1b9e cdb10c    call    0cb1h				;
1ba1 7b        ld      a,e
1ba2 cdb21b    call    1bb2h				;
1ba5 f3        di      
1ba6 3e00      ld      a,00h
1ba8 d3bb      out     (0bbh),a
1baa c3b81b    jp      1bb8h
1bad 212a20    ld      hl,202ah
1bb0 262a      ld      h,2ah
1bb2 21ad1b    ld      hl,1badh				; called from 1b40, 1ba2
1bb5 c3fa15    jp      15fah
1bb8 c9        ret     
;********************************************************************************************
; called from 15e2 table
1bb9 3e04      ld      a,04h				
1bbb d3bb      out     (0bbh),a
1bbd dd211f17  ld      ix,171fh
1bc1 3eff      ld      a,0ffh
1bc3 328580    ld      (8085h),a			; set DDR B to all outputs
1bc6 3e27      ld      a,27h
1bc8 328680    ld      (8086h),a			; set DDR C port direction
1bcb 0625      ld      b,25h
1bcd 16ff      ld      d,0ffh
1bcf 1e6b      ld      e,6bh
1bd1 cd2217    call    1722h				;
1bd4 d2dd1b    jp      nc,1bddh
1bd7 57        ld      d,a
1bd8 3e12      ld      a,12h
1bda cd051c    call    1c05h				;
1bdd 3e11      ld      a,11h
1bdf 0611      ld      b,11h
1be1 cd5415    call    1554h				;
1be4 0600      ld      b,00h
1be6 16ff      ld      d,0ffh
1be8 1e78      ld      e,78h
1bea cd2217    call    1722h				;
1bed d20b1c    jp      nc,1c0bh
1bf0 57        ld      d,a
1bf1 3e01      ld      a,01h
1bf3 0611      ld      b,11h
1bf5 cd5415    call    1554h				;
1bf8 3e28      ld      a,28h
1bfa cd051c    call    1c05h				;
1bfd c30b1c    jp      1c0bh

1c00 262a      ld      h,2ah				; data
1c02 262a      ld      h,2ah
1c04 26
;***********************************************************************************************
; called by 1bda, 1bfa
1c05 21        ld      hl,1c00h				
1c06 00        nop     
1c07 1c        inc     e
1c08 c3fa15    jp      15fah

1c0b 3e01      ld      a,01h
1c0d 0611      ld      b,11h
1c0f cd5415    call    1554h				;
1c12 c9        ret     
;***********************************************************************************************
; called from 15e5 table
1c13 3e04      ld      a,04h				
1c15 d3bb      out     (0bbh),a
1c17 dd211f17  ld      ix,171fh
1c1b 3eff      ld      a,0ffh
1c1d 328580    ld      (8085h),a			; set DDR B to all outputs
1c20 3e27      ld      a,27h
1c22 328680    ld      (8086h),a			; set DDR C port direction
1c25 063e      ld      b,3eh
1c27 16db      ld      d,0dbh
1c29 1e80      ld      e,80h
1c2b 3e02      ld      a,02h
1c2d cde116    call    16e1h				;
1c30 cd2217    call    1722h				;
1c33 d23c1c    jp      nc,1c3ch
1c36 57        ld      d,a
1c37 3e05      ld      a,05h
1c39 cd8b1c    call    1c8bh				;
1c3c 063d      ld      b,3dh
1c3e 16e3      ld      d,0e3h
1c40 1e81      ld      e,81h
1c42 3e04      ld      a,04h
1c44 cde116    call    16e1h				;
1c47 cd2217    call    1722h				;
1c4a d2531c    jp      nc,1c53h
1c4d 57        ld      d,a
1c4e 3e18      ld      a,18h
1c50 cd8b1c    call    1c8bh				;
1c53 0627      ld      b,27h
1c55 16ac      ld      d,0ach
1c57 1e7e      ld      e,7eh
1c59 cd2217    call    1722h				;
1c5c d2651c    jp      nc,1c65h
1c5f 57        ld      d,a
1c60 3e15      ld      a,15h
1c62 cd8b1c    call    1c8bh				;
1c65 3e21      ld      a,21h
1c67 0611      ld      b,11h
1c69 cd5415    call    1554h				;
1c6c 063f      ld      b,3fh
1c6e 16d1      ld      d,0d1h
1c70 1e82      ld      e,82h
1c72 3e02      ld      a,02h
1c74 cde116    call    16e1h				;
1c77 cd2217    call    1722h				;
1c7a d2911c    jp      nc,1c91h
1c7d 57        ld      d,a
1c7e 3e57      ld      a,57h
1c80 cd8b1c    call    1c8bh				;
1c83 c3911c    jp      1c91h

1c86 212a20    ld      hl,202ah				; data
1c89 29        add     hl,hl
1c8a 2a
;***************************************************************************************
; called by 1c39, 1c50, 1c62, 1c80
1c8b 21861c    ld      hl,1c86h				
1c8d 1c        inc     e
1c8e c3fa15    jp      15fah

1c91 c9        ret     
;***************************************************************************************************
; called from 15e8 table
1c92 af        xor     a					
1c93 d3bb      out     (0bbh),a
1c95 3e14      ld      a,14h
1c97 0680      ld      b,80h
1c99 cd5415    call    1554h				;
1c9c 3e01      ld      a,01h
1c9e cdd507    call    07d5h				;
1ca1 3e00      ld      a,00h
1ca3 0680      ld      b,80h
1ca5 cd5415    call    1554h				;
1ca8 3e21      ld      a,21h
1caa 0611      ld      b,11h
1cac cd5415    call    1554h				;
1caf 3e00      ld      a,00h
1cb1 329880    ld      (8098h),a			; set timer 0 mode
1cb4 3e05      ld      a,05h
1cb6 329880    ld      (8098h),a			; set timer 0 mode
1cb9 3e05      ld      a,05h
1cbb 329080    ld      (8090h),a			; set timer 0 low byte
1cbe 3e0d      ld      a,0dh
1cc0 329180    ld      (8091h),a			; set timer 0 high byte
1cc3 329580    ld      (8095h),a			; start timer 0
1cc6 cdcc1c    call    1ccch				;
1cc9 c30e1d    jp      1d0eh
;****************************************************************************
; called from 1cc6, 1d54
1ccc 216602    ld      hl,0266h				
1ccf 0612      ld      b,12h
1cd1 cdb10c    call    0cb1h				;
1cd4 cb47      bit     0,a
1cd6 c2e51c    jp      nz,1ce5h
1cd9 2b        dec     hl
1cda 7c        ld      a,h
1cdb b5        or      l
1cdc c2cf1c    jp      nz,1ccfh
1cdf 3e01      ld      a,01h
1ce1 e1        pop     hl
1ce2 c3a21d    jp      1da2h
1ce5 3e0d      ld      a,0dh
1ce7 0680      ld      b,80h
1ce9 cd5415    call    1554h				;
1cec 3e01      ld      a,01h
1cee cdd507    call    07d5h				;
1cf1 3e01      ld      a,01h
1cf3 0680      ld      b,80h
1cf5 cd5415    call    1554h				;
1cf8 26ff      ld      h,0ffh
1cfa 0612      ld      b,12h
1cfc cdb10c    call    0cb1h				;
1cff cb47      bit     0,a
1d01 c8        ret     z
1d02 25        dec     h
1d03 7c        ld      a,h
1d04 b7        or      a
1d05 c2fa1c    jp      nz,1cfah
1d08 3e02      ld      a,02h
1d0a e1        pop     hl
1d0b c3a21d    jp      1da2h
1d0e 3e00      ld      a,00h
1d10 0680      ld      b,80h
1d12 cd5415    call    1554h				;
1d15 216602    ld      hl,0266h
1d18 0612      ld      b,12h
1d1a cdb10c    call    0cb1h				;
1d1d cb47      bit     0,a
1d1f c22d1d    jp      nz,1d2dh
1d22 2b        dec     hl
1d23 7c        ld      a,h
1d24 b5        or      l
1d25 c2181d    jp      nz,1d18h
1d28 3e03      ld      a,03h
1d2a c3a21d    jp      1da2h
1d2d 3e0b      ld      a,0bh
1d2f 0680      ld      b,80h
1d31 cd5415    call    1554h				;
1d34 3e01      ld      a,01h
1d36 cdd507    call    07d5h				;
1d39 3e01      ld      a,01h
1d3b 0680      ld      b,80h
1d3d cd5415    call    1554h				;
1d40 3e20      ld      a,20h
1d42 cdd507    call    07d5h				;
1d45 0612      ld      b,12h
1d47 cdb10c    call    0cb1h				;
1d4a cb47      bit     0,a
1d4c c2541d    jp      nz,1d54h
1d4f 3e04      ld      a,04h
1d51 c3a21d    jp      1da2h
1d54 cdcc1c    call    1ccch				;
1d57 3e10      ld      a,10h
1d59 0680      ld      b,80h
1d5b cd5415    call    1554h				;
1d5e 3e01      ld      a,01h
1d60 cdd507    call    07d5h				;
1d63 3e00      ld      a,00h
1d65 0680      ld      b,80h
1d67 cd5415    call    1554h				;
1d6a 216602    ld      hl,0266h
1d6d 0612      ld      b,12h
1d6f cdb10c    call    0cb1h				;
1d72 cb47      bit     0,a
1d74 c2a51d    jp      nz,1da5h
1d77 2b        dec     hl
1d78 7c        ld      a,h
1d79 b5        or      l
1d7a c26d1d    jp      nz,1d6dh
1d7d 3e05      ld      a,05h
1d7f c3a21d    jp      1da2h

1d82 212a20    ld      hl,202ah				; data
1d85 27        daa     
1d86 2a
;**********************************************************************************
; called by 1da2
1d87 f5		   push    af					
1d88 3e14      ld      a,14h
1d8a 0680      ld      b,80h
1d8c cd5415    call    1554h				;
1d8f 3e01      ld      a,01h
1d91 cdd507    call    07d5h				;
1d94 3e00      ld      a,00h
1d96 0680      ld      b,80h
1d98 cd5415    call    1554h				;
1d9b f1        pop     af
1d9c 21821d    ld      hl,1d82h
1d9f c3fa15    jp      15fah

1da2 cd871d    call    1d87h				;
1da5 3e14      ld      a,14h
1da7 0680      ld      b,80h
1da9 cd5415    call    1554h				;
1dac 3e01      ld      a,01h
1dae cdd507    call    07d5h				;
1db1 3e00      ld      a,00h
1db3 0680      ld      b,80h
1db5 cd5415    call    1554h				;
1db8 c9        ret     

;*******************************************************************************
; called from 15d6 table
1db9 3e00      ld      a,00h				
1dbb 328780    ld      (8087h),a			; set port mode definition
1dbe 328480    ld      (8084h),a			; set DDR A to all inputs
1dc1 328180    ld      (8081h),a			; write 00h to port B
1dc4 3eff      ld      a,0ffh
1dc6 328580    ld      (8085h),a			; set DDR B to all outputs
1dc9 328280    ld      (8082h),a			; write ffh to port C
1dcc 3e27      ld      a,27h
1dce 328680    ld      (8086h),a			; set DDR C port direction
1dd1 0643      ld      b,43h
1dd3 cdb10c    call    0cb1h				;
1dd6 cb5f      bit     3,a
1dd8 c0        ret     nz
1dd9 210000    ld      hl,0000h
1ddc 110000    ld      de,0000h
1ddf 010000    ld      bc,0000h
1de2 0a        ld      a,(bc)
1de3 5f        ld      e,a
1de4 19        add     hl,de
1de5 03        inc     bc
1de6 3e40      ld      a,40h
1de8 b8        cp      b
1de9 c2e21d    jp      nz,1de2h
1dec 7d        ld      a,l
1ded e607      and     07h
1def 0601      ld      b,01h
1df1 cd2d15    call    152dh				;
1df4 cd211e    call    1e21h				;
1df7 0602      ld      b,02h
1df9 cd2d15    call    152dh				;
1dfc cd211e    call    1e21h				;
1dff 0603      ld      b,03h
1e01 cd2d15    call    152dh				;
1e04 cd211e    call    1e21h				;
1e07 0604      ld      b,04h
1e09 cd2d15    call    152dh				;
1e0c cd211e    call    1e21h				;
1e0f 47        ld      b,a
1e10 cd211e    call    1e21h				;
1e13 80        add     a,b
1e14 0605      ld      b,05h
1e16 cd2d15    call    152dh				;
1e19 3e14      ld      a,14h
1e1b cddd01    call    01ddh				;
1e1e c3311e    jp      1e31h
;****************************************************************************************
; called from 1df4, 1dfc, 1e04, 1e0c, 1e10
1e21 cb3c      srl     h					
1e23 cb1d      rr      l
1e25 cb3c      srl     h
1e27 cb1d      rr      l
1e29 cb3c      srl     h
1e2b cb1d      rr      l
1e2d 7d        ld      a,l
1e2e e607      and     07h
1e30 c9        ret 
;****************************************************************************************
; continuation from above
1e31 00        nop     						
1e32 cd561e    call    1e56h				;
1e35 0601      ld      b,01h
1e37 3e20      ld      a,20h
1e39 cd2d15    call    152dh				;
1e3c f5        push    af
1e3d 3e02      ld      a,02h
1e3f cddd01    call    01ddh				;
1e42 f1        pop     af
1e43 3c        inc     a
1e44 fe2b      cp      2bh
1e46 c2391e    jp      nz,1e39h
1e49 04        inc     b
1e4a 78        ld      a,b
1e4b fe06      cp      06h
1e4d c2371e    jp      nz,1e37h
1e50 cd561e    call    1e56h				;
1e53 c3601e    jp      1e60h
;**************************************************************************
; called from 1e32, 1e50
1e56 0605      ld      b,05h				
1e58 3e2a      ld      a,2ah
1e5a cd2d15    call    152dh				;
1e5d 10fb      djnz    1e5ah
1e5f c9        ret     
;**************************************************************************
; continuation from above
1e60 0642      ld      b,42h				
1e62 cdb10c    call    0cb1h				;
1e65 0e20      ld      c,20h
1e67 e63f      and     3fh
1e69 fe3f      cp      3fh
1e6b ca7a1e    jp      z,1e7ah
1e6e 0e21      ld      c,21h
1e70 cb47      bit     0,a
1e72 ca7a1e    jp      z,1e7ah
1e75 0f        rrca    
1e76 0c        inc     c
1e77 c3701e    jp      1e70h
1e7a 79        ld      a,c
1e7b 0601      ld      b,01h
1e7d cd2d15    call    152dh				;
1e80 0641      ld      b,41h
1e82 cdb10c    call    0cb1h				;
1e85 0e20      ld      c,20h
1e87 47        ld      b,a
1e88 e60f      and     0fh
1e8a fe0f      cp      0fh
1e8c ca9b1e    jp      z,1e9bh
1e8f 0e21      ld      c,21h
1e91 cb47      bit     0,a
1e93 ca9b1e    jp      z,1e9bh
1e96 0f        rrca    
1e97 0c        inc     c
1e98 c3911e    jp      1e91h
1e9b 78        ld      a,b
1e9c cb67      bit     4,a
1e9e c2a21e    jp      nz,1ea2h
1ea1 0c        inc     c
1ea2 79        ld      a,c
1ea3 0602      ld      b,02h
1ea5 cd2d15    call    152dh				;
1ea8 0643      ld      b,43h
1eaa cdb10c    call    0cb1h				;
1ead 0e20      ld      c,20h
1eaf e60f      and     0fh
1eb1 fe0f      cp      0fh
1eb3 cac21e    jp      z,1ec2h
1eb6 0e21      ld      c,21h
1eb8 cb47      bit     0,a
1eba cac21e    jp      z,1ec2h
1ebd 0f        rrca    
1ebe 0c        inc     c
1ebf c3b81e    jp      1eb8h
1ec2 79        ld      a,c
1ec3 0603      ld      b,03h
1ec5 cd2d15    call    152dh				;
1ec8 0640      ld      b,40h
1eca cdb10c    call    0cb1h				;
1ecd 0e20      ld      c,20h
1ecf 47        ld      b,a
1ed0 e61f      and     1fh
1ed2 fe1f      cp      1fh
1ed4 cae21e    jp      z,1ee2h
1ed7 cb47      bit     0,a
1ed9 cae21e    jp      z,1ee2h
1edc 0f        rrca    
1edd 0c        inc     c
1ede 0c        inc     c
1edf c3d71e    jp      1ed7h
1ee2 78        ld      a,b
1ee3 cb6f      bit     5,a
1ee5 cae91e    jp      z,1ee9h
1ee8 0c        inc     c
1ee9 79        ld      a,c
1eea 0604      ld      b,04h
1eec cd2d15    call    152dh				;
1eef 0e20      ld      c,20h
1ef1 0641      ld      b,41h
1ef3 cdb10c    call    0cb1h				;
1ef6 cb6f      bit     5,a
1ef8 c2fc1e    jp      nz,1efch
1efb 0c        inc     c
1efc 0643      ld      b,43h
1efe cdb10c    call    0cb1h				;
1f01 cb67      bit     4,a
1f03 c2071f    jp      nz,1f07h
1f06 0c        inc     c
1f07 79        ld      a,c
1f08 0605      ld      b,05h
1f0a cd2d15    call    152dh				;
1f0d 3e02      ld      a,02h
1f0f cddd01    call    01ddh				;
1f12 c3601e    jp      1e60h
;***********************************************************************************
; called from 15ee table
1f15 217b21    ld      hl,217bh				
1f18 0650      ld      b,50h
1f1a 16bb      ld      d,0bbh
1f1c 1e99      ld      e,99h
1f1e 3e04      ld      a,04h
1f20 cde116    call    16e1h				;
1f23 cd2217    call    1722h				;
1f26 d22f1f    jp      nc,1f2fh
1f29 57        ld      d,a
1f2a 3e05      ld      a,05h
1f2c cdd720    call    20d7h				;
1f2f 23        inc     hl
1f30 7e        ld      a,(hl)
1f31 feff      cp      0ffh
1f33 ca6121    jp      z,2161h				;
1f36 320b80    ld      (800bh),a
1f39 23        inc     hl
1f3a 7e        ld      a,(hl)
1f3b 320c80    ld      (800ch),a
1f3e 23        inc     hl
1f3f 7e        ld      a,(hl)
1f40 320d80    ld      (800dh),a
1f43 23        inc     hl
1f44 e5        push    hl
1f45 cdc013    call    13c0h				;
1f48 e1        pop     hl
1f49 3e02      ld      a,02h
1f4b cddd01    call    01ddh				;
1f4e 3e01      ld      a,01h
1f50 0651      ld      b,51h
1f52 cde116    call    16e1h				;
1f55 0656      ld      b,56h
1f57 16ff      ld      d,0ffh
1f59 1e33      ld      e,33h
1f5b cd2217    call    1722h				;
1f5e d2671f    jp      nc,1f67h
1f61 57        ld      d,a
1f62 3e01      ld      a,01h
1f64 cdd720    call    20d7h				;
1f67 3e01      ld      a,01h
1f69 0651      ld      b,51h
1f6b cde116    call    16e1h				;
1f6e 0657      ld      b,57h
1f70 16ff      ld      d,0ffh
1f72 1e0a      ld      e,0ah
1f74 cd2217    call    1722h				;
1f77 d2801f    jp      nc,1f80h
1f7a 57        ld      d,a
1f7b 3e02      ld      a,02h
1f7d cdd720    call    20d7h				;
1f80 0638      ld      b,38h
1f82 16ff      ld      d,0ffh
1f84 1e19      ld      e,19h
1f86 3e04      ld      a,04h
1f88 cde116    call    16e1h				;
1f8b cd2217    call    1722h				;
1f8e d2971f    jp      nc,1f97h
1f91 57        ld      d,a
1f92 3e01      ld      a,01h
1f94 cde520    call    20e5h				;
1f97 3e01      ld      a,01h
1f99 0621      ld      b,21h
1f9b cd5415    call    1554h				;
1f9e 3e07      ld      a,07h
1fa0 0611      ld      b,11h
1fa2 cd5415    call    1554h				;
1fa5 06b2      ld      b,0b2h
1fa7 16ff      ld      d,0ffh
1fa9 1e19      ld      e,19h
1fab 3e04      ld      a,04h
1fad cde116    call    16e1h				;
1fb0 cd2217    call    1722h				;
1fb3 d2bc1f    jp      nc,1fbch
1fb6 57        ld      d,a
1fb7 3e01      ld      a,01h
1fb9 cdf320    call    20f3h				;
1fbc 3e06      ld      a,06h
1fbe cdd507    call    07d5h				;
1fc1 06b3      ld      b,0b3h
1fc3 16ff      ld      d,0ffh
1fc5 1eb3      ld      e,0b3h
1fc7 cd2217    call    1722h				;
1fca d2d31f    jp      nc,1fd3h
1fcd 57        ld      d,a
1fce 3e02      ld      a,02h
1fd0 cdf320    call    20f3h				;
1fd3 06b0      ld      b,0b0h
1fd5 16d7      ld      d,0d7h
1fd7 1e0f      ld      e,0fh
1fd9 3e04      ld      a,04h
1fdb cde116    call    16e1h				;
1fde cd2217    call    1722h				;
1fe1 d2ea1f    jp      nc,1feah
1fe4 57        ld      d,a
1fe5 3e03      ld      a,03h
1fe7 cdf320    call    20f3h				;
1fea 3e03      ld      a,03h
1fec 0611      ld      b,11h
1fee cd5415    call    1554h				;
1ff1 3e01      ld      a,01h
1ff3 cdd507    call    07d5h				;
1ff6 3e01      ld      a,01h
1ff8 0611      ld      b,11h
1ffa cd5415    call    1554h				;
1ffd 3a2680    ld      a,(8026h)
2000 cb77      bit     6,a
2002 c22f1f    jp      nz,1f2fh
2005 3e02      ld      a,02h
2007 0e0a      ld      c,0ah
2009 cd3017    call    1730h				;
200c 3e22      ld      a,22h
200e 0613      ld      b,13h
2010 cd5415    call    1554h				;
2013 3e00      ld      a,00h
2015 0621      ld      b,21h
2017 cd5415    call    1554h				;
201a 3e07      ld      a,07h
201c 0611      ld      b,11h
201e cd5415    call    1554h				;
2021 3e01      ld      a,01h
2023 cddd01    call    01ddh				;
2026 06b1      ld      b,0b1h
2028 cd5415    call    1554h				;
202b 3e0f      ld      a,0fh
202d 0611      ld      b,11h
202f cd5415    call    1554h				;
2032 3e01      ld      a,01h
2034 0e03      ld      c,03h
2036 cd3017    call    1730h				;
2039 0600      ld      b,00h
203b 16ff      ld      d,0ffh
203d 1e4c      ld      e,4ch
203f 3e04      ld      a,04h
2041 cde116    call    16e1h				;
2044 cd2217    call    1722h				;
2047 d25020    jp      nc,2050h
204a 57        ld      d,a
204b 3e01      ld      a,01h
204d cd0621    call    2106h				;
2050 3e01      ld      a,01h
2052 0e04      ld      c,04h
2054 cd3017    call    1730h				;
2057 0600      ld      b,00h
2059 169a      ld      d,9ah
205b 1e33      ld      e,33h
205d cd2217    call    1722h				;
2060 d26920    jp      nc,2069h
2063 57        ld      d,a
2064 3e02      ld      a,02h
2066 cd0621    call    2106h				;
2069 cd4121    call    2141h				;
206c 3e02      ld      a,02h
206e 0613      ld      b,13h
2070 cd5415    call    1554h				;
2073 3e01      ld      a,01h
2075 0e05      ld      c,05h
2077 cd3017    call    1730h				;
207a 0600      ld      b,00h
207c 16ff      ld      d,0ffh
207e 1e29      ld      e,29h
2080 3e04      ld      a,04h
2082 cde116    call    16e1h				;
2085 cd2217    call    1722h				;
2088 d29120    jp      nc,2091h
208b 57        ld      d,a
208c 3e01      ld      a,01h
208e cd2721    call    2127h				;
2091 3e01      ld      a,01h
2093 0e06      ld      c,06h
2095 cd3017    call    1730h				;
2098 0600      ld      b,00h
209a 16ff      ld      d,0ffh
209c 1e29      ld      e,29h
209e 3e04      ld      a,04h
20a0 cde116    call    16e1h				;
20a3 cd2217    call    1722h				;
20a6 d2af20    jp      nc,20afh
20a9 57        ld      d,a
20aa 3e02      ld      a,02h
20ac cd2721    call    2127h				;
20af 3e01      ld      a,01h
20b1 0e07      ld      c,07h
20b3 cd3017    call    1730h				;
20b6 0600      ld      b,00h
20b8 16ff      ld      d,0ffh
20ba 1e29      ld      e,29h
20bc 3e04      ld      a,04h
20be cde116    call    16e1h				;
20c1 cd2217    call    1722h				;
20c4 d2cd20    jp      nc,20cdh
20c7 57        ld      d,a
20c8 3e03      ld      a,03h
20ca cd2721    call    2127h				;
20cd 3e02      ld      a,02h
20cf 0e00      ld      c,00h
20d1 cd3017    call    1730h				;
20d4 c32f1f    jp      1f2fh
;***************************************************************************************
; called from 1f2c, 1f64, 1f7d
20d7 c1        pop     bc					
20d8 b6        or      (hl)
20d9 d5        push    de
20da d9        exx     
20db d1        pop     de
20dc 216221    ld      hl,2162h				; data at 2162
20df cdfa15    call    15fah				;
20e2 d9        exx     
20e3 c5        push    bc
20e4 c9        ret     
;****************************************************************************************
; called from 1f94
20e5 c1        pop     bc					
20e6 b6        or      (hl)
20e7 d5        push    de
20e8 d9        exx     
20e9 d1        pop     de
20ea 216721    ld      hl,2167h
20ed cdfa15    call    15fah				;
20f0 d9        exx     
20f1 c5        push    bc
20f2 c9        ret     
;****************************************************************************************
; called from 1fb9, 1fd0, 1fe7
20f3 f5        push    af					
20f4 cd4121    call    2141h				;
20f7 f1        pop     af
20f8 c1        pop     bc
20f9 b6        or      (hl)
20fa d5        push    de
20fb d9        exx     
20fc d1        pop     de
20fd 216c21    ld      hl,216ch
2100 cdfa15    call    15fah				;
2103 d9        exx     
2104 c5        push    bc
2105 c9        ret     
;****************************************************************************************
; called from 204d, 2066
2106 f5        push    af					
2107 3e02      ld      a,02h
2109 0613      ld      b,13h
210b cd5415    call    1554h				;
210e cd4121    call    2141h				;
2111 3e02      ld      a,02h
2113 0e00      ld      c,00h
2115 cd3017    call    1730h				;
2118 f1        pop     af
2119 c1        pop     bc
211a b6        or      (hl)
211b d5        push    de
211c d9        exx     
211d d1        pop     de
211e 217121    ld      hl,2171h
2121 cdfa15    call    15fah				;
2124 d9        exx     
2125 c5        push    bc
2126 c9        ret     
;***************************************************************************************
; called from 208e, 20ac, 20ca
2127 f5        push    af					
2128 cd4121    call    2141h				;
212b 3e02      ld      a,02h
212d 0e00      ld      c,00h
212f cd3017    call    1730h				;
2132 f1        pop     af
2133 c1        pop     bc
2134 b6        or      (hl)
2135 d5        push    de
2136 d9        exx     
2137 d1        pop     de
2138 217621    ld      hl,2176h
213b cdfa15    call    15fah				;
213e d9        exx     
213f c5        push    bc
2140 c9        ret     
;**************************************************************************************
; called from 20f4, 210e, 2069, 2128
2141 3e07      ld      a,07h				
2143 0611      ld      b,11h
2145 cd5415    call    1554h				;
2148 3e01      ld      a,01h
214a cdd507    call    07d5h				;
214d 3e03      ld      a,03h
214f 0611      ld      b,11h
2151 cd5415    call    1554h				;
2154 3e01      ld      a,01h
2156 cdd507    call    07d5h				;
2159 3e01      ld      a,01h
215b 0611      ld      b,11h
215d cd5415    call    1554h				;
2160 c9        ret     
;*************************************************************************************
2161 c9        ret     						; from 1f33
;*************************************************************************************
; data used 20dc
2162		   db	   021h, 02ah, 020h, 024h, 02ah, 021h, 02ah, 020h
216a		   db	   022h, 02ah, 021h, 02ah, 021h, 021h, 02ah, 022h
2172		   db      02ah, 020h, 023h, 02ah, 022h, 02ah, 020h, 024h
217a		   db      02ah, 000h, 030h, 001h, 000h, 010h, 043h, 000h
2182		   db      000h, 030h, 041h, 000h, 000h, 020h, 075h, 009h
218a		   db      075h, 060h, 060h, 009h, 075h, 040h, 061h, 001h
2192           db      000h, 050h, 0ffh

;***************************************************************************
; called from 1695, 16ce
2195 f5        push    af					
2196 d5        push    de
2197 0600      ld      b,00h
2199 cdeb16    call    16ebh				;
219c 57        ld      d,a
219d cd5f17    call    175fh				;
21a0 3e05      ld      a,05h
21a2 cddd01    call    01ddh				;
21a5 0643      ld      b,43h
21a7 cdb10c    call    0cb1h				;
21aa cb57      bit     2,a
21ac c29721    jp      nz,2197h
21af d1        pop     de
21b0 f1        pop     af
21b1 c9        ret   
;**************************************************************************
; called from 15f1 table
21b2 3a2680    ld      a,(8026h)			
21b5 cb77      bit     6,a
21b7 c0        ret     nz
21b8 0615      ld      b,15h
21ba 21e721    ld      hl,21e7h				; data at 21e7
21bd 7e        ld      a,(hl)
21be c5        push    bc
21bf 23        inc     hl
21c0 4e        ld      c,(hl)
21c1 23        inc     hl
21c2 cd3017    call    1730h				;
21c5 0610      ld      b,10h
21c7 cdb10c    call    0cb1h				;
21ca c1        pop     bc
21cb e61f      and     1fh
21cd be        cp      (hl)
21ce c2d721    jp      nz,21d7h
21d1 23        inc     hl
21d2 10e9      djnz    21bdh
21d4 c32622    jp      2226h
21d7 57        ld      d,a
21d8 78        ld      a,b
21d9 e607      and     07h
21db 4f        ld      c,a
21dc 78        ld      a,b
21dd e618      and     18h
21df 07        rlca    
21e0 b1        or      c
21e1 cd8f22    call    228fh				;
21e4 c32622    jp      2226h
;********************************************************************************
; data used at 21ba
21e7		   db      005h, 000h, 000h
21ea		   db      005h, 002h, 002h
21ed           db      005h, 004h, 004h
21f0           db      005h, 008h, 008h
21f3           db      005h, 010h, 010h
21f6           db      00ah, 000h, 007h
21f9           db      00ah, 001h, 006h
21fc           db      00ah, 002h, 005h
21ff           db      00ah, 004h, 003h
2202           db      00ah, 008h, 017h
2205           db      00ah, 010h, 00fh
2208           db      00ch, 000h, 001h
220b           db      00ch, 011h, 011h
220e           db      00ch, 002h, 001h
2211           db      00ch, 003h, 002h
2214           db      00ch, 004h, 002h
2217           db      00ch, 008h, 00ah
221a           db      00ch, 009h, 00ah
221d           db      00ch, 00ah, 00ch
2220           db      00ch, 00bh, 00ch
2223           db      00ch, 00ch, 00ch

;********************************************************************************
; from 21d4
2226 0609      ld      b,09h				
2228 215d22    ld      hl,225dh				; data at 225d
222b 4e        ld      c,(hl)
222c 3e05      ld      a,05h
222e cd3017    call    1730h				;
2231 23        inc     hl
2232 4e        ld      c,(hl)
2233 3e0a      ld      a,0ah
2235 cd3017    call    1730h				;
2238 23        inc     hl
2239 4e        ld      c,(hl)
223a 3e0c      ld      a,0ch
223c cd3017    call    1730h				;
223f 23        inc     hl
2240 56        ld      d,(hl)
2241 23        inc     hl
2242 5e        ld      e,(hl)
2243 c5        push    bc
2244 0600      ld      b,00h
2246 cd2217    call    1722h				;
2249 57        ld      d,a
224a c1        pop     bc
224b da5422    jp      c,2254h
224e 23        inc     hl
224f 10da      djnz    222bh
2251 c3a422    jp      22a4h				;
2254 78        ld      a,b
2255 f640      or      40h
2257 cd8f22    call    228fh				;
225a c3a422    jp      22a4h				;
;*************************************************************************************
; data used at 2228
225d           db      000h, 004h, 000h, 0ffh, 075h
               db      001h, 004h, 000h, 010h, 000h
               db      001h, 004h, 010h, 0ffh, 075h
			   db      002h, 004h, 000h, 0ffh, 075h
               db      003h, 004h, 001h, 0ffh, 075h
               db      004h, 004h, 002h, 0ffh, 075h 
               db      005h, 004h, 003h, 0ffh, 075h
			   db      006h, 004h, 004h, 0ffh, 075h
               db      007h, 004h, 000h, 0ffh, 075h

; data used at 229c
228a 222a20    db      022h, 02ah, 020h, 025h, 02ah

;***************************************************************************************
; called from 21e1, 2257
228f f5		   push    af					
2290 3e02      ld      a,02h
2292 0e00      ld      c,00h
2294 cd3017    call    1730h				;
2297 f1        pop     af
2298 c1        pop     bc
2299 d5        push    de
229a d9        exx     
229b d1        pop     de
229c 218a22    ld      hl,228ah				; data at 228a
229f cdfa15    call    15fah				;
22a2 d9        exx     
22a3 c5        push    bc
22a4 3e02      ld      a,02h				; from 2251, 225a
22a6 0e00      ld      c,00h
22a8 cd3017    call    1730h				;
22ab c9        ret     
;****************************************************************************************
; called from 15f4 table
22ac 3a2680    ld      a,(8026h)			
22af cb77      bit     6,a
22b1 c0        ret     nz
22b2 0e00      ld      c,00h
22b4 3e01      ld      a,01h
22b6 cd3017    call    1730h				;
22b9 0e01      ld      c,01h
22bb 3e02      ld      a,02h
22bd cd3017    call    1730h				;
22c0 0600      ld      b,00h
22c2 16ae      ld      d,0aeh
22c4 1e85      ld      e,85h
22c6 cd2217    call    1722h				;
22c9 d2d222    jp      nc,22d2h
22cc 57        ld      d,a
22cd 3e12      ld      a,12h
22cf cd4623    call    2346h				;
22d2 0e02      ld      c,02h
22d4 3e01      ld      a,01h
22d6 cd3017    call    1730h				;
22d9 0e01      ld      c,01h
22db 3e02      ld      a,02h
22dd cd3017    call    1730h				;
22e0 0600      ld      b,00h
22e2 16ff      ld      d,0ffh
22e4 1e66      ld      e,66h
22e6 cd2217    call    1722h				;
22e9 d2f222    jp      nc,22f2h
22ec 57        ld      d,a
22ed 3e28      ld      a,28h
22ef cd4623    call    2346h				;
22f2 0e03      ld      c,03h
22f4 3e01      ld      a,01h
22f6 cd3017    call    1730h				;
22f9 0e09      ld      c,09h
22fb 3e02      ld      a,02h
22fd cd3017    call    1730h				;
2300 3e22      ld      a,22h
2302 0613      ld      b,13h
2304 cd5415    call    1554h				;
2307 0600      ld      b,00h
2309 16ff      ld      d,0ffh
230b 1e80      ld      e,80h
230d cd2217    call    1722h				;
2310 d21923    jp      nc,2319h
2313 57        ld      d,a
2314 3e10      ld      a,10h
2316 cd4623    call    2346h				;
2319 0e03      ld      c,03h
231b 3e01      ld      a,01h
231d cd3017    call    1730h				;
2320 0e01      ld      c,01h
2322 3e02      ld      a,02h
2324 cd3017    call    1730h				;
2327 3e02      ld      a,02h
2329 0613      ld      b,13h
232b cd5415    call    1554h				;
232e 0600      ld      b,00h
2330 1610      ld      d,10h
2332 1e00      ld      e,00h
2334 cd2217    call    1722h				;
2337 d27123    jp      nc,2371h
233a 57        ld      d,a
233b 3e01      ld      a,01h
233d cd6223    call    2362h				;
2340 c9        ret     
;*******************************************************************************************
; data used at 2356
2341           db      022h, 02ah, 020h, 021h, 02ah

;*******************************************************************************************
; called from 22cf, 22ef, 2316
2346 f5    	   push    af					
2347 3e02      ld      a,02h 
2349 0e00      ld      c,00h
234b cd3017    call    1730h
234e 3e02      ld      a,02h
2350 0613      ld      b,13h
2352 cd5415    call    1554h
2355 f1        pop     af
2356 214123    ld      hl,2341h				; data at 2341
2359 c3fa15    jp      15fah
235c c9        ret     
;********************************************************************************************
235d 222a20    ld      (202ah),hl
2360 222a
;********************************************************************************************
; called from 233d
2362 f5        push    af					
2363 3e02      ld      a,02h
2365 0e00      ld      c,00h
2367 cd3017    call    1730h
236a f1        pop     af
236b 215d23    ld      hl,235dh
236e c3fa15    jp      15fah
;********************************************************************************************
; from 2337
2371 3e02      ld      a,02h				
2373 0e00      ld      c,00h
2375 cd3017    call    1730h				;
2378 c9        ret     



