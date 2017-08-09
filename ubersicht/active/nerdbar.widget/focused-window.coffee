command: "echo \"#$(/usr/local/bin/chunkc tiling:query --desktop id) [$(/usr/local/bin/chunkc tiling:query --desktop mode)]\" $(/usr/local/bin/chunkc tiling:query --window tag)"

refreshFrequency: 1000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
  <div class="foc"
    <span></span>
    <span class="icon"></span>
  </div>
  """

update: (output, el) ->
    $(".foc span:first-child", el).text("  #{output}")
    $icon = $(".foc span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa fa-columns")

style: """
  -webkit-font-smoothing: antialiased
  color: #D6E7EE
  font: 10px  Helvetica Neue
  height: 16px
  left: 10px
  width: 500px
  white-space: nowrap
  overflow: hidden
  text-overflow: ellipsis
  top: 2px
"""
