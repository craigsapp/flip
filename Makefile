
BASE = flip

all: gpp

gpp:
	g++ -ansi -O3 -o $(BASE) $(BASE).cpp && strip $(BASE)

# "make install" needs to be done as super user:
install:
	@if [ -r /usr/local/bin ]; 			\
	then 						\
		echo "installing in /usr/local/bin";	\
		cp ./flip /usr/local/bin;		\
	else						\
		echo "installing in /usr/bin";		\
		cp ./flip /usr/bin;			\
	fi
	
clean:
	rm -f ./flip

