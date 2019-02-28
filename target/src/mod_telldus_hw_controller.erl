%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : 
%%%    Interface to resource_master
%%%    connect(ClusterId) => reosurce_master
%%%    board_inventory() 
%%% The master have understanding of the complete network 
%%% Data structures: Boards
%%% board={compute|storage|hw_control, clusterId,localIPaddr}.
%%% compute: CPU/mem/ num_vms
%%% storage: capacity,redundancy
%%% hw_control: type of hw, tellstick, temp, , ....
%%% DataStructures: Cluster
%%% cluster:{name,IPaddr, Port}
%%% 
%%% Created :
%%% ------------------------------------------------------------------

-module(mod_telldus_hw_controller).
-export([run/3]).
run(MM, _ArgC, _ArgS) ->
 %   io:format("starting ~p~n",[?MODULE]),    
  %  io:format("ArgC = ~p  ArgS=~p~n",[ArgC, ArgS]),
    loop(MM).
loop(MM) ->
    receive
	{chan, MM, {restart}} ->
	    io:format("~p~n",[{?MODULE,?LINE,restart}]),   
	    MM ! {send,telldus_hw_controller:restart()}, 
	    loop(MM);
	{chan, MM, {set_state,Cmd}} ->
	    io:format("~p~n",[{?MODULE,?LINE,set_state,Cmd}]),    
	    MM ! {send,telldus_hw_controller:set_state(Cmd)}, 
	    loop(MM);
	{chan, MM, {get_all_info}} ->
	    io:format("~p~n",[{?MODULE,?LINE,get_all_info}]),   
	    MM ! {send,telldus_hw_controller:get_all_info()}, 
	    loop(MM);
	{chan, MM,X}->
	    io:format("unmatched signal~p~n",[{?MODULE,?LINE,X}]), 
	    MM ! {send, {unmatched_signal,X}},
	    loop(MM);
	{chan_closed, MM} ->
%	    io:format("stopped ~p~n",[?MODULE]),  
	    exit(normal)
    end.


    
    
