let portkat 6
let portodl 9
:poczatek
let kat 0
let katM 0
let run 1
let lewo 20
let lewo3 6
let prawo3 48
let prawo 34
let prosto1 36
let prosto2 45
let prosto3 54 
let stop 27
let pod 1
let czas 20
let przeszkoda 0
let if 1
let lewowolnekat 0
let prawowolnekat 0
let obst 0
let styk 0
let popprawo 0
let poplewo 0
let odl 1000
let przejscia 1


call :obrotM2 

:jazda
set 1 prosto3
set 2 20
while run :przeszkoda
wait czas
	get 3 przeszkoda
	get 1 styk
	get portkat katM
	get portodl odl
	goifminus :koncowka ( odl - 5 )
	goifplus :idprzeszkoda przeszkoda
	goifplus :idprzeszkodau styk
	goifminus :tu ( 60 - katM )
	goifplus :korektakatlewo ( katM - 20 )
	:tu
	goifminus :korektakatprawo ( 120 - katM - 20 )
	set 1 prosto3
	:wroc
:przeszkoda
:koncowka
write "tu jestem "
get 4 kat
get portkat katM
goifzero :jazda1 ( kat - katM )
goifplus :lewo1 ( 60 - katM )
goifminus :prawo1 (60 - katM )
:lewo1 
set 1 lewo 
while katM :obrlewo1
	get portkat katM 
	write "i tu "
:obrlewo1
goto :jazda1
:prawo1 
set 1 prawo 
while katM :obrprawo1 
	get portkat katM 
	write "teraz tu "
:obrprawo1
goto :jazda1

:jazda1
set 1 prosto1
let idz 1
let odl 1
while idz :dokonca
let popodl odl
get portodl odl
goifminus :powrot ( odl - popodl )
:dokonca

set 1 27
let przejscia 0
goto :powrot
:koniec1
let idz 0
return

stop

:obrotM2
get 4 kat
get portkat katM
goifzero :jazda ( kat - katM )
goifplus :lewo ( 60 - katM )
goifminus :prawo (60 - katM )


:lewo 
set 1 lewo 
while katM :obrlewo 
	get portkat katM
:obrlewo
goto :jazda
:prawo 
set 1 prawo 
while katM :obrprawo 
	get portkat katM 
:obrprawo
goto :jazda



:idprzeszkoda
get 4 kat
get portkat katM
set 2 40 
set 1 lewo3
let if 1
while if :lewoprz1
	get 3 if
:lewoprz1
get 4 lewowolnekat
set 1 prawo3
wait 5
let if 1
while if :prawoprz1
	get 3 if
:prawoprz1
get 4 prawowolnekat
let if 1
let czylewo ( lewowolnekat - kat )
let czyprawo ( kat - prawowolnekat )
while if :decyzja
	goifminus :lewoprz2 czylewo
	goifminus :prawoprz2 czyprawo
	let czylewo ( czylewo - 1 )
	let czyprawo ( czyprawo - 1 )	
:decyzja
goto :koniec
:lewoprz2
let poplewo 1
let popprawo 0
set 1 lewo3
let if ( lewowolnekat - kat )
while if :dolewaszybko
get 4 kat
goifminus :powoli ( lewowolnekat - kat - 4 )
:dolewaszybko
:powoli
set 1 lewo
let if 1
while if :dolewa
	get 4 kat
	let if ( lewowolnekat - kat )
:dolewa
goto :jazda
:prawoprz2
let popprawo 1
let poplewo 0
goto :jazda

:idprzeszkodau
write "przeszkoda "
goifplus :lewoprz3 poplewo
goifplus :prawoprz3 popprawo

:lewoprz3
write " w lewo "
set 1 lewo
wait 170
set 1 prosto3
wait 100
goto :obrotM2

:prawoprz3 
write " w prawo"
set 1 prawo
wait 170
set 1 prosto3
wait 100
goto :obrotM2

:korektakatlewo
set 1 lewo
while katM :kor1
get portkat katM
:kor1
set 1 stop
get portodl odl
goto :wroc

:korektakatprawo
set 1 prawo 
while katM :kor2
get portkat katM
:kor2
set 1 stop
goto :wroc

:powrot
while przejscia :wraca
freemem
let portkat 5
let portodl 8
goto :poczatek

:wraca
stop