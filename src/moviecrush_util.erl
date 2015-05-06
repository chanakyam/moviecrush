-module(moviecrush_util).
-include("includes.hrl").

-export([newsdb_url/0,
		 videosdb_url/0, 
		 thumb_title_count/3,
		 thumb_title_interview_count/3,
		 video_count/3,
		 more_videos/3,
		 video_data/1,
		 videos_count/1,
		 most_popular_data/1,
		 interviews_item_url/1,
		 interviews_list_count/1,
		 photo_gallery_list/1
		]).

newsdb_url() ->
	string:concat(?COUCHDB_URL, ?COUCHDB_TEXT_GRAPHICS)
.

videosdb_url() ->
	string:concat(?COUCHDB_URL, ?COUCHDB_TEXT_GRAPHICS_VIDEOS)
.	

thumb_title_count(Category, Limit, Skip) ->
	%http://couchdb.speakglobally.net/wildridge_latest/_design/slideshow/_view/us_nba?descending=true&limit=2
	%http://localhost:5984/_utils/database.html?moviecrush/_design/cover_media/_view/feed_view
	Url1 = string:concat(?MODULE:newsdb_url(),"_design/cover_media/_view/"),
	Url2 = string:concat(Url1, Category),
	Url3 = string:concat(Url2, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip)
.
thumb_title_interview_count(Category, Limit, Skip) ->
	%http://couchdb.speakglobally.net/wildridge_latest/_design/slideshow/_view/us_nba?descending=true&limit=2
	%http://localhost:5984/_utils/database.html?moviecrush/_design/cover_media/_view/feed_view
	% http://localhost:5984/_utils/database.html?interviews/_design/interviews_design/_view/interviews_view
	Url1 = string:concat(?MODULE:newsdb_url(),"_design/interviews_design/_view/"),
	Url2 = string:concat(Url1, Category),
	Url3 = string:concat(Url2, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip)
.
most_popular_data(Doc_id) ->
	string:concat(?MODULE:newsdb_url(), Doc_id)
.
interviews_item_url(Id) ->
	string:concat(?MODULE:newsdb_url(),Id)
.
interviews_list_count(Category) ->
	%% http://localhost:5984/reconlive/_design/get_count/_view/<category>
	Url1 = string:concat(?MODULE:newsdb_url(), "_design/interviews_design/_view/"),
	Url2 = string:concat(Url1, Category),	
	string:concat(Url2, "?descending=true&limit=14")
.
photo_gallery_list(Category) ->
	%% http://localhost:5984/reconlive/_design/get_count/_view/<category>
	Url1 = string:concat(?MODULE:newsdb_url(), "_design/image_gallery_design/_view/"),
	Url2 = string:concat(Url1, Category),	
	string:concat(Url2, "?descending=true&limit=50")
.
video_count(Category, Limit, Skip) ->
	Url1 = string:concat(?MODULE:videosdb_url(),"_design/video_movies/_view/"),
	Url2 = string:concat(Url1, Category),
	Url3 = string:concat(Url2, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip)
.
more_videos(Category, Limit, Skip) ->
	Url  = string:concat(?MODULE:videosdb_url(), "_design/video_movies/_view/"), 
	Url1 = string:concat(Url,Category ),	
	Url3 = string:concat(Url1, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip).
video_data(Doc_id) ->
	string:concat(?MODULE:videosdb_url(), Doc_id)
.
videos_count(Category) ->
	Url1 = string:concat(?MODULE:videosdb_url(), "_design/video_movies/_view/"),
	Url2 = string:concat(Url1, Category),	
	string:concat(Url2, "?descending=true&limit=1")
.
