command: "echo $(/usr/local/bin/mpc current --format '%artist% - %title%')"

refreshFrequency: 1000 # ms

update: (output, el) ->
    $(".np span:first-child", el).text("  #{output}")
    $icon = $(".np span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa #{@icon(output)}")

icon: (status) =>
    return if status.substring(0, 9) == "[stopped]"
        "fa-stop-circle-o"
    else if status.substring(0, 8) == "[paused]"
        "fa-pause-circle-o"
    else if status.substring(0, 17) == "Connection failed"
        "fa-times-circle-o"
    else
        "fa-play-circle-o"

style: """
  -webkit-font-smoothing: antialiased
  text-align: center
  color: #D6E7EE
  font: 13px Helvetica Neue
  height: 16px
  left: 25%
  overflow: hidden
  text-overflow: ellipsis
  top: 2px
  width: 50%
"""
