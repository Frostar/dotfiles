# Now Playing for Übersicht
# v0.8
#
# For more info:
# http://github.com/levifig/now-playing.widget
#
# Levi Figueira
# http://levifig.com
#
# ==================================
# Alternate/bottom-pinned layout
# Set `alt-layout` to `true` (see `style:` section below)

command: 'now-playing.widget/lib/get_track_metadata.sh'

refreshFrequency: 5000

render: (output) -> '''
<div id="now-playing">
  <div id="display">
    <div id="art"></div>
    <div id="coverart"></div>
    <div id="text">
      <p id="artist"></p>
      <p id="album"></p>
      <p id="track"></p>
    </div>
  </div>
</div>
'''

afterRender: ->

update: (output) ->
  if !output
    $('#now-playing').hide()
  else
    $('#now-playing').show()
    track = JSON.parse(output)
    if $('#track').text() != track.name
      $('#track').text track.name
      $('#artist').text track.artists[0].name
      $('#album').text track.album.name
      $.getScript 'now-playing.widget/lib/jquery.textfill.min.js', ->
        $('#now-playing').textfill
          minFontPixels: 8
          maxFontPixels: 16
          explicitHeight: 40
          innerTag: '#track'
      if(track.album)
        $('#art').css
          'background-image': 'url(' + track.album.images[0].url + ')'
          'background-size': 'cover'
          'background-repeat': 'no-repeat'
   return

style: """

// Set to true for alternate layout
alt-layout = false

color: #fff
bottom: 200px
left: 200px

#now-playing
  //box-shadow: 25px 25px 50px 15px rgba(0,0,0,0.1)
  border-radius: 5px
  border-color: rgba(0,0,0,0.8)
  position: relative
  overflow: auto
  background: rgba(0,0,0,0.1)

p
  margin: 0

#display
  padding:  0 0

#art
  width: 550px
  height: 550px
  z-index:1

#coverart
  width: 550px
  height: 550px
  z-index: 2
  background-image: -webkit-gradient(
    linear, left top, left bottom, from(rgba(0,0,0,0)), to(rgba(0,0,0,1)),
    color-stop(.5,rgba(0,0,0,0.0)), color-stop(.6,rgba(0,0,0,0.1)), color-stop(.9,rgba(0,0,0,0.7)));
  position: absolute
  top:0
  left:0

#text
  position: absolute
  font-family: Droid Sans, Helvetica Neue, Helvetica, Arial
  z-index: 3
  left: 0
  bottom: 0
  padding: 0.8em
  line-height: 0.7rem
  text-shadow: 0 0 15px rgba(255,255,255,0.1)

#artist, #album
  font-size: 0.9rem
  line-height: 1.0rem
  //overflow-x: hidden
  whitespace: nowrap
  text-overflow: ellipsi5
  color: rgba(255,255,255,0.8)
  //width: 180px
  width: 300px

#album
  font-size: 0.8rem
  font-style: regular
  color: rgba(255,255,255,0.6)

#track
  font-weight: 700
  padding-right: 20px
  margin: 0.2rem 0 0
  line-height: 1.5rem

if alt-layout
  bottom: 0px
  #now-playing
    border-radius: 8px 8px 0 0
  #text
    padding: 0.8em 0.8em 0.4em
"""
