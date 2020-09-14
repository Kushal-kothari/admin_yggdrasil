-module(yggdrasil_server).

-behaviour(gen_server).

-export([start_link/0,stop/0]).

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
%% API functions, Gen_server
%% ====================================================================
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).




%% ====================================================================
%% API functions, user interface grouping
%% ====================================================================



%% ====================================================================
%% Client Call functions 
%% ====================================================================
start_link() ->
    gen_server:start_link({global, ?MODULE}, ?MODULE, [], []).

stop() ->
    gen_server:cast({global, ?MODULE}, stop).



yggrequest(Request) ->
    gen_server:call({global, ?MODULE}, {yggrequest, Request}).

getNodeInfo(Request,Key,Coords) ->
    gen_server:call({global, ?MODULE}, {getNodeInfo, Request,Key,Coords}).


addpeer(Request,Uri) ->
    gen_server:call({global, ?MODULE}, {addpeer,Request,Uri}).

removepeer(Request,Port) ->
    gen_server:call({global, ?MODULE}, {removepeer,Request,Port}).

addRoute(Request,Snet,Key) ->
    gen_server:call({global, ?MODULE}, {addRoute,Request,Snet,Key}).

removeRoute(Request,Snet,Key) ->
    gen_server:call({global, ?MODULE}, {removeRoute,Request,Snet,Key}).


addSourceSubnet(Request,Subnet) ->
    gen_server:call({global, ?MODULE}, {addSourceSubnet,Request,Subnet}).

removeSourceSubnet(Request,Subnet) ->
    gen_server:call({global, ?MODULE}, {removeSourceSubnet,Request,Subnet}).

dhtPing(Request,Key,Coords,Target) ->
    gen_server:call({global, ?MODULE}, {dhtPing,Request,Key,Coords,Target}).

%% ====================================================================
%% Call Back functions 
%% ====================================================================
%when the yggdrasil server is initialised the init function is always called.

init([]) ->
    process_flag(trap_exit, true), %ensures notification when it goes down
    io:format("~p (~p) starting ... ~n", [{local, ?MODULE}, self()]),
    {ok, []}.

   
handle_call({yggrequest, Request}, _From, State) ->  
    {reply, yggdrasil_api:yggrequest(Request), State};

handle_call({getNodeInfo, Request,Key,Coords}, _From, State) ->  
    {reply, yggdrasil_api:getNodeInfo(Request,Key,Coords), State};

handle_call({addpeer,Request,Uri}, _From, State) ->  
    {reply, yggdrasil_api:addpeer(Request,Uri), State};

handle_call({removepeer,Request,Port}, _From, State) ->  
    {reply, yggdrasil_api:removepeer(Request,Port), State};

handle_call({addRoute,Request,Snet,Key}, _From, State) ->  
    {reply, yggdrasil_api:addRoute(Request,Snet,Key), State};

handle_call({removeRoute,Request,Snet,Key}, _From, State) ->  
    {reply, yggdrasil_api:removeRoute(Request,Snet,Key), State};

handle_call({addSourceSubnet,Request,Subnet}, _From, State) ->  
    {reply, yggdrasil_api:addSourceSubnet(Request,Subnet), State};

handle_call({removeSourceSubnet,Request,Subnet}, _From, State) ->  
    {reply, yggdrasil_api:removeSourceSubnet(Request,Subnet), State};

handle_call({dhtPing,Request,Key,Coords,Target}, _From, State) ->  
    {reply, yggdrasil_api:dhtPing(Request,Key,Coords,Target), State};


handle_call(_Request, _From, State) ->
    {reply, i_don_t_konw, State}.

handle_cast(_Request, State) -> % asyncrohnous and generally not for returning values.
    {noreply, State}.

handle_info(Info, State) ->   % it is called when handle call ka timeout occurs
    {noreply, Info, State}.

terminate(_Reason, _State) ->    %when we terminate the server
    io:format("terminating ~p~n", [{local, ?MODULE}]),
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.