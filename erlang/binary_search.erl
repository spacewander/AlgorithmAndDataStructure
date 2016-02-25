-module(binary_search).
-export([lower_bound/2, upper_bound/2, binary_search/2, equal_range/2]).

lower_bound(Seq, Value) ->
    binary_compare_in_seq(Seq, 1, 
                          fun(Target, Current) -> Target =< Current end,
                          Value).

upper_bound(Seq, Value) ->
    binary_compare_in_seq(Seq, 1, 
                          fun(Target, Current) -> Target < Current end,
                          Value).

binary_compare_in_seq(Seq, Start, CP, Value) ->
    Mid = round(length(Seq)/2),
    if
        Mid < 1 -> Start;
        true -> 
            case CP(Value, lists:nth(Mid, Seq)) of
                true -> binary_compare_in_seq(
                          lists:sublist(Seq, Mid-1), Start, CP, Value);
                false -> binary_compare_in_seq(
                        lists:sublist(
                          Seq, Mid+1, length(Seq)-Mid), Start+Mid, CP, Value)
            end
    end.

binary_search(Seq, Value) ->
    Idx = lower_bound(Seq, Value),
    (Idx =/= length(Seq)+1) andalso (lists:nth(Idx, Seq) =:= Value).

equal_range(Seq, Value) ->
    {lower_bound(Seq, Value), upper_bound(Seq, Value)}.
