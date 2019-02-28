## set the paths for a default setup

all:
	erlc -o ebin src/*.erl */src/*.erl;
	erl -pa ebin -name telldus_hw_controller -run gen_boot start ebin/boot.config 

create: 
	erlc -o ebin src/*.erl socket_dist/src/*.erl;
	cp src/*.app ebin;
	cp dbase/src/*.app ebin

clean:
	rm -rf */*~ *.beam ebin/*.beam src/*.beam *~ *.dump
test:
	erlc -o ebin src/*.erl;
	erl -pa ebin -s service_agent_test test  -name service_agent@127.0.0.1
