# command: 'nerdbar.widget/lib/get_track.sh'
command: 'username=' + 'Jens_Frost' + '; curl -s "http://ws.audioscrobbler.com/2.0/?method=user.getRecentTracks&user=$username&api_key=b25b959554ed76058ac220b7b2e0a026&format=json&limit=1"'

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
    if(!output)
        return

    data = JSON.parse(output)
    track = data.recenttracks.track[0]
    if track['@attr']
        $('#timestamp').text 'Now Playing'
        $(".np span:first-child", el).text("  #{track.artist['#text']}" + " - " + "#{track.name} ")
        $icon = $(".np span.icon", el)
        $icon.removeClass().addClass("icon")
        $icon.addClass("fa fa-music")
    else
        return



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
