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