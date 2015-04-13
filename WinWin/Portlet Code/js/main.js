(function(Liferay, angular, window, undefined)
{
    angular.portlet.add("alliance", "alliance", function()
    {
        var myModule = angular.module("myModule", ['infinite-scroll', 'nsPopover', 'ui.bootstrap', 'ngSanitize']);

        myModule.controller("AllianceCntrl", function($scope, $http) {
            $scope.start = 0;
            $scope.length = 5;
            $scope.totalLoaded = 0;
            $scope.pendingStart = 0;
            $scope.pendingLength = 5;
            $scope.pendingTotalLoaded = 0;
            $scope.recommendedStart = 0;
            $scope.recommendedLength = 5;
            $scope.recommendedTotalLoaded = 0;
            $scope.isBusy = false;
            $scope.pendingIsBusy = false;
            $scope.recommendedIsBusy = false;
            $scope.sponsor = null;
            $scope.currentView = 'list';
            
            $scope.currentTab = 'All';

            $scope.relationship = 'Any';
            $scope.industry = 'All';
            $scope.region = regionId;
            $scope.distance = 'All';
            $scope.businessName = '';

            $scope.newBusinessMessage = {};
            
            $scope.chosenRelationship = 'Any';
            $scope.chosenIndustry = 'All';
            $scope.chosenRegion = regionId;
            $scope.chosenBusinessName = '';
            $scope.chosenDistance = '0';
            $scope.businessDetail = null;
            $scope.bounds = new google.maps.LatLngBounds();

            $scope.map = null;

            $scope.infoWindow = new google.maps.InfoWindow();

            $scope.markerIcon = "/WinWinTheme-theme/images/assets/map_marker.png";

            $scope.doRecommendedSearchClear = function()
            {
            	 $scope.recommended = [];
            	 $scope.recommendedTotalLoaded = 0;
            	 $scope.recommendedIsBusy = false;
            	 $scope.loadmoreRecommended();
            };
            
            doRecommendedSearchClear = $scope.doRecommendedSearchClear;
            
            $scope.sendAllianceRequest = function(bus)
            {
                $http.get('/api/jsonws/Membership-portlet.business/request-alliance/user-id/' + userId + '/business-id/' + bus.businessId).
                    success(function(data)
                    {
                        //alert(JSON.stringify(data));
                    	bus.pendingInvite = true;
                        
                        $scope.businesses = [];
                        $scope.pendingStart = 0;
                        $scope.pendingTotalLoaded = 0;
                        $scope.loadmorePending();
                    });
            };

            $scope.acceptAllianceRequest = function(event, companyId, allianceRequestId, businessId)
            {
                //alert('acceptAllianceRequest - businessId: ' + businessId);

                var query = '/api/jsonws/Membership-portlet.business/accept-alliance-request' + 
                '/user-id/' + userId + 
                '/company-id/' + companyId +
                '/alliance-request-id/' + allianceRequestId + 
                '/business-id/' + businessId;

                $http.get(query).
                    success(function(data)
                    {
                        var counter = 0;

                        for(var i = 0;  i < $scope.businesses.length; i++)
                        {
                            //alert($scope.businesses[i].businessId);

                            if ($scope.businesses[i].businessId == businessId)
                                break;

                            counter++;
                        }

                        $scope.businesses = $scope.businesses.slice(0, counter).concat($scope.businesses.slice(counter + 1, $scope.businesses.length));
                        $scope.pendingTotalLoaded = $scope.pendingTotalLoaded - 1;
                        
                        if ($scope.businesses.length == 0)
                        	$scope.loadmorePending();
                    });

                //alert('counter: ' + counter);
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

            $scope.applyDetails = function(event, business)
            {
                $scope.businessDetail=business;
                //alert('applied details: ' + JSON.stringify($scope.businessDetail));
            };

            $scope.reset = function()
            {
                $scope.relationship = 'Any';
                $scope.industry = 'All';
                $scope.relationship = 'All';
                $scope.businessName = '';
                $scope.distance = 'All';

                $scope.chosenRelationship = 'Any';
                $scope.chosenIndustry = 'All';
                $scope.chosenRelationship = 'All';
                $scope.chosenBusinessName = '';
                $scope.chosenDistance = 0;
                $scope.sponsor = null;
            };

            $scope.search = function()
            {
                $scope.chosenRelationship = $scope.relationship;
                $scope.chosenIndustry = $scope.industry;
                $scope.chosenRegion = $scope.region;
                $scope.chosenBusinessName = $scope.businessName;
                $scope.chosenDistance = $scope.distance;
                $scope.sponsor = null;
                
                $scope.totalLoaded = 0;
                $scope.alliances = [];

                $scope.loadmore();
            };

            $scope.loadmore = function()
            {
                if($scope.currentTab != 'All')
                    return;

                if($scope.isBusy === true || $scope.currentView == 'map')
                    return; // request in progress, return

                $scope.isBusy = true;

                //alert('loadmore');

                var query = '/api/jsonws/Membership-portlet.business/find-businesses' +
                	'/user-id/' + userId + 
                    '/relationship/' + $scope.chosenRelationship +
                    '/industry/' + $scope.chosenIndustry +
                    '/region/' + $scope.chosenRegion + 
                    '/distance/' + $scope.chosenDistance;

                if ($scope.chosenBusinessName && $scope.chosenBusinessName.length > 0)
                    query = query + '/business-name/' + $scope.chosenBusinessName;

                query = query + '/start/' + $scope.totalLoaded +
                    '/length/' + $scope.length;

                $http.get(query).
                    success(function(data)
                    {
                        for(var i = 0; i < data.length; i++)
                        {
                            $scope.alliances.push(data[i]);
                            //alert(JSON.stringify(data[i]));
                            
                            if ($scope.map == null)
                            {
                            	//alert('create map');
                            	
                                $scope.map = new google.maps.Map(document.getElementById('map-canvas'), {
                                    center: new google.maps.LatLng(data[i].lattitude, data[i].longitude),
                                    zoom: 10
                                });
                            }
                            
                            var loc = new google.maps.LatLng(data[i].lattitude, data[i].longitude);

                            new google.maps.Marker({
                                map: $scope.map,
                                position: loc,
                                icon: $scope.markerIcon,
                                title: data[i].name
                            });

                            $scope.bounds.extend(loc);
                        }

                        $scope.totalLoaded = $scope.totalLoaded + data.length;

                        $scope.isBusy = false;
                    });
                
                if ($scope.sponsor == null)
                {
                	//alert('load sponsor');
                	
	                var sponsorQuery = '/api/jsonws/Membership-portlet.business/get-sponsored-business-by-user-id-industry-id/' +
	            	'/user-id/' + userId + 
	                '/industry-id/' + $scope.chosenIndustry;
	
	                $http.get(sponsorQuery).
		                success(function(data)
		                {
		                	//alert('sponsor: ' + JSON.stringify(data));
		                	
		                	$scope.sponsor = data;
		                });
               }
                
            };

            $scope.sendRequest = function(element){
                // implement javascript at the end
            };

            $scope.showAll = function(element){
                $scope.currentTab = 'All';
                //alert('All');
            };

            $scope.showPending = function(element){
                $scope.currentTab = 'Pending';

                if ($scope.pendingTotalLoaded == 0)
                    $scope.loadmorePending();
                //alert('Pending');
            };

            $scope.pendingToAll = function() {
            	$scope.showAll();
            	$('#pendingTab').removeClass('active');
            	$('#allTab').addClass('active');            	
            };
            
            $scope.showRecommended = function(element){
                $scope.currentTab = 'Recommended';
                
                if ($scope.recommendedTotalLoaded == 0)
                	$scope.loadmoreRecommended();
                
                //alert('Recommended');
            };
            
            $scope.showHelp = function(element){
                $scope.currentTab = 'Help';
            };

            $scope.loadmorePending = function()
            {
                if($scope.currentTab != 'Pending')
                    return;

                if($scope.pendingIsBusy === true)
                    return; // request in progress, return

                if($scope.isBusy === true || $scope.currentView == 'map')
                    return; // request in progress or in map view, return

                $scope.pendingIsBusy = true;

                //alert('loadmore pending');

                var query = '/api/jsonws/Membership-portlet.business/get-pending-alliance-request-businesses/user-id/' + userId;
                query = query + '/start/' + $scope.pendingTotalLoaded + '/length/' + $scope.pendingLength;

                $http.get(query).
                    success(function(data)
                    {
                        for(var i = 0; i < data.length; i++)
                        {
                            $scope.businesses.push(data[i]);
                            //alert(JSON.stringify(data[i]));
                        }

                        $scope.pendingTotalLoaded = $scope.pendingTotalLoaded + data.length;

                        $scope.pendingIsBusy = false;
                    });
            };
            
            $scope.loadmoreRecommended = function()
            {
            	//alert('loadmore recommended');
            	
                if($scope.currentTab != 'Recommended')
                    return;

                if($scope.recommendedIsBusy === true)
                    return; // request in progress, return

                if($scope.isBusy === true || $scope.currentView == 'map')
                    return; // request in progress or in map view, return

                $scope.recommendedIsBusy = true;

                var query = '/api/jsonws/Membership-portlet.business/find-user-join-alliance-businesses/user-id/' + userId;
                query = query + '/start/' + $scope.recommendedTotalLoaded + '/length/' + $scope.recommendedLength;

                $http.get(query).
                    success(function(data)
                    {
                    	//alert(JSON.stringify(data));
                    	
                        for(var i = 0; i < data.length; i++)
                        {
                            $scope.recommended.push(data[i]);
                            //alert(JSON.stringify(data[i]));
                        }

                        $scope.recommendedTotalLoaded = $scope.recommendedTotalLoaded + data.length;

                        $scope.recommendedIsBusy = false;
                    });
            };
            
            $scope.showBusinessAwards = function(){
              //console.log("clicked on awards tabs inside popover");
               //$scope.getBusinessAwards();

            };
            $scope.showBusinessProducts = function(){
                //console.log("clicked on products tabs inside popover");
                //$scope.getBusinessProducts();
            };
            $scope.showBusinessServices = function(){
                //console.log("clicked on services tabs inside popover");
                //$scope.getBusinessServices();
            };

            $scope.listView = function()
            {
                if ($scope.currentView == 'list')
                    return;

                $('#listView').toggle();
                $('#mapView').toggle();
                $('#content-filter').toggle();
                
                $scope.currentView = 'list';
            };

            $scope.mapView = function()
            {
                if ($scope.currentView == 'map')
                    return;

                //alert('map view');
                
                $('#listView').toggle();
                $('#mapView').toggle();
                $('#content-filter').toggle();
                
                $scope.currentView = 'map';

                //alert('scope.map: ' + $scope.map);
                
                google.maps.event.trigger($scope.map, 'resize');

                //$scope.map.setZoom(5);

                $scope.map.fitBounds($scope.bounds);
                $scope.map.panToBounds($scope.bounds);

                //alert('pan to bounds');
                
                //alert('fitBounds: sw: ' + $scope.swLat + ", " + $scope.swLon + "\n" + "ne: " + $scope.neLat + ', ' + $scope.neLon);

                //$scope.map.fitBounds(new google.maps.LatLngBounds(
                //		new google.maps.LatLng($scope.swLat, $scope.swLon),
                //		new google.maps.LatLng($scope.neLat, $scope.neLong)));
            };

            $scope.businesses = [];
            $scope.alliances = [];
            $scope.recommended = [];
        });

        return [ myModule.name ];
    });

    var mod;mod=angular.module("infinite-scroll",[]),mod.directive("infiniteScroll",["$rootScope","$window","$timeout",function(i,n,e){return{link:function(t,l,o){var r,c,f,a;return n=angular.element(n),f=0,null!=o.infiniteScrollDistance&&t.$watch(o.infiniteScrollDistance,function(i){return f=parseInt(i,10)}),a=!0,r=!1,null!=o.infiniteScrollDisabled&&t.$watch(o.infiniteScrollDisabled,function(i){return a=!i,a&&r?(r=!1,c()):void 0}),c=function(){var e,c,u,d;return d=n.height()+n.scrollTop(),e=l.offset().top+l.height(),c=e-d,u=n.height()*f>=c,u&&a?i.$$phase?t.$eval(o.infiniteScroll):t.$apply(o.infiniteScroll):u?r=!0:void 0},n.on("scroll",c),t.$on("$destroy",function(){return n.off("scroll",c)}),e(function(){return o.infiniteScrollImmediateCheck?t.$eval(o.infiniteScrollImmediateCheck)?c():void 0:c()},0)}}}]);

})(Liferay, angular, window, undefined);
