-module(n2o_cowboy2).
-compile(export_all).

init(Req, Opts) -> {cowboy_websocket, Req, Req}.

ws({ok,R,S})                 -> {ok,S};
ws({shutdown,R,S})           -> {shutdown,S};
ws({reply,{binary,Rep},R,S}) -> {reply,{binary,Rep},S};
ws({reply,{json,Rep},R,S})   -> {reply,{binary,n2o_json:encode(Rep)},S};
ws({reply,{bert,Rep},R,S})   -> {reply,{binary,n2o_bert:encode(Rep)},S};
ws({reply,{text,Rep},R,S})   -> {reply,{text,Rep},S};
ws({reply,{default,Rep},R,S})-> {reply,{binary,n2o:encode(Rep)},S};
ws({reply,{Encoder,Rep},R,S})-> {reply,{binary,Encoder:encode(Rep)},S};
ws(X) -> io:format("UNKNOWN: ~p~n",[X]), {shutdown,[]}.

websocket_init(S)            -> ws(n2o_proto:init([],S,[],ws)).
websocket_handle(D,S)        -> ws(n2o_proto:stream(D,[],S)).
websocket_info(D,S)          -> ws(n2o_proto:info(D,[],S)).

points() -> cowboy_router:compile([{'_', [
	    {"/ws/[...]", n2o_cowboy2, []},
            {"/n2o/[...]", cowboy_static, {priv_dir, n2o, []}},
	    {"/app/[...]", cowboy_static, {dir, "priv/static", []}} ]}]).
