-module(channel_latestinterviews_handler).

-export([init/3]).

-export([content_types_provided/2]).
-export([welcome/2]).
-export([terminate/3]).

%% Init
init(_Transport, _Req, []) ->
	{upgrade, protocol, cowboy_rest}.

%% Callbacks
content_types_provided(Req, State) ->
	{[		
		{<<"text/html">>, welcome}	
	], Req, State}.

terminate(_Reason, _Req, _State) ->
	ok.

%% API
welcome(Req, State) ->
	{Limit, _ } = cowboy_req:qs_val(<<"l">>, Req),
	{Skip, _ } = cowboy_req:qs_val(<<"skip">>, Req),

	Url = string:join(["http://api.contentapi.ws/news?channel=interviews&limit=", binary_to_list(Limit),"&skip=", binary_to_list(Skip),"&format=short"],""),
	
	{ok, "200", _, Response} = ibrowse:send_req(Url,[],get,[],[]),
	Body = list_to_binary(Response),
	{Body, Req, State}.



