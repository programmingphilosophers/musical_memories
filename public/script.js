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
            $('#results').html('');
            $('#results').append('<h5>Results</h5>');
            console.log('winner!');
            console.table(data.albums.items);

            for (var i = 0; i < data.albums.items.length; i++) {

              var temp_result = '<form action="/memories/create" method="post">' + '<input type="hidden" name="memory[is_new]" value="true">' + '<input type="hidden" name="memory[album]" value="' + data.albums.items[i].name + '">' + '<input type="hidden" name="memory[artist]" value="' + query + '">' + data.albums.items[i].name + '<br>' + '<img src="' + data.albums.items[i].images[1].url + '"><br>' + '<input type="submit" value="Begin Memory"></form>';

              // var temp_result = '<p>' + data.albums.items[i].name + '<br>' + '<img src="' + data.albums.items[i].images[1].url + '"></p>';
              $('#results').append(temp_result);

            }
          }
      });
  };

  document.getElementById('search-form').addEventListener('submit', function (e) {
      e.preventDefault();
      searchAlbums(document.getElementById('query').value);
  }, false);

});
