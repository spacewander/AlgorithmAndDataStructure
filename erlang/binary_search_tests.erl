-module(binary_search_tests).
-include_lib("eunit/include/eunit.hrl").
-import(binary_search, 
        [lower_bound/2, upper_bound/2, binary_search/2, equal_range/2]).
-define(ARY, [1, 2, 3, 4]).

% find the index of first element which is not lower than given value
lower_bound_test() ->
    ?assert(lower_bound(?ARY, 3) =:= 3),
    ?assert(lower_bound(?ARY, 2.5) =:= 3),
    ?assert(lower_bound(?ARY, 1) =:= 1),
    ?assert(lower_bound(?ARY, 5) =:= length(?ARY)+1).

% find the index of first element which is upper than given value
upper_bound_test() ->
    ?assert(upper_bound(?ARY, 3) =:= 4),
    ?assert(upper_bound(?ARY, 2.5) =:= 3),
    ?assert(upper_bound(?ARY, 3) =:= 4).

binary_search_test() ->
    ?assert(binary_search(?ARY, 3)),
    ?assert(not binary_search(?ARY, 0)),
    ?assert(not binary_search(?ARY, 5)).

equal_range_test() ->
    ?assert(equal_range(?ARY, 3) =:= {3, 4}),
    ?assert(equal_range(?ARY, 2.5) =:= {3, 3}).
