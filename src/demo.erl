-module(demo).
-export([run/0]).

%% Exercises:
%%
%% 1. spawn a process that executes the demo:run() function
%%
%% 2. send it messages
%%
%% 3. extend the receive block so it handles a 'crash' message and in turn
%%    crashes its process (Hint: you can provoke an exeception for example
%%    by deviding soemthing by zero)
%%
%% 4. Send 'crash' to the process and check it with is_process_alive(Pid)
%%
%% 5. What happens when you still send it messages with !
%%
%% 6. Start a new process with spawn_link. What happens when you crash the
%%    shell process (Hint: Entering 1/0 crashes the current evaluation loop
%%    and respawns a fresh one).
%%
%% 7. Add process_flag(trap_exit, true) to the top of the demo:run/0 function.
%%    What happens now when you crash the shell after starting the process with
%%    spawn_link?
%%
%% 8. Again, start the process with spawn_link from the console shell. Also
%%    start a remote shell (./bin/remsh) in a different window. What is
%%    different when you send messages to the process via the remote shell?
%%    What happens if you crash the remote shell? (Hint: You can construct
%%    Pids with the pid/3 function, e.g. pid(0,194,0) -> <0.194.0>)

run() ->
    receive
        quit ->
            io:format("Bye, bye...~n", []);
        Msg ->
            io:format("~p received ~p~n", [self(), Msg]),
            ?MODULE:run()
    end.
