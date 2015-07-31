(function(Liferay, angular, window, undefined) 
{
	angular.portlet.add("business-setup-wizard", "business-setup-wizard", function() 
	{
			//alert('in businessWizard.js');
		
			var myModule = angular.module("myModule", []);

			//alert('add controller');
			
			myModule.controller("LocationWizardCntrl", function($scope, $http, $timeout) 
            {
            	//alert('in controller');
            	                    	
				$scope.isBusy = false;
                $scope.result = '';               
                $scope.locationMode = 'add';
                $scope.locationIdToRemove = 0;
                $scope.newLocation = {};
                $scope.locations = [];
                $scope.lastLocation = {};
                $scope.locationSuccess = false
                
                $scope.applyLocation = function(location)
                {
                	$scope.newLocation.locationId = location.locationId;
                	$scope.newLocation.name = location.name;
                	$scope.newLocation.street = location.street;
                	$scope.newLocation.street2 = location.street2;
                	$scope.newLocation.city = location.city;
                	$scope.newLocation.state = location.state;
                	$scope.newLocation.postalCode = location.zip;
                	
                	$scope.locationMode = 'edit';
                };
                
                $scope.applyLocationToRemove = function(location)
                {
                	//alert('contact: ' + JSON.stringify(contact));
                	$scope.locationIdToRemove = location.locationId;
                };
                            
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
                
                $scope.loadLocations = function()
                {
                	//alert('load locations');
                
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
                
                $scope.clearLocationPopup = function()
                {
                	$scope.newLocation = {};
                	//$scope.newLocation.locationId = 0;
                	//$scope.newLocation.name = '';
                	//$scope.newLocation.street = '';
                	//$scope.newLocation.street2 = '';
                	//$scope.newLocation.city = '';
                	//$scope.newLocation.state = '';
                	//$scope.newLocation.postalCode = '';
                	
                	$scope.locationMode = 'add';
                };                                       
                
                $scope.saveLocation = function() 
                {               
                	//alert('save location');
                	
                	$scope.lastLocation = $scope.newLocation.name;
                	
                	var query = '/api/jsonws/Membership-portlet.location/send-location-invite?' + 
            		'email=' +  encodeURIComponent($scope.newLocation.email) + "&" + 
            		'street=' + encodeURIComponent($scope.newLocation.street) + "&" +            
            		'city=' + encodeURIComponent($scope.newLocation.city) + "&" + 
            		'state=' + encodeURIComponent($scope.newLocation.state) +  "&" +
            		'postalCode=' + encodeURIComponent($scope.newLocation.postalCode) + "&" +
            		'groupId=' + encodeURIComponent(groupId);              
            	
	            	$http.post(query).
			        success(function(data) 
			        {			        	
			        	//if (data > 0)
	                	//{
	                		$scope.locations.push($scope.lastLocation);
	                	//}	    
	                		$scope.clearLocationPopup();
	                		$scope.locationSuccess = true;
	                		$("#locationSuccess").show();
	                		//$timeout(function() {
	                		//	 $scope.locationSuccess = false;
	                		// }, 3000);
			        });         
            	
                	/*
                	if ($scope.locationMode == 'add')
                	{
                		//alert('add location');
                		
                		saveQuery = '/api/jsonws/Membership-portlet.location/add-location' + 
                		'/business-id/' + businessId + 
                		'/name/' + $scope.newLocation.name + 
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
                		'/name/' + $scope.newLocation.name + 
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
                	*/
                	
                };
                
                //alert('here');
                
                //$scope.loadLocations();           
                
                //alert('here 2');                
			});	 // end of ProfileCntrl
           
			myModule.controller("DepartmentWizardCntrl", function($scope, $http, $timeout) 
	        {
                $scope.departmentMode = 'add';
                $scope.newDepartment = {};
                $scope.departmentIdToRemove = 0;
                $scope.departments = [];
                $scope.lastDepartment = {};              
                $scope.departmentSuccess = false;
                
                $scope.applyDepartment = function(department)
                {
                	//alert('department: ' + JSON.stringify(department));
                	
                	$scope.newDepartment.departmentId = department.departmentId;
                	$scope.newDepartment.departmentName = department.departmentName;                	
                	
                	$scope.departmentMode = 'edit';
                };
                
                $scope.applyDepartmentToRemove = function(department)
                {
                	$scope.departmentIdToRemove = department.departmentId;
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
                
                $scope.clearDepartmentPopup = function()
                {
                	$scope.newDepartment = {};
                	//$scope.newDepartment.departmentId = 0;
                	//$scope.newDepartment.departmentName = '';       
                	//$scope.newDepartment.street = '';
                	//$scope.newDepartment.city = '';
                	//$scope.newDepartment.state = '';
                	//$scope.newDepartment.postalCode = '';
                	
                	$scope.departmentMode = 'add';
                };
                
                $scope.saveDepartment = function() 
                {                            
                	//alert('save department');
                	$scope.lastDepartment = $scope.newDepartment.departmentName;
                	
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
			        	//if (data > 0)
	                	//{
			        	$scope.departments.push($scope.lastDepartment);
	                		
	                	$scope.clearDepartmentPopup();
	                	$scope.departmentSuccess = true;
	                	
	                	$("#departmentSuccess").show();
	                	
                		//$timeout(function() {
               			//// $scope.departmentSuccess = false;
               		 //}, 3000);
	                	//}	          			        				     
			        });       
	            	
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
                	
                	
                };
                
				//$scope.loadDepartments();
				//$scope.clearDepartmentPopup();
	        });
			
			myModule.controller("EmployeeWizardCntrl", function($scope, $http, $timeout) 
            {		       
				$scope.newEmployee = {};
				$scope.employees = [];
				$scope.employeeSuccess = false;
                
                $scope.saveEmployee = function() 
                {               
                	var query = '/api/jsonws/Membership-portlet.employee/add-employee?' + 
            		'firstName=' + encodeURIComponent($scope.newEmployee.firstName) + "&" + 
            		'lastName=' + encodeURIComponent($scope.newEmployee.lastName) + "&" +		            		
            		'email=' + encodeURIComponent($scope.newEmployee.email) + "&" +
            		'groupId=' + encodeURIComponent(groupId);               
            	
	            	$http.put(query).
			        success(function(data) 
			        {			        	
			        	//if (data > 0)
	                	//{
	                		$scope.employees.push($scope.newEmployee.firstName + ' ' + $scope.newEmployee.lastName);
	                	//}	    
	                		$scope.clearEmployeePopup();
	                		$scope.employeeSuccess = true;
	                		
	                		$("#employeeSuccess").show();
	                		//$timeout(function(){
	                		//		$scope.employeeSuccess = false;
	                  		// }, 3000);
			        });
                };         
            			      
                $scope.clearEmployeePopup = function() 
                {
                	$scope.newEmployee = {};
                	//$scope.newEmployee.firstName = '';
                	//$scope.newEmployee.lastName = '';
                	//$scope.newEmployee.email = '';
                };
                
			});	 // end of ProfileCntrl
			
			return [ myModule.name ];
		});
		
})(Liferay, angular, window, undefined);