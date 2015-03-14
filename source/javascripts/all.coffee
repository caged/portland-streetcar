---
# this ensures Jekyll reads the file to be transformed into JS later
---
"use strict";

document.addEventListener 'DOMContentLoaded', (e) ->
  views = document.querySelectorAll '.js-street-view'
  for el in views
    lat = el.getAttribute 'data-lat'
    lon = el.getAttribute 'data-lon'
    heading = parseInt el.getAttribute 'data-heading'

    if !isNaN(heading)
      pov = heading: heading, pitch: 0

    new google.maps.StreetViewPanorama el,
      position: new google.maps.LatLng(lat, lon)
      pov: pov
      mode: 'webgl'
      linksControl: false
      panControl: false
      scrollwheel: false
      zoomControlOptions: { style: google.maps.ZoomControlStyle.SMALL }
