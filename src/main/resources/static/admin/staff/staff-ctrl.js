
app.controller("staff-ctrl", function($scope, $http , $location ,  $window) {
    $scope.to = {};
    $scope.stafs = []; 
    $scope.currentPage = 1; 
    $scope.itemsPerPage = 10;

    $scope.initialize = function() {
        $http.get("/rest/staf?staf=true").then(resp => {
            $scope.stafs = resp.data; 
        });
       
    }

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
    
    $scope.createStaf = function() {
		 var Checkvarusername = $scope.stafs.some(t => t.username === $scope.to.username);
		 if(!$scope.to.username){
			 $scope.showAlert("MyShoes: Tên tài khoản không được để trống", "error", false);
			 return;
		 }
		 
		  if(!$scope.to.password){
			 $scope.showAlert("MyShoes: Mật Khẩu không được để trống", "error", false);
			 return;
		 }
		 
		 if(!$scope.to.fullname){
			 $scope.showAlert("MyShoes:Họ và Tên không được để trống", "error", false);
			 return;
		 }
		 
		 if(!$scope.to.email){
			 $scope.showAlert("MyShoes: Email không được để trống", "error", false);
			 return;
		 }
		 
		 if(!$scope.to.phone){
			 $scope.showAlert("MyShoes: Số Điện Thoại không được để trống", "error", false);
			 return;
		 }
        
        if (Checkvarusername ) {
            $scope.showAlert("MyShoes: Tên tài khoản đã tồn tại", "error", false);
            return;
        }
		
        $http.post("/rest/staf", $scope.to).then(resp => {
            $scope.stafs.push(resp.data);
            $scope.showAlert("MyShoes: Tạo mới nhân viên thành công", "success", true);
        }).catch(error => {
             $scope.showAlert("MyShoes: Tạo mới nhân viên thất bại", "error", false);
            console.log("Error", error);
        });
    };

     $scope.updateStaf = function() {
    var itemCopy = angular.copy($scope.to);
    $http.put(`/rest/staf/${itemCopy.username}`, itemCopy).then(resp => {
        var index = $scope.stafs.findIndex(s => s.username == itemCopy.username);
        if (index !== -1) {
            $scope.stafs[index] = resp.data;
        }
        $scope.showAlert("MyShoes: Cập nhật nhân viên thành công", "success", true);
    }).catch(error => {
        $scope.showAlert("MyShoes: Cập nhật nhân viên thất bại", "error", false);
        console.log("Error", error);
    });
};
    
    
    
     $scope.deleteStaf = function() {
    if ($scope.to.username) {
		
        var checkvarusername = $window.confirm("Bạn có chắc chắn muốn xóa nhân viên này?");

        if (checkvarusername) {
            $http.delete(`/rest/staf/${$scope.to.username}`)
                .then(resp => {
                    var index = $scope.stafs.findIndex(s => s.username == $scope.to.username);
                    if (index !== -1) {
                        $scope.stafs.splice(index, 1);
                    }
                    $scope.showAlert("MyShoes: Xóa nhân viên thành công", "success", true);
                })
                .catch(error => {
                    $scope.showAlert("MyShoes: Xóa nhân viên thất bại", "error", false);
                    console.log("Error", error);
                });
        } else {
            $scope.showAlert("MyShoes: Đã hủy bỏ xóa nhân viên", "error", false);
        }
    } else {
        $scope.showAlert("MyShoes: Vui lòng chọn một nhân viên để xóa", "error", false);
    }
};

	
	$scope.resetStaf = function() {
        $scope.to = {}; 
       
    };
    
 
    $scope.editStaf = function(item) {
        $scope.to = angular.copy(item);
        
    }
	

    $scope.pageCount = function() {
        return Math.ceil($scope.stafs.length / $scope.itemsPerPage);
    };

    $scope.paginatedStafs = function() {
        var begin = ($scope.currentPage - 1) * $scope.itemsPerPage;
        var end = begin + $scope.itemsPerPage;
        return $scope.stafs.slice(begin, end);
    };

    $scope.setPage = function(pageNumber) {
    if (pageNumber >= 1 && pageNumber <= $scope.pageCount()) {
        $scope.currentPage = pageNumber;
    }
};
    
    $scope.initialize();
    
    
    
});