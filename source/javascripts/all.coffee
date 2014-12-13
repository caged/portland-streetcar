# all.coffee

document.addEventListener 'DOMContentLoaded', (e) ->
  d3.selectAll('.js-street-view').each ->
    el = d3.select this
    lat = el.attr 'data-lat'
    lon = el.attr 'data-lon'
    heading = parseInt el.attr 'data-heading'

    if !isNaN(heading)
      pov = heading: heading, pitch: 0

    view = new google.maps.StreetViewPanorama this, {
      position: new google.maps.LatLng(lat, lon)
      pov: pov
      mode: 'webgl'
      linksControl: false
      panControl: false
      scrollwheel: false
      zoomControlOptions: { style: google.maps.ZoomControlStyle.SMALL }
    }
