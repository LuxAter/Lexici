program p14
  integer(kind=8) :: chain_length = 1
  integer(kind=8) :: maximum = 1000000, longest = 0, num = 0
  integer(kind=8) :: i
  character(len=32) :: arg

  if (command_argument_count() .ge. 1) then
     call get_command_argument(1, arg)
     read (arg, *) maximum 
  endif

  do i=1,maximum 
    chain_length = count_chain(i)
    if (chain_length .gt. longest) then
      longest = chain_length
      num = i
    endif
  enddo

  print *, num

  contains

  integer(kind=8) recursive function count_chain(n) result(ret)
    integer(kind=8), intent(in) :: n
    if (n .eq. 1) then
      ret = 1
      return
    endif
    if (mod(n, 2) .eq. 0) then
      ret = 1 + count_chain(n / 2)
      return
    else
      ret = 2 + count_chain((3 * n + 1) / 2)
      return 
    endif
  end function count_chain

end program p14
