let movie_array = [];

//fetching data from imdb API
function fetchApi(_id){
    fetch(`https://movie-database-imdb-alternative.p.rapidapi.com/?i=${_id}&r=json&plot=full`, {
        "method": "GET",
        "headers": {
            "x-rapidapi-key": "48977c75b7mshf9ec82ca69c6e31p13758djsn286d7e862508",
            "x-rapidapi-host": "movie-database-imdb-alternative.p.rapidapi.com"
        }
    })
        .then(async response => {
            const json = await response.json();
            updateMovieArray(json);
        })
        .catch(err => {
            console.error(err);
        });
}

//updating the movie_array
function updateMovieArray(_json){
    if (localStorage.getItem('movie_array') !== null) {
        movie_array = getMovieArrayFromLocalstorage();
    }
    console.log(_json);
    movie_array.push({
        "Title" : _json.Title,
        "Type" : _json.Type,
        "Year" : _json.Year,
        "Runtime" : _json.Runtime,
        "Plot" : _json.Plot,
        "Actors" : _json.Actors,
        "Poster" : _json.Poster,
        "Director" : _json.Director,
        "Genre" : _json.Genre

    })
    console.log(movie_array);
    setMovieArrayInLocalstorage(movie_array);
    createMovieInformation(
        _json.Title, _json.Type, _json.Year, _json.Runtime, _json.Plot, _json.Actors, _json.Poster, _json.Director, _json.Genre
    );
}

//getting "movie_array" from the localstorage
function getMovieArrayFromLocalstorage() {
    return JSON.parse(localStorage.getItem('movie_array'));
}

//uploading "movie_array" to the localstorage
function setMovieArrayInLocalstorage(_movie_array) {
    localStorage.setItem('movie_array', JSON.stringify(_movie_array));
}

function createMovieInformation (_title, _type, _year, _runtime, _plot, _actors, _poster, _director, _genre) {
    const movie_view = document.getElementById("movie_view");
    const title = document.getElementById("title");
    const year = document.getElementById("year");
    const poster = document.getElementById("poster");
    const runtime = document.getElementById("runtime");
    const plot = document.getElementById("plot");
    const actors = document.getElementById("actors");
    const director = document.getElementById("director");
    const genre = document.getElementById("genre");
    const background = document.getElementById("movie_view_background");
    const body = document.getElementById("body");

    body.style.overflowY = "hidden";
    movie_view.style.display = "block";
    background.style.display = "block";
    title.innerText = _title;
    year.innerText = _year;
    poster.src = _poster;
    runtime.innerText = _runtime;
    plot.innerHTML = _plot;
    actors.innerHTML = "<span class='darker_text'>Cast: </span><b>" + _actors + "</b>";
    director.innerHTML = "<span class='darker_text'>Directed by: </span><b>" + _director + "</b>";
    genre.innerHTML = "<span class='darker_text'>Genres: </span><b>" + _genre + "</b>";
}

function hideMovieInformation(){
    const movie_view = document.getElementById("movie_view");
    const background = document.getElementById("movie_view_background");
    const body = document.getElementById("body");

    body.style.overflowY = "visible";
    movie_view.style.display = "none";
    background.style.display = "none";
}