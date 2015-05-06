-module(moviecrush_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
	Dispatch = cowboy_router:compile([
		{'_',[
                {"/", home_page_handler, []},
                {"/mostpopular", most_popular_handler, []},
                {"/api/latestinterviews/channel",channel_latestinterviews_handler,[]},
                {"/music", imageGallery_handler, []},
                {"/termsandconditions", tnc_page_handler, []},
                {"/more_videos", more_videos_handler, []},
                {"/video", video_handler, []},
                {"/update", feed_update_handler, []},
                {"/api/videos/count", videos_count_handler, []},
                {"/api/imageGallery/channel", channel_imageGallery_handler, []},
                {"/api/moviecrush/channel", channel_moviecrush_handler, []},
                {"/api/videos/channel", feed_videos_handler, []},
                {"/api/latestinterviewslist/channel",channel_latestinterviews_list_handler,[]},
                {"/interviews/:id", interviews_handler, []},

                % Release routes

                {"/css/[...]", cowboy_static, {priv_dir, moviecrush, "static/css"}},
                {"/images/[...]", cowboy_static, {priv_dir, moviecrush, "static/images"}},
                {"/js/[...]", cowboy_static, {priv_dir, moviecrush, "static/js"}},
                {"/fonts/[...]", cowboy_static, {priv_dir, moviecrush, "static/fonts"}}

                % Dev routes
		         % {"/css/[...]", cowboy_static, {dir, "priv/static/css"}},
           %       {"/images/[...]", cowboy_static, {dir, "priv/static/images"}},
           %       {"/js/[...]", cowboy_static, {dir,"priv/static/js"}},
		         % {"/fonts/[...]", cowboy_static, {dir, "priv/static/fonts"}}
        ]}		
	]), 
    
	{ok, _} = cowboy:start_http(http,100, [{port, 9914}],[{env, [{dispatch, Dispatch}]},
                                                          {onresponse, fun error_hook_responder:respond/4 },
                                                          {onrequest, fun request_hook_responder:set_cors/1}                                                          
              ]),
    moviecrush_sup:start_link().

stop(_State) ->
    ok.
