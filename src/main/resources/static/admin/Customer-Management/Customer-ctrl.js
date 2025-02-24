        
// agulajs 

app.controller("Customer-ctrl", function($scope, $http, $location ,  $window) {
    $scope.custs = [];
    $scope.isCreating = true; 
	$scope.currentPage = 1; 
    $scope.itemsPerPage = 10;

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
		
		 var Checkvarusername = $scope.custs.some(c => c.username === $scope.selectedCustomer.username);
        
        if (Checkvarusername ) {
            $scope.showAlert("MyShoes: Tên tài khoản đã tồn tại. Vui lòng Nhập tên khác.", "error", false);
            return;
        }

    if ($scope.selectedCustomer && $scope.selectedCustomer.username) {
		 $http.post("/rest/cust", $scope.selectedCustomer)
        .then(resp => {
            $scope.custs.push(resp.data);
            $scope.showAlert("MyShoes: Tạo mới khách hàng thành công", "success", true);
        })
        .catch(error => {
            $scope.showAlert("MyShoes: Tạo mới khách hàng thất bại", "error", false);
            console.log("Error", error);
        });
    }else{
		 $scope.showAlert("MyShoes: Vui Lòng Nhập Tên Tài Khoản", "error", false);
	}


   
};


    $scope.updateCustomer = function() {
        $http.put(`/rest/cust/${$scope.selectedCustomer.username}`, $scope.selectedCustomer).then(resp => {
            var index = $scope.custs.findIndex(c => c.username == $scope.selectedCustomer.username);
            if (index !== -1) {
                $scope.custs[index] = resp.data;
            }
            $scope.showAlert("MyShoes: Cập nhật khách hàng thành công", "success", true);
        }).catch(error => {
             $scope.showAlert("MyShoes: Cập nhật khách hàng thất bại", "error", false);
            console.log("Error", error);
        });


    };

   $scope.deleteCustomer = function() {
    if ($scope.selectedCustomer.username) {
        var confirmDelete = $window.confirm("Bạn có chắc chắn muốn xóa khách hàng này?");

        if (confirmDelete) {
            $http.delete(`/rest/cust/${$scope.selectedCustomer.username}`)
                .then(resp => {
                    var index = $scope.custs.findIndex(c => c.username == $scope.selectedCustomer.username);
                    if (index !== -1) {
                        $scope.custs.splice(index, 1);
                    }
                    $scope.showAlert("MyShoes: Xóa khách hàng thành công", "success", true);
                })
                .catch(error => {
                    $scope.showAlert("MyShoes: Xóa khách hàng thất bại", "error", false);
                    console.log("Error", error);
                });
        } else {
            $scope.showAlert("MyShoes: Đã hủy bỏ xóa khách hàng", "error", false);
        }
    } else {
        $scope.showAlert("MyShoes: Vui Lòng Chọn Khách hàng Để Xóa", "error", false);
    }
};


    $scope.resetForm = function() {

        $scope.selectedCustomer = {};
        document.getElementById("infoForm-mangement").reset();
    };

    $scope.editCustomer = function(customer) {

        $scope.selectedCustomer = angular.copy(customer);
        $scope.isCreating = false; 
    };
    
    
    $scope.pageCount = function() {
        return Math.ceil($scope.custs.length / $scope.itemsPerPage);
    };

    $scope.paginatedStafs = function() {
        var begin = ($scope.currentPage - 1) * $scope.itemsPerPage;
        var end = begin + $scope.itemsPerPage;
        return $scope.custs.slice(begin, end);
    };

    $scope.setPage = function(pageNumber) {
    if (pageNumber >= 1 && pageNumber <= $scope.pageCount()) {
        $scope.currentPage = pageNumber;
    }
};

    $scope.initialize();
    
    

});




