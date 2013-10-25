class AttemptTimer
  constructor: ->
    $('#pause-timer').hide()
    $('#submit-timer').hide()
    window.clock = $(".clock").FlipClock({
      autoStart: false
    }) 
       
    $('#start-timer').on 'click', ->
      startTimer()
    $('#pause-timer').on 'click', ->
      pauseToggle()
    $('#submit-timer').on 'click', ->
      console.log "test"
      submitTime()

  startTimer = ->
    window.clock.start ->
    $('#start-timer').hide()
    $('#pause-timer').show()
    $('#submit-timer').show()

  pauseToggle = ->
    value = $('#pause-timer').text()
    if value == "Pause"
      $('#pause-timer').text("Resume")
      window.clock.stop ->
    else
      $('#pause-timer').text("Pause")
      window.clock.start ->

  submitTime = ->
    timer = window.clock.getTime()
    $('#challenge_attempt_completion_time').val(timer.time)
    $('.edit_challenge_attempt').submit()

$ ->
  window.AttemptTimer = new AttemptTimer() if $('.clock').length > 0


