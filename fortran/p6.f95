program p6
  integer :: limit = 100
  integer :: sum = 0
  integer :: sum_sq = 0
  integer :: diff = 0
  character(len=32) :: arg
  if (command_argument_count() .ge. 1) then
    call get_command_argument(1, arg)
    read(arg,*) limit
  endif
  sum = limit * (limit + 1) / 2
  sum_sq = (2 * limit + 1) * (limit + 1) * limit / 6
  diff = sum**2 - sum_sq
  print *,diff
endprogram
