program p9
  integer :: sum = 1000
  integer :: prod = 0
  character(len=32) :: arg
  integer :: a, b, c
  if(command_argument_count() .ge. 1) then
    call get_command_argument(1, arg)
    read(arg,*) sum
  endif
  do a = 3, (sum-3)/3
    do b = (a+1), (sum-1-a)/2
      c = sum - a - b
      if(c*c .eq. a*a+b*b) then
        prod = a*b*c
        exit
      endif
    enddo
    if (prod .ne. 0) then
      exit
    endif
  enddo
  print *,prod
endprogram
