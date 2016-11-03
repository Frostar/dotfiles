command: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'"

refreshFrequency: 150000 # ms

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  font: 13px  Helvetica Neue
  top: 2px
  right: 160px
  color: #D6E7EE
  span
    color: #9C9486
"""
