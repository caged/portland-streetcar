# all.coffee

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


  # drawMap = (el) ->
  #   console.log 'DRAWING'
  #   lat = el.getAttribute 'data-lat'
  #   lon = el.getAttribute 'data-lon'
  #   heading = parseInt el.getAttribute 'data-heading'
  #
  #   if !isNaN(heading)
  #     pov = heading: heading, pitch: 0
  #
  #   new google.maps.StreetViewPanorama el,
  #     position: new google.maps.LatLng(lat, lon)
  #     pov: pov
  #     mode: 'webgl'
  #     linksControl: false
  #     panControl: false
  #     scrollwheel: false
  #     zoomControlOptions: { style: google.maps.ZoomControlStyle.SMALL }
  #
  # setOnScreen = ->
  #   offset = window.pageYOffset
  #   for el in views
  #     if !el.classList.contains 'is-onscreen'
  #       rect = el.getBoundingClientRect()
  #       if offset in [rect.top..(rect.top + rect.height)]
  #         el.classList.add 'is-onscreen'
  #         drawMap(el)
  #
  # window.onscroll = setOnScreen
