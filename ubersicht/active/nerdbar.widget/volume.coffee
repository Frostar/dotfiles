command: "~/tools/volume.sh"

refreshFrequency: 1000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
  <div class="battery"
    <span></span>
    <span class="icon"></span>
  </div>
  """

update: (output, el) ->
    bat = parseInt(output)
    $(".battery span:first-child", el).text("  #{output}")
    $icon = $(".battery span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa #{@icon(bat)}")

icon: (output) =>
  return if output > 49
    "fa-volume-up"
  else if output > 1
    "fa-volume-down"
  else
    "fa-volume-off"

style: """
  -webkit-font-smoothing: antialiased
  color: #D6E7EE
  font: 13px  Helvetica Neue
  right: 275px
  top: 2px
"""
