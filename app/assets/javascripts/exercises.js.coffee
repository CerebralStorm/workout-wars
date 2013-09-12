# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(@).prev("input[id$=_destroy]").val("1");
    $(@).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(@).data('id'), 'g')
    $(@).after($(@).data('fields').replace(regexp, time))
    event.preventDefault()

  $('.activity-select').change (event) ->
    activity_id = $(@).val()
    path = '/activities/' + activity_id
    str = $(event.target).attr('id')
    pattern = /[0-9]+/g
    matches = str.match(pattern)
    $.getJSON path, (data) ->
      # THIS NEEDS TO BE REFACTORED
      rep_label = 'workout_exercises_attributes_' + matches[0] + '_reps'
      rep_selector = '#workout_exercises_attributes_' + matches[0] + '_reps' 
      if data.use_reps 
        $(rep_selector).show()
        $("label[for=#{rep_label}").show() 
      else
        $(rep_selector).hide()
        $("label[for=#{rep_label}").hide() 

      sets_label = 'workout_exercises_attributes_' + matches[0] + '_sets'
      sets_selector = '#workout_exercises_attributes_' + matches[0] + '_sets'
      if data.use_reps 
        $(sets_selector).show()
        $("label[for=#{sets_label}").show() 
      else
        $(sets_selector).hide()
        $("label[for=#{sets_label}").hide() 

