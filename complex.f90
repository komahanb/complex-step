!=====================================================================!
! Program that finds the first derivative of a function using complex 
! step method, finite-differencing and compares it with exact value.
!---------------------------------------------------------------------!
! Example:
!---------------------------------------------------------------------!
! Let f(u) = sin(u) then f'(u) = imag(f(u))/h
!
! where "h" is simply a step size. The precision of the derivative is 
! EQUAL to the exponent of the step size. 
! 
! Since we know the  analytical  derivative of sin(u) to be cos(u), we
! can see the number of significant digits the derivatives would 
! agree to.
!=====================================================================!
program complex_step

  use scalar_class

  implicit none

  real(8)               :: h    !   step size
  type(scalar)          :: u    !   define a complex number

  ! define step size
  h = 1.0d-12

  ! the imaginary part is not specified it is set to zero
  u = scalar(real_part=2.0d0, imag_part=h) 

  write(*,*) " Step size h = ", h

#if defined USE_COMPLEX
  write(*,'(2x,a,25x,a,15x,a)') "Exact", "Complex step", "Error"
  print*, cos(real(u%x)), imag(sin(u%x))/h, cos(real(u%x))- imag(sin(u%x))/h
#else
  write(*,'(2x,a,25x,a,15x,a)') "Exact", "Finite diff ", "Error"
  print*, cos(u%x), (sin(u%x+h)-sin(u%x))/h, cos(u%x)-(sin(u%x+h)-sin(u%x))/h
#endif

end program complex_step

!  write(*,*), "exact f'(x)", "                complex step", &
!       &"             finite difference"

