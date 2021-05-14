let movie_array = [];
let favorite_movies = [];
let ajaxRequest;
let ajaxResponseJson = [];

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
            updateMovieArray(json, _id);
        })
        .catch(err => {
            console.error(err);
        });
}

//updating the movie_array
function updateMovieArray(_json, _id){
    movie_array.push({
        "id" : _id,
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
    createMovieInformation(
        _json.Title, _json.Type, _json.Year, _json.Runtime, _json.Plot, _json.Actors, _json.Poster, _json.Director, _json.Genre
    );
}

//if the record is already fetched, we will not fetch it again, we will load it from movie_array
function loadExtendedData(_id){
    if (movie_array.length !== 0){
        let is_found = false;
        for (let i = 0; i < movie_array.length; i++){
            if (movie_array[i].id === _id){
                createMovieInformation(
                    movie_array[i].Title,
                    movie_array[i].Type,
                    movie_array[i].Year,
                    movie_array[i].Runtime,
                    movie_array[i].Plot,
                    movie_array[i].Actors,
                    movie_array[i].Poster,
                    movie_array[i].Director,
                    movie_array[i].Genre
                );
                is_found = true;
            }
        }
        if (is_found === false){
            fetchApi(_id);
        }
    } else {
        fetchApi(_id);
    }
}

//getting favorite movies
function getFavoriteMoviesArray() {
    return ajaxResponseJson;
}


//creating view with extended informations
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
    selectFromDatabase();
}

//hiding extended view
function hideMovieInformation(){
    const movie_view = document.getElementById("movie_view");
    const background = document.getElementById("movie_view_background");
    const body = document.getElementById("body");

    body.style.overflowY = "visible";
    movie_view.style.display = "none";
    background.style.display = "none";
}

//click on the "star button" and make this movie your favorite
function makeFavorite(){
    const star1 = document.getElementById("star1");
    const star2 = document.getElementById("star2");
    const title = document.getElementById("title");
    const year = document.getElementById("year");

    favorite_movies = getFavoriteMoviesArray();

    for (let i = 0; i < movie_array.length; i++){
        if (movie_array[i].Title === title.innerText && movie_array[i].Year === year.innerText){
            if (star1.style.display !== "none"){
                star1.style.display = "none";
                star2.style.display = "block";
                favorite_movies.push(movie_array[i]);
                insertIntoDatabase(
                    movie_array[i].id,
                    movie_array[i].Title,
                    movie_array[i].Type,
                    movie_array[i].Year,
                    movie_array[i].Runtime,
                    movie_array[i].Plot,
                    movie_array[i].Actors,
                    movie_array[i].Poster,
                    movie_array[i].Director,
                    movie_array[i].Genre
                );
            } else {
                star1.style.display = "block";
                star2.style.display = "none";
                deleteFromDatabase(movie_array[i].id);
            }
        }
    }
}

//check if the movie is in favorite array
function checkIsFavorite(){
    const star1 = document.getElementById("star1");
    const star2 = document.getElementById("star2");
    const title = document.getElementById("title");
    const year = document.getElementById("year");

    favorite_movies = getFavoriteMoviesArray();
    const is_favorite = () => {
        for (let i = 0; i < favorite_movies.length; i++){
            if (favorite_movies[i].title === title.innerText && favorite_movies[i].year === year.innerText){
                return true;
            }
        }
    }
    //if is in favorite movies => show the filled star
    if (is_favorite()){
        star1.style.display = "none";
        star2.style.display = "block";
    } else {
        star1.style.display = "block";
        star2.style.display = "none";
    }
}

//setting up ajax and getting back the response
function setUpAjax(){
    try{
        ajaxRequest = new XMLHttpRequest();
    } catch (e){
        try{
            ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try{
                ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e){
                alert("Browser Not Supported");
                return false;
            }
        }
    }
    //get response
    ajaxRequest.onreadystatechange = function(){
        if(ajaxRequest.readyState === 4){
            ajaxResponseJson = JSON.parse(ajaxRequest.responseText);
            checkIsFavorite();
        }
    }
}

//selecting all favorite movies from database
function selectFromDatabase(){
    setUpAjax();

    ajaxRequest.open("POST", "process_ajax.php", true);
    ajaxRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    ajaxRequest.send("select="+encodeURIComponent(1));
}

//inserting new favorite movies into the database
function insertIntoDatabase(_id, _title, _type, _year, _runtime, _plot, _actors, _poster, _director, _genre){
    setUpAjax();

    ajaxRequest.open("POST", "process_ajax.php", true);
    ajaxRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    ajaxRequest.send("id="+encodeURIComponent(_id)+"&title="+encodeURIComponent(_title)
        +"&type="+encodeURIComponent(_type)+"&year="+encodeURIComponent(_year)+"&runtime="+encodeURIComponent(_runtime)
        +"&plot="+encodeURIComponent(_plot)+"&actors="+encodeURIComponent(_actors)+"&poster="+encodeURIComponent(_poster)
        +"&director="+encodeURIComponent(_director)+"&genre="+encodeURIComponent(_genre));
}

//deleting favorite movies from database
function deleteFromDatabase(_id){
    setUpAjax();

    ajaxRequest.open("POST", "process_ajax.php", true);
    ajaxRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    ajaxRequest.send("id="+encodeURIComponent(_id)+"&delete="+encodeURIComponent(1));
}

