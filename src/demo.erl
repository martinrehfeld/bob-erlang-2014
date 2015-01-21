-module(demo).
-export([run/0]).

run() ->
    receive
        quit ->
            io:format("Bye, bye...~n", []);
        Msg ->
            io:format("~p received ~p~n", [self(), Msg]),
            ?MODULE:run()
    end.
