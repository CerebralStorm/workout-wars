# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/

# class ExerciseForm
#   constructor: -> 
#     window.master = this
#     $(".remove_fields").bind "click", @removeFields
#     $(".add_fields").bind "click", @addFields      
#     $('.exercise-select').bind "change", @activitySelected
#     exercise_id = $('.exercise-select').val()
#     path = '/exercises/' + exercise_id
#     str = $('.exercise-select').attr('id')
#     pattern = /[0-9]+/g
#     matches = str.match(pattern)
#     @callGetJSON(path, matches[0])    
    
#   removeFields: (event) ->  
#     console.log "removeFields"
#     $(event.target).prev("input[id$=_destroy]").val("1");
#     $(event.target).closest('fieldset').hide()
#     event.preventDefault()
    

#   addFields: (event) ->
#     console.log "addFields"
#     time = new Date().getTime()
#     regexp = new RegExp($(@).data('id'), 'g')
#     $(@).after($(@).data('fields').replace(regexp, time))
#     event.preventDefault()

#   activitySelected: (event) ->
#     exercise_id = $(@).val()
#     path = '/exercises/' + exercise_id
#     str = $(event.target).attr('id')
#     pattern = /[0-9]+/g
#     matches = str.match(pattern)
#     window.master.callGetJSON(path, matches[0])    

#   callGetJSON: (path, id) ->
#     $.getJSON path, (data) ->
#       suffixes = ['_reps', '_sets', '_duration', '_distance', '_weight']
#       for elem in suffixes
#         bool = switch elem 
#           when '_reps' then data.use_reps
#           when '_sets' then data.use_sets
#           when '_duration' then data.use_duration
#           when '_distance' then data.use_distance
#           when '_weight' then data.use_weight
#         rep_label = window.master.setHTMLElement('', id, elem)
#         rep_selector = window.master.setHTMLElement('#', id, elem) 
#         window.master.setField(bool, rep_label, rep_selector)

#   setField: (bool, label, selector) ->
#     if bool 
#       $(selector).show()
#       $("label[for=#{label}").show() 
#     else
#       $(selector).hide()
#       $("label[for=#{label}").hide()

#   setHTMLElement: (prefix, id, suffix) ->
#     prefix + 'workout_exercises_attributes_' + id + suffix


# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/

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