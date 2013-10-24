class AttemptTimer
  constructor: ->
    $('#pause-timer').hide()
    $('#submit-timer').hide()
    window.clock = $(".clock").FlipClock({
      autoStart: false
    }) 
       
    $('#start-timer').on 'click', ->
      window.clock.start ->
      $('#start-timer').hide()
      $('#pause-timer').show()
      $('#submit-timer').show()
    $('#pause-timer').on 'click', ->
      value = $('#pause-timer').text()
      if value == "Pause"
        $('#pause-timer').text("Resume")
        window.clock.stop ->
      else
        $('#pause-timer').text("Pause")
        window.clock.start ->

    $('#submit-timer').on 'click', ->
      time = window.clock.getTime()
      console.log time.time 


$ ->
  window.AttemptTimer = new AttemptTimer() if $('.clock').length > 0


