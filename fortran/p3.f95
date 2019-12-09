program p3
  integer(kind=8) :: n = 600851475143_8
  integer(kind=8) :: last_factor = 1
  integer(kind=8) :: factor = 3
  integer(kind=8) :: max_factor = 0
  character(len=32) :: arg
  if (command_argument_count() .gt. 1) then
    call get_command_argument(1, arg)
    read(arg,*) n
  endif
  if (mod(n, 2) .eq. 0) then
    last_factor = 2
    n = n / 2
    do while (mod(n, 2) .eq. 0)
      n = n / 2
    enddo
  endif
  max_factor = int(sqrt(real(n)))
  do while (n .gt. 1 .and. factor .le. max_factor)
    if (mod(n, factor) .eq. 0) then
      n = n / factor
      last_factor = factor
      do while (mod(n, factor) .eq. 0)
        n = n / factor
      enddo
      max_factor = int(sqrt(real(n)))
    endif
    factor = factor + 2
  enddo
  if (n .ne. 1) then
    last_factor = n
  endif
  print *,last_factor
end program p3
