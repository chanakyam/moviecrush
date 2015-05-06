-module(home_page_handler).

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
	Url_movies_video = "http://api.contentapi.ws/videos?channel=world_news&limit=1&skip=0&format=long",
	
	{ok, "200", _, Response_movies_video} = ibrowse:send_req(Url_movies_video,[],get,[],[]),
	ResponseParams_movies_video = jsx:decode(list_to_binary(Response_movies_video)),	
	[ResponseRows_movies_video] = proplists:get_value(<<"articles">>, ResponseParams_movies_video),
	
	% Movies_Url = "http://api.contentapi.ws/news?channel=entertainment_film&limit=3&skip=0&format=short",
	Movies_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_film/_view/by_id_title_desc_thumb_date?descending=true&limit=3",
	{ok, "200", _, Response_Movies} = ibrowse:send_req(Movies_Url,[],get,[],[]),
	ResponseParams_Movies = jsx:decode(list_to_binary(Response_Movies)),	
	ResponseRows_Movies = proplists:get_value(<<"rows">>, ResponseParams_Movies),

	% Movies1_Url = "http://api.contentapi.ws/news?channel=entertainment_film&limit=2&skip=5&format=short",
	Movies1_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_film/_view/by_id_title_desc_thumb_date?descending=true&limit=2&skip=5",
	{ok, "200", _, Response_Movies1} = ibrowse:send_req(Movies1_Url,[],get,[],[]),
	ResponseParams_Movies1 = jsx:decode(list_to_binary(Response_Movies1)),	
	ResponseRows_Movies1 = proplists:get_value(<<"rows">>, ResponseParams_Movies1),

	% Movies2_Url = "http://api.contentapi.ws/news?channel=entertainment_film&limit=2&skip=7&format=short",
	Movies2_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_film/_view/by_id_title_desc_thumb_date?descending=true&limit=2&skip=7",
	{ok, "200", _, Response_Movies2} = ibrowse:send_req(Movies2_Url,[],get,[],[]),
	ResponseParams_Movies2 = jsx:decode(list_to_binary(Response_Movies2)),	
	ResponseRows_Movies2 = proplists:get_value(<<"rows">>, ResponseParams_Movies2),

	% Movies3_Url = "http://api.contentapi.ws/news?channel=entertainment_film&limit=1&skip=9&format=short",
	Movies3_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_film/_view/by_id_title_desc_thumb_date?descending=true&limit=1&skip=9",
	{ok, "200", _, Response_Movies3} = ibrowse:send_req(Movies3_Url,[],get,[],[]),
	ResponseParams_Movies3 = jsx:decode(list_to_binary(Response_Movies3)),	
	[ResponseRows_Movies3] = proplists:get_value(<<"rows">>, ResponseParams_Movies3),

	% Movies4_Url = "http://api.contentapi.ws/news?channel=entertainment_film&limit=2&skip=10&format=short",
	Movies4_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_film/_view/by_id_title_desc_thumb_date?descending=true&limit=2&skip=10",
	{ok, "200", _, Response_Movies4} = ibrowse:send_req(Movies4_Url,[],get,[],[]),
	ResponseParams_Movies4 = jsx:decode(list_to_binary(Response_Movies4)),	
	ResponseRows_Movies4 = proplists:get_value(<<"rows">>, ResponseParams_Movies4),

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

	% ImgGallery1_Url = "http://api.contentapi.ws/news?channel=entertainment_music&limit=1&skip=1&format=short",
	ImgGallery1_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_music/_view/short?descending=true&limit=1&skip=1",
	{ok, "200", _, Response_ImgGallery1} = ibrowse:send_req(ImgGallery1_Url,[],get,[],[]),
	ResponseParams_ImgGallery1 = jsx:decode(list_to_binary(Response_ImgGallery1)),	
	[ResponseRows_ImgGallery1] = proplists:get_value(<<"rows">>, ResponseParams_ImgGallery1),

	% ImgGallery_Url = "http://api.contentapi.ws/news?channel=image_galleries&limit=4&skip=1&format=long",
	% {ok, "200", _, Response_ImgGallery} = ibrowse:send_req(ImgGallery_Url,[],get,[],[]),
	% ResponseParams_ImgGallery = jsx:decode(list_to_binary(Response_ImgGallery)),	
	% ResponseRows_ImgGallery = proplists:get_value(<<"articles">>, ResponseParams_ImgGallery),

	{ok, Body} = index_dtl:render([{<<"videoParam">>,ResponseRows_movies_video},{<<"movies">>,ResponseRows_Movies},{<<"movies1">>,ResponseRows_Movies1},{<<"movies2">>,ResponseRows_Movies2},{<<"movies3">>,ResponseRows_Movies3},{<<"movies4">>,ResponseRows_Movies4},{<<"movies5">>,ResponseRows_Movies5},{<<"interviews">>,ResponseRows_Interviews},{<<"imagegallery1">>,ResponseRows_ImgGallery1}]),	
    {Body, Req, State}
.