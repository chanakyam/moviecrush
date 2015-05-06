-module(more_videos_handler).
-include("includes.hrl").
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
	Url_movies_video = "http://api.contentapi.ws/videos?channel=world_news&limit=1&skip=3&format=long",
	
	{ok, "200", _, Response_movies_video} = ibrowse:send_req(Url_movies_video,[],get,[],[]),
	ResponseParams_movies_video = jsx:decode(list_to_binary(Response_movies_video)),	
	[ResponseRows_movies_video] = proplists:get_value(<<"articles">>, ResponseParams_movies_video),
	
	% {PageBinary, _} = cowboy_req:qs_val(<<"p">>, Req),
	% PageNum = list_to_integer(binary_to_list(PageBinary)),
	% SkipItems = (PageNum-1) * ?NEWS_PER_PAGE,
	
	% Url_all_news = string:concat("http://api.contentapi.ws/videos?channel=world_news&limit=14&format=short&skip=", integer_to_list(SkipItems)),	
	Url_all_news = "http://api.contentapi.ws/videos?channel=world_news&limit=14&format=short&skip=0",	
	{ok, "200", _, ResponseAllNews} = ibrowse:send_req(Url_all_news,[],get,[],[]),
	ResponseParams = jsx:decode(list_to_binary(ResponseAllNews)),
	ResAllNews = proplists:get_value(<<"articles">>, ResponseParams),
	
	% Movies5_Url = "http://api.contentapi.ws/news?channel=entertainment_film&limit=1&skip=0&format=short",
	Movies5_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_film/_view/by_id_title_desc_thumb_date?descending=true&limit=1&skip=0",
	{ok, "200", _, Response_Movies5} = ibrowse:send_req(Movies5_Url,[],get,[],[]),
	ResponseParams_Movies5 = jsx:decode(list_to_binary(Response_Movies5)),	
	[ResponseRows_Movies5] = proplists:get_value(<<"rows">>, ResponseParams_Movies5),

	% Interviews_Url = "http://api.contentapi.ws/news?channel=entertainment_people&limit=1&skip=0&format=short",
	Interviews_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_people/_view/short?descending=true&limit=1&skip=0",
	{ok, "200", _, Response_Interviews} = ibrowse:send_req(Interviews_Url,[],get,[],[]),
	ResponseParams_Interviews = jsx:decode(list_to_binary(Response_Interviews)),	
	[ResponseRows_Interviews] = proplists:get_value(<<"rows">>, ResponseParams_Interviews),

	% Interviews1_Url = "http://api.contentapi.ws/news?channel=entertainment_people&limit=50&skip=0&format=short",
	Interviews1_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_people/_view/short?descending=true&limit=60&skip=0",
	{ok, "200", _, Response_Interviews1} = ibrowse:send_req(Interviews1_Url,[],get,[],[]),
	ResponseParams_Interviews1 = jsx:decode(list_to_binary(Response_Interviews1)),	
	ResponseRows_Interviews1 = proplists:get_value(<<"rows">>, ResponseParams_Interviews1),

	{ok, Body} = more_videos_dtl:render([{<<"videoParam">>,ResponseRows_movies_video},{<<"allnews">>,ResAllNews},{<<"movies5">>,ResponseRows_Movies5},{<<"interviews">>,ResponseRows_Interviews},{<<"interviews1">>,ResponseRows_Interviews1}]),
    {Body, Req, State}.


