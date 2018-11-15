-module(n2o_heart).
-description('N2O Heartbeat Protocol').
-export([info/3]).

info({text,<<"PING">> = _Ping}=Message, Req, State) ->
    n2o:info(?MODULE,"PING: ~p",[Message]),
    {reply, {text, <<"PONG">>}, Req, State};

info({text,<<>>}=Message, Req, State) ->
    n2o:info(?MODULE,"PING: ~p",[Message]),
    {reply, {text, <<>>}, Req, State};

info({text,<<"N2O,",Process/binary>> = _InitMarker}=Message, Req, State) ->
    n2o:info(?MODULE,"N2O INIT: ~p",[Message]),
    n2o_proto:push({init,Process},Req,State,n2o_proto:protocols(),[]);

info(Message, Req, State) -> {unknown,Message, Req, State}.
