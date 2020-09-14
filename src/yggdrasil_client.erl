-module(yggdrasil_client).

-export([start/0,stop/0]).
%% ====================================================================
%% %% API exports
%% ====================================================================
-export([yggrequest/1,
        addpeer/2,
        removepeer/2,
        addRoute/3,
        removeRoute/3,
        addSourceSubnet/2,
        removeSourceSubnet/2,
        dhtPing/4,
        getNodeInfo/3]).




%% ====================================================================
%% Public functions
% ====================================================================
start() ->
    yggdrasil_server:start_link().

stop() ->
    yggdrasil_server:stop().

yggrequest(Request) ->
    yggdrasil_server:yggrequest(Request).

getNodeInfo(Request,Key,Coords) ->
    yggdrasil_server:getNodeInfo(Request,Key,Coords).

addpeer(Request,Uri) ->
    yggdrasil_server:addpeer(Request,Uri).

removepeer(Request,Port) ->
    yggdrasil_server:removepeer(Request,Port).

addRoute(Request,Snet,Key) ->
    yggdrasil_server:addRoute(Request,Snet,Key).

removeRoute(Request,Snet,Key) ->
    yggdrasil_server:removeRoute(Request,Snet,Key).

addSourceSubnet(Request,Subnet) ->
    yggdrasil_server:addSourceSubnet(Request,Subnet).

removeSourceSubnet(Request,Subnet) ->
    yggdrasil_server:removeSourceSubnet(Request,Subnet).

dhtPing(Request,Key,Coords,Target) ->
    yggdrasil_server:dhtPing(Request,Key,Coords,Target).
