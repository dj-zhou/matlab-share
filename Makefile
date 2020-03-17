# makefile for Dingjiang use
CC=/usr/local/MATLAB/R2019a/bin/mex
all:
	cd time && $(CC) Get_Unix_Time.c -lm
	cd time && $(CC) Get_Unix_Time_Bias_ms.c -lm
clean:
	cd time && rm -f *.o *.mexa64 *.mexglx *.mexmaci64
