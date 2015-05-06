-module(video_handler).
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
	{CategoryBinary, _} = cowboy_req:qs_val(<<"id">>, Req),
	Category = binary_to_list(CategoryBinary),

	Url_all_news = string:concat("http://api.contentapi.ws/v?id=",Category ),
	% Url_all_news = string:concat("http://contentapi.ws:5984/contentapi_text_maxcdn/",Category ),
	{ok, "200", _, ResponseAllNews} = ibrowse:send_req(Url_all_news,[],get,[],[]),
	ResAllNews = string:sub_string(ResponseAllNews, 1, string:len(ResponseAllNews) -1 ),
	Params = jsx:decode(list_to_binary(ResAllNews)),

	% Movies5_Url = "http://api.contentapi.ws/news?channel=entertainment_film&limit=1&skip=0&format=short",
	Movies5_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_film/_view/by_id_title_desc_thumb_date?descending=true&limit=1&skip=0",
	{ok, "200", _, Response_Movies5} = ibrowse:send_req(Movies5_Url,[],get,[],[]),
	ResponseParams_Movies5 = jsx:decode(list_to_binary(Response_Movies5)),	
	[ResponseRows_Movies5] = proplists:get_value(<<"rows">>, ResponseParams_Movies5),

	% Movies_Url = "http://api.contentapi.ws/news?channel=entertainment_film&limit=2&skip=30&format=short",
	Movies_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_film/_view/by_id_title_desc_thumb_date?descending=true&limit=2&skip=30",
	{ok, "200", _, Response_Movies} = ibrowse:send_req(Movies_Url,[],get,[],[]),
	ResponseParams_Movies = jsx:decode(list_to_binary(Response_Movies)),	
	ResponseRows_Movies = proplists:get_value(<<"rows">>, ResponseParams_Movies),

	% Movies1_Url = "http://api.contentapi.ws/news?channel=entertainment_film&limit=2&skip=32&format=short",
	Movies1_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_film/_view/by_id_title_desc_thumb_date?descending=true&limit=2&skip=32",
	{ok, "200", _, Response_Movies1} = ibrowse:send_req(Movies1_Url,[],get,[],[]),
	ResponseParams_Movies1 = jsx:decode(list_to_binary(Response_Movies1)),	
	ResponseRows_Movies1 = proplists:get_value(<<"rows">>, ResponseParams_Movies1),

	% Interviews_Url = "http://api.contentapi.ws/news?channel=entertainment_people&limit=1&skip=0&format=short",
	Interviews_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_people/_view/short?descending=true&limit=1&skip=0",
	{ok, "200", _, Response_Interviews} = ibrowse:send_req(Interviews_Url,[],get,[],[]),
	ResponseParams_Interviews = jsx:decode(list_to_binary(Response_Interviews)),	
	[ResponseRows_Interviews] = proplists:get_value(<<"rows">>, ResponseParams_Interviews),

	% Interviews1_Url = "http://api.contentapi.ws/news?channel=entertainment_people&limit=15&skip=0&format=short",
	Interviews1_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_people/_view/short?descending=true&limit=40&skip=0",
	{ok, "200", _, Response_Interviews1} = ibrowse:send_req(Interviews1_Url,[],get,[],[]),
	ResponseParams_Interviews1 = jsx:decode(list_to_binary(Response_Interviews1)),	
	ResponseRows_Interviews1 = proplists:get_value(<<"rows">>, ResponseParams_Interviews1),
	
	Url_all_latest_news = "http://api.contentapi.ws/videos?channel=world_news&limit=14&format=short&skip=0",	
	{ok, "200", _, ResponseAllLatestNews} = ibrowse:send_req(Url_all_latest_news,[],get,[],[]),
	ResponseParams_latestnews = jsx:decode(list_to_binary(ResponseAllLatestNews)),
	ResAllLatestNews = proplists:get_value(<<"articles">>, ResponseParams_latestnews),
		
	{ok, Body} = video_dtl:render([{<<"allnews">>,Params},{<<"movies5">>,ResponseRows_Movies5},{<<"movies">>,ResponseRows_Movies},{<<"movies1">>,ResponseRows_Movies1},{<<"interviews">>,ResponseRows_Interviews},{<<"interviews1">>,ResponseRows_Interviews1},{<<"alllatestnews">>,ResAllLatestNews}]),
    {Body, Req, State}.
