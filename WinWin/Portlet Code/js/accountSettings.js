(function(Liferay, angular, window, undefined) 
{
	angular.portlet.add("account-settings", "account-settings", function() 
	{
		//alert('adding angular portlet. userId: ' + userId);
		
			var myModule = angular.module("myModule", ['infinite-scroll', 'ui.bootstrap', 'ngResource', 'httpPrefix', 'validPassword',  'WinWinFileUploadModule']);
			

            myModule.controller("AccountSettingsCntrl", function($scope, $http, $resource, $timeout, winwinFileUploadSvc) 
            {
				$scope.start = 0;
				$scope.length = 5;
				$scope.totalLoaded = 0;
				$scope.isBusy = false;
                $scope.result = '';
                $scope.options = '';
                $scope.newMode = 'add';
                $scope.productServiceSelectDisabled = false;
                $scope.contactMode = 'add';
                $scope.locationMode = 'add';
                $scope.departmentMode = 'add';
                $scope.employeeMode = 'add';
                $scope.newContact = {};
                $scope.newLocation = {};
                $scope.newDepartment = {};
                $scope.newEmployee = {};
                $scope.contactIdToRemove = 0;
                $scope.departmentIdToRemove = 0;
                $scope.business = {};
                $scope.currentEmployee = {};
                $scope.currentEmployeeToRemove = {}; 
                $scope.invitedEmployees = [];
                $scope.invitedDepartments = [];
                $scope.invitedLocations = [];                           
                $scope.logoReq = {};
                
                //form regex
                $scope.onlyNumbers = /^\d+$/i;
                $scope.onlyLetters = /^[a-z]+$/i
                $scope.alphaNumeric = /^[a-z0-9 ]+$/i;
                $scope.pswdPattern = /(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z])/;
                $scope.facebookURL = /^(https?:\/\/)?((w{3}\.)?)facebook.com\/.*/i;
                $scope.twitterURL = /^(https?:\/\/)?((w{3}\.)?)twitter\.com\/(#!\/)?[a-z0-9_]+$/i;
                $scope.linkedinURL = /^(https?:\/\/)?((w{3}\.)?)linkedin.com\/.*/i;
                $scope.youtubeURL = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
                
                $scope.newItemTypes = [
	                 {name:'product', display:'Product'},
	                 {name:'service', display:'Service'}
	            ];

                $scope.newItemType = $scope.newItemTypes[0];
                
                /*== Business Contact Info tab ==*/
                $scope.businessWebsite = "http://";

                /*
                 json object returned by google's places api we need to figure out a way to
                 parse the address_components object in order to seperate the address and store the state, city, zip seperately
                 those fields are currently hidden...
                 */
                $scope.addrDetails = [];

                //additional contacts
                $scope.businessContTitle = ""; // not sure what name we should give this I am gussining that his will be modeled a litte differently then regular business contact info
                $scope.businessContName = "";
                $scope.businessContNumber = "";
                $scope.businessContExt = "";
                $scope.businessProducts = [];
                $scope.businessServices = [];
                $scope.businessUsers = [];
                $scope.locations = [];
                $scope.departments = [];
                //$scope.emailNotificationSettings = {};
                $scope.member = {};
                $scope.businessImages = [];
                
                $scope.currentNotifications = {};

                /*== Business Manage User tab ==*/
                	
                /*
                $scope.businessUsrName = "";
                $scope.businessUsrEmail = "";
                $scope.businessUsrRole = {};
                $scope.businessUsrStatus = {
                    activate: "",
                    activated: "",
                    delete: ""
                };
                */
                
                /*== Business Password reset ==*/

                $scope.businessPswd = "aaa";
                $scope.password = "";
                $scope.businessConfirmPswd = "";
                
                $scope.saveNewPswd = function(){
                	//alert("save password function");
                };

                /*== Business Support ==*/
                $scope.support = {
                    subject: '',
                    issue: '',
                    create: true,
                    current: false,
                    saved:  false,

                    send: function()
                    {	
                    	var query = '/api/jsonws/Membership-portlet.business/send-support-ticket?' + 
                    	'subject=' + encodeURIComponent($scope.support.subject) +
                    	'&issue=' + encodeURIComponent($scope.support.issue);
                	
	                	$http.put(query).
				        success(function(data) 
				        {	
				        	$scope.support.subject = '';
				        	$scope.support.issue = '';
				        	alert("support ticket sent!");				        	
				        });                    	                        
                    }
                };
                                           
                $scope.uploadImage = function($files) {
            		
            		if ($files.length != 1) {
            			//alert("no image selected for upload");
            			return;
            		}
             		
            		winwinFileUploadSvc.uploadBusinessLogoImage($files[0]).
	        			then(function(response) {
	        				// check if file is uploaded successfully
	        				//alert('response: ' + JSON.stringify(response));
	        				
	        				if (angular.isString(response)) {
	        					var query = '/api/jsonws/Membership-portlet.business/update-business-logo?logoPath=' + encodeURIComponent(response);
	                        	
	                        	$http.post(query).
	        			        success(function(data) 
	        			        {			        					
	        			        	$scope.business.logo = response;
	        			        });
	        				}	        				
	        			},
	        			function() {
	        				// file is not uploaded	        			
	        			});
            	};
            	
                /*
                 *
                 *
                 *  Apply New/Remove data
                 *
                 * */

                $scope.applyContact = function(contact)
                {
                	$scope.newContact.businessContactId = contact.businessContactId 
                	$scope.newContact.title = contact.title 
                	$scope.newContact.name = contact.name
                	$scope.newContact.phone = contact.phone 
                	$scope.newContact.phoneExt = contact.phoneExt 
                	$scope.newContact.email = contact.email
                	
                	$scope.contactMode = 'edit';
                };

                $scope.applyLocation = function(location)
                {
                	$scope.newLocation.locationId = location.locationId;
                	$scope.newLocation.email = location.email;
                	$scope.newLocation.street = location.street;
                	$scope.newLocation.street2 = location.street2;
                	$scope.newLocation.city = location.city;
                	$scope.newLocation.state = location.state;
                	$scope.newLocation.postalCode = location.zip;
                	
                	$scope.locationMode = 'edit';
                };
                
                $scope.applyDepartment = function(department)
                {
                	//alert('department: ' + JSON.stringify(department));
                	
                	$scope.newDepartment.departmentId = department.departmentId;
                	$scope.newDepartment.departmentName = department.departmentName;                	
                	
                	$scope.departmentMode = 'edit';
                };
                
                $scope.applyContactToRemove = function(contact)
                {
                	//alert('contact: ' + JSON.stringify(contact));
                	$scope.contactIdToRemove = contact.businessContactId;
                };

                $scope.applyLocationToRemove = function(location)
                {
                	//alert('contact: ' + JSON.stringify(contact));
                	$scope.locationIdToRemove = location.locationId;
                };
                
                $scope.applyDepartmentToRemove = function(department)
                {
                	$scope.departmentIdToRemove = department.departmentId;
                };
                
                $scope.applyProduct = function(product)
                {
                	//alert('product: ' + JSON.stringify(product));
                	
                	$scope.newItemType = $scope.newItemTypes[0];
                	$scope.newName = product.productName;
                	$scope.newDescription = product.productDescription;
                	$scope.productServiceSelectDisabled = true;
                	$scope.newMode = 'edit';
                	$scope.newId = product.businessProductId;
                	//alert($scope.newItemType);
                };
                
                $scope.applyService = function(service)
                {
                	//alert('service: ' + JSON.stringify(service));
                	
                	$scope.newItemType = $scope.newItemTypes[1];
                	$scope.newName = service.serviceName;
                	$scope.newDescription = service.serviceDescription;
                	$scope.productServiceSelectDisabled = true;
                	$scope.newMode = 'edit';
                	$scope.newId = service.businessServicesId;
                	//alert($scope.newItemType);
                };
                
                $scope.applyServiceToRemove = function(service)
                {
                	$scope.idToRemove = service.businessServicesId;
                	$scope.typeToRemove = 'service';
                	console.log('remove service');
                };
                
                $scope.applyProductToRemove = function(product)
                {
                	$scope.idToRemove = product.businessProductId;
                	$scope.typeToRemove = 'product';
                	console.log('remove product');
                };
                
                $scope.removeServiceProduct = function()
                {
                	//alert('idToRemove: ' + $scope.idToRemove);
                	//alert('typeToRemove: ' + $scope.typeToRemove);
                	
                	var removeQuery = '/api/jsonws/Membership-portlet.business/remove-business-product-service' + 
            		'/id/' + $scope.idToRemove + 
            		'/user-id/' + userId +
            		'/type/' + $scope.typeToRemove;
                	
                	$http.get(removeQuery).
			        success(function(data) 
			        {			 			  
			        	//alert('need to remove deleted item from list');
			        	
			        	if ($scope.typeToRemove == 'product')
			        	{
			        		$scope.loadProducts();
			        	}
			        	
			        	if ($scope.typeToRemove == 'service')
			        	{
			        		$scope.loadServices();
			        	}
			        	
			        	$scope.idToRemove = -1;
			        	$scope.typeToRemove = null;
			        	$scope.newMode = 'add';
			        	$scope.productServiceSelectDisabled = false;
			        });
                };
                
                $scope.applyPending = function (pending){

                };
                
                $scope.applyCurrentEmployee = function (current)
                {
                	$scope.currentEmployee = current;
                	//alert(JSON.stringify(current));
                };
                
                $scope.applyPendingToRemove = function (pending){

                };
                
                $scope.applyCurrentEmployeeToRemove = function (current)
                {
                	//alert('employee to remove: ' + JSON.stringify(current));
                	$scope.currentEmployeeToRemove = current;
                };
                /*
                *
                *  Remove Data
                *
                * */
                $scope.removeLocation = function()
                {
                	var removeQuery = '/api/jsonws/Membership-portlet.location/remove-location' + 
            		'/id/' + $scope.locationIdToRemove + 
            		'/user-id/' + userId;
                	
                	$http.get(removeQuery).
			        success(function(data) 
			        {			 			  
			        	$scope.loadLocations();
			        	
			        	$scope.locationIdToRemove = 0;
			        });
                };
                
                $scope.removeDepartment = function()
                {
                	var removeQuery = '/api/jsonws/Membership-portlet.department/remove-department' + 
            		'/id/' + $scope.departmentIdToRemove + 
            		'/user-id/' + userId;
                	
                	$http.get(removeQuery).
			        success(function(data) 
			        {			 			  
			        	$scope.loadDepartments();
			        	
			        	$scope.departmentIdToRemove = 0;
			        });
                };
                
                $scope.removeContact = function()
                {
                	var removeQuery = '/api/jsonws/Membership-portlet.businesscontact/remove-business-contact?' + 
            		'id=' + encodeURIComponent($scope.contactIdToRemove) + 
            		'&userId=' + encodeURIComponent(userId);
                	
                	$http.get(removeQuery).
			        success(function(data) 
			        {			 			  
			        	$scope.loadContacts();
			        	
			        	$scope.contactIdToRemove = 0;
			        });
                };
                
                $scope.removeEmployee = function ()
                {
                	//alert('removing employee: ' + JSON.stringify($scope.currentEmployeeToRemove));
                	
                    var removeQuery = '/api/jsonws//Membership-portlet.employee/delete-employee?userId=' + $scope.currentEmployeeToRemove.userId;

                    $http.post(removeQuery).
                        success(function(data)
                        {
                        	$scope.loadBusinessUsers();
    						$scope.loadPendingEmployees();
    						$scope.loadInvitedEmployees();
                            $scope.employeeIdToRemove = {};
                        });
                };

                $scope.cancelMyAccount = function ()
                {
                	//alert('cancel my account called');
                	
                    var removeQuery = '/api/jsonws/Membership-portlet.business/cancel-my-account';

                    $http.post(removeQuery).
                        success(function(data)
                        {
                        	window.location.href="/c/portal/logout";
                        });
                };
                
                /*
                *
                * Load Data
                *
                * */

                /*
                $scope.loadEmailNotifications = function()
                {
                	var notificationQuery = '/api/jsonws/Membership-portlet.emailnotificationsettings/get-email-notification-settings-by-user-id/' +                 	
                	'/user-id/' + userId;

					$http.get(notificationQuery).
			        success(function(data) 
			        {
			        	$scope.emailNotificationSettings = data;			        	
			        });              
                };
                */
                
                $scope.loadMember = function()
                {
                	var memberQuery = '/api/jsonws/Membership-portlet.member/get-member-by-user-id/' +                 	
                	'/user-id/' + userId;

					$http.get(memberQuery).
			        success(function(data) 
			        {
			        	$scope.member = data;	
			        	
			        	$scope.currentNotifications.emailRequestAlliance = $scope.member.emailRequestAlliance;
			        	$scope.currentNotifications.emailApproveAlliance = $scope.member.emailApproveAlliance;
			        	$scope.currentNotifications.emailCommentsOnPosts = $scope.member.emailCommentsOnPosts;
			        	$scope.currentNotifications.emailSendsPrivateMessage = $scope.member.emailSendsPrivateMessage;
			        	$scope.currentNotifications.emailNewFeatures = $scope.member.emailNewFeatures;
			        	
			        	//alert(JSON.stringify(data));
			        });              
                };
                
                $scope.resetNotificationForm = function()
                {
                	$scope.member.emailRequestAlliance = $scope.currentNotifications.emailRequestAlliance;
                	$scope.member.emailApproveAlliance = $scope.currentNotifications.emailApproveAlliance;
                	$scope.member.emailCommentsOnPosts = $scope.currentNotifications.emailCommentsOnPosts;
                	$scope.member.emailSendsPrivateMessage = $scope.currentNotifications.emailSendsPrivateMessage;
                	$scope.member.emailNewFeatures = $scope.currentNotifications.emailNewFeatures;		        	
                };
                
                $scope.loadInvitedEmployees = function()
                {
                	var query = '/api/jsonws/Membership-portlet.employee/get-invited-employees';
                	
                	$http.get(query).
			        success(function(data) 
			        {
			        	$scope.invitedEmployees = data;	
			        	//alert(JSON.stringify(data));
			        });
                };
                
                $scope.loadInvitedDepartments = function()
                {
                	var query = '/api/jsonws/Membership-portlet.department/get-invited-departments';
                	
                	$http.get(query).
			        success(function(data) 
			        {
			        	$scope.invitedDepartments = data;	
			        	//alert(JSON.stringify(data));
			        });
                };
                
                $scope.loadInvitedLocations = function()
                {
                	var query = '/api/jsonws/Membership-portlet.location/get-invited-locations';
                	
                	$http.get(query).
			        success(function(data) 
			        {
			        	$scope.invitedLocations = data;	
			        	//alert(JSON.stringify(data));
			        });
                };
                
                $scope.loadPendingEmployees = function()
                {
                	var employeeQuery = '/api/jsonws/Membership-portlet.businessemployeerequest/get-business-employee-requests-by-user-id-business-id/' +                 	
                	'/user-id/' + userId +
                	'/business-id/' + businessId +
                	'/status-cd/P';

					$http.get(employeeQuery).
			        success(function(data) 
			        {
			        	$scope.pendingEmployees = data;
			        	//alert(JSON.stringify(data));
			        });              
                };
                
                $scope.loadLocations = function()
                {
                	var locationsQuery = '/api/jsonws/Membership-portlet.location/get-locations-by-business-id' + 
                	'/business-id/' + businessId +
                	'/user-id/' + userId;

					$http.get(locationsQuery).
			        success(function(data) 
			        {
			        	$scope.locations = data;
			        	//alert('locations: ' + JSON.stringify(data));
			        });              
                };
                
                $scope.loadDepartments = function()
                {
                	var departmentsQuery = '/api/jsonws/Membership-portlet.department/get-departments-by-business-id' + 
                	'/business-id/' + businessId +
                	'/user-id/' + userId;

					$http.get(departmentsQuery).
			        success(function(data) 
			        {
			        	$scope.departments = data;
			        	//alert('departments: ' + JSON.stringify(data));
			        });              
                };
                
                $scope.loadBusiness = function ()
                {
                	var businessQuery = '/api/jsonws/Membership-portlet.business/get-business-by-user-id/user-id/' + userId;

					$http.get(businessQuery).
			        success(function(data) 
			        {
			        	$scope.business = data;
			        	//alert(JSON.stringify(data));
			        });
                };
                
                $scope.loadBusinessUsers = function ()
                {
                	var businessUsersQuery = '/api/jsonws/Membership-portlet.business/get-employees-by-business-id' + 
                	'/business-id/' + businessId;

					$http.get(businessUsersQuery).
			        success(function(data) 
			        {
			        	$scope.businessUsers = data;
			        	//alert(JSON.stringify(data));
			        });
                };
                
                $scope.loadLocation = function () 
                {
                	var locationQuery = '/api/jsonws/Membership-portlet.business/get-location-for-business/business-id/' + businessId;
					
					$http.get(locationQuery).
			        success(function(data) 
			        {
			        	$scope.location = data;
			        	//alert(JSON.stringify(data));
			        });
                };
                
                $scope.loadProducts = function () 
                {
                	var productsQuery = '/api/jsonws/Membership-portlet.business/get-business-products-by-user-id/user-id/' + userId;
					
					$http.get(productsQuery).
			        success(function(data) 
			        {
			        	$scope.businessProducts = data;
			        	//alert(JSON.stringify(data));
			        });
                };
                
                $scope.loadContacts = function () 
                {
                	var contactsQuery = '/api/jsonws/Membership-portlet.businesscontact/get-business-contacts-by-user-id/user-id/' + userId;
					
					$http.get(contactsQuery).
			        success(function(data) 
			        {
			        	$scope.businessContacts = data;
			        	//alert(JSON.stringify(data));
			        });
                };
                
                $scope.loadServices = function ()
                {
                	var servicesQuery = '/api/jsonws/Membership-portlet.business/get-business-services-by-user-id/user-id/' + userId;
					
					$http.get(servicesQuery).
			        success(function(data) 
			        {
			        	$scope.businessServices = data;
			        	//alert(JSON.stringify(data));
			        });
                };

                /*
                *
                * Clear Lite Boxes
                *
                * */
                $scope.clearLocationPopup = function()
                {
                	$scope.newLocation.locationId = 0;
                	$scope.newLocation.email = '';
                	$scope.newLocation.street = '';
                	$scope.newLocation.street2 = '';
                	$scope.newLocation.city = '';
                	$scope.newLocation.state = '';
                	$scope.newLocation.postalCode = '';
                	
                	$scope.locationMode = 'add';
                };
                
                $scope.clearDepartmentPopup = function()
                {
                	$scope.newDepartment.departmentId = 0;
                	$scope.newDepartment.departmentName = '';                	
                	
                	$scope.departmentMode = 'add';
                };
                
                $scope.clearServicePopup = function ()
                {
                	$scope.newItemType = $scope.newItemTypes[0];
                	$scope.newName = '';
                	$scope.newDescription = '';
                	$scope.newMode = 'add';
                	$scope.productServiceSelectDisabled = false;
                	$scope.newId = 0;
                };
                
                $scope.clearContactPopup = function ()
                {
                	$scope.newContact.title = '';
                	$scope.newContact.name = '';
                	$scope.newContact.phone = '';               
                	$scope.newContact.phoneExt = '';
                	$scope.newContact.email = '';
                	$scope.contactIdToRemove = 0;
                	$scope.contactMode = 'add';
                };
                $scope.clearEmployeePopup = function ()
                {
                    console.log('cleared employee popup');
                    $scope.newEmployee.employeeId = 0;
                    $scope.newEmployee.email = '';
                    $scope.newEmployee.firstName = '';
                    $scope.newEmployee.lastName = '';
                    $scope.newEmployee.departmentName = '';
                    $scope.employeeMode = 'add';
                };
            
                $scope.addServiceProduct = function ()
                {
                	//alert('newItemType: ' + JSON.stringify($scope.newItemType));
                	
                	var saveQuery = '';
                	
                	if ($scope.newMode == 'add')
                	{
	                	if ($scope.newItemType.name == 'product')
	                	{
	                		saveQuery = '/api/jsonws/Membership-portlet.business/add-business-product?' + 
	                		'businessId=' + encodeURIComponent(businessId) + 
	                		'&productName=' + encodeURIComponent($scope.newName) + 
	                		'&productDescription=' + encodeURIComponent($scope.newDescription) +
	                		'&userId=' + encodeURIComponent(userId);                	
	                	}
	                	else
	                	{
	                		saveQuery = '/api/jsonws/Membership-portlet.business/add-business-service?' + 
	                		'businessId=' + encodeURIComponent(businessId) + 
	                		'&serviceName=' + encodeURIComponent($scope.newName) + 
	                		'&serviceDescription=' + encodeURIComponent($scope.newDescription) +
	                		'&userId=' + encodeURIComponent(userId);  
	                	}
	                		
	                	$http.get(saveQuery).
				        success(function(data) 
				        {
				        	if (data > 0)
		                	{
		                		//alert('newItemType: ' + $scope.newItemType);
		                		
		                		if ($scope.newItemType.name == 'product')
		                		{	
			                		$scope.loadProducts();
		                		}
		            			else
		            			{
		            				$scope.loadServices();
		            			}
		                	}	          
				        	
				        	$scope.clearServicePopup();
				        });
                	}
                	
                	if ($scope.newMode == 'edit')
                	{
                		if ($scope.newItemType.name == 'product')
	                	{
	                		saveQuery = '/api/jsonws/Membership-portlet.business/update-business-product?' + 
	                		'businessProductId=' + encodeURIComponent($scope.newId) + 
	                		'&productName=' + encodeURIComponent($scope.newName) + 
	                		'&productDescription=' + encodeURIComponent($scope.newDescription) +
	                		'&userId=' + encodeURIComponent(userId);                	
	                	}
	                	else
	                	{
	                		saveQuery = '/api/jsonws/Membership-portlet.business/update-business-service?' + 
	                		'businessServiceId=' + encodeURIComponent($scope.newId) + 
	                		'&serviceName=' + encodeURIComponent($scope.newName) + 
	                		'&serviceDescription=' + encodeURIComponent($scope.newDescription) +
	                		'&userId=' + encodeURIComponent(userId);  
	                	}
	                		
	                	$http.get(saveQuery).
				        success(function(data) 
				        {
				        	if (data > 0)
		                	{
		                		//alert('add to existing item list');
		                		
		                		if ($scope.newItemType.name == 'product')
		                		{			                			
			                		$scope.loadProducts();
		                		}
		            			else
		            			{		            				
		            				$scope.loadServices();		            				
		            			}
		                	}
				        					       
				        	$scope.clearServicePopup();
				        });
                	}
                };

                $scope.addContact = function ()
                {
                	var saveQuery = null;
                	
                	if ($scope.contactMode == 'add')
                	{
                		saveQuery = '/api/jsonws/Membership-portlet.businesscontact/add-business-contact?' + 
                		'businessId=' + businessId + 
                		'&title=' + encodeURIComponent($scope.newContact.title) + 
                		'&name=' + encodeURIComponent($scope.newContact.name) +
                		'&phone=' + encodeURIComponent($scope.newContact.phone) +
                		'&phoneExt=' + encodeURIComponent($scope.newContact.phoneExt) + 
                		'&email=' + encodeURIComponent($scope.newContact.email) + 
                		'&userId=' + userId; 
                		
                		$http.put(saveQuery).
    			        success(function(data) 
    			        {			        	
    			        	if (data > 0)
    	                	{
    	                		$scope.loadContacts();
    	                	}	          
    			        	
    			        	$scope.clearContactPopup();
    			        });
                	}
                	
                	if ($scope.contactMode == 'edit')
                	{
                		saveQuery = '/api/jsonws/Membership-portlet.businesscontact/update-business-contact?' + 
                		'businessContactId=' + encodeURIComponent($scope.newContact.businessContactId) + 
                		'&title=' + encodeURIComponent($scope.newContact.title) + 
                		'&name=' + encodeURIComponent($scope.newContact.name) +
                		'&phone=' + encodeURIComponent($scope.newContact.phone) + 
                		'&phoneExt=' + encodeURIComponent($scope.newContact.phoneExt) + 
                		'&email=' + encodeURIComponent($scope.newContact.email) + 
                		'&userId=' + encodeURIComponent(userId);  
                		
                		$http.post(saveQuery).
    			        success(function(data) 
    			        {			        	
    			        	if (data > 0)
    	                	{
    	                		$scope.loadContacts();
    	                	}	          
    			        	
    			        	$scope.clearContactPopup();
    			        });
                	}
                	
                	
                };
                
				$scope.currentTab = 'All';
				
				$scope.loadData = function()  
				{
					//alert('loadData called');
					
					if($scope.isBusy === true) 
						return; // request in progress, return
				
					$scope.isBusy = true;

					$scope.loadBusiness();
					
					$scope.loadLocation();
					$scope.loadLocations();
					
					var userQuery = '/api/jsonws/user/get-user-by-id/user-id/' + userId;
					
					$http.get(userQuery).
			        success(function(data) 
			        {
			        	$scope.user = data;
			        });
					
					$scope.loadProducts();
					$scope.loadServices();
					$scope.loadContacts();
					$scope.loadBusinessUsers();
					$scope.loadDepartments();
					$scope.loadMember();
					$scope.loadPendingEmployees();
					$scope.loadInvitedEmployees();
					$scope.loadInvitedDepartments();
					$scope.loadInvitedLocations();
					
				};

                /*
                 *  Field Validation
                 * */
                $scope.saveForm = function() {
                    $scope.$broadcast('show-errors-check-validity');

                    if ($scope.businessForm.$valid) {
                       // alert('User saved');
                        $scope.reset();
                    }
                };

                $scope.reset = function() {
                    $scope.$broadcast('show-errors-reset');
                   // $scope.business = {
                   //     email: '',
                   //     address: '',
                   //     phone_number: ''
                   // };
                };

                $scope.saveLocation = function() 
                {            
                	var query = '/api/jsonws/Membership-portlet.location/send-location-invite?' +                  	
                	'email=' + encodeURIComponent($scope.newLocation.email) + "&" +            
            		'street=' + encodeURIComponent($scope.newLocation.street) + "&" +            
            		'city=' + encodeURIComponent($scope.newLocation.city) + "&" + 
            		'state=' + encodeURIComponent($scope.newLocation.state) +  "&" +
            		'postalCode=' + encodeURIComponent($scope.newLocation.postalCode) + "&" +
            		'groupId=' + encodeURIComponent(groupId);            
            	
	            	$http.post(query).
			        success(function(data) 
			        {	
			        	alert('Location invited');
			        	$scope.clearLocationPopup();
			        	$scope.loadInvitedLocations();
			        });       
	            	
                	//alert('save location');
                	/*
                	var saveQuery = null;
                	
                	if ($scope.locationMode == 'add')
                	{
                		$scope.sumitted = true;
                		//alert('add location');
                		
                		saveQuery = '/api/jsonws/Membership-portlet.location/add-location' + 
                		'/business-id/' + businessId + 
                		'/name/' + $scope.newLocation.email + 
                		'/street/' + $scope.newLocation.street +
                		//'/street2/' + $scope.newLocation.street2 + 
                		'/city/' + $scope.newLocation.city + 
                		'/state/' + $scope.newLocation.state + 
                		'/postal-code/' + $scope.newLocation.postalCode + 
                		'/user-id/' + userId;                	
                	}
                	
                	if ($scope.locationMode == 'edit')
                	{
                		//alert('edit location: ' + JSON.stringify($scope.newLocation));
                		
                		saveQuery = '/api/jsonws/Membership-portlet.location/update-location' + 
                		'/location-id/' + $scope.newLocation.locationId + 
                		'/name/' + $scope.newLocation.email + 
                		'/street/' + $scope.newLocation.street +
                		//'/street2/' + $scope.newLocation.street2 + 
                		'/city/' + $scope.newLocation.city + 
                		'/state/' + $scope.newLocation.state + 
                		'/postal-code/' + $scope.newLocation.postalCode + 
                		'/user-id/' + userId;  
                	}
                	
                	$http.get(saveQuery).
			        success(function(data) 
			        {			        	
			        	if (data > 0)
	                	{
	                		$scope.loadLocations();
	                	}	          			        				     
			        });         
                	
                	$timeout(function(){ 
                		$scope.clearLocationPopup()
                	}, 1000);
                	*/
                };
                
                $scope.saveDepartment = function() 
                {               
                	//alert('save department');
                	/*
                	var saveQuery = null;
                	
                	if ($scope.departmentMode == 'add')
                	{
                		//alert('add department');
                		
                		saveQuery = '/api/jsonws/Membership-portlet.department/add-department' +
                		'/business-id/' + businessId + 
                		'/name/' + $scope.newDepartment.departmentName +                 		 
                		'/user-id/' + userId;            
                		
                		$http.put(saveQuery).
    			        success(function(data) 
    			        {			        	
    			        	if (data > 0)
    	                	{
    	                		$scope.loadDepartments();
    	                	}	          			        				     
    			        }); 
                	}
                	
                	if ($scope.departmentMode == 'edit')
                	{
                		//alert('edit department: ' + JSON.stringify($scope.newDepartment));
                		
                		saveQuery = '/api/jsonws/Membership-portlet.department/update-department' + 
                		'/department-id/' + $scope.newDepartment.departmentId + 
                		'/name/' + $scope.newDepartment.departmentName +                 		
                		'/user-id/' + userId;  
                		
                		$http.post(saveQuery).
    			        success(function(data) 
    			        {			        	
    			        	if (data > 0)
    	                	{
    	                		$scope.loadDepartments();
    	                	}	          			        				     
    			        }); 
                	}
                	*/
                	                	
                	var query = '/api/jsonws/Membership-portlet.department/send-department-invite?' + 
                	'name=' +  encodeURIComponent($scope.newDepartment.departmentName) + "&" + 
                	'email=' + encodeURIComponent($scope.newDepartment.email) + "&" +
            		'street=' + encodeURIComponent($scope.newDepartment.street) + "&" +            
            		'city=' + encodeURIComponent($scope.newDepartment.city) + "&" + 
            		'state=' + encodeURIComponent($scope.newDepartment.state) +  "&" +
            		'postalCode=' + encodeURIComponent($scope.newDepartment.postalCode) + "&" +
            		'groupId=' + encodeURIComponent(groupId);              
            	
	            	$http.post(query).
			        success(function(data) 
			        {		
			        	alert('Department Invited');	
	                	$scope.clearDepartmentPopup();     
	                	$scope.loadInvitedDepartments();
			        });       
	            	
                	$scope.clearDepartmentPopup();
                };
                
                $scope.saveProfile = function() {
                	/*
                	var query = '/api/jsonws/Membership-portlet.business/save-account-settings-profile' + 
                	'/business-id/' + encodeURIComponent(businessId) + 
                	'/business-name/' + encodeURIComponent($scope.business.name) + 
                	'/facebook/' + encodeURIComponent($scope.business.facebook) + 
                	'/twitter/' + encodeURIComponent($scope.business.twitter) + 
                	'/linked-in/' + encodeURIComponent($scope.business.linkedin) + 
                	'/tour/' + encodeURIComponent($scope.business.videoTourURL);
					*/
                	
                	var query = '/api/jsonws/Membership-portlet.business/save-account-settings-profile?' + 
                	'businessId=' + encodeURIComponent(businessId) + "&" + 
                	'businessName=' + encodeURIComponent($scope.business.name) +  "&" +
                	'aboutUs=' + encodeURIComponent($scope.business.aboutUs) +  "&" +
                	'awards=' + encodeURIComponent($scope.business.awards) +  "&" +                	
                	'facebook=' + encodeURIComponent($scope.business.facebook) +  "&" +
                	'twitter=' + encodeURIComponent($scope.business.twitter) +  "&" +
                	'linkedIn=' + encodeURIComponent($scope.business.linkedin) +  "&" +
                	'tour=' + encodeURIComponent($scope.business.videoTourURL);
                	
                	//alert(query);
                	
					$http.post(query).
			        success(function(data) 
			        {
			        	$scope.loadBusiness();
			        	$scope.loadLocation();
			        	$('#saveBusinessInformationSuccessful').show();
			        	//alert("Changes saved successfully");
			        });
                };

                $scope.saveContactInfo = function() 
                {
                	var query = '/api/jsonws/Membership-portlet.business/save-contact-info?' + 
                	'businessId=' + encodeURIComponent(businessId) + "&" +
                	'userId=' + userId +  "&" +
                	'email=' + encodeURIComponent($scope.user.emailAddress) + "&" + 
                	'street=' + encodeURIComponent($scope.location.street) +  "&" +
                	'city=' + encodeURIComponent($scope.location.city) +  "&" +
                	'state=' + encodeURIComponent($scope.location.state) +  "&" +
                	'zip=' + encodeURIComponent($scope.location.zip) +  "&" +
                	'phone=' + encodeURIComponent($scope.business.phone) + "&" +
                	'phoneExt=' + encodeURIComponent($scope.business.phoneExt) + "&" +
                	'website=' + encodeURIComponent($scope.business.website);
					
                	//alert(query);
                	
					$http.post(query).
			        success(function(data)
			        {
			        	$scope.loadBusiness();
			        	$scope.loadLocation();			
			        	$('#saveContactSuccessful').show();
			        	//alert("Changes saved successfully");
			        	//alert(JSON.stringify(data));
			        });
					
                	/*
                	var query = '/api/jsonws/Membership-portlet.business/save-contact-info' + 
                	'/business-id/' + encodeURIComponent(businessId) + 
                	'/user-id/' + userId + 
                	'/email/' + encodeURIComponent($scope.user.emailAddress) + 
                	'/street/' + encodeURIComponent($scope.location.street) + 
                	'/city/' + encodeURIComponent($scope.location.city) + 
                	'/state/' + encodeURIComponent($scope.location.state) + 
                	'/zip/' + encodeURIComponent($scope.location.zip) + 
                	'/phone/' + encodeURIComponent($scope.business.phone) +
                	'/phone-ext/' + encodeURIComponent($scope.business.phoneExt) +
                	'/website/' + encodeURIComponent($scope.business.website);
					
                	//alert(query);
                	
					$http.post(query).
			        success(function(data)
			        {
			        	$scope.loadBusiness();
			        	$scope.loadLocation();			        	
			        	//alert(JSON.stringify(data));
			        });
			        */
                	/*
                	Liferay.Service.post(
                			  '/Membership-portlet.business/save-contact-info',
                			  {
                			    businessId: businessId,
                			    userId: userId,
                			    email: $scope.user.emailAddress,
                			    street: $scope.location.street,
                			    city: $scope.location.city,
                			    state: $scope.location.state,
                			    zip: $scope.location.zip,
                			    phone: $scope.location.phone,
                			    phoneExt: $scope.location.phoneExt,
                			    website: $scope.location.website,                			    
                			  },
                			  function(obj) {
                			    console.log(obj);
                			  }                			
                			);
            		*/
                };
                
                $scope.saveEmailNotificationSettings = function() {
                	//alert(JSON.stringify($scope.member));
                	var query = '/api/jsonws/Membership-portlet.member/update-member-email-settings' +
                	'/member-id/' + $scope.member.memberId + 
                	'/request-alliance/' + $scope.member.emailRequestAlliance + 
                	'/approve-alliance/' + $scope.member.emailApproveAlliance + 
                	'/commentsOnPosts/' + $scope.member.emailCommentsOnPosts + 
                	'/sends-private-message/' + $scope.member.emailSendsPrivateMessage + 
                	'/new-features/' + $scope.member.emailNewFeatures +
                	'/user-id/' + userId;
                	
                	$http.get(query).
			        success(function(data) 
			        {
			        	//$scope.location = data;
			        	$('#saveNotificationsSuccessful').show();
			        	//alert('Notifications saved successfully');			        	
			        	$scope.loadMember();
			        });
                	/*
                	var query = '/api/jsonws/Membership-portlet.emailnotificationsettings/save-email-notification-settings' + 
                	'/userId/' + userId + 
                	'/requestAllianceDaily/' + $scope.emailNotificationSettings.requestAllianceDaily +
                	'/requestAllianceWeekly/' + $scope.emailNotificationSettings.requestAllianceWeekly +
                	'/requestAllianceMonthly/' + $scope.emailNotificationSettings.requestAllianceMonthly +
                	'/approveAllianceDaily/' + $scope.emailNotificationSettings.approveAllianceDaily +
                	'/approveAllianceWeekly/' + $scope.emailNotificationSettings.approveAllianceWeekly +
                	'/approveAllianceMonthly/' + $scope.emailNotificationSettings.approveAllianceMonthly +
                	'/commentsOnPostsDaily/' + $scope.emailNotificationSettings.commentsOnPostsDaily + 
                	'/commentsOnPostsWeekly/' + $scope.emailNotificationSettings.commentsOnPostsWeekly +
                	'/commentsOnPostsMonthly/' + $scope.emailNotificationSettings.commentsOnPostsMonthly +
                	'/sendsPrivateMessageDaily/' + $scope.emailNotificationSettings.sendsPrivateMessageDaily +
                	'/sendsPrivateMessageWeekly/' +  $scope.emailNotificationSettings.sendsPrivateMessageWeekly +
                	'/sendsPrivateMessageMonthly/' + $scope.emailNotificationSettings.sendsPrivateMessageMonthly +
                	'/newFeaturesDaily/' + $scope.emailNotificationSettings.newFeaturesDaily +
                	'/newFeaturesWeekly/' +  $scope.emailNotificationSettings.newFeaturesWeekly +
                	'/newFeaturesMonthly/' +  $scope.emailNotificationSettings.newFeaturesMonthly;
					
                	//alert(query);
                	
					$http.get(query).
			        success(function(data) 
			        {
			        	//$scope.location = data;
			        	alert('Notifications saved successfully');
			        });
			        */
                };
                
                $scope.saveEmployee = function (){
                	//alert('save employee: ' + JSON.stringify($scope.newEmployee));

                	/*
                	var query = '/api/jsonws/Membership-portlet.employee/add-employee/' +
                	'/first-name/' + $scope.newEmployee.firstName + 
                	'/last-name/' + $scope.newEmployee.lastName + 
                	'/email/' + $scope.newEmployee.email + 
                	'/location-id/' + $scope.newEmployee.location.locationId + 
                	'/department-id/' + $scope.newEmployee.department.departmentId;
                	
                	$http.put(query).
			        success(function(data) 
			        {
			        	//$scope.location = data;
			        	alert('Employee Saved');
			        	$scope.loadEmployees();
			        });
			        */
                	var query = '/api/jsonws/Membership-portlet.employee/add-employee?' + 
            		'firstName=' + encodeURIComponent($scope.newEmployee.firstName) + "&" + 
            		'lastName=' + encodeURIComponent($scope.newEmployee.lastName) + "&" +		            		
            		'email=' + encodeURIComponent($scope.newEmployee.email) + "&" +
            		'groupId=' + encodeURIComponent(groupId);              
            	
	            	$http.put(query).
			        success(function(data) 
			        {			        				        	  
	                	$scope.currentEmployee = {};
	                	$scope.loadBusinessUsers();
						$scope.loadPendingEmployees();
						$scope.loadInvitedEmployees();
			        });
                };
                
                $scope.updateCurrentEmployee = function() {
                	var query = '/api/jsonws/Membership-portlet.employee/update-employee?' + 
                	'userId=' + encodeURIComponent($scope.currentEmployee.userId) + "&" +
            		'firstName=' + encodeURIComponent($scope.currentEmployee.firstName) + "&" + 
            		'lastName=' + encodeURIComponent($scope.currentEmployee.lastName) + "&" +		            		
            		'emailAddress=' + encodeURIComponent($scope.currentEmployee.emailAddress) + "&" +
            		'status=' + encodeURIComponent($scope.currentEmployee.status);              
            	
	            	$http.put(query).
			        success(function(data) 
			        {			        	
			        	$scope.loadBusinessUsers();
						$scope.loadPendingEmployees();
						$scope.loadInvitedEmployees();
	                	$scope.clearCurrentEmployeePopup();
			        });
                };

                $scope.initCreateLogoRequest = function(){
                	$scope.logoReq.website = $scope.business.website;
                	$scope.logoReq.contactEmail = $scope.user.emailAddress;
                	$scope.logoReq.businessName = $scope.business.name;
                	$scope.logoReq.contactName = "";
                	$scope.logoReq.details = "";
                }

                $scope.createLogoRequest = function(){
            		var request = {
            				method: "create-logo-request",
            				params: $scope.logoReq,
            				jsonrpc:"2.0"
            		};
            			
            		var url = '/api/jsonws/Membership-portlet.business';
            		$http.post(url, request).
            			then (function(response) {
            				if (!angular.isNumber(response.data.result) 
            				|| response.data.result != 0) {
            					console.error("createLogoRequest: error occured:" + angular.toJson(response));
            				} 
            			});
                };
                
                $scope.approvePendingEmployee = function (employee){
                	//alert('approve employee: ' + JSON.stringify(employee));

                	var query = '/api/jsonws/Membership-portlet.employee/approve-employee/' +
                	'/user-id/' + employee.userId;
                	
                	$http.put(query).
			        success(function(data) 
			        {			        	
			        	$scope.loadBusinessUsers();
			        	$scope.loadPendingEmployees();
			        	//alert('Employee Approved');
			        });
                };
                
                $scope.rejectPendingEmployee = function (employee){
                	//alert('approve employee: ' + JSON.stringify(employee));

                	var query = '/api/jsonws/Membership-portlet.employee/reject-employee/' +
                	'/user-id/' + employee.userId;
                	
                	$http.put(query).
			        success(function(data) 
			        {			        				        
			        	$scope.loadPendingEmployees();
			        	//alert('Employee Rejected');
			        });
                };
                
                $scope.changePassword = function() {
                	//alert('change password from ' + $scope.currentPassword + ' to ' + $scope.newPassword);
                	
                	var query = '/api/jsonws/Membership-portlet.business/change-password' +
                	'/current-password/' + $scope.currentPassword + 
                	'/new-password/' + $scope.newPassword;
                	
                	$http.post(query).
			        success(function(data) 
			        {			        		
			        	if (data == -1)
			        		alert('Invalid current password');
			        	
			        	if (data == 0)
			        	{
			        		$("#passwordSuccess").show();
			        		//alert('Password Successfully Changed');
			        	}
			        });
                };
                
				$scope.businesses = [];

				$scope.loadData();
				$scope.clearContactPopup();
			});	 // end of ProfileCntrl
            
			return [ myModule.name ];
			
			
		});
	
	var mod;mod=angular.module("infinite-scroll",[]),mod.directive("infiniteScroll",["$rootScope","$window","$timeout",function(i,n,e){return{link:function(t,l,o){var r,c,f,a;return n=angular.element(n),f=0,null!=o.infiniteScrollDistance&&t.$watch(o.infiniteScrollDistance,function(i){return f=parseInt(i,10)}),a=!0,r=!1,null!=o.infiniteScrollDisabled&&t.$watch(o.infiniteScrollDisabled,function(i){return a=!i,a&&r?(r=!1,c()):void 0}),c=function(){var e,c,u,d;return d=n.height()+n.scrollTop(),e=l.offset().top+l.height(),c=e-d,u=n.height()*f>=c,u&&a?i.$$phase?t.$eval(o.infiniteScroll):t.$apply(o.infiniteScroll):u?r=!0:void 0},n.on("scroll",c),t.$on("$destroy",function(){return n.off("scroll",c)}),e(function(){return o.infiniteScrollImmediateCheck?t.$eval(o.infiniteScrollImmediateCheck)?c():void 0:c()},0)}}}]);
})(Liferay, angular, window, undefined);