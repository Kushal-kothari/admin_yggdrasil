-module(yggdrasil_api).

-export([yggrequest/1,
        addpeer/2,
        removepeer/2,
        addRoute/3,
        removeRoute/3,
        addSourceSubnet/2,
        removeSourceSubnet/2,
        dhtPing/4,
        getNodeInfo/3]).


-define(SET_OPTS, [local, binary, {packet, 0}, {active,false}]).


getNodeInfo(Request,Key,Coords) ->
            Bin = list_to_binary(Request),
            B_uri = list_to_binary(Key),
            C_uri = list_to_binary(Coords),
            Def = #{<<"request" >>=>Bin, <<"box_pub_key">> =>B_uri, <<"coords">> => C_uri},
            JsonData = jsx:encode(Def),
            {ok, Sock} = gen_tcp:connect({local, "/var/run/yggdrasil.sock"},0, ?SET_OPTS),
            ok = gen_tcp:send(Sock, JsonData),
            case gen_tcp:recv(Sock, 0) of
            {ok, Data} ->
                io:format([Data]),
                gen_tcp:close(Sock);
            {error, closed} ->
                io:format("[getNodeInfo] closed~n", []);
            E ->
                io:format("[getNodeInfo] error ~p~n", [E])
            end.




yggrequest(Request) ->
            Bin = list_to_binary(Request),
            Def = #{<<"request" >>=>Bin, <<"uri">> => <<"foo">>, <<"baz">> => <<"qux">>},
            JsonData = jsx:encode(Def),
            {ok, Sock} = gen_tcp:connect({local, "/var/run/yggdrasil.sock"}, 0,?SET_OPTS),
            ok = gen_tcp:send(Sock, JsonData),
            case gen_tcp:recv(Sock, 0) of
            {ok, Data} ->
                io:format([Data]),
                gen_tcp:close(Sock);
            {error, closed} ->
                io:format("[yggrequest] closed~n", []);
            E ->
                io:format("[yggrequest] error ~p~n", [E])
            end.
 

addpeer(Request,Uri) ->
            Bin = list_to_binary(Request),
            B_uri = list_to_binary(Uri),
            Def = #{<<"request" >>=>Bin, <<"uri">> =>B_uri, <<"baz">> => <<"qux">>},
            JsonData = jsx:encode(Def),
            {ok, Sock} = gen_tcp:connect({local, "/var/run/yggdrasil.sock"}, 0, ?SET_OPTS),
            ok = gen_tcp:send(Sock, JsonData),
            case gen_tcp:recv(Sock, 0) of
            {ok, Data} ->
                io:format([Data]),
                gen_tcp:close(Sock);
            {error, closed} ->
                io:format("[addpeer]   closed~n", []);
            E ->
                io:format("[addpeer]   error ~p~n", [E])
            end.


removepeer(Request,Port) ->
            Bin = list_to_binary(Request),
            B_uri = list_to_binary(Port),
            Def = #{<<"request" >>=>Bin, <<"Port">> =>B_uri, <<"baz">> => <<"qux">>},
            JsonData = jsx:encode(Def),
            {ok, Sock} = gen_tcp:connect({local, "/var/run/yggdrasil.sock"}, 0, ?SET_OPTS),
            ok = gen_tcp:send(Sock, JsonData),
            case gen_tcp:recv(Sock, 0) of
            {ok, Data} ->
                io:format([Data]),
                gen_tcp:close(Sock);
            {error, closed} ->
                io:format("[removepeer]  closed~n", []);
            E ->
                io:format("[removepeer]  error ~p~n", [E])
            end.


