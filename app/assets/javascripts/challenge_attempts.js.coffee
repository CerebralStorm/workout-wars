class AttemptTimer
  constructor: ->
    timer = $.timer(updateTimer, @incrementTime, false)
    $('#startTimer').bind 'click', startTimer(timer)
    @incrementTime = 70 # Timer speed in milliseconds
    @currentTime = 0 # Current time in hundredths of a second

  startTimer = (timer)->
    timer.play()

  updateTimer = ->
    $('#stopwatch').html(formatTime(@currentTime))
    @currentTime += @incrementTime / 10

  @resetStopwatch = ->
      @currentTime = 0
      @Timer.stop().once()

  pad = (number, length) ->
    str = "" + number
    str = "0" + str  while str.length < length
    str

  formatTime = (time) ->
    min = parseInt(time / 6000)
    sec = parseInt(time / 100) - (min * 60)
    hundredths = pad(time - (sec * 100) - (min * 6000), 2)
    ((if min > 0 then pad(min, 2) else "00")) + ":" + pad(sec, 2) + ":" + hundredths

$ ->
  window.AttemptTimer = new AttemptTimer()


