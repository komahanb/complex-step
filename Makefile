default:
	gfortran -cpp -c scalar_class.f90  complex.f90 
	gfortran -cpp scalar_class.o complex.o

complex:
	gfortran -cpp -DUSE_COMPLEX -c scalar_class.f90  complex.f90 
	gfortran -cpp -DUSE_COMPLEX scalar_class.o complex.o

clean:
	rm *.o *.mod
