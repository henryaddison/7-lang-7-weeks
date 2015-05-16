-module(logserver).
-behaviour(gen_server).

-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-export([start_link/0, log/2]).

start_link() -> 
  gen_server:start_link(?MODULE, [], []).

log(Pid, Message) -> 
  gen_server:cast(Pid, {log, Message}).

init(State) ->
  {ok, State}.

handle_cast({log, Message}, State) ->
  io:format("Log: ~s~n", [Message]),
  ok = file:write_file("server.log", Message, [append]),
  ok = file:write_file("server.log", "~n", [append]),
  {noreply, State}.

handle_call(_, _, State) ->
  {noreply, State}.

handle_info(Msg, State) ->
  io:format("Unexpected message: ~p~n",[Msg]),
  {noreply, State}.

terminate(normal, _) ->
  ok.

code_change(_OldVsn, State, _Extra) ->
  %% No change planned. The function is there for the behaviour,
  %% but will not be used. Only a version on the next
  {ok, State}.
