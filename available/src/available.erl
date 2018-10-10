-module(available).

%% API exports
-export([ work/0 ]).

%%====================================================================
%% API functions
%%====================================================================

work() ->
        monitor_me(),
        doStuff(1).

%%====================================================================
%% Internal functions
%%====================================================================

doStuff(N) ->
       doStuff(N+1).

standby() ->
        receive
             {'DOWN', _Ref, process, _OnlineProc, _Reason} ->
                work()
        end.

monitor_me() ->
        S = self(),
        F = fun () ->
                monitor(process, S),
                standby()
         end,
        spawn(F).
