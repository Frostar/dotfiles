command: "df -H | grep '/dev/disk1' | awk '{print $8}'"

refreshFrequency: 60000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="./assets/font-awesome/css/font-awesome.min.css" />
  <div class="disk"
    <span></span>
    <span class="icon"></span>
  </div>
  """

update: (output, el) ->
    $(".disk span:first-child", el).text("  #{output}")
    $icon = $(".disk span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa fa-home")

style: """
  -webkit-font-smoothing: antialiased
  color: #D6E7EE
  font: 10px  Helvetica Neue
  right: 315px
  top: 2px
"""
