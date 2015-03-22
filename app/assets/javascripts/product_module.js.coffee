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
          
angular.module('product').directive('ngReallyClick', [ () ->
    restrict: 'A'
    link: (scope, elem, attrs) ->
      elem.bind('click', () ->
        message = attrs.ngReallyMessage
        if message and confirm(message)
          scope.$apply(attrs.ngReallyClick))
  
  ])
         
angular.module('product').controller "CartShowController", ["$scope", "$http","$timeout",  ($scope, $http, $timeout) ->
    $http.get("line_items/1").success((data) ->
      if data.message
        $scope.message = data.message
      else
        $scope.items = data.items
        console.log($scope.items)).error((data)->
          console.log(data))

    $scope.total = ->
      total = 0
      angular.forEach $scope.items, (item) ->
        total += item.quantity * item.product.summ
        return

      total


    $scope.p_price = (item, price, value, percent) ->
      m = price * value
      summ =  m + (m * (percent/100.0))
      item.product.summ = summ
      return summ
      
   
      
    $scope.delete_notice = ->
      $scope.notice = false 
    #update quantity in items
    $scope.update_cart = (callback, error_callback) ->
      update_items = [] 
      angular.forEach $scope.items, (item) ->
        update_items.push({id: item.id, quantity: item.quantity})
      $http({method: "PATCH", url: "/line_items/1", data: {items: update_items}})
        .success(callback).error(error_callback)
      
    #error callback
    error_callback = (error) ->
      console.log(error, "FFF")
    $scope.t = ->
      console.log("FFFFFFFFFFFFFFFFKKKK")
    #for save cart    
    $scope.line_items_update = ->
      #success callback
      callback = (data) ->
        if data.message is "Your line_item updated"
          $scope.notice = "Ваша корзина обновлена"
          $("#cart_item").find('.badge').html("#{ data.line_size }")
          if $scope.notice
            $timeout($scope.delete_notice, 5000)
        else console.log(data)
      $scope.update_cart(callback, error_callback)

    #for create order 
    $scope.contact_form = () ->
      #success callback
      callback = (data) ->
        if data.message is "Your line_item updated"
          $scope.button_hide = true
        else
          console.log(data)


      $scope.update_cart(callback, error_callback)

    #create order 
    $scope.create_order = (order) ->
      callback = (data) ->
        if data.message = "Your order saved"
          $scope.button_hide = false
          $scope.message = "Ваш заказ принят. Спасибо за покупку"
      $http.post("/orders", order: order).success(callback)
        .error(error_callback)
        
    $scope.delete = (idx) ->
      post_to_delete = $scope.items[idx]
      $http.delete("/line_items/#{post_to_delete.id}").success((data) ->
        if data.message is "Your post deleted"
          
          console.log(data, 'delete.data')
          if data.line_size is 0
            $scope.empty_table = true
          $("#cart_item").find('.badge').html("#{ data.line_size }")
          #post_to_delete.hideValue = true)
          $scope.items.splice(idx, 1))
            .error((error) -> console.log(error))
            


    ]



  
