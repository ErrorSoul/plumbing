
angular.module('product', [])

angular.module('product')
  .config [
    '$httpProvider'
    ($httpProvider) ->
      authToken = $("meta[name=csrf-token]").attr("content")
      $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
]
angular.module('product').directive 'modal', ->
  {
    template: '<div class="modal fade">' + '<div class="modal-dialog">' + '<div class="modal-content">' + '<div class="modal-header">' + '<button type="button" ng-click="toggleModal()" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' + '<h4 class="modal-title">{{ title }}</h4>' +   '</div>' + '<div class="modal-body" ng-transclude></div>' + '</div>' + '</div>' + '</div>'
    restrict: 'E'
    transclude: true
    replace: true
    link: (scope, element, attrs) ->
      scope.user = {}
      scope.user.email = 'aaa'
      scope.mail = () ->
        console.log(scope.user.email, "EMAIL")
      scope.title = attrs.title
      scope.$watch attrs.visible, (value) ->
        if value == true
          $(element).modal 'show'
        else
          $(element).modal 'hide'
        return

      $("#email").on 'change', ->
        scope.user.email  = $("#email").val()
        console.log('scope.user.email', scope.user.email)
        scope.$apply()

      #$(element).on 'input', ->
      #  console.log('fffffaaaa')
      #
      $(element).on 'shown.bs.modal', ->
        scope.$apply ->
          scope.$parent[attrs.visible] = true
          return
        return
      $(element).on 'hidden.bs.modal', ->
        scope.$apply ->
          scope.$parent[attrs.visible] = false
          return
        return
      return

  }


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
    $scope.showModal = false
    $scope.toggleModal = ->
      $scope.showModal = !$scope.showModal
      console.log("showmodal", $scope.showModal)

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

    $scope.consa = ->
      console.log('i am Worked')
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
          $scope.order_flag = true
          $scope.notice = "Куда вам доставить?"
        else
          console.log(data)


      $scope.update_cart(callback, error_callback)

    #create order
    $scope.create_order = (order) ->
      callback = (data) ->
        if data.message = "Your order saved"
          $scope.order_flag = false
          $scope.empty_table = true
          $scope.notice = "Ваш заказ принят. Спасибо за покупку! Вы можете перейти в "
          $("#cart_item").find('.badge').html("")
          $("#cart_notice").append('<a href="/persons/profile">Личный кабинет</a>')
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


angular.module('product').controller "CommentsController", ["$scope", "$http","$timeout",  ($scope, $http, $timeout) ->
  $scope.checkForm = ->
      if  $scope.expertForm.$valid
        true
      else
        $scope.expertForm.name.$setTouched(true)
        $scope.expertForm.name.$setDirty(true)
        $scope.expertForm.body.$setTouched(true)
        $scope.expertForm.body.$setDirty(true)
        false

  $scope.submit = (comment) ->
      $http.post("/send_comment", comment: comment)
        .success( (data) ->
          console.log("data", data)
          if data.message and data.message is 'send'
            $scope.comment.name = ""
            $scope.comment.body = ""
            $scope.expertForm.name.$setUntouched(true)
            $scope.expertForm.name.$setPristine(true)
            $scope.expertForm.body.$setUntouched(true)
            $scope.expertForm.body.$setPristine(true)
            $scope.flag_confirm = true
            comment = data.comment
            $scope.comments.push(comment)
        ).error((error) ->
          console.log('error', error)
        )
      console.log("submit")


  ]
