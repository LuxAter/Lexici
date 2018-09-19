program p2
  integer :: limit = 4000000
  integer :: sum = 0
  integer :: a = 1
  integer :: b = 1
  integer :: c = 2
  character(len=32) :: arg
  if (command_argument_count() .gt. 1) then
    call get_command_argument(1, arg)
    read (arg, *) limit
  end if
  do while (c .lt. limit)
    sum = sum + c
    a = b + c
    b = c + a
    c = a + b
  enddo
  print *, sum
end program p2
