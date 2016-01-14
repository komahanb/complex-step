!=====================================================================!
! Program that finds the first derivative of a function using complex 
! step method, finite-differencing and compares it with exact value.
!---------------------------------------------------------------------!
! Example:
!---------------------------------------------------------------------!
! Let f(z) = f(x+iy) = sin(z) then f'(x) = imag(f(x+ih))
!
! where "h" is simply a step size. The precision of the derivative is 
! EQUAL to the exponent of the step size. 
! 
! Since we know the  analytical  derivative of sin(x) to be cos(x), we
! can see the number of significant digits the derivatives would 
! agree to.
!=====================================================================!
program complex_step

  use scalar_class

  implicit none

  !-------------------------------------------------------------------!
  !  Define constants to manage precision [TUNABLE]
  !-------------------------------------------------------------------!

  integer, parameter      :: sp = kind(0.0)  ! single precision
  integer(sp), parameter  :: dp = kind(0.0d0)! double precision

  !-------------------------------------------------------------------!
  ! define a custom type to handle both real and complex numbers
  !-------------------------------------------------------------------!

  !-------------------------------------------------------------------!
  !  Problem parameters
  !-------------------------------------------------------------------!

  real(8)               :: x, h         ! real, imag, step size
  type(scalar)          :: z               ! define a complex number

  ! define step size
  h = 1.0e-12_dp

  ! what is the real component
  x = 2.0_dp     

  !make a complex number with real and perturbed imaginary part
  z = scalar(x, h) 

  write(*,*), "exact f'(x)", "                complex step", &
       &"             finite difference"
  print*, cos(x), imag(sin(z%x))/h, (sin(x+h)-sin(x))/h

end program complex_step
