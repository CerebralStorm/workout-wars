# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class CompetitionForm
  constructor: () -> 
    window.competitionForm = this
    window.use_limit = true
    $('.datepicker').datepicker
      dateFormat: 'yy-mm-dd'
    $('#competition_competition_type_id').bind "change", @competitionTypeSelected
    $('#competition_competition_type_id').trigger "change"  
    $("input[name='competition[team]']").bind "change", @setTeamSelected
    $('form').on 'click', '.add_fields', @addExercise      
    $('form').on 'click', '.remove_fields', @removeExercise      
    $(".team_show").hide()
  
  addExercise: (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).after($(this).data('fields').replace(regexp, time))
    competitionForm.setUseLimit(window.use_limit)
    event.preventDefault()

  removeExercise: (event) ->
    $(event.target).prev('input[type=hidden]').val('1')
    $(event.target).closest('fieldset').hide()
    event.preventDefault()

  setTeamSelected: (event) -> 
    if event.target.id == 'competition_team_true'
      showTeam()
    else
      hideTeam()

  showTeam = ->
    $('.individual_show').hide()
    $('.team_show').show()

  hideTeam = ->
    $('.individual_show').show()
    $('.team_show').hide()

  competitionTypeSelected: (event) -> 
    competition_type_id = $(@).val()
    path = '/competition_types/' + competition_type_id
    callGetJSON(path) 

  setUseLimit: (bool) =>   
    window.use_limit = bool
    if bool
      $('.use_limit').show()
    else
      $('.use_limit').hide()

  callGetJSON = (path) ->
    $.getJSON path, (data) ->
      if data.use_date
        $("label[for='competition_end_date']").show()
        $('#competition_end_date').show()
      else
        $("label[for='competition_end_date']").hide()
        $('#competition_end_date').hide()
      competitionForm.setUseLimit(data.use_limit)


jQuery ->
  new CompetitionForm() if $('.competition-form').length > 0
