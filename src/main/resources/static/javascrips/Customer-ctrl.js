// AngularJS app.controller
app.controller("CustomerCtrl", function($scope, $http, $location, $window) {
    $scope.custs = [];
    $scope.isCreating = true;
    
    $scope.initialize = function() {
        $http.get("/rest/cust?cust=true").then(resp => {
            $scope.custs = resp.data;
        });
    };
    
    $scope.showAlert = function(message, type, reload) {
        var alertElement = document.getElementById('custom-alert');
        alertElement.innerHTML = message;
        if (type === 'success') {
            alertElement.style.backgroundColor = '#28a745';
        } else if (type === 'error') {
            alertElement.style.backgroundColor = '#dc3545';
        }
        alertElement.style.display = 'block';
        setTimeout(function() {
            alertElement.style.display = 'none';
            if (reload) {
                $window.location.reload();
            }
        }, 1500);
    };
    
    $scope.createCustomer = function() {
        $http.post("/rest/cust", $scope.selectedCustomer).then(resp => {
            $scope.custs.push(resp.data);
            $scope.showAlert("Tạo mới khách hàng thành công", "success", true);
        }).catch(error => {
            $scope.showAlert("Tạo thất bại khách hàng mới", "error", false);
            console.log("Lỗi", error);
        });
    };

    // ... (other functions)

    $scope.editCustomer = function(customer) {
        $scope.selectedCustomer = angular.copy(customer);
        $scope.isCreating = false;
    };

    $scope.initialize();
});