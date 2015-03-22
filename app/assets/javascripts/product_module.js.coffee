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
          $scope.line_size = data.line_size
          cart_item  = $('#cart_item')
          b = cart_item.find('.badge')
          console.log(b, "FFF")
          if b.length is 0
            cart_item.append("<span class='badge'>#{ $scope.line_size }</span>")
            console.log('cart_item', cart_item)
          else
            console.log("Not EMPTY")
            b.html("#{ $scope.line_size }")
          cart_animate = () ->
            $('#cart_item').css({'color': 'initial'})
          badge_animate = ->
            $('.badge').css({'color': 'white'})
            
          $('.badge').css({'color':'#88ff88'})
            .animate({'color': '#FE980F'}, 6000, badge_animate)
          cart_item.css({'color':'#88ff88'})
            .animate({'color': '#FE980F'}, 6000, cart_animate))

        .error((data) ->
          console.log(data))
        
      ]
          
          
         




  
