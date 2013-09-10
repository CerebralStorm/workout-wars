# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $.getScript "https://www.google.com/jsapi", (data, textStatus) ->
    google.load "visualization", "1.0",
      packages: ["corechart"]
      callback: ->
        # Draw Workout Ditribution Chart
        data = new google.visualization.DataTable()
        data.addColumn "string", "Workouts"
        data.addColumn "number", "Distribution"
        data.addRows [["Strength", 3], ["Endurance", 1], ["Flexiblity", 1], ["Balance", 1]]

        options =
        title: "Workout Distribution"
        width: 400
        height: 300

        chart = new google.visualization.PieChart(document.getElementById("distribution_chart_div"))
        chart.draw data, options

        #Draw Strength Area Chart
        data = google.visualization.arrayToDataTable([["Month", "Pushups", "Pullups", "Squats"], ["08/2013", 1000, 231, 437], ["09/2013", 1112, 247, 491], ["10/2013", 987, 230, 472], ["11/2013", 1221, 290, 503]])
        
        options =
          title: "Workout Performance"

        chart = new google.visualization.AreaChart(document.getElementById("strength_chart_div"))
        chart.draw data, options

        #Draw Endurance Area Chart
        data = google.visualization.arrayToDataTable([["Month", "Running", "Swimming", "Biking"], ["08/2013", 21, 4, 35], ["09/2013", 18, 6, 47], ["10/2013", 25, 4, 32], ["11/2013", 41, 8, 39]])
        
        options =
          title: "Workout Performance"

        chart = new google.visualization.AreaChart(document.getElementById("endurance_chart_div"))
        chart.draw data, options