program arraymult
    ! compile with: gfortran -O3 -o f90-arraymult arraymult.f90
    implicit none
    integer :: i, imax
    real*8  :: t, ttot

    ttot = 0.0
    imax = 5
    do i=1,imax
        write(*,'(a,i2,a)') 'Test ', i, ':'
        call test_mult(t)
        ttot = ttot + t
    enddo
    
    write(*,'(a,f12.3,a)') 'Mean total time: ', ttot / real(imax), ' ms'

end program


subroutine test_mult(ttot)
    implicit none

    integer*8 :: c0, r0, m0, c1, r1, m1, c2, r2, m2
    integer   :: i
    real*8    :: ttot
    real*8, dimension(:), allocatable :: x, y, z
    integer, parameter :: sz = 100000000

    call system_clock(c0, r0, m0)
    allocate(x(sz))
    allocate(y(sz))
    allocate(z(sz))
    call system_clock(c2, r2, m2)
    call display_time(c0, r0, m0, c2, r2, m2, '   * Time to allocate', ttot)

    call system_clock(c1, r1, m1)
    do i=1,sz
        x(i) = real(i)
        y(i) = 2.0 * real(i)
    enddo 
    call system_clock(c2, r2, m2)
    call display_time(c1, r1, m1, c2, r2, m2, '   * Time to assign values', ttot)

    call system_clock(c1, r1, m1)
    do i=1,sz
        z(i) = x(i) * y(i)
    enddo 
    call system_clock(c2, r2, m2)
    call display_time(c1, r1, m1, c2, r2, m2, '   * Time to multiply vectors', ttot)
    call display_time(c0, r0, m0, c2, r2, m2, '   * Total time', ttot)
end subroutine


subroutine display_time(c1, r1, m1, c2, r2, m2, msg, telap)
    implicit none

    integer*8       :: c1, r1, m1, c2, r2, m2
    real*8          :: telap
    character*(*)   :: msg

    if (r1 .ne. r2) stop 'Unequal clock rates'
    if (m1 .ne. m2) stop 'Unequal clock max counts'

    if (c1 .lt. c2) then
        telap = real(c2 - c1) / real(r1) * 1000
    else
        telap = real(c2 - c1 + m1) / real(r1) * 1000
    endif

    write(*,'(a,a,f12.4,a)') trim(msg), ': ', telap, ' ms'
    !write(*,*) trim(msg), ': ', telap, ' ms'

end subroutine