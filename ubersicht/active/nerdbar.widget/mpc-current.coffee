command: 'nerdbar.widget/lib/get_track.sh'

refreshFrequency: 2000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
  <div class="np"
    <span></span>
    <span class="icon"></span>
  </div>
  """

update: (output, el) ->
    values = output.split('@',2);
    $(".np span:first-child", el).text("  #{values[0]}")
    $icon = $(".np span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa #{@icon(values[1])}")

icon: (status) =>
    return if status.startsWith("playing")
        "fa-play"
    else if status.startsWith("paused")
        "fa-pause"
    else
        ""

style: """
  -webkit-font-smoothing: antialiased
  text-align: center
  color: #D6E7EE
  font: 10px Helvetica Neue
  height: 16px
  left: 25%
  top: 2px
  width: 50%
"""
