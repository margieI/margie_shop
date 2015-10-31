

var app = angular.module('shop', ['ngResource']);

app.controller('OrdersCtrl', ['$scope', 'models', function($scope, models){
  // Here will be all code belonging to this controller
$scope.orders = models.orders;
$scope.addOrder = function(){
  $scope.orders.push if(!$scope.newOrder.product_id || $scope.newOrder.total === ''){ return; }
  $scope.orders = models.orders.query();
  $scope.products = models.products.query();

}
order = models.orders.save($scope.newOrder, function(){
  recent_order = models.orders.get({id: order.id});
  $scope.orders.push(recent_order);
  $scope.newOrder = '';
});


$scope.deleteOrder = function(order){
  $scope.orders.splice($scope.orders.indexOf(order), 1);
}
models.orders.delete(order);
}]);





app.factory('models', ['$resource', function($resource){
  var orders_model = $resource("/orders/:id.json", {id: "@id"});
  var products_model = $resource("/products/:id.json", {id: "@id"});

  var x = {
  orders: orders_model,
  products: products_model
};
return x;
}]);