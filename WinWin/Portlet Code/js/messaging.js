(function(Liferay, angular, window, undefined)
{
    angular.portlet.add("messaging", "messaging", function()
    {
        var myModule = angular.module("myModule", []);

        myModule.controller("MessagingCntrl", function($scope, $http) {

            alert("MessagingCntrl");
        });	 // end of MessagingCntrl

        return [ myModule.name ];
    });

})(Liferay, angular, window, undefined);