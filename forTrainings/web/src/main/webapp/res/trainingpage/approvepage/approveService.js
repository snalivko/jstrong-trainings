angular.module('approvePageModule').factory('approveService', ['$rootScope','$http','$location', function($rootScope,$http,$location) {
    var service={};
    service.approve = function(id) {
        console.log({
            transactionId:id,
            adminAnswer:'Approve'
        });
        $http.put('rest/storagetraining/approve',{
            transactionId:id,
            adminAnswer:'Approve'
        }).then(function(){
            $location.url('/ui/news');
        }, function(error){
            if(error.status===401){
                $location.url('/ui/');
            }
            console.log(error);
        });
    };

    service.dismiss = function(id) {
        console.log({
            transactionId:id,
            adminAnswer:'Approve'
        });
        $http.put('rest/storagetraining/approve',{
            transactionId:id,
            adminAnswer:'Dismiss'
        }).then(function(){
            //$rootScope.$broadcast('removeNewsItem');
            $location.url('/ui/news');
        }, function(error){
            if(error.status===401){
                $location.url('/ui/');
            }
            console.log(error);
        });
    };
    return service;
}]);