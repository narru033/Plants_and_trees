function gmap_show(company) {
  alert('Hello1');
  if ((company.latitude == null) || (company.longitude == null) ) {    // validation check if coordinates are there
    return 0;
  }
  alert('Hello');
  handler = Gmaps.build('Google');    // map init
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){

    markers = handler.addMarkers([    // put marker method
      {
        "lat": company.latitude,    // coordinates from parameter company
        "lng": company.longitude,
        "picture": {    // setup marker icon
          "url": 'http://www.planet-action.org/img/2009/interieur/icons/orange-dot.png',
          "width":  32,
          "height": 32
        },
        "infowindow": "<b>" + company.first_name + "</b> " + company.address + ", " + company.city + " " + company.state
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(12);    // set the default zoom of the map
  });
}
