app.controller("feedback-ctrl", function($scope, $http, $location) {
	$scope.feedbacks = [];
	$scope.send = {}; 
	
	$scope.initialize = function() {
		$http.get("/rest/feedback").then(resp => {
			$scope.feedbacks = resp.data;
		})
	}
	
	$scope.fb1 = function(feedbacks) {
		$scope.send = angular.copy(feedbacks);
		};
		
		
		 
	$scope.initialize();
	
	    $scope.pager = {
        page: 0,
        size: 10,
        get feedbacks() {
            var start = this.page * this.size;
            return $scope.feedbacks.slice(start, start + this.size);
        },
        get count() {
            return Math.ceil(1 * $scope.feedbacks.length / this.size);
        },
        first() {
            this.page = 0;
        },
        prev() {
            this.page--;
            if (this.page < 0) {
                this.last();
            }
        },
        next() {
            this.page++;
            if (this.page >= this.count) {
                this.first();
            }
        },
        last() {
            this.page = this.count - 1;
        }
    }
});
