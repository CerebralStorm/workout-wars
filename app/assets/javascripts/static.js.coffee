jQuery(document).ready ($) ->
  goToByScroll = (dataslide) ->
    htmlbody.animate
      scrollTop: $(".slide[data-slide=\"" + dataslide + "\"]").offset().top
    , 2000, "easeInOutQuint"

  $(window).stellar()
  links = $(".navigation").find("li")
  slide = $(".slide")
  slide_button = $(".button")
  form_button = $("input.btn")
  mywindow = $(window)
  htmlbody = $("html,body")  

  slide.waypoint (event, direction) ->
    dataslide = $(this).attr("data-slide")
    if direction is "down"
      $(".navigation li[data-slide=\"" + dataslide + "\"]").addClass("active").prev().removeClass "active"
    else
      $(".navigation li[data-slide=\"" + dataslide + "\"]").addClass("active").next().removeClass "active"

  mywindow.scroll ->
    if mywindow.scrollTop() is 0
      $(".navigation li[data-slide=\"1\"]").addClass "active"
      $(".navigation li[data-slide=\"2\"]").removeClass "active"
  
  form_button.click (e) ->
    $(this).closest("form").submit()

  links.click (e) ->
    e.preventDefault()
    dataslide = $(this).attr("data-slide")
    goToByScroll dataslide

  slide_button.click (e) ->
    e.preventDefault()
    dataslide = $(this).attr("data-slide")
    goToByScroll dataslide

