(function(Liferay, angular, window, undefined)
{
    angular.portlet.add("notifications", "notifications", function()
    {
        var myModule = angular.module("myModule", []);

        myModule.controller("NotificationsCtrl", function($scope, $http) {

            console.log("notifications portlet");
        });	 // end of ProfileCntrl

        return [ myModule.name ];
    });

})(Liferay, angular, window, undefined);