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

# jQuery ->
#   $.getScript "https://www.google.com/jsapi", (data, textStatus) ->
#     google.load "visualization", "1.0",
#       packages: ["corechart"]
#       callback: ->
#         # Draw Workout Ditribution Chart
#         data = new google.visualization.DataTable()
#         data.addColumn "string", "Workouts"
#         data.addColumn "number", "Distribution"
#         data.addRows [["Strength", 3], ["Endurance", 1], ["Flexiblity", 1], ["Balance", 1]]

#         options =
#         title: "Workout Distribution"
#         width: 400
#         height: 300

#         chart = new google.visualization.PieChart(document.getElementById("distribution_chart_div"))
#         chart.draw data, options

#         #Draw Strength Area Chart
#         data = google.visualization.arrayToDataTable([["Month", "Pushups", "Pullups", "Squats"], ["08/2013", 1000, 231, 437], ["09/2013", 1112, 247, 491], ["10/2013", 987, 230, 472], ["11/2013", 1221, 290, 503]])
        
#         options =
#           title: "Workout Performance"

#         chart = new google.visualization.AreaChart(document.getElementById("strength_chart_div"))
#         chart.draw data, options

#         #Draw Endurance Area Chart
#         data = google.visualization.arrayToDataTable([["Month", "Running", "Swimming", "Biking"], ["08/2013", 21, 4, 35], ["09/2013", 18, 6, 47], ["10/2013", 25, 4, 32], ["11/2013", 41, 8, 39]])
        
#         options =
#           title: "Workout Performance"

#         chart = new google.visualization.AreaChart(document.getElementById("endurance_chart_div"))
#         chart.draw data, options