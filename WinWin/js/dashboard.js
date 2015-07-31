(function(Liferay, angular, window, undefined) 
{
	angular.portlet.add("dashboard", "dashboard", function() 
	{			
			var myModule = angular.module("myModule", ['infinite-scroll', 'ui.bootstrap',  'angularMoment', 'angular-growl', 'WinWinFileUploadModule', 'ngSanitize']);
			
			myModule.controller("DashboardCntrl", function($scope, $http, $window, $element, winwinFileUploadSvc) {
				$scope.start = 0;
				$scope.length = 5;
				$scope.totalLoaded = 0;
				$scope.isBusy = false;
				$scope.newPost = {};
				$scope.currentTab = 'All';
				$scope.entries = [];
				$scope.recommended = [];
				$scope.recommendedBusiness = {};
				$scope.showRequestAlliance = false;
				$scope.postToShare= {};
				$scope.prospects = [];
				$scope.totalProspectsLoaded = 0;
				$scope.prospectLength = 100;
				$scope.isProspectsBusy = false;
				$scope.activeTab='dashboard';
				$scope.emailToInvite = '';
				$scope.postType = '1';
				$scope.imageName = '';
				$scope.allianceToRemove = 0;
				$scope.spamDashboardPostId = 0;
				$scope.postToRemove = {};
				$scope.singlePostLoaded = false;
				$scope.picked = 0;

				//$scope.showSinglePost = showSinglePost;
				
            	// check for a tab url parameter
            	if ($window.location.search.indexOf("tab=creationzone") > -1) {
            		$scope.activeTab = "creation";
            		
            		// deactivate dashboard	
            		$element.find("#dashboardTab, #dashboardTab2, #dashboard").removeClass("active");

            		// activate the creation zone
            		$element.find("#creationTab, #creationTab2, #creation").addClass("active");
            		
            		// find which modal popup to activate
            		if ($window.location.search.indexOf("popup=b2b") > -1) {
            			// activate b2b
            			$element.find("#creation").find("button[data-target='#b2bModal']").trigger("click")
            		}
            		else
                		if ($window.location.search.indexOf("popup=coop") > -1) {
                			// activate coop marketing
                			$element.find("#creation").find("button[data-target='#coopModal']").trigger("click")
                		}
                		else
                    		if ($window.location.search.indexOf("popup=events") > -1) {
                    			// activate events
                    			$element.find("#creation").find("button[data-target='#eventsModal']").trigger("click")
                    		}
            	}
				
				//$locationProvider.html5Mode(true).hashPrefix('!');
				
				$scope.applyAllianceToRemove = function(businessId)
                {
                	$scope.allianceToRemove = businessId;
                };
				
                $scope.applyPostToRemove = function(post)
                {
                	$scope.postToRemove = post;
                };
                
                $scope.applySpamDashboardPostId = function(dashboardPostId)
                {
                	$scope.spamDashboardPostId = dashboardPostId;
                };
                
                $scope.removeAlliance = function()
                {
                	//alert('remove alliance for business id: ' + $scope.allianceToRemove);     
                	
                	var query = '/api/jsonws/Membership-portlet.business/remove-business-alliance?'
						+ 'businessIdToRemove=' +  encodeURIComponent($scope.allianceToRemove);
						
					$http.post(query).
			        success(function(data) 
			        {	
			        	$scope.allianceToRemove = 0;			        	
			        });
			        
                };
                
                $scope.removePost = function(post)
                {
                	//alert('remove alliance for business id: ' + $scope.allianceToRemove);     
                	
                	var query = '/api/jsonws/Membership-portlet.dashboardpost/remove-post?'
						+ 'dashboardPostId=' +  encodeURIComponent($scope.postToRemove.dashboardPostId);
						
					$http.post(query).
			        success(function(data) 
			        {	
			        	$scope.postToRemove.status='D';
			        	
			        	$scope.postToRemove = {};				        	
			        	
			        	//$scope.entries = $scope.entries.filter(function(el) { return el.dashboardPostId != post.dashboardPostId; });
			        	//$scope.totalLoaded = $scope.totalLoaded - 1;
			        });
			        
                };
                
                $scope.reportSpam = function()
                {
                	//alert('report spam for business id: ' + $scope.spamDashboardPostId);     
                	
                	var query = '/api/jsonws/Membership-portlet.dashboardpost/report-spam?'
						+ 'dashboardPostId=' +  encodeURIComponent($scope.spamDashboardPostId);
						
					$http.post(query).
			        success(function(data) 
			        {	
			        	$scope.spamDashboardPostId = 0;			        	
			        });
			        
                };
                
				$scope.setActiveTab = function(tabName)
				{
					//alert('setting active tab: ' + tabName);
					$scope.activeTab = tabName;					
				};
				
				$scope.setPostType = function(type)
				{
					$scope.postType = type;
					//alert($scope.postType);
				};
				
				$scope.showPostType = function()
				{
					alert($scope.postType);
				};
				
				$scope.inviteViaEmail = function()
				{
					if ($scope.emailToInvite == '')
						return;
					
					var query = '/api/jsonws/Membership-portlet.business/invite-business-via-email?'
						+ 'email=' +  encodeURIComponent($scope.emailToInvite);
						
						$http.put(query).
				        success(function(data) 
				        {	
				        	if (data == '-1')
				        	{
				        		alert($scope.emailToInvite + ' is already registered');
				        	}
				        	else
				        	{
				        		alert($scope.emailToInvite + ' has been invited');
				        		$scope.emailToInvite = '';
				        	}
				        });
				};
				
				$scope.sendInvite = function(prospect)
				{					
					var query = '/api/jsonws/Membership-portlet.businessprospects/invite-prospect?'
						+ 'prospectId=' + prospect.prospectId;
						
						$http.put(query).
				        success(function(data) 
				        {	
				        	prospect.status='I';
				        });
				};
				
				$scope.loadmore = function()  
				{
					if ($scope.activeTab != 'dashboard')
						return;
					
					if($scope.isBusy === true) 
						return; // request in progress, return
					
					$scope.isBusy = true;
					
					if (showSinglePost)
					{
						//alert('load single post ' + postId);
						
						if (!$scope.singlePostLoaded)
						{
							var query = '/api/jsonws/Membership-portlet.dashboardpost/get-dashboard-post?'					
								+ 'dashboardPostId=' + postId;
								
							$http.get(query).
					        success(function(data) 
					        {
					        	$scope.entries.push(data);
					        	$scope.singlePostLoaded = true;
					        });						        
						}
						
						$scope.isBusy = false;
						return;
					}
					
					//alert('loadmore called');
					
					var query = '/api/jsonws/Membership-portlet.dashboardpost/get-dashboard-posts?'					
					+ 'start=' + $scope.totalLoaded 
					+ '&length=' + $scope.length;
					
					if (useFilter)
						query = query + '&filter=' + filter;
					
					$http.get(query).
			        success(function(data) 
			        {
			        	//if (data.length && data.length > 0)
			        	//	alert(JSON.stringify(data));
			        	
			        	for(var i = 0; i < data.length; i++)
			        	{
			        		$scope.entries.push(data[i]);
			        	}
			        	
			        	$scope.totalLoaded = $scope.totalLoaded + data.length;
			        	
			        	$scope.isBusy = false;
			        });
				};

				$scope.submitDashboardPost = function()
				{
					//alert('submitting post: ' + JSON.stringify($scope.newPost) + ', filePath: ' + filePath);

					if ($scope.newPost.content == undefined && !$scope.imageUploaded)
					{
						alert ('This status post appears to be blank. Please write something or attach a photo to update your status.');
						return;
					}
						
					var query = '/api/jsonws/Membership-portlet.dashboardpost/create-dashboard-post?' + 
					'dashboardPostTypeId=' + encodeURIComponent($scope.postType) + '&' +
					'filePath=' + encodeURIComponent($scope.newPost.imagePath) + "&" +
					'sharedPostId=&' +
					'content=' + encodeURIComponent($scope.newPost.content);
					
					$http.put(query).
			        success(function(data) 
			        {
			        	$scope.entries.unshift(data);
			        	$scope.newPost = {};		
			        	$scope.imageUploaded = false;
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
				
				$scope.loadProspects = function()
	            {	            	
					if ($scope.activeTab != 'network')
						return;
					
					if($scope.isProspectsBusy === true) 
						return; // request in progress, return
				
					$scope.isProspectsBusy = true;
					
	                var query = '/api/jsonws/Membership-portlet.businessprospects/get-prospects?' + 
	                'start=' + $scope.totalProspectsLoaded + 
	                '&length=' + $scope.prospectLength;

	                $http.get(query).
	                    success(function(data)
	                    {
	                    	//alert(JSON.stringify(data));
	                    	
	                        for(var i = 0; i < data.length; i++)
	                        {
	                            $scope.prospects.push(data[i]);
	                            //alert(JSON.stringify(data[i]));
	                        }	           
	                        
	                        $scope.totalProspectsLoaded = $scope.totalProspectsLoaded + data.length;

	    	                $scope.isProspectsBusy = false;
	                    });	                	
	            };
	            
	            $scope.loadRecommended = function()
	            {	            	
	                var query = '/api/jsonws/Membership-portlet.business/find-user-join-alliance-businesses/?' + 
	                'userId=' + userId + '&start=0&length=10';

	                $http.get(query).
	                    success(function(data)
	                    {
	                    	//alert(JSON.stringify(data));
	                    	
	                        for(var i = 0; i < data.length; i++)
	                        {
	                            $scope.recommended.push(data[i]);
	                            //alert(JSON.stringify(data[i]));
	                        }	                        
	                    });
	            };
	            
	            $scope.showRecommended = function(business, picked) {
	            	$scope.recommendedBusiness = business;
	            	$scope.showRequestAlliance = true;
	            	$scope.picked = picked;
	           };	          		
	            

	            $scope.sendAllianceRequest = function(event, businessId, picked)
	            {
	                //alert('request alliance for business id ' + businessId);

	                $http.get('/api/jsonws/Membership-portlet.business/request-alliance?' +
	                	'userId=' + userId + 
	                	'&businessId=' + businessId).
	                    success(function(data)
	                    {
	                        //alert(JSON.stringify(data));
	                        //$('#request' + businessId).toggle();
	                        //$('#requested' + businessId).toggle();
	                    	$scope.recommended.splice($scope.picked, 1);
	                    	$scope.recommendedBusiness.about = "Awaiting Alliance Approval with" + $scope.recommendedBusiness.name; 
	                      	$scope.recommendedBusiness.name = "";
	        				$scope.showRequestAlliance = false;
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
	            
	            $scope.applyPost = function(post)
	            {
	            	$scope.postToShare = post;
	            	//alert('postToShare: ' + JSON.stringify(post));
	            };
	            
	            $scope.clearSharePostPopup = function()
	            {
	            	$scope.postToShare = {};
	            };
	            
	            $scope.sharePost = function()
	            {
	                //alert('share post called on post id ' + $scope.postToShare.dashboardPostId + 
	                //		' with comment: ' + $scope.sharePostComment);
	                
	            	var sharedPostId = $scope.postToShare.dashboardPostId;
	            	
	            	if ($scope.postToShare.hasSharedPost == "TRUE")
	            		sharedPostId = $scope.postToShare.sharedPost.dashboardPostId;
			
	                var query = '/api/jsonws/Membership-portlet.dashboardpost/create-dashboard-post?' + 
					'dashboardPostTypeId=1&' +
					'sharedPostId=' + encodeURIComponent(sharedPostId) + '&' +
					'filePath=&' +
					'content=' + encodeURIComponent($scope.sharePostComment);
					
					$http.put(query).
			        success(function(data) 
			        {
			        	$scope.entries.unshift(data);
			        	$scope.newPost = {};
			        	$scope.imagePath = undefined;
			        	$scope.postToShare = {};
			        });	
	                /*
	                $http.put('/api/jsonws/Membership-portlet.dashboardpost/share-post?' +
	                	'dashboardPostId=' + $scope.postToShare.dashboardPostId +
	                	'&comment=' + $scope.sharePostComment).
	                    success(function(data)
	                    {
	                    	if (data == -1)
	                    		alert('business already shared this post');
	                    	
	                    	if (data == -2)
	                    		alert('user has already shared this post');
	                    	
	                    	if (data > 0)
	                    	{
	                    		post.userShared = 'TRUE';
	                    		post.shareCount = post.shareCount + 1;
	                    	}
	                    });
	                */
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
	            
	            $scope.clearRecommended = function() {
	            	$scope.recommendedBusiness = {};
	            	$scope.showRequestAlliance = false;
	            };	          	            	         	            
            	
	            $scope.uploadImage = function($files) {
            		
            		if ($files.length != 1) {
            			//alert("no image selected for upload");
            			return;
            		}
             		
            		winwinFileUploadSvc.uploadDashboardImage($files[0]).
	        			then(function(response) {
	        				// check if file is uploaded successfully
	        				//alert('response: ' + JSON.stringify(response));
	        				
	        				if (angular.isString(response)) {
	        					$scope.newPost.imagePath = response;
	        					$scope.imageUploaded = true;
	        				}
	        				else {
		        				$scope.newPost.imagePath = undefined;
		        				$scope.imageUploaded = false;
	        				}
	        			},
	        			function() {
	        				// file is not uploaded
	        				$scope.newPost.imagePath = undefined;
	        				$scope.imageUploaded = false;
	        			});
            	};
            	
            	$scope.removeImage = function() {
            		winwinFileUploadSvc.removeDashboardImage($scope.newPost.imageName);
            		$scope.newPost.imagePath = undefined;
            		$scope.imageUploaded = false;
            	};
        		
	            $scope.loadRecommended();
	            $scope.loadProspects();
			});	 // end of DashboardCntrl         
      
            myModule.controller("AddExchangeCntrl", function($scope, $http, $attrs, winwinFileUploadSvc) {
            	
            	$scope.winwinCtx = $attrs.winwinCtx;
            	
            	$scope.newListing = {};
            	
				$scope.imageUploaded = false;
				$scope.fileUploaded = false;
            	
            	$scope.clearForm = function (){
		        	//clear form
					$scope.newListing.exchange = 'General';
        			$scope.newListing.headline = '';
        			$scope.newListing.message = '';
        			$scope.newListing.youtubeUrl = '';
        			$scope.newListing.imageName = undefined;
        			$scope.newListing.fileName = undefined;
        			$scope.newListing.originalFileName = undefined;

    				$scope.imageUploaded = false;
    				$scope.fileUploaded = false;
            	};
            	
            	$scope.clearForm();
            	
            	$scope.addExchange = function() {
            		
            		// check headline is 3 to 25 chars
            		if (!angular.isString($scope.newListing.headline) || $scope.newListing.headline == "" || $scope.newListing.headline.length < 3 || $scope.newListing.headline.length > 150) {
            			return false;
            		}
            		
            		// check message
            		if (!angular.isString($scope.newListing.message) || $scope.newListing.message == "" || $scope.newListing.message.length > 1024) {
            			return false;
            		}
            		
         			var message = {
    					method: "add",
    					params: {
    					    type: $scope.winwinCtx,
    					    exchange: $scope.newListing.exchange,
    					    headline: $scope.newListing.headline,
    					    message: $scope.newListing.message,
    					    youtubeUrl: angular.isString($scope.newListing.youtubeUrl) ? $scope.newListing.youtubeUrl: "",
    						imageName: angular.isString($scope.newListing.imageName) ? $scope.newListing.imageName: "",
    						fileName: angular.isString($scope.newListing.fileName) ? $scope.newListing.fileName: "",
    						originalFileName: angular.isString($scope.newListing.originalFileName) ? $scope.newListing.originalFileName: ""
    					},
    					jsonrpc:"2.0"
        			};
        			
        			var url = '/api/jsonws/Events-portlet.b2bexchange';

        			var promise = $http.post(url, message).
        				then(function(response) {
        		
        					// check for data
        					if (!angular.isObject(response.data.result)) {
        						console.error("addExchange: error occured:" + angular.toJson(response.data));
        					}
        					else {
        						if ($scope.winwinCtx == 'b2b') {
        							$("#b2bModal").modal("hide");
        						}
        						else {
        							$("#coopModal").modal("hide");
        						}
//    							growl.success("Posting successfully added", {ttl: 3000});
        					}
        					
        					//TODO
        					// something went wrong. what todo?
    			        	$scope.clearForm();
        				},
        				function() {
    			        	$scope.clearForm();
        				});
            	};
            	
            	$scope.uploadImage = function($files) {
            		
            		//check file was selected
            		if ($files.length != 1) {
            			alert("no image selected for upload");
            			return;
            		}
            		
            		winwinFileUploadSvc.uploadEventsImage($files[0]).
	        			then(function(response) {
	        				// check if file is uploaded successfully
	        				if (angular.isString(response)) {
	        					$scope.newListing.imageName = response;
	        					$scope.imageUploaded = true;
	        				}
	        				else {
		        				$scope.newListing.imageName = undefined;
		        				$scope.imageUploaded = false;
	        				}
	        			},
	        			function() {
	        				// file is not uploaded
	        				$scope.newListing.imageName = undefined;
	        				$scope.imageUploaded = false;
	        			});
            	};
            	
            	$scope.removeImage = function() {
            		winwinFileUploadSvc.removeEventsImage($scope.newListing.imageName);
            		$scope.newListing.imageName = undefined;
            		$scope.imageUploaded = false;
            	};

            	$scope.uploadFile = function($files) {
            		
            		//check file was selected
            		if ($files.length != 1) {
            			alert("no file selected for upload");
            			return;
            		}
            		
            		winwinFileUploadSvc.uploadEventsFile($files[0]).
	        			then(function(response) {
	        				// check if file is uploaded successfully
	        				if (angular.isString(response)) {
	        					$scope.newListing.fileName = response;
	                			$scope.newListing.originalFileName = $files[0].name;
	        					$scope.fileUploaded = true;
	        				}
	        				else {
		        				$scope.newListing.fileName = undefined;
		            			$scope.newListing.originalFileName = undefined;
		        				$scope.fileUploaded = false;
	        				}
	        			},
	        			function() {
	        				// file is not uploaded
	        				$scope.newListing.fileName = undefined;
	            			$scope.newListing.originalFileName = undefined;
	        				$scope.fileUploaded = false;
	        			});
            	};
            	
            	$scope.removeFile = function() {
            		winwinFileUploadSvc.removeEventsFile($scope.newListing.fileName);
            		$scope.newListing.fileName = undefined;
        			$scope.newListing.originalFileName = undefined;
            		$scope.fileUploaded = false;
            	};
            
            });

            myModule.controller("AddEventCntrl", function($scope, $http, winwinFileUploadSvc) {
            	
            	$scope.newListing = {};
				$scope.imageUploaded = false;
    			$scope.fileUploaded = false;

				$scope.minDate = new Date();

				$scope.dateOptions = {
					showWeeks: false
				};
            	
                /*datepicker*/
                $scope.today = function() {
                    $scope.newListing.startDate = new Date();
                    $scope.newListing.endDate = new Date();
                    
                    $scope.newListing.startTime = new Date();
                    $scope.newListing.endTime = new Date();
                };

                $scope.start = function($event) {
                    $event.preventDefault();
                    $event.stopPropagation();

                    $scope.startOpened = true;
                };
                $scope.end = function($event) {
                    $event.preventDefault();
                    $event.stopPropagation();

                    $scope.endOpened = true;
                };

            	$scope.clearForm = function (){
		        	//clear form
					$scope.newListing.event = 'General';
        			$scope.newListing.headline = '';
        			$scope.newListing.message = '';
        			$scope.newListing.youtubeUrl = '';
        			$scope.newListing.imageName = undefined;
        			$scope.newListing.fileName = undefined;
        			$scope.newListing.originalFileName = undefined;
        			$scope.newListing.location = '';

        			$scope.imageUploaded = false;
        			$scope.fileUploaded = false;
        			
                    $scope.today();
            	};
            	
            	$scope.clearForm();

				$scope.$watch("newListing.startDate", function(newValue, oldValue) {
					if (angular.isDate(newValue)) {
						// check if end date is before start date
						if (!angular.isDate($scope.newListing.endDate) || $scope.newListing.endDate < $scope.newListing.startDate) {
							$scope.newListing.endDate = $scope.newListing.startDate;
						}
					}
				});

				$scope.addEvent = function() {
					
            		// check headline is 3 to 25 chars
            		if (!angular.isString($scope.newListing.headline) || $scope.newListing.headline == "" || $scope.newListing.headline.length < 3 || $scope.newListing.headline.length > 150) {
            			return false;
            		}
            		
            		// check message
            		if (!angular.isString($scope.newListing.message) || $scope.newListing.message == "" || $scope.newListing.message.length > 1024) {
            			return false;
            		}
					
					var req = {
							method: "create-event",
							params: {
								event: $scope.newListing.event,
								startDate: angular.isDate($scope.newListing.startDate) ? $scope.newListing.startDate.getTime(): null,
								startTime: null,
								endDate: angular.isDate($scope.newListing.endDate) ? $scope.newListing.endDate.getTime(): null,
								endTime: null,
								headline: $scope.newListing.headline,
								message: $scope.newListing.message,
								youtubeUrl: $scope.newListing.youtubeUrl,
								imageName: angular.isString($scope.newListing.imageName) ? $scope.newListing.imageName: "",
								fileName: angular.isString($scope.newListing.fileName) ? $scope.newListing.fileName: "",
								originalFileName: angular.isString($scope.newListing.originalFileName) ? $scope.newListing.originalFileName: "",
								location: $scope.newListing.location
							},
							jsonrpc:"2.0"
					};
					
					var url = "/api/jsonws/Events-portlet.event";
					
					var promise = $http.post(url, req).
						then(function(response) {
					
							// check for data
							if (!angular.isObject(response.data.result)) {
								console.error("addEvent: error occured:" + angular.toJson(response.data));
							}
							else {
								$("#eventsModal").modal("hide");
//								growl.success("Posting successfully added", {ttl: 3000});
							}
							
							//TODO
							// something went wrong. what todo?
				        	$scope.clearForm();
						},
						function() {
				        	$scope.clearForm();
						});
				};

            	$scope.uploadImage = function($files) {
            		
            		if ($files.length != 1) {
            			alert("no image selected for upload");
            			return;
            		}
             		
            		winwinFileUploadSvc.uploadEventsImage($files[0]).
	        			then(function(response) {
	        				// check if file is uploaded successfully
	        				if (angular.isString(response)) {
	        					$scope.newListing.imageName = response;
	        					$scope.imageUploaded = true;
	        				}
	        				else {
		        				$scope.newListing.imageName = undefined;
		        				$scope.imageUploaded = false;
	        				}
	        			},
	        			function() {
	        				// file is not uploaded
	        				$scope.newListing.imageName = undefined;
	        				$scope.imageUploaded = false;
	        			});
            	};
            	
            	$scope.removeImage = function() {
            		winwinFileUploadSvc.removeEventsImage($scope.newListing.imageName);
            		$scope.newListing.imageName = undefined;
            		$scope.imageUploaded = false;
            	};

            	$scope.uploadFile = function($files) {
            		
            		if ($files.length != 1) {
            			alert("no file selected for upload");
            			return;
            		}
             		
            		winwinFileUploadSvc.uploadEventsFile($files[0]).
	        			then(function(response) {
	        				// check if file is uploaded successfully
	        				if (angular.isString(response)) {
	        					$scope.newListing.fileName = response;
	        					$scope.newListing.originalFileName = $files[0].name;
	        					$scope.fileUploaded = true;
	        				}
	        				else {
		        				$scope.newListing.fileName = undefined;
	        					$scope.newListing.originalFileName = undefined;
		        				$scope.fileUploaded = false;
	        				}
	        			},
	        			function() {
	        				// file is not uploaded
	        				$scope.newListing.fileName = undefined;
        					$scope.newListing.originalFileName = undefined;
	        				$scope.fileUploaded = false;
	        			});
            	};
            	
            	$scope.removeFile = function() {
            		winwinFileUploadSvc.removeEventsFile($scope.newListing.fileName);
            		$scope.newListing.fileName = undefined;
					$scope.newListing.originalFileName = undefined;
            		$scope.fileUploaded = false;
            	};
				
            });
 
            myModule.controller("AddDashboardPostCntrl", function($scope, $http, winwinFileUploadSvc) {

            	// business wisdom
				$scope.postType = 2;
				$scope.newPost = {
					content: "" 
				};
            	
            	$scope.submitDashboardPost = function() {
            		
            		if ($scope.newPost.content.trim().length == 0) {
            			return;
            		}

					var req = {
						method: "create-dashboard-post",
						params: {
							dashboardPostTypeId: $scope.postType,
							filePath: null,
							content: $scope.newPost.content,
							sharedPostId: null
						},
						jsonrpc:"2.0"
					};
					
					var url = "/api/jsonws/Membership-portlet.dashboardpost";
        			$http.post(url, req).
    				then(function(response) {
    		
    					// check for data
    					if (angular.isObject(response.data.result)) {
   							$("#wisdomModal").modal("hide");
   							$scope.newPost.content = "";
    					}
    					else {
    						console.error("submitDashboardPost: error occured:" + angular.toJson(response.data));
    					}
    				},
    				function() {
						console.error("submitDashboardPost: error occured:" + angular.toJson(response));
    				});
            		
				};
            	
            });

            myModule.controller("AllianceMessageCntrl", function($scope, $http) {

            	// alliance message
				$scope.newMessage = {
					message: "" 
				};

				$scope.businessAlliances = [];
				$scope.selectedBusinessAlliances = [];

				$scope.selectBusinessAlliance = function(item, model, label) {
					// add selection to the selected list if not already in the list
					if ($scope.selectedBusinessAlliances.indexOf(item) == -1) {
						$scope.selectedBusinessAlliances.push(item);
					}
					
					// clear out the current entry
					$scope.selectedBusinessAlliance = "";
				};

				$scope.unselectBusinessAlliance = function(item) {
					// find the selection in the list
					var idx = $scope.selectedBusinessAlliances.indexOf(item);

					// remove the selection
					if (idx >= 0) {
						$scope.selectedBusinessAlliances.splice(idx, 1);
					}
				};
           	
            	$scope.submitAllianceMessage = function() {

            		// check that data was entered
            		if ($scope.newMessage.message.trim().length == 0 || $scope.selectedBusinessAlliances.length == 0) {
            			return;
            		}
            		
            		// create a list of businessIds
            		var businessIds = [];
            		angular.forEach($scope.selectedBusinessAlliances, function(item) {
            			businessIds.push(item.businessId);
            		});
            		
					var req = {
						method: "create-alliance-message",
						params: {
							businessIds: businessIds,
							message: $scope.newMessage.message
						},
						jsonrpc:"2.0"
					};
					
					var url = "/api/jsonws/Messaging-portlet.message";
        			$http.post(url, req).
    				then(function(response) {
    		
    					// check for data
    					if (angular.isObject(response.data.result)) {
   							$("#messageModal").modal("hide");
   							$scope.newMessage.message = "";
    					}
    					else {
    						console.error("submitAllianceMessage: error occured:" + angular.toJson(response.data));
    					}
    				},
    				function() {
						console.error("submitAllianceMessage: error occured:" + angular.toJson(response));
    				});
            		
				};
				
				var url = "/api/jsonws/Membership-portlet.business/get-allied-businesses-names";
				$http.get(url).
					then (function(response) {
						
						if (angular.isArray(response.data)) {
							$scope.businessAlliances = response.data;
						}
						
					});
            });

			return [ myModule.name ];
		});
	
	var mod;mod=angular.module("infinite-scroll",[]),mod.directive("infiniteScroll",["$rootScope","$window","$timeout",function(i,n,e){return{link:function(t,l,o){var r,c,f,a;return n=angular.element(n),f=0,null!=o.infiniteScrollDistance&&t.$watch(o.infiniteScrollDistance,function(i){return f=parseInt(i,10)}),a=!0,r=!1,null!=o.infiniteScrollDisabled&&t.$watch(o.infiniteScrollDisabled,function(i){return a=!i,a&&r?(r=!1,c()):void 0}),c=function(){var e,c,u,d;return d=n.height()+n.scrollTop(),e=l.offset().top+l.height(),c=e-d,u=n.height()*f>=c,u&&a?i.$$phase?t.$eval(o.infiniteScroll):t.$apply(o.infiniteScroll):u?r=!0:void 0},n.on("scroll",c),t.$on("$destroy",function(){return n.off("scroll",c)}),e(function(){return o.infiniteScrollImmediateCheck?t.$eval(o.infiniteScrollImmediateCheck)?c():void 0:c()},0)}}}]);

})(Liferay, angular, window, undefined);