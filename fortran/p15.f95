program p15
  integer :: grid = 20
  real :: res = 1.0
  character(len=32) :: arg

  if (command_argument_count() .ge. 1) then
     call get_command_argument(1, arg)
     read (arg, *) grid 
  endif

  do i=(grid*2),(grid+1),-1
    res = res * (i/real(i-grid))
  enddo
  print *, int8(res)

end program p15
