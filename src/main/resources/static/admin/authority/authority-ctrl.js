
app.controller("authority-ctrl",function($scope , $http , $location , $window){
   $scope.roles=[];
   $scope.admins = [];
   $scope.authorities = [];

   $scope.initialize = function(){
       // load all roles
       $http.get("/rest/roles").then(resp =>{
           $scope.roles = resp.data;
       })

       //load staffs and directors(administrators)
       $http.get("/rest/accounts?admin=true").then(resp =>{
           $scope.admins = resp.data;
       })

       //load authorities of staffs and directors
       $http.get("/rest/authorities?admin=true").then(resp =>{
            $scope.authorities = resp.data;
         }).catch(error =>{
             $location.path("/unauthorized");
         })
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
    
            }
        }, 1500);
    };

   $scope.authority_of = function(acc , role){
       if($scope.authorities){
           return $scope.authorities.find(ur => ur.account.username == acc.username 
                                            && ur.role.id == role.id);
       }
   }
   $scope.authority_changed = function(acc,role){
       var authority = $scope.authority_of(acc , role);
       if(authority){
           $scope.revoke_authority(authority);
       }
       else{
           authority = {account:acc , role : role};
           $scope.grant_authority(authority);
       }
   }

   //thêm mới authority
   $scope.grant_authority = function(authority){
       $http.post(`/rest/authorities`, authority).then(resp =>{
           $scope.authorities.push(resp.data);
           $scope.showAlert("MyShoes: Cấp quyền sử dụng thành công", "success", true);
       }).catch(error =>{
           alert("");
            $scope.showAlert("MyShoes: Cấp quyền sử dụng thất bại", "error", false);
            console.log("Error" , error);
       })
   }

   //Xoá authority
   $scope.revoke_authority = function(authority){
       $http.delete(`/rest/authorities/${authority.id}`).then(resp =>{
           var index = $scope.authorities.findIndex(a => a.id == authority.id);
           $scope.authorities.splice(index ,1);
           $scope.showAlert("MyShoes: Thu hồi sử dụng thành công", "success", true);
       }).catch(error =>{
        $scope.showAlert("MyShoes: Thu hồi quyền sử dụng thất bại", "error", false);
        console.log("Error",error );
       })
   }

   $scope.initialize();
});