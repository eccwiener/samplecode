(function(Liferay, angular, window, undefined) 
{
	angular.portlet.add("profile", "profile", function() 
	{
			var myModule = angular.module("myModule", ['infinite-scroll', 'ui.bootstrap', 'angularMoment', 'angular-growl', 'WinWinFileUploadModule', 'ngSanitize']);

            myModule.controller("ProfileCntrl", function($scope, $http, winwinFileUploadSvc) {
				$scope.start = 0;
				$scope.length = 5;
				$scope.totalLoaded = 0;
				$scope.isBusy = false;
				
				$scope.currentTab = 'All';

                // activity feed vars
                
				$scope.activity = [];
				$scope.activityStart = 0;
				$scope.activityLength = 5;
				$scope.activityLoaded = 0;
				$scope.activityIsBusy = false;
				
                $scope.postContent = "";
                $scope.activityType = 'all';

                $scope.newBusinessMessage = {};

                $scope.clearActivity = function()
                {
                	$scope.activity = [];
					$scope.activityStart = 0;
					$scope.activityLength = 5;
					$scope.activityLoaded = 0;
					$scope.activityIsBusy = false;	 
					
					$scope.loadActivity();
                }
                
                $scope.loadActivity = function()
                {
                	if($scope.activityIsBusy === true) 
						return; // request in progress, return
					
					$scope.activityIsBusy = true;

					var query = "/api/jsonws/Membership-portlet.dashboardpost/get-dashboard-posts-by-business-id-post-type?" + 						
						"start=" + $scope.activityLoaded + 
						"&length=" + $scope.activityLength +
						"&businessId=" + businessId +
						"&postType=" + $scope.activityType;
					
					$http.get(query).
			        success(function(data) 
			        {
			        	for(var i = 0; i < data.length; i++)
			        	{
			        		$scope.activity.push(data[i]);
			        	}
			        	
			        	$scope.activityLoaded = $scope.activityLoaded + data.length;
			        	
			        	$scope.activityIsBusy = false;
			        });
                };
                
                $scope.submitDashboardPost = function()
				{
					//alert('submitting post: ' + JSON.stringify($scope.newPost) + ', filePath: ' + filePath);

                	if ($scope.postContent == undefined || $scope.postContent == '')
					{
						alert ('This post appears to be blank. Please write something to post.');
						return;
					}
                	
					var query = '/api/jsonws/Membership-portlet.dashboardpost/create-private-dashboard-post?' + 
					'targetBusinessId=' + businessId + 
					'&content=' + encodeURIComponent($scope.postContent);
					
					$http.put(query).
			        success(function(data) 
			        {
			        	$scope.activity.unshift(data);
			        	$scope.postContent = '';
			        });	
				};
				
                $scope.recommendPost = function(post)
	            {
	               // alert('recommend post called on ' + JSON.stringify(post));
	           
	                $http.put('/api/jsonws/Membership-portlet.dashboardrecommendation/add-recommendation?' +
	                	'dashboardPostId=' + post.dashboardPostId).
	                    success(function(data)
	                    {
	                    	//alert("return " + data);
	                    	
	                    	if (data > 0)
	                    	{
	                    		post.userCommented = 'TRUE';
	                    		post.recommendationCount = post.recommendationCount + 1;
	                    	}
	                    });	               
	            };
	            
	            $scope.recommendComment = function(comment)
	            {
	                //alert('recommend comment called on ' + JSON.stringify(comment));

	                $http.put('/api/jsonws/Membership-portlet.dashboardcommentrecommendation/add-recommendation?' +
		                	'dashboardCommentId=' + comment.dashboardCommentId).
		                    success(function(data)
		                    {
		                    	if (data == -1)
		                    		alert('business already shared this comment');
		                    	
		                    	if (data == -2)
		                    		alert('user has already shared this comment');
		                    	
		                    	if (data > 0)
		                    	{
		                    		comment.userCommented = 'TRUE';
		                    		comment.recommendationCount = comment.recommendationCount + 1;
		                    	}
		                    });
	            };
	            
	            $scope.submitCommentFunct = function(keyEvent, post) 
				{
					if (keyEvent.which === 13)
					{
						//alert('submit comment: ' + keyEvent.target.value);
						//alert('post: ' + JSON.stringify(post));
												
						var query = '/api/jsonws/Membership-portlet.dashboardcomment/comment-on-post?' + 
						'comment=' + encodeURIComponent(keyEvent.target.value) + "&" +
						'postId=' + encodeURIComponent(post.dashboardPostId);
						
						$http.put(query).
				        success(function(data) 
				        {
				        	//alert('created comment ' + data);
				        	post.comments.push(data);
				        	keyEvent.target.value = '';
				        });			
					}	
				};
				
				$scope.loadmore = function()  
				{					
					if($scope.isBusy === true) 
						return; // request in progress, return
									
					$scope.isBusy = true;

					var query = "/api/jsonws/Membership-portlet.business/get-allied-businesses-for-business-id?" + 
						"businessId=" + businessId +
						"&start=" + $scope.totalLoaded + 
						"&length=" + $scope.length;
					
					$http.get(query).
			        success(function(data) 
			        {
			        	for(var i = 0; i < data.length; i++)
			        	{
			        		$scope.businesses.push(data[i]);
			        	}
			        	
			        	$scope.totalLoaded = $scope.totalLoaded + data.length;
			        	
			        	$scope.isBusy = false;
			        });
				};

                $scope.loadData = function()
                {
                    //alert('loadData called');

                    if($scope.isBusy === true)
                        return; // request in progress, return

                    $scope.isBusy = true;

                    var businessQuery = '/api/jsonws/Membership-portlet.business/get-business/business-id/' + businessId;

                    $http.get(businessQuery).
                        success(function(data)
                        {
                            $scope.business = data;
                            //alert(JSON.stringify(data));
                        });

                    var locationQuery = '/api/jsonws/Membership-portlet.business/get-location-for-business/business-id/' + businessId;

                    $http.get(locationQuery).
                        success(function(data)
                        {
                            $scope.location = data;
                            //alert(JSON.stringify(data));
                        });
                    
                    $scope.loadProducts();
                    $scope.loadServices();
                    $scope.loadContacts();
                    $scope.loadBusinessImages();
                    $scope.loadActivity(businessId);
                    /*
                    var userQuery = '/api/jsonws/user/get-user-by-id/user-id/' + userId;

                    $http.get(userQuery).
                        success(function(data)
                        {
                            $scope.user = data;
                            //alert(JSON.stringify(data));
                        });
                    */
                    
                    $scope.isBusy = false;
                };

                $scope.uploadBusinessImage = function($files) 
            	{            		
            		if ($files.length != 1) {
            			//alert("no image selected for upload");
            			return;
            		}
             		
            		winwinFileUploadSvc.uploadBusinessImage($files[0]).
	        			then(function(response) {
	        				// check if file is uploaded successfully
	        				//alert('response: ' + JSON.stringify(response));
	        				
	        				
	        				//if (angular.hasOwnProperty("url")) 
	        				//{
	        					$scope.businessImages.unshift(response);
	        				//}
	        				//else {
		        				//$scope.business.log = undefined;		        			
	        				//}
	        				
	        			},
	        			function() {
	        				// file is not uploaded
	        				//$scope.business.logo = undefined;
	        			});
            	};
            	
                $scope.removeBusinessImage = function(image) 
            	{            		
             		
            		winwinFileUploadSvc.removeBusinessImage(image.imageUploadId).
	        			then(function(response) {
	        				// success
	        				if (response.status == 200) {
	        					if (angular.isObject(response.data)) {
	        						// remove image
		        					for (var idx = 0; idx < $scope.businessImages.length; idx++) {
		        						if ($scope.businessImages[idx].imageUploadId == image.imageUploadId) {
		        							$scope.businessImages.splice(idx, 1);
		        							return;
		        						}
		        					}
	        					}
	        				}
	        				else {
		        				console.error(angular.toJson(response));
	        				}
	        			},
	        			function(response) {
	        				// error
	        				console.error(angular.toJson(response));
	        			});
            	};
            	
                $scope.sendAllianceRequest = function(event, businessId)
                {
                    $http.get('/api/jsonws/Membership-portlet.business/request-alliance?' + 
                    	'userId=' + userId + 
                    	'&businessId=' + businessId).
                        success(function(data)
                        {
                            //alert(JSON.stringify(data));
                            $('#request' + businessId).toggle();
                            $('#requested' + businessId).toggle();
                        });
                };
                
                $scope.loadProducts = function () 
                {
                	var productsQuery = '/api/jsonws/Membership-portlet.business/get-business-products-by-business-id?' +
            		'businessId='+ businessId;
					
					$http.get(productsQuery).
			        success(function(data) 
			        {
			        	$scope.businessProducts = data;
			        	//alert(JSON.stringify(data));
			        });
                };
                
                $scope.loadContacts = function () 
                {
                	var contactsQuery = '/api/jsonws/Membership-portlet.businesscontact/get-business-contacts-by-business-id?' +
                		'businessId='+ businessId;
					
					$http.get(contactsQuery).
			        success(function(data) 
			        {
			        	$scope.businessContacts = data;
			        	//alert(JSON.stringify(data));
			        });
                };
                
                $scope.loadServices = function ()
                {
                	var servicesQuery = '/api/jsonws/Membership-portlet.business/get-business-services-by-business-id?' +
            		'businessId='+ businessId;
					
					$http.get(servicesQuery).
			        success(function(data) 
			        {
			        	$scope.businessServices = data;
			        	//alert(JSON.stringify(data));
			        });
                };

                $scope.loadBusinessImages = function () 
                {
                	var query = '/api/jsonws/Membership-portlet.business/get-business-images?businessId=' + businessId;
					
					$http.get(query).
			        success(function(data) 
			        {
			        	$scope.businessImages = data;
			        	//alert(JSON.stringify(data));
			        });
                };
                
                $scope.initSendBusinessMessage = function(business) {
                	$scope.newBusinessMessage.message = "";
                	$scope.newBusinessMessage.business = business;
                };
                
                $scope.sendBusinessMessage = function()
                {
            		var request = {
            				method: "create-message",
            				params: {
            					businessIds: $scope.newBusinessMessage.business.businessId,
            					message: $scope.newBusinessMessage.message,
            					imageName: "",
            					fileName: "",
            					originalFileName: ""
            				},
            				jsonrpc:"2.0"
            		};
            		
            		var url = '/api/jsonws/Messaging-portlet.message';
            		
            		$http.post(url, request).
            			then(function(response) {
            				// check for data
            				if (!angular.isObject(response.data.result)) {
            					//TODO
            					// something went wrong. what todo?
            					console.error("sendBusinessMessage: error occured:" + angular.toJson(response.data));
            				}
            			});
                };
                
                $scope.businessProducts = [];
                $scope.businessServices = [];
                $scope.businessContacts = [];
				$scope.businesses = [];
				$scope.businessImages = [];
                $scope.loadData();

			});	 // end of ProfileCntrl

			return [ myModule.name ];
		});
	
	var mod;mod=angular.module("infinite-scroll",[]),mod.directive("infiniteScroll",["$rootScope","$window","$timeout",function(i,n,e){return{link:function(t,l,o){var r,c,f,a;return n=angular.element(n),f=0,null!=o.infiniteScrollDistance&&t.$watch(o.infiniteScrollDistance,function(i){return f=parseInt(i,10)}),a=!0,r=!1,null!=o.infiniteScrollDisabled&&t.$watch(o.infiniteScrollDisabled,function(i){return a=!i,a&&r?(r=!1,c()):void 0}),c=function(){var e,c,u,d;return d=n.height()+n.scrollTop(),e=l.offset().top+l.height(),c=e-d,u=n.height()*f>=c,u&&a?i.$$phase?t.$eval(o.infiniteScroll):t.$apply(o.infiniteScroll):u?r=!0:void 0},n.on("scroll",c),t.$on("$destroy",function(){return n.off("scroll",c)}),e(function(){return o.infiniteScrollImmediateCheck?t.$eval(o.infiniteScrollImmediateCheck)?c():void 0:c()},0)}}}]);

})(Liferay, angular, window, undefined);