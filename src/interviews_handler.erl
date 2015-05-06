-module(interviews_handler).

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
	{[{_,Value}], Req2} = cowboy_req:bindings(Req),
	
	Url_movies_video = "http://api.contentapi.ws/videos?channel=world_news&limit=1&skip=2&format=long",
	{ok, "200", _, Response_movies_video} = ibrowse:send_req(Url_movies_video,[],get,[],[]),
	ResponseParams_movies_video = jsx:decode(list_to_binary(Response_movies_video)),	
	[Params1] = proplists:get_value(<<"articles">>, ResponseParams_movies_video),

	% Url = string:concat("http://api.contentapi.ws/t?id=",binary_to_list(Value) ),
	Url = string:concat("http://contentapi.ws:5984/contentapi_text_maxcdn/",binary_to_list(Value) ),
	
	
	{ok, "200", _, Response} = ibrowse:send_req(Url,[],get,[],[]),
	
	Res = string:sub_string(Response, 1, string:len(Response) -1 ),
	Params = jsx:decode(list_to_binary(Res)),

	% Interviews1_Url = "http://api.contentapi.ws/news?channel=entertainment_people&limit=50&skip=0&format=short",
	Interviews1_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_people/_view/short?descending=true&limit=40&skip=0",
	{ok, "200", _, Response_Interviews1} = ibrowse:send_req(Interviews1_Url,[],get,[],[]),
	ResponseParams_Interviews1 = jsx:decode(list_to_binary(Response_Interviews1)),	
	ResponseRows_Interviews1 = proplists:get_value(<<"rows">>, ResponseParams_Interviews1),	

	% ImgGallery1_Url = "http://api.contentapi.ws/news?channel=entertainment_music&limit=1&skip=1&format=short",
	ImgGallery1_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_music/_view/short?descending=true&limit=1&skip=1",
	{ok, "200", _, Response_ImgGallery1} = ibrowse:send_req(ImgGallery1_Url,[],get,[],[]),
	ResponseParams_ImgGallery1 = jsx:decode(list_to_binary(Response_ImgGallery1)),	
	[ResponseRows_ImgGallery1] = proplists:get_value(<<"rows">>, ResponseParams_ImgGallery1),

	% ImgGallery_Url = "http://api.contentapi.ws/news?channel=image_galleries&limit=4&skip=1&format=long",
	% {ok, "200", _, Response_ImgGallery} = ibrowse:send_req(ImgGallery_Url,[],get,[],[]),
	% ResponseParams_ImgGallery = jsx:decode(list_to_binary(Response_ImgGallery)),	
	% ResponseRows_ImgGallery = proplists:get_value(<<"articles">>, ResponseParams_ImgGallery),

	% Movies_Url = "http://api.contentapi.ws/news?channel=entertainment_film&limit=3&skip=0&format=short",
	Movies_Url = "http://contentapi.ws:5984/contentapi_text_maxcdn/_design/yb_entertainment_film/_view/by_id_title_desc_thumb_date?descending=true&limit=3",
	{ok, "200", _, Response_Movies} = ibrowse:send_req(Movies_Url,[],get,[],[]),
	ResponseParams_Movies = jsx:decode(list_to_binary(Response_Movies)),	
	ResponseRows_Movies = proplists:get_value(<<"rows">>, ResponseParams_Movies),

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

	{ok, Body} = interviews_dtl:render([{<<"videoParam">>,Params1},{<<"newsParam">>,Params},{<<"interviews1">>,ResponseRows_Interviews1},{<<"imagegallery1">>,ResponseRows_ImgGallery1},{<<"movies">>,ResponseRows_Movies},{<<"movies5">>,ResponseRows_Movies5},{<<"interviews">>,ResponseRows_Interviews}]),
	{Body, Req2, State}.

