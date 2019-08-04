program p12
  integer :: req_count = 500
  integer :: p = 1
  logical :: is_prime = .true.
  integer, dimension(:), allocatable :: primes

  integer :: n = 3, n1 = 3, dn = 2, dn1 = 2
  integer :: expon = 0
  integer :: cnt = 0

  character(len=32) :: arg
  if (command_argument_count() .ge. 1) then
     call get_command_argument(1, arg)
     read (arg, *) req_count
  endif
  allocate(primes(req_count*2))
  primes(0) = 2
  do i=3,(req_count*2)
    is_prime = .true.
    do j=0,(p-1)
      if (mod(i,primes(j)) .eq. 0) then
        is_prime = .false.
        exit
      endif
    enddo
    if (is_prime .eqv. .true.) then
      primes(p) = i
      p = p + 1
    endif
  enddo
  
  do while (cnt .le. req_count)
    n = n + 1
    n1 = n
    if (mod(n1, 2) .eq. 0) then
      n1 = n1 / 2
    endif
    dn1 = 1
    do i=0,(p-1)
      if((primes(i)*primes(i)) .gt. n1) then
        dn1 = dn1 * 2
        exit
      endif
      expon = 1
      do while (mod(n1, primes(i)) .eq. 0)
        expon = expon + 1
        n1 = n1 / primes(i)
      enddo
      if (expon .gt. 1) then
        dn1 = dn1 * expon 
      endif
      if (n1 .eq. 1) then
        exit
      endif
    enddo
    cnt = dn * dn1
    dn = dn1
  enddo

  print *, (n * (n-1) / 2)

end program p12
