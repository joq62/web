%% ---
%%  Excerpted from "Programming Erlang, Second Edition",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/jaerlang2 for more book information.
%%---
-module(lib_chan_test).

-compile(export_all).

-import(lib_chan, [connect/5, rpc/4, disconnect/1]).

start_server() ->
    lib_chan:start_server(),
  %  wait().
   ok.
wait() ->
    receive
	_Any ->
	    wait()
    end.

