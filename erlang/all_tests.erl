-module(all_tests).
-export([test/0]).

test() ->
    lists:foreach(
        fun(Mod) -> 
            eunit:test(list_to_atom(string:concat(Mod, "_tests")), [verbose])
        end,
        ["binary_search"]).
