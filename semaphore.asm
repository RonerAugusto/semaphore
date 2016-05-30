;---------semaforo --------------
;---------begin -----------
org 0000h;
jmp inicio;

;--------configuration of the timer -------------
org 100h

inicio:  setb EA; all inputs enable
         setb et0; interruption do timer active

;---------timer  -----------

 mov  tmod,#1 ;modo de contagem 16bits
 setb TR0 ;turn on timer0;

;------------------loop--------

loop:

 mov   p2,#00100001b ; red and green
 cjne  a,#5,$
 clr   a  

 mov   p2,#01000001b; yellow and red
 cjne  a,#2,$
 clr   a

 mov   p2,#10000001b;
 cjne  a,#1,$
 clr   a

 mov  p2,#10000100b;
 cjne a,#5,$
 clr  a

 mov  p2,#10000010b; yellow and red
 cjne a,#2,$ 
 clr  a
 
 mov  p2,#10000001b; red and red
 cjne a,#1,$
 clr  a


;-------interrupçao -------

org 000bh

 inc  r0
 cjne r0,#14,pula
 mov  r0,#0
 inc a

pula:
 clr tf0
 reti


end


