# all.coffee

document.addEventListener 'DOMContentLoaded', (e) ->

  d3.selectAll('.js-pdx-map').each ->
    el = d3.select this
    lat = el.attr 'data-lat'
    lon = el.attr 'data-lon'

    pdxmap = L.mapbox.map(this, 'caged.historical-map-two')
      .setView([20, 65], 3)

    L.mapbox.featureLayer({
      type: 'Feature'
      geometry: { type: 'Point', coordinates: [lat, lon] }
      properties: {
        'marker-size': 'medium'
        'marker-color': '#4e4433'
        'marker-symbol': 'rail-metro'
      }
    }).addTo pdxmap

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
      linksControl: false
      panControl: false
      zoomControlOptions: { style: google.maps.ZoomControlStyle.SMALL }
    }
