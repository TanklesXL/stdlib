-module(int_test).
-compile(no_auto_import).

-export([to_string/0, parse/0, to_base_string/0]).

to_string() ->
    expect:equal(int:to_string(123), <<"123">>),
    expect:equal(int:to_string(-123), <<"-123">>),
    expect:equal(int:to_string(123), <<"123">>).

parse() ->
    expect:equal(int:parse(<<"123">>), {ok, 123}),
    expect:equal(int:parse(<<"-123">>), {ok, -123}),
    expect:equal(int:parse(<<"0123">>), {ok, 123}),
    expect:is_error(int:parse(<<"">>)),
    expect:is_error(int:parse(<<"what">>)),
    expect:is_error(int:parse(<<"1.23">>)).

to_base_string() ->
    expect:equal(int:to_base_string(100, 16), <<"64">>),
    expect:equal(int:to_base_string(-100, 16), <<"-64">>).
