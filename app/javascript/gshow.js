// var map;
// var marker;
// var geocoder;
// function initMap() {
//   geocoder = new google.maps.Geocoder();
//   geocoder.geocode({
//   'address': '東京都新宿区西新宿4-29' //住所
//   }, function(results, status) {
//     if (status === google.maps.GeocoderStatus.OK) {
//     map = new google.maps.Map(document.getElementById('gmap'), {
//       center: results[0].geometry.location,
//       zoom: 17 //ズーム
//    });
//   marker = new google.maps.Marker({
//   position: results[0].geometry.location,
//   map: map
//   });
//   infoWindow = new google.maps.InfoWindow({
//   content: '<h4>ツールチップのタイトル</h4>'
//   });
//   marker.addListener('click', function() {
//     infoWindow.open(map, marker);
//   });
//   } else {
//     alert(status);
//   }
// });
// }


function initMaps() { //Map's'
    const map = new google.maps.Map(document.getElementById("gmap"), {
      center: { lat: 34.985849, lng: 135.7587667 },
      zoom: 12,
    });
    const request = {
      placeId: gon.shop.location,
      fields: ["name", "formatted_address", "url", "geometry"],
    };
    const infowindow = new google.maps.InfoWindow();
    const service = new google.maps.places.PlacesService(map);
    service.getDetails(request, (place, status) => {
      if (status === google.maps.places.PlacesServiceStatus.OK) {
        const marker = new google.maps.Marker({
          map,
          position: place.geometry.location,
        });
        google.maps.event.addListener(marker, "click", function () {
          infowindow.setContent(
            "<div><strong>" +
              place.name +
              "</strong><br>" +
              "url: " +
              place.url +
              "<br>" +
              place.formatted_address +
              "</div>"
          );
          // downloadByURL(url: string) {
          //   const link = document.createElement('a')
          //   link.href = place.url
          //   link.click()
          // };
          // downloadByURL(place.url)
          infowindow.open(map, this);
        });
      }
    });
}

window.addEventListener('load', function (){
  initMaps()
});

const options = {
  root: null,
  rootMargin: "-50% 0px",
  threshold: 0
};
const observer = new IntersectionObserver(initMaps, options);
