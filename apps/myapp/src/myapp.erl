-module(myapp).

-export([main/1]).

main(_) ->
  io:format("test ~p", [mylib:val("foo")]).
