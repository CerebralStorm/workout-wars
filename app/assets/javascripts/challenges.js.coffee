# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class ChallengeForm
  constructor: () -> 
    window.challengeForm = this
    window.use_limit = true
    $('.datepicker').datepicker
      dateFormat: 'yy-mm-dd'
    $('#challenge_challenge_type_id').bind "change", @challengeTypeSelected
    $('#challenge_challenge_type_id').trigger "change"  
    $("input[name='challenge[team]']").bind "change", @setTeamSelected
    $('form').on 'click', '.add_fields', @addExercise      
    $('form').on 'click', '.remove_fields', @removeExercise      
    $(".team_show").hide()
  
  addExercise: (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).after($(this).data('fields').replace(regexp, time))
    challengeForm.setUseLimit(window.use_limit)
    event.preventDefault()

  removeExercise: (event) ->
    $(event.target).prev('input[type=hidden]').val('1')
    $(event.target).closest('fieldset').hide()
    event.preventDefault()

  setTeamSelected: (event) -> 
    if event.target.id == 'challenge_team_true'
      showTeam()
    else
      hideTeam()

  showTeam = ->
    $('.individual_show').hide()
    $('.team_show').show()

  hideTeam = ->
    $('.individual_show').show()
    $('.team_show').hide()

  challengeTypeSelected: (event) -> 
    challenge_type_id = $(@).val()
    path = '/challenge_types/' + challenge_type_id
    callGetJSON(path) 

  setUseLimit: (bool) =>   
    window.use_limit = bool
    if bool
      $('.use_limit').show()
    else
      $('.use_limit').hide()

  callGetJSON = (path) ->
    $.getJSON path, (data) ->
      console.log data
      if data.use_date
        $("label[for='challenge_end_date']").show()
        $('#challenge_end_date').show()
      else
        $("label[for='challenge_end_date']").hide()
        $('#challenge_end_date').hide()
      challengeForm.setUseLimit(data.use_limit)


jQuery ->
  new ChallengeForm() if $('.challenge-form').length > 0