
app.controller("order-management-ctrl",  function($scope, $http, $location) {
	var username = "your_username_here";
    
            $http.get('*/orders/by-username/' + username)
                .then(function(response) {
                    $scope.orders = response.data;
                });	
                $http.get('/rest/orderdetail')
    .then(function(response) {
      $scope.orderDetails = response.data;
    })
    .catch(function(error) {
      console.error('Error fetching order details: ', error);
    });
	
	$scope.orders = [];
	$scope.status = [];
	$scope.accounts = [];
	$scope.orderDetails = [];
	$scope.products = [];
	$scope.sta = {};
	
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

            }
        }, 1500);
    };
	
    // Other functions and initialization code here

   $scope.updateStatus = function(order) {
        $http.put('/rest/order/' + order.id, order)
            .then(function(response) {
                var index = $scope.orders.findIndex(function(o) {
                    return o.id === order.id;
                });
                if (index !== -1) {
                    $scope.orders[index] = angular.copy(order);
                    $scope.showAlert("MyShoes: Cập nhật trạng thái đơn hàng thành công", "success", true);
                }
            })
            .catch(function(error) {
                $scope.showAlert("MyShoes: Lỗi cập nhật trạng thái đơn hàng", "error", false);
                console.error("Error", error);
            });
    };
	
	

 
	 
	 
	$scope.initialize = function() {
		// load all roles
		$http.get("/rest/order").then(resp => {
			
			$scope.orders = resp.data;
		})
		$http.get("/rest/Status").then(resp => {
			$scope.status = resp.data;
		})
		$http.get("/rest/orderdetail").then(resp => {
			$scope.orderDetails = resp.data;
		})
		$http.get("/rest/accounts").then(resp => {
			$scope.accounts = resp.data;
		})
		$http.get("/rest/products").then(resp => {
			$scope.products = resp.data;
		})
	}
	
	
	  $scope.editor = function(order) {
        $scope.sta = angular.copy(order);
       
    }
	

	$scope.update = function() {
		var order = angular.copy($scope.sta);
		$http.put(`/rest/order/${order.id}`, order).then(resp => {
			var index = $scope.orders.findIndex( f => f.id == order.id);
			$scope.orders[index] = order;
			alert("cap nhap thanh cong");
		}).catch(error => {
			alert("Loi cập nhật san pham");
			console.log("Error", error);
		})
	}
	
	
	$scope.cart = {
        items: [],
	get amount() {
            return this.items
                .map(item => item.qty * item.price)
                .reduce((total, qty) => total += qty, 0);  
        },
        
        saveToLocalStorage() {
            var json = JSON.stringify(angular.copy(this.items));
            localStorage.setItem("cart", json);
        },
        loadFromLocalStorage() {
            var json = localStorage.getItem("cart");
            this.items = json ? JSON.parse(json) : [];
        }
    }
    $scope.cart.loadFromLocalStorage();
   $scope.order = {
        createDate: new Date(),
        address: "",
        fullname: $("#fullname").text(),
        status: { id: "1", status: "default status" },
        phone: "0345303416",
        account: { username: $("#username").text() },
        get orderDetails() {
            return $scope.cart.items.map(item => {
                return {
                    product: { id: item.id },
                    price: item.price,
                    quantity: item.qty,
                   	
                }
            });
        },

},

	$scope.initialize();
})



