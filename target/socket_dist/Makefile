## set the paths for a default setup

all:
	erlc -o ebin src/*.erl;
	erl -pa ebin -name lib_chan_server@127.0.0.1  -setcookie abc
#	erl -pa ebin -pa /home/joq/erlang/lib/ebin -s dbase start

create:
	erlc -o ../ebin_repo src/*.erl

clean:
	rm -rf */*~ *.beam ebin/*.beam *~ *.dump
test:
	erlc -o ebin src/*.erl;
	erl -pa ebin -s resource_cluster_agent_test test  -name resource_cluster_agent@127.0.0.1
