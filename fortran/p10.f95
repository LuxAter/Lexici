program p10
  integer(kind=8) :: limit = 2000000
  integer(kind=8) :: cross_limit = 0
  integer(kind=8) :: n, m
  integer(kind=8) :: sum = 0
  logical, dimension(2000000) :: sieve
  character(len=32) :: arg
  if(command_argument_count() .ge. 1) then
    call get_command_argument(1, arg)
    read(arg,*) limit
  endif
  cross_limit = int(sqrt(real(limit)))
  do n = 4, limit, 2
    sieve(n) = .true.
  enddo
  do n = 3, cross_limit, 2
    if (.not. sieve(n)) then
      do m = n * n, limit, (2 * n)
        sieve(m) = .true.
      enddo
    endif
  enddo
  do n = 2, limit
    if (.not. sieve(n)) then
      sum = sum + n
    endif
  enddo
  print *,sum
endprogram
