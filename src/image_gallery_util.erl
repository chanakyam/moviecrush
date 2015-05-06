-module(image_gallery_util).
-include("includes.hrl").

-export([newsdb_url/0, 
	image_gallery_count/1,
		 thumb_title_image_gallery_count/3
		]).

newsdb_url() ->
	string:concat(?COUCHDB_URL, ?COUCHDB_TEXT_GRAPHICS)
.	

thumb_title_image_gallery_count(Category, Limit, Skip) ->
	Url1 = string:concat(?MODULE:newsdb_url(),"_design/image_gallery_design/_view/"),
	Url2 = string:concat(Url1, Category),
	Url3 = string:concat(Url2, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip)
.
	image_gallery_count(Category) ->
	Url1 = string:concat(?MODULE:newsdb_url(),"_design/image_gallery_design/_view/"),
	string:concat(Url1, Category)
.


