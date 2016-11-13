command: "echo $(/usr/local/bin/kwmc query space active tag)"

# command: "echo $(/usr/local/bin/kwmc query window focused name)"

refreshFrequency: 1000 # ms

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #D6E7EE
  font: 13px  Helvetica Neue
  height: 16px
  left: 10px
  overflow: hidden
  text-overflow: ellipsis
  top: 2px
  width: 500px
"""
