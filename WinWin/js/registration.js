(function(Liferay, angular, window, undefined)
{
    angular.portlet.add("registration", "registration", function()
    {


        var myModule = angular.module("myModule", ['angucomplete'])

        myModule.controller("RegistrationCntrl", function($scope, $http, $location)
        {
        	$scope.business = {};
        	
        	$scope.business.registrationType = 'business';

            $scope.location = $location;

            console.log($scope.location);

            $scope.businesses = [
                {   name: "Basics Landscaping", address: "354 Boston Ave, NY 11001" },
                {   name: "Basics Landscaping (HQ)", address: "354 Boston Ave, NY 11001" },
                {   name: "Rory Hedels", address: "354 Ontario Ave, NY 11757" },
                {   name: "OpenTemp",   address: "49 South Grove St, Valley Stream NY 11580"}
            ];

            $scope.test = function () {
            	alert($scope.regType);
            };
            
            $scope.createUser = function () 
            {
            	if ($scope.business.password != $scope.business.confirmPassword)
            	{
            		alert("passwords don't match");
            		return;
            	}
            	
            	alert('create user. email: ' + $scope.business.email + "\npassword: " + $scope.business.password);

            	var registrationQuery = '/api/jsonws//Membership-portlet.member/register-user' + 
            	'/email/' + $scope.business.email + 
            	'/password/' + $scope.business.password +
            	'/confirmPassword' + $scope.business.confirmPassword +
            	'/firstName/' + $scope.business.firstName +
            	'/lastName/' + $scope.business.lastName +
            	'/sCompanyId/' + companyId + 
            	'/registrationType/' + $scope.business.registrationType;
            	
            	$http.post(registrationQuery).
		        success(function(data) 
		        {			 			  
		        	alert('redirect to login page');
		        });
            };
            
        });	 // end of ProfileCntrl


        return [ myModule.name ];
    });

})(Liferay, angular, window, undefined);
