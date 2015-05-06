var moviesApp = angular.module('movieCrush', []);

moviesApp.factory('moviesCrushIndexPageService', function ($http) {
	return {
		getFeedData: function (count, skip) {			
			return $http.get('/api/moviecrush/channel?l=' + count + '&skip=' + skip).then(function (result) {
				return result.data.articles;
			});
		},
		getVideo: function (category, count, skip) {
			return $http.get('/api/videos/channel?c=' + category + '&l=' + count + '&skip=' + skip).then(function (result) {
				return result.data.rows;
			});
		},

		getInterviews: function ( count, skip) {
			return $http.get('/api/latestinterviews/channel?l=' + count + '&skip=' + skip).then(function (result) {
				return result.data.articles;
			});
		},

		getImages: function (count, skip) {
			return $http.get('/api/imageGallery/channel?l=' + count + '&skip=' + skip).then(function (result) {
				return result.data.articles;
			});
		}

	};
});
//flowplayer-flash factory
moviesApp.factory("flowplayer", function(){
	return flowplayer;
});
moviesApp.controller('moviesCrushIndex', function($scope, moviesCrushIndexPageService, $document, flowplayer) {
	$scope.feedData = moviesCrushIndexPageService.getFeedData(60, 0);
	$scope.latestInterviews = moviesCrushIndexPageService.getInterviews(4,0);
	$scope.latestInterviewsindex = moviesCrushIndexPageService.getInterviews(70,0);
	$scope.latestInterviewsList = moviesCrushIndexPageService.getInterviews(24,0);
 	$scope.latestInterviewsList1 = moviesCrushIndexPageService.getInterviews(15,0);
	$scope.imageGallery = moviesCrushIndexPageService.getImages(8,0);
	$scope.currentYear = (new Date).getFullYear();


	// flowplayer - flash
 	$scope.loadVideo = function(){
	  	$document.ready(function(){
	  		flowplayer("player", " http://releases.flowplayer.org/swf/flowplayer.commercial-3.2.18.swf",  {
			    clip:  {
			        	autoPlay: false,
			        	autoBuffering: true
			    		}, 	
			    		onError: function(){					      
							 window.location.reload(true);							
					    }, 	
			    key: '#$48dee10ee03b0e53fa2'
		    });
	  	});
	};
});
