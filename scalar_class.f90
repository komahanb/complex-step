module scalar_class

  ! interface for scalar data type
  interface scalar
     module procedure complex_scalar
  end interface scalar

  type scalar

#if defined USE_COMPLEX  
     complex(8) :: x = dcmplx(0.0d0, 0.0d0)
#else
     real(8) :: x = 0.0d0
#endif

   contains

     
     
  end type scalar

contains

  !===================================================================!
  ! Overloaded function that can set real and imaginary parts into a 
  ! SCALAR datatype
  !===================================================================!

  function complex_scalar(real_part, imag_part) result(this)

    real(8) :: real_part
    real(8), optional :: imag_part
    type(scalar) :: this

#if defined USE_COMPLEX   
    !  compiled in complex mode
    if (present(imag_part)) then 
       this%x = dcmplx(real_part, imag_part)
    else
       this%x = dcmplx(real_part, 0.0d0)
    end if
#else 
    !   compiled in real mode
    this%x = real_part
#endif

  end function complex_scalar

end module scalar_class
