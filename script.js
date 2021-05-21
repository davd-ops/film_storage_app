let movie_array = [];
let favorite_movies = [];
let ajaxRequest;

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

    if(document.querySelectorAll('.movie_item').length > 4){
        body.style.overflowY = "visible";
    }
    movie_view.style.display = "none";
    background.style.display = "none";
}

//click on the "star button" and make this movie your favorite
async function makeFavorite(){
    const star1 = document.getElementById("star1");
    const star2 = document.getElementById("star2");
    const title = document.getElementById("title");
    const year = document.getElementById("year");

    favorite_movies = await selectFromDatabase();

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

//deleting from favorite movies array - working on favorite.php page
function deleteFromFavorite(){
    const star1 = document.getElementById("star1");
    const star2 = document.getElementById("star2");
    const title = document.getElementById("title");

    for (let i = 0; i < favorite_movies.length; i++){
        if (star1.style.display == "none"){
            star1.style.display = "block";
            star2.style.display = "none";
            for (let i = 0; i < favorite_movies.length; i++) {
                if (favorite_movies[i].title == title.innerText) {
                    deleteFromDatabase(favorite_movies[i].id);
                    const title = document.getElementById("title").innerText;
                    const fav_movies = document.querySelectorAll(".movie_title");
                    for (i = 0; i < fav_movies.length; i++) {
                        if (fav_movies[i].innerText == title){
                            document.getElementById("movie_view_background").style.display = "none";
                            fav_movies[i].parentElement.parentElement.style.display = "none";
                            document.getElementById("movie_view").style.display = "none";
                            if(document.querySelectorAll('.movie_item:not([style*="display:none"]):not([style*="display: none"])').length <= 4){
                                document.getElementById("movie_container").style.marginBottom = "30%";
                                document.getElementById("body").style.overflow = "hidden";
                            }
                        }
                    }
                }
            }
        }
    }
}

//check if the movie is in favorite array
async function checkIsFavorite(){
    const star1 = document.getElementById("star1");
    const star2 = document.getElementById("star2");
    const title = document.getElementById("title");
    const year = document.getElementById("year");

    favorite_movies = await selectFromDatabase();
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

//selecting all favorite movies from database
async function selectFromDatabase(){
    const formData = new FormData();
    formData.append('select', 1);

    const response = await fetch('process_php.php', { method: 'POST', body: formData });
    const ajaxResponseJson = await response.json();
    checkIsFavorite();
    return ajaxResponseJson;
}

//inserting new favorite movies into the database
async function insertIntoDatabase(_id, _title, _type, _year, _runtime, _plot, _actors, _poster, _director, _genre){
    const formData = new FormData();
    formData.append('id', _id);
    formData.append('title', _title);
    formData.append('type', _type);
    formData.append('year', _year);
    formData.append('runtime', _runtime);
    formData.append('plot', _plot);
    formData.append('actors', _actors);
    formData.append('poster', _poster);
    formData.append('director', _director);
    formData.append('genre', _genre);


    const response = await fetch('process_php.php', { method: 'POST', body: formData });
    checkIsFavorite();
}

//deleting favorite movies from database
async function deleteFromDatabase(_id){
    const formData = new FormData();
    formData.append('id', _id);
    formData.append('delete', 1);


    const response = await fetch('process_php.php', { method: 'POST', body: formData });
    ajaxResponseJson = await response.json();
    checkIsFavorite();
}

