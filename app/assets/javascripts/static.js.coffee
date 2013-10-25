class IndexView
  constructor: ->
    $(window).stellar()

    $(".slide").waypoint (direction) ->
      dataslide = $(this).attr("data-slide")
      if direction is "down"
        $(".static-navigation li[data-slide=\"" + dataslide + "\"]").addClass("active").prev().removeClass "active"
      else
        $(".static-navigation li[data-slide=\"" + dataslide + "\"]").addClass("active").next().removeClass "active"

    $(window).scroll ->
      if $(window).scrollTop() is 0
        $(".static-navigation li[data-slide=\"1\"]").addClass "active"
        $(".static-navigation li[data-slide=\"2\"]").removeClass "active"
    
    $("input.btn").click (e) ->
      $(this).closest("form").submit()

    $(".static-navigation").find("li").click (e) ->
      e.preventDefault()
      dataslide = $(this).attr("data-slide")
      goToByScroll dataslide

    $(".button").click (e) ->
      e.preventDefault()
      dataslide = $(this).attr("data-slide")
      goToByScroll dataslide

  goToByScroll = (dataslide) ->
    $("html,body").animate
      scrollTop: $(".slide[data-slide=\"" + dataslide + "\"]").offset().top
    , 2000, "easeInOutQuint"

jQuery(document).ready ($) ->
  new IndexView()
  

   

  

