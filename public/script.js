// Some code borrowed from Spotify code example: http://jsfiddle.net/JMPerez/0u0v7e1b/
// ––––––––––––––––––––––––––––––––––––––––––––––––––

var temp_artist = [];

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
            temp_artist = query;
            $('#results').html('');
            $('#write_mem').html('');
            $('#results').append('<h5>Results</h5>');
            console.log('winner!');
            console.table(data.albums.items);

            for (var i = 0; i < data.albums.items.length; i++) {

              // var temp_result = '<form action="/memories/create" method="post">' + '<input type="hidden" name="memory[album]" value="' + data.albums.items[i].name + '">' + '<input type="hidden" name="memory[img_url]" value="' + data.albums.items[i].images[1].url + '">' + '<input type="hidden" name="memory[artist]" value="' + query + '">' + data.albums.items[i].name + '<br>' + '<img src="' + data.albums.items[i].images[1].url + '"><br>' + '<input type="submit" value="Begin Memory"></form>';

              var temp_result = '<div class="falalalala"><p>' + data.albums.items[i].name + '<br>' + '<img src="' + data.albums.items[i].images[1].url + '"></p></div>';

              $('#results').append(temp_result);

            }
          }
      });
  };

  $(document).on("click", "img", function() {
    $('#write_mem').html('');
    $('#write_mem').append($(this).parent());
    $('#results').contents().remove();
    console.log(this.src);
    console.log($(this).parent().text());
    $(this).parent().append('<form action="/memories/create" method="post" id="memory_creation"><input type="hidden" name="memory[album]" value="' + $(this).parent().text() + '"><input type="hidden" name="memory[artist]" value="' + temp_artist + '"><input type="hidden" name="memory[img_url]" value="' + this.src + '"><input type="text" name="memory[specific_song]" placeholder="Song"><br><input type="text" name="memory[year]" placeholder="When?"><br><input type="text" name="memory[setting]" placeholder="Where?"><br><input type="text" name="memory[notes]" placeholder="Write about your memory here." id="blobbox"><br><input type="submit"></form>');
  });

  document.getElementById('search-form').addEventListener('submit', function (e) {
      e.preventDefault();
      searchAlbums(document.getElementById('query').value);
  }, false);

});
