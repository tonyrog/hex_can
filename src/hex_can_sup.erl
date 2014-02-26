-module(hex_can_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    Server = {hex_can_server, {hex_can_server, start_link, []},
	      permanent, 5000, worker, [hex_can_server]},
    {ok, { {one_for_one,3,5}, [Server]} }.