addRoute(Request,Snet,Key) ->
            Bin = list_to_binary(Request),
            B_uri = list_to_binary(Snet),
            Bkey = list_to_binary(Key),
            Def = #{<<"request" >>=>Bin, <<"subnet">> =>B_uri, <<"box_pub_key">> => Bkey},
            JsonData = jsx:encode(Def),
            {ok, Sock} = gen_tcp:connect({local, "/var/run/yggdrasil.sock"}, 0, ?SET_OPTS),
            ok = gen_tcp:send(Sock, JsonData),
            case gen_tcp:recv(Sock, 0) of
            {ok, Data} ->
                io:format([Data]),
                gen_tcp:close(Sock);
            {error, closed} ->
                io:format("[addRoute]   closed~n", []);
            E ->
                io:format("[addRoute]   error ~p~n", [E])
            end.


removeRoute(Request,Snet,Key) ->
            Bin = list_to_binary(Request),
            B_uri = list_to_binary(Snet),
            Bkey = list_to_binary(Key),
            Def = #{<<"request" >>=>Bin, <<"subnet">> =>B_uri, <<"box_pub_key">> => Bkey},
            JsonData = jsx:encode(Def),
            {ok, Sock} = gen_tcp:connect({local, "/var/run/yggdrasil.sock"}, 0, ?SET_OPTS),
            ok = gen_tcp:send(Sock, JsonData),
            case gen_tcp:recv(Sock, 0) of
            {ok, Data} ->
                io:format([Data]),
                gen_tcp:close(Sock);
            {error, closed} ->
                io:format("[removeRoute]   closed~n", []);
            E ->
                io:format("[removeRoute]   error ~p~n", [E])
            end.



addSourceSubnet(Request,Subnet) ->
            Bin = list_to_binary(Request),
            B_uri = list_to_binary(Subnet),
            Def = #{<<"request" >>=>Bin, <<"subnet">> =>B_uri, <<"baz">> => <<"qux">>},
            JsonData = jsx:encode(Def),
            {ok, Sock} = gen_tcp:connect({local, "/var/run/yggdrasil.sock"}, 0, ?SET_OPTS),
            ok = gen_tcp:send(Sock, JsonData),
            case gen_tcp:recv(Sock, 0) of
            {ok, Data} ->
                io:format([Data]),
                gen_tcp:close(Sock);
            {error, closed} ->
                io:format("[addSourceSubnet]   closed~n", []);
            E ->
                io:format("[addSourceSubnet]   error ~p~n", [E])
            end.

removeSourceSubnet(Request,Subnet) ->
            Bin = list_to_binary(Request),
            B_uri = list_to_binary(Subnet),
            Def = #{<<"request" >>=>Bin, <<"subnet">> =>B_uri, <<"baz">> => <<"qux">>},
            JsonData = jsx:encode(Def),
            {ok, Sock} = gen_tcp:connect({local, "/var/run/yggdrasil.sock"}, 0, ?SET_OPTS),
            ok = gen_tcp:send(Sock, JsonData),
            case gen_tcp:recv(Sock, 0) of
            {ok, Data} ->
                io:format([Data]),
                gen_tcp:close(Sock);
            {error, closed} ->
                io:format("[removeSourceSubnet]   closed~n", []);
            E ->
                io:format("[removeSourceSubnet]   error ~p~n", [E])
            end.



dhtPing(Request,Key,Coords,Target) ->
            Bin = list_to_binary(Request),
            B_uri = list_to_binary(Key),
            C_uri = list_to_binary(Coords),
            D_uri = list_to_binary(Target),
            Def = #{<<"request" >>=>Bin, <<"box_pub_key">> =>B_uri, <<"coords">> => C_uri,<<"target">> => D_uri},
            JsonData = jsx:encode(Def),
            {ok, Sock} = gen_tcp:connect({local, "/var/run/yggdrasil.sock"}, 0, ?SET_OPTS),
            ok = gen_tcp:send(Sock, JsonData),
            case gen_tcp:recv(Sock, 0) of
            {ok, Data} ->
                io:format([Data]),
                gen_tcp:close(Sock);
            {error, closed} ->
                io:format("[dhtPing]   closed~n", []);
            E ->
                io:format("[dhtPing]   error ~p~n", [E])
            end.
