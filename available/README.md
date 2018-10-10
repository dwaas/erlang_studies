available
=====

Simple highly available process

Build
-----

    $ rebar3 compile

Test it
-------
From the erlang shell

```
c(available).

Pid = spawn(fun () -> available:work() end).

% inspect processes
i().

exit(Pid, "kill").

% inspect processes again to see that previous process in standby is
% currently working and spawned another process in standby
i().
```
