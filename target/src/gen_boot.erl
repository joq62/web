%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : 
%%%
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(gen_boot).



%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
%%  -include("").
%% --------------------------------------------------------------------
%% External exports

-export([start/1,
	stop/0]).

%% ====================================================================
%% External functions
%% ====================================================================
start([])->
    'empty_applications_list';
start(ConfigFile)->
    {ok,[L]}=file:consult(ConfigFile),
    io:format("L  ~p~n",[L]),    
    StartedApplications=start(L,[]),
    io:format("Started ~p~n",[StartedApplications]),
    StartedApplications.
start([],StartedApplications)->
    StartedApplications;
start([App|T],StartedApplications)->
  %  M=list_to_atom(App),
    io:format("Loading ~p~n",[application:load(App)]),
    io:format("Starting ~p~n",[application:start(App)]),
    start(T,[App|StartedApplications]).
    
    
stop()->
    erlang:exit(kill_from_user).
