# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
<% if @order.errors.any? || @order_item.errors.any? %>
alert("not valid.")
<% else %>
  $(".cart-text").html("<%= escape_javascript(render 'layouts/cart_text') %>")
<% end %>
$(".cart-text").html("<%= escape_javascript(render 'layouts/cart_text') %>")
$(".shopping-cart").html("<%= escape_javascript(render 'carts/shopping_cart') %>")
$(".cart-text").html("<%= escape_javascript(render 'layouts/cart_text') %>")
$(".shopping-cart").html("<%= escape_javascript(render 'carts/shopping_cart') %>")
