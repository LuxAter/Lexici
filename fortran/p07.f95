program p7
  integer :: limit = 10001
  integer :: count = 1
  integer :: val = 1
  character(len=32) :: arg
  if(command_argument_count() .ge. 2) then
    call get_command_argument(1, arg)
    read(arg,*) limit
  endif
  do while (count .lt. limit)
    val = val + 2
    if (is_prime(val)) then
      count = count + 1
    endif
  enddo
  print *,val

  contains

  logical function is_prime(n) result(ret)
    integer, intent(in) :: n
    integer :: r = 0
    integer :: f = 5
    if (n .eq. 1) then
      ret = .false.
    elseif (n .lt. 4) then
      ret = .true.
    elseif (mod(n, 2) .eq. 0) then
      ret = .false.
    elseif (n .lt. 9) then
      ret = .true.
    elseif (mod(n, 3) .eq. 0) then
      ret = .false.
    else
      r = int(sqrt(real(n)))
      f = 5
      do while (f .le. r)
        if(mod(n, f) .eq. 0) then
          ret = .false.
          return
        elseif (mod(n, f+2) .eq. 0) then
          ret = .false.
          return
        endif
        f = f + 6
      enddo
      ret = .true.
    endif
  endfunction
endprogram
