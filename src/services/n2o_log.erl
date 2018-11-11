-module(n2o_log).
-export([log_modules/0, log_level/0, level/1, log/4]).

logger()       -> application:get_env(?MODULE,logger,n2o_io).
log_modules()  -> application:get_env(?MODULE,log_modules,[]).
log_level()    -> application:get_env(?MODULE,log_level,info).

level(none)    -> 3;
level(error)   -> 2;
level(warning) -> 1;
level(_)       -> 0.

log(M,F,A,Fun) ->
    case level(Fun) < level(log_level()) of
         true  -> skip;
         false -> case    log_modules() of
             any       -> (logger()):Fun(M,F,A);
             []        -> skip;
             Allowed   -> case lists:member(M, Allowed) of
                 true  -> (logger()):Fun(M,F,A);
                 false -> skip end end end.
