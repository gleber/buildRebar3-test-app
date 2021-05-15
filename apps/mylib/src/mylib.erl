-module(mylib).

-compile([{parse_transform, lager_transform}]).

-export([val/1]).

val(X) ->
    lager:error("test ~p", [foo]),
    X ++ "!!!".
