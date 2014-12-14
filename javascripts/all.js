(function() {
  "use strict";
  document.addEventListener('DOMContentLoaded', function(e) {
    var el, heading, lat, lon, pov, views, _i, _len, _results;
    views = document.querySelectorAll('.js-street-view');
    _results = [];
    for (_i = 0, _len = views.length; _i < _len; _i++) {
      el = views[_i];
      lat = el.getAttribute('data-lat');
      lon = el.getAttribute('data-lon');
      heading = parseInt(el.getAttribute('data-heading'));
      if (!isNaN(heading)) {
        pov = {
          heading: heading,
          pitch: 0
        };
      }
      _results.push(new google.maps.StreetViewPanorama(el, {
        position: new google.maps.LatLng(lat, lon),
        pov: pov,
        mode: 'webgl',
        linksControl: false,
        panControl: false,
        scrollwheel: false,
        zoomControlOptions: {
          style: google.maps.ZoomControlStyle.SMALL
        }
      }));
    }
    return _results;
  });

}).call(this);
