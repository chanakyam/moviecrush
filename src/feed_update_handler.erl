-module(feed_update_handler).

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
	Url_mlb = "http://api.contentapi.ws/news?channel=us_mlb&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_mlb} = ibrowse:send_req(Url_mlb,[],get,[],[]),
	ResponseParams_mlb = jsx:decode(list_to_binary(Response_mlb)),	
	[ResponseRows_mlb] = proplists:get_value(<<"articles">>, ResponseParams_mlb),
	Params_mlb = proplists:get_value(<<"upload_date">>, ResponseRows_mlb),

	% Url_nhl = "http://api.contentapi.ws/news?channel=us_nhl&limit=1&skip=0&format=short&asc=true",
	% {ok, "200", _, Response_nhl} = ibrowse:send_req(Url_nhl,[],get,[],[]),
	% ResponseParams_nhl = jsx:decode(list_to_binary(Response_nhl)),	
	% % io:format("resp params : ~p ~n",[ResponseParams_nhl]),
	% [ResponseRows_nhl] = proplists:get_value(<<"articles">>, ResponseParams_nhl),
	% Params_nhl = proplists:get_value(<<"upload_date">>, ResponseRows_nhl),

	Url_nba = "http://api.contentapi.ws/news?channel=us_nba&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_nba} = ibrowse:send_req(Url_nba,[],get,[],[]),
	ResponseParams_nba = jsx:decode(list_to_binary(Response_nba)),	
	[ResponseRows_nba] = proplists:get_value(<<"articles">>, ResponseParams_nba),
	Params_nba = proplists:get_value(<<"upload_date">>, ResponseRows_nba),


	Url_us_world = "http://api.contentapi.ws/news?channel=us_world&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_us_world} = ibrowse:send_req(Url_us_world,[],get,[],[]),
	ResponseParams_us_world = jsx:decode(list_to_binary(Response_us_world)),	
	[ResponseRows_us_world] = proplists:get_value(<<"articles">>, ResponseParams_us_world),
	Params_us_world = proplists:get_value(<<"upload_date">>, ResponseRows_us_world),



		Url_us_top = "http://api.contentapi.ws/news?channel=us_top&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_us_top} = ibrowse:send_req(Url_us_top,[],get,[],[]),
	ResponseParams_us_top = jsx:decode(list_to_binary(Response_us_top)),	
	[ResponseRows_us_top] = proplists:get_value(<<"articles">>, ResponseParams_us_top),
	Params_us_top = proplists:get_value(<<"upload_date">>, ResponseRows_us_top),


	Url_us_technology = "http://api.contentapi.ws/news?channel=us_technology&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_us_technology} = ibrowse:send_req(Url_us_technology,[],get,[],[]),
	ResponseParams_us_technology = jsx:decode(list_to_binary(Response_us_technology)),	
	[ResponseRows_us_technology] = proplists:get_value(<<"articles">>, ResponseParams_us_technology),
	Params_us_technology = proplists:get_value(<<"upload_date">>, ResponseRows_us_technology),

			Url_us_sports = "http://api.contentapi.ws/news?channel=us_sports&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_us_sports} = ibrowse:send_req(Url_us_sports,[],get,[],[]),
	ResponseParams_us_sports = jsx:decode(list_to_binary(Response_us_sports)),	
	[ResponseRows_us_sports] = proplists:get_value(<<"articles">>, ResponseParams_us_sports),
	Params_us_sports = proplists:get_value(<<"upload_date">>, ResponseRows_us_sports),

			Url_us_science = "http://api.contentapi.ws/news?channel=us_science&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_us_science} = ibrowse:send_req(Url_us_science,[],get,[],[]),
	ResponseParams_us_science = jsx:decode(list_to_binary(Response_us_science)),	
	[ResponseRows_us_science] = proplists:get_value(<<"articles">>, ResponseParams_us_science),
	Params_us_science = proplists:get_value(<<"upload_date">>, ResponseRows_us_science),

			Url_us_politics = "http://api.contentapi.ws/news?channel=us_politics&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_us_politics} = ibrowse:send_req(Url_us_politics,[],get,[],[]),
	ResponseParams_us_politics = jsx:decode(list_to_binary(Response_us_politics)),	
	[ResponseRows_us_politics] = proplists:get_value(<<"articles">>, ResponseParams_us_politics),
	Params_us_politics = proplists:get_value(<<"upload_date">>, ResponseRows_us_politics),


	Url_us_oddly = "http://api.contentapi.ws/news?channel=us_oddly&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_us_oddly} = ibrowse:send_req(Url_us_oddly,[],get,[],[]),
	ResponseParams_us_oddly = jsx:decode(list_to_binary(Response_us_oddly)),	
	[ResponseRows_us_oddly] = proplists:get_value(<<"articles">>, ResponseParams_us_oddly),
	Params_us_oddly = proplists:get_value(<<"upload_date">>, ResponseRows_us_oddly),

	Url_us_nfl = "http://api.contentapi.ws/news?channel=us_nfl&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_us_nfl} = ibrowse:send_req(Url_us_nfl,[],get,[],[]),
	ResponseParams_us_nfl = jsx:decode(list_to_binary(Response_us_nfl)),	
	[ResponseRows_us_nfl] = proplists:get_value(<<"articles">>, ResponseParams_us_nfl),
	Params_us_nfl = proplists:get_value(<<"upload_date">>, ResponseRows_us_nfl),

		Url_us_money = "http://api.contentapi.ws/news?channel=us_money&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_us_money} = ibrowse:send_req(Url_us_money,[],get,[],[]),
	ResponseParams_us_money = jsx:decode(list_to_binary(Response_us_money)),	
	[ResponseRows_us_money] = proplists:get_value(<<"articles">>, ResponseParams_us_money),
	Params_us_money = proplists:get_value(<<"upload_date">>, ResponseRows_us_money),
		Url_entertainment_film = "http://api.contentapi.ws/news?channel=entertainment_film&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_entertainment_film} = ibrowse:send_req(Url_entertainment_film,[],get,[],[]),
	ResponseParams_entertainment_film = jsx:decode(list_to_binary(Response_entertainment_film)),	
	[ResponseRows_entertainment_film] = proplists:get_value(<<"articles">>, ResponseParams_entertainment_film),
	Params_entertainment_film = proplists:get_value(<<"upload_date">>, ResponseRows_entertainment_film),

	Url_entertainment_people = "http://api.contentapi.ws/news?channel=entertainment_people&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_entertainment_people} = ibrowse:send_req(Url_entertainment_people,[],get,[],[]),
	ResponseParams_entertainment_people = jsx:decode(list_to_binary(Response_entertainment_people)),	
	[ResponseRows_entertainment_people] = proplists:get_value(<<"articles">>, ResponseParams_entertainment_people),
	Params_entertainment_people = proplists:get_value(<<"upload_date">>, ResponseRows_entertainment_people),

	Url_entertainment_television = "http://api.contentapi.ws/news?channel=entertainment_television&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_entertainment_television} = ibrowse:send_req(Url_entertainment_television,[],get,[],[]),
	ResponseParams_entertainment_television = jsx:decode(list_to_binary(Response_entertainment_television)),	
	[ResponseRows_entertainment_television] = proplists:get_value(<<"articles">>, ResponseParams_entertainment_television),
	Params_entertainment_television = proplists:get_value(<<"upload_date">>, ResponseRows_entertainment_television),

	Url_entertainment_business = "http://api.contentapi.ws/news?channel=entertainment_business&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_entertainment_business} = ibrowse:send_req(Url_entertainment_business,[],get,[],[]),
	ResponseParams_entertainment_business = jsx:decode(list_to_binary(Response_entertainment_business)),	
	[ResponseRows_entertainment_business] = proplists:get_value(<<"articles">>, ResponseParams_entertainment_business),
	Params_entertainment_business = proplists:get_value(<<"upload_date">>, ResponseRows_entertainment_business),

	Url_entertainment_music = "http://api.contentapi.ws/news?channel=entertainment_music&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_entertainment_music} = ibrowse:send_req(Url_entertainment_music,[],get,[],[]),
	ResponseParams_entertainment_music = jsx:decode(list_to_binary(Response_entertainment_music)),	
	[ResponseRows_entertainment_music] = proplists:get_value(<<"articles">>, ResponseParams_entertainment_music),
	Params_entertainment_music = proplists:get_value(<<"upload_date">>, ResponseRows_entertainment_music),

	Url_entertainment_reviews = "http://api.contentapi.ws/news?channel=entertainment_reviews&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_entertainment_reviews} = ibrowse:send_req(Url_entertainment_reviews,[],get,[],[]),
	ResponseParams_entertainment_reviews = jsx:decode(list_to_binary(Response_entertainment_reviews)),	
	[ResponseRows_entertainment_reviews] = proplists:get_value(<<"articles">>, ResponseParams_entertainment_reviews),
	Params_entertainment_reviews = proplists:get_value(<<"upload_date">>, ResponseRows_entertainment_reviews),

		Url_environment_report = "http://api.contentapi.ws/news?channel=environment_report&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_environment_report} = ibrowse:send_req(Url_environment_report,[],get,[],[]),
	ResponseParams_environment_report = jsx:decode(list_to_binary(Response_environment_report)),	
	[ResponseRows_environment_report] = proplists:get_value(<<"articles">>, ResponseParams_environment_report),
	Params_environment_report = proplists:get_value(<<"upload_date">>, ResponseRows_environment_report),

		Url_health_news_online = "http://api.contentapi.ws/news?channel=health_news_online&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_health_news_online} = ibrowse:send_req(Url_health_news_online,[],get,[],[]),
	ResponseParams_health_news_online = jsx:decode(list_to_binary(Response_health_news_online)),	
	[ResponseRows_health_news_online] = proplists:get_value(<<"articles">>, ResponseParams_health_news_online),
	Params_health_news_online = proplists:get_value(<<"upload_date">>, ResponseRows_health_news_online),

		Url_life_online = "http://api.contentapi.ws/news?channel=life_online&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_life_online} = ibrowse:send_req(Url_life_online,[],get,[],[]),
	ResponseParams_life_online = jsx:decode(list_to_binary(Response_life_online)),	
	[ResponseRows_life_online] = proplists:get_value(<<"articles">>, ResponseParams_life_online),
	Params_life_online = proplists:get_value(<<"upload_date">>, ResponseRows_life_online),

		Url_us_business = "http://api.contentapi.ws/news?channel=us_business&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_us_business} = ibrowse:send_req(Url_us_business,[],get,[],[]),
	ResponseParams_us_business = jsx:decode(list_to_binary(Response_us_business)),	
	[ResponseRows_us_business] = proplists:get_value(<<"articles">>, ResponseParams_us_business),
	Params_us_business = proplists:get_value(<<"upload_date">>, ResponseRows_us_business),

		Url_us_domestic = "http://api.contentapi.ws/news?channel=us_domestic&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_us_domestic} = ibrowse:send_req(Url_us_domestic,[],get,[],[]),
	ResponseParams_us_domestic = jsx:decode(list_to_binary(Response_us_domestic)),	
	[ResponseRows_us_domestic] = proplists:get_value(<<"articles">>, ResponseParams_us_domestic),
	Params_us_domestic = proplists:get_value(<<"upload_date">>, ResponseRows_us_domestic),

		Url_us_economy = "http://api.contentapi.ws/news?channel=us_economy&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_us_economy} = ibrowse:send_req(Url_us_economy,[],get,[],[]),
	ResponseParams_us_economy = jsx:decode(list_to_binary(Response_us_economy)),	
	[ResponseRows_us_economy] = proplists:get_value(<<"articles">>, ResponseParams_us_economy),
	Params_us_economy = proplists:get_value(<<"upload_date">>, ResponseRows_us_economy),

	Url_us_entertainment = "http://api.contentapi.ws/news?channel=us_entertainment&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_us_entertainment} = ibrowse:send_req(Url_us_entertainment,[],get,[],[]),
	ResponseParams_us_entertainment = jsx:decode(list_to_binary(Response_us_entertainment)),	
	[ResponseRows_us_entertainment] = proplists:get_value(<<"articles">>, ResponseParams_us_entertainment),
	Params_us_entertainment = proplists:get_value(<<"upload_date">>, ResponseRows_us_entertainment),

	% 	Url_us_stocks = "http://api.contentapi.ws/news?channel=us_stocks&limit=1&skip=0&format=short&asc=true",
	% {ok, "200", _, Response_us_stocks} = ibrowse:send_req(Url_us_stocks,[],get,[],[]),
	% ResponseParams_us_stocks = jsx:decode(list_to_binary(Response_us_stocks)),	
	% [ResponseRows_us_stocks] = proplists:get_value(<<"articles">>, ResponseParams_us_stocks),
	% Params_us_stocks = proplists:get_value(<<"upload_date">>, ResponseRows_us_stocks),

		Url_us_internet = "http://api.contentapi.ws/news?channel=us_internet&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_us_internet} = ibrowse:send_req(Url_us_internet,[],get,[],[]),
	ResponseParams_us_internet = jsx:decode(list_to_binary(Response_us_internet)),	
	[ResponseRows_us_internet] = proplists:get_value(<<"articles">>, ResponseParams_us_internet),
	Params_us_internet = proplists:get_value(<<"upload_date">>, ResponseRows_us_internet),


		Url_us_markets = "http://api.contentapi.ws/news?channel=us_markets&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_us_markets} = ibrowse:send_req(Url_us_markets,[],get,[],[]),
	ResponseParams_us_markets = jsx:decode(list_to_binary(Response_us_markets)),	
	[ResponseRows_us_markets] = proplists:get_value(<<"articles">>, ResponseParams_us_markets),
	Params_us_markets = proplists:get_value(<<"upload_date">>, ResponseRows_us_markets),

		Url_movies_video = "http://api.contentapi.ws/videos?channel=movies&limit=1&skip=0&format=short",
	{ok, "200", _, Response_movies_video} = ibrowse:send_req(Url_movies_video,[],get,[],[]),
	ResponseParams_movies_video = jsx:decode(list_to_binary(Response_movies_video)),	
	[ResponseRows_movies_video] = proplists:get_value(<<"articles">>, ResponseParams_movies_video),
	Params_movies_video = proplists:get_value(<<"upload_date">>, ResponseRows_movies_video),

		Url_world_news = "http://api.contentapi.ws/videos?channel=world_news&limit=1&skip=0&format=short",
	{ok, "200", _, Response_world_news} = ibrowse:send_req(Url_world_news,[],get,[],[]),
	ResponseParams_world_news = jsx:decode(list_to_binary(Response_world_news)),	
	[ResponseRows_world_news] = proplists:get_value(<<"articles">>, ResponseParams_world_news),
	Params_world_news = proplists:get_value(<<"upload_date">>, ResponseRows_world_news),

		Url_image_galleries = "http://api.contentapi.ws/news?channel=image_galleries&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_image_galleries} = ibrowse:send_req(Url_image_galleries,[],get,[],[]),
	ResponseParams_image_galleries = jsx:decode(list_to_binary(Response_image_galleries)),	
	[ResponseRows_image_galleries] = proplists:get_value(<<"articles">>, ResponseParams_image_galleries),
	Params_image_galleries = proplists:get_value(<<"upload_date">>, ResponseRows_image_galleries),

		Url_interviews = "http://api.contentapi.ws/news?channel=interviews&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_interviews} = ibrowse:send_req(Url_interviews,[],get,[],[]),
	ResponseParams_interviews = jsx:decode(list_to_binary(Response_interviews)),	
	[ResponseRows_interviews] = proplists:get_value(<<"articles">>, ResponseParams_interviews),
	Params_interviews = proplists:get_value(<<"upload_date">>, ResponseRows_interviews),

		Url_beauty = "http://api.contentapi.ws/news?channel=beauty&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_beauty} = ibrowse:send_req(Url_beauty,[],get,[],[]),
	ResponseParams_beauty = jsx:decode(list_to_binary(Response_beauty)),	
	[ResponseRows_beauty] = proplists:get_value(<<"articles">>, ResponseParams_beauty),
	Params_beauty = proplists:get_value(<<"upload_date">>, ResponseRows_beauty),

			Url_movies = "http://api.contentapi.ws/news?channel=movies&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_movies} = ibrowse:send_req(Url_movies,[],get,[],[]),
	ResponseParams_movies = jsx:decode(list_to_binary(Response_movies)),	
	[ResponseRows_movies] = proplists:get_value(<<"articles">>, ResponseParams_movies),
	Params_movies = proplists:get_value(<<"upload_date">>, ResponseRows_movies),


	Url_fitness = "http://api.contentapi.ws/news?channel=fitness&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_fitness} = ibrowse:send_req(Url_fitness,[],get,[],[]),
	ResponseParams_fitness = jsx:decode(list_to_binary(Response_fitness)),	
	[ResponseRows_fitness] = proplists:get_value(<<"articles">>, ResponseParams_fitness),
	Params_fitness = proplists:get_value(<<"upload_date">>, ResponseRows_fitness),

		Url_fashion = "http://api.contentapi.ws/news?channel=fashion&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_fashion} = ibrowse:send_req(Url_fashion,[],get,[],[]),
	ResponseParams_fashion = jsx:decode(list_to_binary(Response_fashion)),	
	[ResponseRows_fashion] = proplists:get_value(<<"articles">>, ResponseParams_fashion),
	Params_fashion = proplists:get_value(<<"upload_date">>, ResponseRows_fashion),

	Url_starstyle = "http://api.contentapi.ws/news?channel=starstyle&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_starstyle} = ibrowse:send_req(Url_starstyle,[],get,[],[]),
	ResponseParams_starstyle = jsx:decode(list_to_binary(Response_starstyle)),	
	[ResponseRows_starstyle] = proplists:get_value(<<"articles">>, ResponseParams_starstyle),
	Params_starstyle = proplists:get_value(<<"upload_date">>, ResponseRows_starstyle),

		Url_showbiz = "http://api.contentapi.ws/news?channel=showbiz&limit=1&skip=0&format=short&asc=true",
	{ok, "200", _, Response_showbiz} = ibrowse:send_req(Url_showbiz,[],get,[],[]),
	ResponseParams_showbiz = jsx:decode(list_to_binary(Response_showbiz)),	
	[ResponseRows_showbiz] = proplists:get_value(<<"articles">>, ResponseParams_showbiz),
	Params_showbiz = proplists:get_value(<<"upload_date">>, ResponseRows_showbiz),



	{ok, Body} = feed_updates_dtl:render([{<<"Params_movies_video">>,Params_movies_video},{<<"VideoParam_us_markets">>,Params_us_markets},{<<"videoParam_us_science">>,Params_us_science},{<<"videoParam_us_sports">>,Params_us_sports},{<<"videoParam_us_technology">>,Params_us_technology},{<<"videoParam_us_top">>,Params_us_top},{<<"videoParam_us_world">>,Params_us_world},{<<"videoParam_mlb">>,Params_mlb},
		% {<<"videoParam_nhl">>,Params_nhl},
		{<<"videoParam_nba">>,Params_nba},{<<"videoParam_us_politics">>,Params_us_politics},{<<"videoParam_us_oddly">>,Params_us_oddly},{<<"videoParam_us_nfl">>,Params_us_nfl}	,{<<"videoParam_us_money">>,Params_us_money},{<<"videoParam_us_internet">>,Params_us_internet},
		% {<<"videoParam_us_stocks">>,Params_us_stocks},
		{<<"videoParam_us_entertainment">>,Params_us_entertainment}	,{<<"videoParam_us_economy">>,Params_us_economy}	,{<<"videoParam_us_domestic">>,Params_us_domestic}	,{<<"videoParam_us_business">>,Params_us_business}	,{<<"videoParam_life_online">>,Params_life_online}	,{<<"videoParam_health_news_online">>,Params_health_news_online}	,{<<"videoParam_environment_report">>,Params_environment_report}	,{<<"videoParam_entertainment_reviews">>,Params_entertainment_reviews}	,{<<"videoParam_entertainment_music">>,Params_entertainment_music}	,{<<"videoParam_entertainment_business">>,Params_entertainment_business}	,{<<"videoParam_entertainment_television">>,Params_entertainment_television}	,{<<"videoParam_entertainment_people">>,Params_entertainment_people}	,{<<"videoParam_entertainment_film">>,Params_entertainment_film},{<<"videoParam_world_news">>,Params_world_news},{<<"videoParam_image_galleries">>,Params_image_galleries},{<<"videoParam_interviews">>,Params_interviews},{<<"videoParam_beauty">>,Params_beauty},{<<"videoParam_movies">>,Params_movies},{<<"videoParam_fitness">>,Params_fitness},{<<"videoParam_fashion">>,Params_fashion},{<<"videoParam_starstyle">>,Params_starstyle},{<<"videoParam_showbiz">>,Params_showbiz}]),
    {Body, Req, State}
.
