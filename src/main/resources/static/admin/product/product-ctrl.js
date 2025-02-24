
app.controller("product-ctrl", function($scope, $http,$window) {
    $scope.items = [];
    $scope.cates = [];
    $scope.cates1 = [];
    $scope.form = {};
    $scope.selectedcates = {};
    $scope.newCategoryName = '';
    $scope.newCategory = {}; 
    $scope.editedCategory = {};

    $scope.initialize = function() {
        $http.get("/rest/products").then(resp => {
            $scope.items = resp.data;
            $scope.items.forEach(item => {
                item.createDate = new Date(item.createDate)
            })
        });
        
        $http.get("/rest/categories").then(resp => {
            $scope.cates = resp.data;
        });
    }

    $scope.reset = function() {
        $scope.form = {
            createDate: new Date(),
            available: true,


        }
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
  
    $scope.edit = function(item) {
        $scope.form = angular.copy(item);
    }
    $scope.create = function() {
        var item = angular.copy($scope.form);
        
         var isNameDuplicate = $scope.items.some(existingItem => existingItem.name === item.name);
         
        if (!item.name) {
        	$scope.showAlert("MyShoes: Tên sản phẩm không được để trống.", "error", false);
        return;
         }
         
   		 if (isNameDuplicate) {
        	$scope.showAlert("MyShoes: Tên sản phẩm đã tồn tại. Vui lòng nhập một tên khác.", "error", false);
        return;
   		 }
   		 
   		 if (item.price < item.pricesale){
			$scope.showAlert("MyShoes: Giá giảm không thể lớn hơn giá bán", "error", false);
		return;
		}
        
    	if (new Date(item.createDate) > new Date()) {
        	$scope.showAlert("MyShoes: Ngày nhập không thể lớn hơn ngày hiện tại", "error", false);
        	return;
    	}
    
        $http.post(`/rest/products`, item).then(resp => {
            resp.data, createDate = new Date(resp.data.createDate);
            $scope.items.push(resp.data);
            $scope.reset();
            $scope.showAlert("MyShoes: Tạo mới sản phẩm thành công", "success", true);
        }).catch(error => {
            $scope.showAlert("MyShoes: Tạo mới sản phẩm thất bại", "error", false);
            console.log("Error", error);
        })
    }
    
    $scope.update = function(item) {
        var item = angular.copy($scope.form);
         if (!item.name) {
        	$scope.showAlert("MyShoes: Tên sản phẩm không được để trống.", "error", false);
        return;
         }
        if (new Date(item.createDate) > new Date()) {
        	$scope.showAlert("MyShoes: Ngày nhập không thể lớn hơn ngày hiện tại", "error", false);
        return;
    	}
    	 if (item.price < item.pricesale){
			$scope.showAlert("MyShoes: Giá giảm không thể lớn hơn giá bán", "error", false);
		return;
		}
        $http.put(`/rest/products/${item.id}`, item).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items[index] = item;
            $scope.showAlert("MyShoes: Cập nhật sản phẩm thành công", "success", true);
        }).catch(error => {
            $scope.showAlert("MyShoes: Cập nhật sản phẩm thất bại", "error", false);
            console.log("Error", error);
        })
    }

$scope.delete = function(item) {
    var itemToDelete = angular.copy(item);

    var confirmDelete = $window.confirm("Bạn có chắc chắn muốn xóa sản phẩm này?");

    if (confirmDelete) {
        if (itemToDelete.id) {
            $http.delete(`/rest/products/${itemToDelete.id}`)
                .then(resp => {
                    var index = $scope.items.findIndex(p => p.id == itemToDelete.id);
                    if (index !== -1) {
                        $scope.items.splice(index, 1);
                    }
                    $scope.showAlert("MyShoes: Xóa sản phẩm thành công", "success", true);
                })
                .catch(function(error) {
                    console.error('Error:', error);
                    $scope.showAlert("MyShoes: Xóa sản phẩm thất bại", "error", false);
                    console.error('Error Data:', error.data);
                });
        } else {
            $scope.showAlert("MyShoes: Vui lòng chọn sản phẩm để xóa", "error", false);
        }
    } else {
        $scope.showAlert("MyShoes: Đã hủy bỏ xóa sản phẩm", "error", false);
    }
};


    $scope.imageChanged = function(files) {
        var data = new FormData();
        data.append('file', files[0]);
        $http.post('/rest/upload/images', data, {
            transformRequest: angular.identity,
            headers: { 'Content-Type': undefined }
        }).then(resp => {
            $scope.form.image = resp.data.name;
        }).catch(error => {
            alert("Loi upload");
            console.log("Error", error);
        })
    }
    
    
    
    $scope.pager = {
        page: 0,
        size: 10,
        get items() {
            var start = this.page * this.size;
            return $scope.items.slice(start, start + this.size);
        },
        get count() {
            return Math.ceil(1 * $scope.items.length / this.size);
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
    
    
       $scope.getAllCategories = function() {
        $http.get("/rest/categories").then(function(resp) {
            $scope.cates1 = resp.data;
        });
    };

   
	$scope.resetCategory = function () {
		$scope.editedCategory = {};
	}

    $scope.editcates = function(category) {
        $scope.editedCategory = angular.copy(category);
    };
    
  $scope.createCategory = function () {
    var newCategoryId = $scope.editedCategory.id;
    var newCategoryName = $scope.editedCategory.name;
    
       if(!newCategoryName) {
		$scope.showAlert("MyShoes: Vui lòng nhập một Tên Danh Mục.", "error", false);
		return;
	}
	
	 if(!newCategoryId) {
		$scope.showAlert("MyShoes: Vui lòng nhập một ID Danh Mục.", "error", false);
		return;
	}

    var checkvarID = $scope.cates.some(category => category.id === newCategoryId);
    var CheckvarName = $scope.cates.some(category => category.name === newCategoryName);

    if (checkvarID || CheckvarName) {
        $scope.showAlert("MyShoes: ID hoặc Tên đã tồn tại. Vui lòng chọn một ID hoặc Tên khác.", "error", false);
        return;
    }
    
  

    if (newCategoryId && newCategoryName) {
        var newCategory = {
            id: newCategoryId,
            name: newCategoryName
        };

        $http.post(`/rest/categories`, newCategory)
            .then(resp => {
                $scope.cates.push(resp.data);
                $scope.editedCategory = {};
                $scope.showAlert("MyShoes: Tạo mới danh mục thành công", "success", true);
            })
            .catch(error => {
                $scope.showAlert("MyShoes: Tạo mới danh mục thất bại", "error", false);
                console.log("Error", error);
            });
    } else {
        $scope.showAlert("MyShoes: Vui lòng nhập đầy đủ thông tin ID và Tên danh mục", "error", false);
    }
};

    
     $scope.updateCategory = function () {
		 
    var CheckvarName = $scope.cates.some(category => category.name === $scope.editedCategory.name);

    if ( CheckvarName) {
        $scope.showAlert("MyShoes: Tên đã tồn tại. Vui lòng nhập một Tên khác.", "error", false);
        return;
    }
    
    if(!$scope.editedCategory.name) {
		$scope.showAlert("MyShoes: Vui lòng nhập một Tên Danh Mục.", "error", false);
		return;
	}
	
	 if(!$scope.editedCategory.id) {
		$scope.showAlert("MyShoes: Vui lòng nhập một ID Danh Mục.", "error", false);
		return;
	}
		 
    if ($scope.editedCategory && $scope.editedCategory.id && $scope.editedCategory.name) {
        $http.put(`/rest/categories/${$scope.editedCategory.id}`, $scope.editedCategory)
            .then(function (resp) {
                $scope.showAlert("MyShoes: Cập nhật danh mục thành công", "success", true);
            })
            .catch(function (error) {
                $scope.showAlert("MyShoes: Cập nhật danh mục thất bại", "error", false);
                console.error("Error", error);
            });
    }
};


$scope.deleteCategory = function() {
    var confirmDeleteCategory = $window.confirm("Bạn có chắc chắn muốn xóa danh mục này?");
    if (confirmDeleteCategory) {
        if ($scope.editedCategory && $scope.editedCategory.id) {
            $http.delete(`/rest/categories/${$scope.editedCategory.id}`)
                .then(resp => {
                    var index = $scope.cates.findIndex(c => c.id == $scope.editedCategory.id);
                    if (index !== -1) {
                        $scope.cates.splice(index, 1);
                    }
                    $scope.showAlert("MyShoes: Xóa danh mục thành công", "success", true);
                })
                .catch(function(error) {
                    console.error('Error:', error);
                    $scope.showAlert("MyShoes: Xóa danh mục thất bại", "error", false);
                });
        } else {
            $scope.showAlert("MyShoes: Vui lòng chọn danh mục để xóa", "error", false);
        }
    } else {
		$scope.showAlert("MyShoes: Đã hủy yêu cầu xóa", "error", false);
    }
};

  
        $scope.initialize();
    
    
  
});