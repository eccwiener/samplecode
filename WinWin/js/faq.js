(function(Liferay, angular, window, undefined) {
    angular.portlet.add("faq", "faq",
        function() {

            var myModule = angular.module("myModule", []);

            myModule.controller("FaqCntrl", function($scope, $http) {
                console.log("faq angular");
            });

            return [ myModule.name ];
        });

})(Liferay, angular, window, undefined);

