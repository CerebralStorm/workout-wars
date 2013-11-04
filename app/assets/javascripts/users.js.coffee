# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/

class @ExerciseForm
  constructor: () -> 
    window.master = this 
    $('#exercise_exercise_type_id').bind "change", @exerciseSelected
    $('#exercise_exercise_type_id').trigger "change"   

  exerciseSelected: (event) -> 
    exercise_type_id = $(@).val()
    path = '/exercise_types/' + exercise_type_id
    window.master.callGetJSON(path)    

  callGetJSON: (path) ->
    $.getJSON path, (data) ->
      suffixes = ['_reps', '_sets', '_duration', '_distance', '_weight', '_calories']
      for elem in suffixes
        bool = switch elem 
          when '_reps' then data.use_reps
          when '_sets' then data.use_sets
          when '_duration' then data.use_duration
          when '_distance' then data.use_distance
          when '_weight' then data.use_weight
          when '_calories' then data.use_weight
        selector = window.master.setHTMLElement(elem)
        window.master.setField(bool, selector)

  setField: (bool, selector) ->
    if bool 
      $("##{selector}").closest('li').show()
      $("label[for=#{selector}").show() 
    else
      $("##{selector}").closest('li').hide()
      $("label[for=#{selector}").hide()

  setHTMLElement: (suffix) ->
    'exercise' + suffix

class @UserStats
  constructor: () -> 
    window.chart = this 
    window.chart.chartTitle = "Aerobics"    
    $('#chart').bind "change", @exerciseSelected
    $('#chart').trigger "change" 

  exerciseSelected: (event) -> 
    path = '/exercise_types/' + $('#chart').val()
    $.getJSON path, (data) ->
      window.chart.chartTitle = data.name
      console.log data
      window.chart.setChartData()

  setChartData: ->
    path = "/user_exercises" + window.location.pathname + "?exercise_type_id=" + $('#chart').val()
    $.getJSON path, (data) ->     
      for exercise in data 
        console.log exercise

      $("#statChart").highcharts
        title:
          text: window.chart.chartTitle
          x: -20 #center

        xAxis:
          categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

        yAxis:
          title:
            text: "Metric"

          plotLines: [
            value: 0
            width: 1
            color: "#808080"
          ]

        tooltip:
          valueSuffix: "Reps per Day"

        legend:
          layout: "vertical"
          align: "right"
          verticalAlign: "middle"
          borderWidth: 0

        series: [
          name: "Leaders"
          data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        ,
          name: "You"
          data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
        ,
          name: "Average"
          data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
        ,
          name: "Your Age Group"
          data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
        ] 

jQuery ->
  new ExerciseForm() if $('#exercise_exercise_type_id').length > 0
  new UserStats() if $("#statChart").length > 0

  pattern = /\btab=[a-z]+/;
  tab = location.search.match(pattern)
  if tab
    $('a[href="#exercises"]').tab('show') 

  $('.tab-button').on 'mouseup', (e) ->
    $('.tab-button').removeClass('active')
    $(e.target).addClass('active')

