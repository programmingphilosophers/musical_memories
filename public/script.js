// Some code borrowed from Spotify code example: http://jsfiddle.net/JMPerez/0u0v7e1b/
// ––––––––––––––––––––––––––––––––––––––––––––––––––
$(document).ready(function () {

  var temp_artist = [];

  // find template and compile it
  var resultsPlaceholder = document.getElementById('results')

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

              var temp_result = '<div class="falalalala"><p>' + data.albums.items[i].name + '<br>' + '<img src="' + data.albums.items[i].images[1].url + '"></p></div>';

              $('#results').append(temp_result);
            }
            $(document).on("click", "img", createform);
          }
      });
  };

  var createform = function() {
    $('#write_mem').html('');
    $('#write_mem').append($(this).parent());
    $('#results').contents().remove();
    console.log(this.src);
    console.log($(this).parent().text());

    // I know this way of doing things isn't optimal, nor is this even the best way of undertaking this sub-optimal method.

    $(this).parent().append('<form action="/memories/create" method="post" id="memory_creation"><input type="hidden" name="memory[album]" value="' + $(this).parent().text() + '"><input type="hidden" name="memory[artist]" value="' + temp_artist + '"><input type="hidden" name="memory[img_url]" value="' + this.src + '"><input type="text" name="memory[specific_song]" placeholder="Song"><br><input type="text" name="memory[year]" placeholder="When?"><br><input type="text" name="memory[setting]" placeholder="Where?"><br><input type="text" name="memory[notes]" placeholder="Write about your memory here." id="blobbox"><br><input type="submit"></form>');

    $(document).unbind("click", createform);
  };

  var navon = function() {
    $('#nav').css({'display': 'none'});
    $('#navitems').css({'opacity': '0', 'display': 'block'});
    $('#navitems').velocity({'opacity': '+=1'}, 500);
    $('#left').velocity({'opacity': '-=1'}, 500);
  };

  $('#nav').on("click", navon);

  var navoff = function() {
    $('#navitems').velocity({'opacity': '-=1'}, 250);
    $('#left').velocity({'opacity': '+=1'}, 250);
    var navtimer = setTimeout(function() {
      $('#navitems').css({'display': 'none'});
      $('#nav').css({'display': 'block'});
    }, 300);
  };

  $('#navitems').on("click", navoff);

  document.getElementById('search-form').addEventListener('submit', function (e) {
      e.preventDefault();
      searchAlbums(document.getElementById('query').value);
  }, false);

});
