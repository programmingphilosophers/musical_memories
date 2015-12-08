// Some code borrowed from Spotify code example: http://jsfiddle.net/JMPerez/0u0v7e1b/
// ––––––––––––––––––––––––––––––––––––––––––––––––––
$(document).ready(function () {

  // find template and compile it
  var resultsPlaceholder = document.getElementById('results')

  var fetchTracks = function (albumId, callback) {
      $.ajax({
          url: 'https://api.spotify.com/v1/albums/' + albumId,
          success: function (response) {
              callback(response);
          }
      });
  };

  var searchAlbums = function (query) {
      $.ajax({
          url: 'https://api.spotify.com/v1/search?q=artist:' + query + '&type=album&limit=10',
          data: 'json',
          success: function (data) {
            console.log('winner!');
            console.table(data.albums.items);

            for (var i = 0; i < data.albums.items.length; i++) {
              $('#results').append('<p>');
              $('#results').append('<input type="hidden" name="item[album]" value="' + data.albums.items[i].name + '">')
              $('#results').append('<input type="hidden" name="item[artist]" value="' + query + '">')
              $('#results').append(data.albums.items[i].name + '<br>');
              $('#results').append('<input type=image src="' + data.albums.items[i].images[1].url + '">');
              $('#results').append('</p>');
            }
          }
      });
  };

  document.getElementById('search-form').addEventListener('submit', function (e) {
      e.preventDefault();
      searchAlbums(document.getElementById('query').value);
  }, false);

});
