program p8
  integer :: n = 13
  character(len=1000) :: val = "7316717653133062491922511967442657474235534919&
    4934969835203127745063262395783180169848018694788518438586156078911294949545&
    9501737958331952853208805511125406987471585238630507156932909632952274430435&
    5766896648950445244523161731856403098711121722383113622298934233803081353362&
    7661428280644448664523874930358907296290491560440772390713810515859307960866&
    7017242712188399879790879227492190169972088809377665727333001053367881220235&
    4218097512545405947522435258490771167055601360483958644670632441572215539753&
    6978179778461740649551492908625693219784686224828397224137565705605749026140&
    7972968652414535100474821663704844031998900088952434506585412275886668811642&
    7171479924442928230863465674813919123162824586178664583591245665294765456828&
    4891288314260769004224219022671055626321111109370544217506941658960408071984&
    0385096245544436298123098787992724428490918884580156166097919133875499200524&
    0636899125607176060588611646710940507754100225698315520005593572972571636269&
    561882670428252483600823257530420752963450"
  character(len=32) :: arg
  integer(kind=8) :: max_value = 0
  integer(kind=8) :: current = 1
  integer :: i, j
  if(command_argument_count() .ge. 1) then
    call get_command_argument(1, arg)
    read(arg,*) n
  endif
  if(command_argument_count() .ge. 2) then
    call get_command_argument(2, val)
  endif
  do i = 1, (len_trim(val) - n)
    current = 1
    do j = i, (i + n - 1)
      current = current * (iachar(val(j:j))-48)
    enddo
    max_value = max(max_value, current)
  enddo
  print *,max_value
endprogram
