-module(feed_videos_util).
-include("includes.hrl").

-export([newsdb_url/0,
		videosdb_url/0, 
		 thumb_title_count/3,
		 most_popular_data/1
		]).

newsdb_url() ->
	string:concat(?COUCHDB_URL, ?COUCHDB_TEXT_GRAPHICS)
.
videosdb_url() ->
	string:concat(?COUCHDB_URL, ?COUCHDB_TEXT_GRAPHICS_VIDEOS)
.	

thumb_title_count(Category, Limit, Skip) ->Url1 = string:concat(?MODULE:videosdb_url(),"_design/video_movies/_view/"),
	Url2 = string:concat(Url1, Category),
	Url3 = string:concat(Url2, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip)
.
most_popular_data(Doc_id) ->
	string:concat(?MODULE:newsdb_url(), Doc_id)
.
