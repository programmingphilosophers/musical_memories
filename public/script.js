// Some code borrowed from Spotify code example: http://jsfiddle.net/JMPerez/0u0v7e1b/
// ––––––––––––––––––––––––––––––––––––––––––––––––––
$(document).ready(function () {
  // Stores the search result in this array.
  var temp_artist = '';

  // Finds the element the search results will appear in.
  var resultsPlaceholder = document.getElementById('results')

  // ---------------
  // Ajax call to Spotify search.
  // ---------------

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
            // Loops through the 10 search results.
            for (var i = 0; i < data.albums.items.length; i++) {
              // Assigns album name and album art to a variable.
              var temp_result = '<div class="falalalala"><p>' + data.albums.items[i].name + '<br>' + '<img src="' + data.albums.items[i].images[1].url + '"></p></div>';
              // Appends it to the results.
              $('#results').append(temp_result);
            }
            // This is the event listener for any image clicked on in the page. Could cause a problem if nav is clicked on.
            $(document).on("click", "img", createform);
          }
      });
  };

  // ---------------
  // Code executes when a search result image is clicked on.
  // ---------------

  var createform = function() {
    // Clears out the element containing memory edit form.
    $('#write_mem').html('');
    // Adds the element that is parent of the image clicked on, along with the pic and album name.
    $('#write_mem').append($(this).parent());
    // Clears out the other search results from the results element.
    $('#results').contents().remove();

    // I know this way of doing things isn't optimal, nor is this even the best way of undertaking this sub-optimal method. Pulls in album name, art, and artist (as entered), and generates a form that allows the user to enter the other info associated with the memory.

    $(this).parent().append('<form action="/memories/create" method="post" id="memory_creation"><input type="hidden" name="memory[album]" value="' + $(this).parent().text() + '"><input type="hidden" name="memory[artist]" value="' + temp_artist + '"><input type="hidden" name="memory[img_url]" value="' + this.src + '"><input type="text" name="memory[specific_song]" placeholder="Song"><br><input type="text" name="memory[year]" placeholder="When?"><br><input type="text" name="memory[setting]" placeholder="Where?"><br><input type="text" name="memory[notes]" placeholder="Write about your memory here." id="blobbox"><br><input type="submit"></form>');

    // Unbinds the click event listener for the picture that executes the code in this block.
    $(document).unbind("click", createform);
  };

  // ---------------
  // This section controls the nav menu animations.
  // ---------------

  var navon = function() {
    $('#nav').css({'display': 'none'});
    $('#navitems').css({'opacity': '0', 'display': 'block'});
    $('#navitems').velocity({'opacity': '+=1'}, 250);
    // The left arrow is in the way.
    $('#left').velocity({'opacity': '-=1'}, 250);
  };

  $('#nav').on("click", navon);

  var navoff = function() {
    $('#navitems').velocity({'opacity': '-=1'}, 250);
    // Putting the left arrow back.
    $('#left').velocity({'opacity': '+=1'}, 250);
    var navtimer = setTimeout(function() {
      $('#navitems').css({'display': 'none'});
      $('#nav').css({'display': 'block'});
    }, 300);
  };

  $('#navitems').on("click", navoff);

  // ---------------
  // This event listener detects submission of search queries.
  // ---------------

  document.getElementById('search-form').addEventListener('submit', function (e) {
      e.preventDefault();
      searchAlbums(document.getElementById('query').value);
  }, false);

});
