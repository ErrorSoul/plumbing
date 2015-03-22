angular.module('product', [])

angular.module('product')
  .config [
    '$httpProvider'
    ($httpProvider) ->
      authToken = $("meta[name=csrf-token]").attr("content")
      $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
      
]


angular.module('product').controller "CartController", ['$scope', '$http', ($scope, $http) ->
    console.log("CONTROLLER WORKING")
    $scope.add_to_cart = (product_id) ->
      console.log("I AM WORKING", product_id)
      line_item = {}
      line_item.product_id = product_id
      $http.post("/line_items", line_item: line_item)
        .success((data) ->
          cart_item  = $('#cart_item')
          cart_animate = () ->
            $('#cart_item').css({'background-color': 'initial'})
          
          cart_item.css({'background-color':'#88ff88'})
            .animate({'background-color': '#FE980F'}, 6000, cart_animate))

        .error((data) ->
          console.log(data))
        
      ]
          
          
         




  
