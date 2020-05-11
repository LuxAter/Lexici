
program p4
  implicit none
  integer :: count = 3
  integer :: tmp = 3
  integer :: max = 0
  integer :: a = 0
  integer :: largest = 0
  integer :: b = 0
  integer :: db = 0
  character(len=32) :: arg
  if(command_argument_count() .ge. 1) then
    call get_command_argument(1, arg)
    read(arg,*) count
  endif
  tmp = count
  do while(tmp .gt. 0)
    max = (max * 10) + 9
    tmp = tmp - 1
  enddo
  a = max
  largest = 0
  do while (a .ge. (10*count))
    if(mod(a,11) .eq. 0) then
      b = max
      db = 1
    else
      b = 11 * (max / 11)
      db = 11
    endif
    do while(b .ge. a)
      if(a*b .le. largest) then
        exit
      elseif (is_palindrome(a*b)) then
        largest = a * b
      endif
      b = b - db
    enddo
    a = a - 1
  enddo

  print *,largest

  contains

  integer function reverse_integer(n) result(reversed)
    integer, intent(in) :: n
    integer :: val = 0
    val = n
    reversed = 0
    do while (val .gt. 0)
      reversed = (10 * reversed) + mod(val, 10)
      val = val / 10
    enddo
  endfunction

  logical function is_palindrome(n) result(tf)
    integer, intent(in) :: n
    tf = n .eq. reverse_integer(n)
  endfunction
end program p4
