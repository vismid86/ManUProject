all:
	@echo "test target started: " | tee testmake.log
	gcc -c hello.c -o hello.bin 2>&1 | tee -a testmake.log
	@echo "Myriota test target stopped: " | tee -a testmake.log

clean:
	rm *.o 
