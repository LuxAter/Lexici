! Why can I not return an integer?
real function SumDivisible(n, max)
  integer, intent(in) :: n ! input
  integer, intent(in) :: max ! input
  integer :: p
  p = max / n
  p = n * (p * (p + 1)) / 2
  SumDivisible = p
end function SumDivisible

program p1
  integer :: max = 999
  integer :: sum
  character(len=32) :: arg
  if (command_argument_count() .ge. 1) then
    call get_command_argument(1, arg)
    read(arg,*) max
  end if
  sum = int(SumDivisible(3, max) + SumDivisible(5, max) - SumDivisible(15, max))
  print *, sum
end program p1
