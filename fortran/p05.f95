program p5
  integer :: k = 20
  integer :: multiple = 1
  integer :: i = 0
  logical :: check = .true.
  integer :: limit = 0
  integer, dimension(50) :: a
  integer, dimension(50) :: p = (/ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37,&
                                 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83,&
                                 89, 97, 101, 103, 107, 109, 113, 127, 131,&
                                 137, 139, 149, 151, 157, 163, 167, 173, 179,&
                                 181, 191, 193, 197, 199, 211, 223, 227, 229 /)
  character(len=31) :: arg
  if(command_argument_count() .ge. 1) then
    call get_command_argument(1, arg)
    read(arg,*) k
  endif
  limit = int(sqrt(real(k)))
  do while(p(i) .le. k)
    a(i) = 1
    if(check) then
      if(p(i) .le. limit) then
        a(i) = int(log(real(k)) / log(real(p(i))))
      else
        check = .false.
      endif
    endif
    multiple = multiple * p(i)**a(i)
    i = i + 1
  enddo
  print *,multiple
endprogram
