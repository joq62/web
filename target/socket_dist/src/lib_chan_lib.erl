%% ---
%%  Excerpted from "Programming Erlang, Second Edition",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/jaerlang2 for more book information.
%%---

%%      close

-module(lib_chan_lib).
%% TCP Middle man
%%   Models the interface to gen_tcp

-export([call/5,cast/5]).

call(IpAddr,Port,Application,PassWd,Msg)->
    case lib_chan:connect(IpAddr,Port,Application,PassWd,{yes,go}) of
	{ok,S} ->
	    Result=lib_chan:rpc(S,Msg),
	    lib_chan:disconnect(S),
	    Reply={ok,Result};
	Err ->
	     io:format("~p~n",[{?MODULE,?LINE,time(),Err, IpAddr,Port,Application,PassWd}]),  
	    Reply={error,Err} 
    end,
    Reply.

cast(IpAddr,Port,Application,PassWd,Msg)->
    case lib_chan:connect(IpAddr,Port,Application,PassWd,{yes,go}) of
	{ok,S} ->
	    lib_chan:rpc(S,Msg),
	    lib_chan:disconnect(S);
	Err ->
	    error
    end.
