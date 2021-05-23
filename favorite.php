<?php
require_once("auth_session.php");
require_once('db.php');

?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="style.css">
    <script src="script.js" type="text/javascript"></script>
    <title>Favorite | Film storage</title>
</head>
<body id="body">

<div class="movie_view_background" id="movie_view_background" onclick="hideMovieInformation();"></div>

<div class="container2">
    <p class="lead">You are logged in as <?php echo $_SESSION['username']; ?></p>
    <div class="header-bar">
        <h1 class="logo">C</h1>
        <ul class="slider-menu">
            <a href="index.php">Search</a>
            <a href="profile.php">Profile</a>
            <a href="favorite.php">Favorite</a>
            <a href="logout.php">Log out</a>
        </ul>
    </div>
</div>

<div class="movie_view" id="movie_view">
    <div class="movie_view_left">
        <p id="year"></p>
        <p id="runtime"></p>
        <img id="star1" src="images/star2.png" alt="Mark as favorite" onclick="deleteFromFavorite();">
        <img id="star2" src="images/star.png" alt="Unmark as favorite" onclick="deleteFromFavorite();">
        <h1 id="title"></h1>
        <div class="movie_view_inner_first">
            <p id="plot"></p>
        </div>
        <div class="movie_view_inner_second">
            <p id="director"></p>
            <p id="genre"></p>
            <p id="actors"></p>
        </div>
    </div>
    <div class="movie_view_right">
        <img src="" id="poster">
    </div>
</div>

<div class="container" id="movie_container"> <?php
    //select favorite movies for this user
    $sql = 'SELECT imdbId, title, type, year, runtime, plot, actors, poster, director, genre FROM favorite_movies WHERE user = :user';
    $statement = $pdo->prepare($sql);
    $statement->execute([
        'user' => $_SESSION['username']
    ]);
    $posts = $statement->fetchAll();

    $favorite_movies = array();

    foreach ($posts as $post) {
        array_push($favorite_movies, [
            'id' => $post->imdbId,
            'title' => $post->title,
            'type' => $post->type,
            'year' => $post->year,
            'runtime' => $post->runtime,
            'plot' => $post->plot,
            'actors' => $post->actors,
            'poster' => $post->poster,
            'director' => $post->director,
            'genre' => $post->genre
        ]);

        if ($post->type == "movie" || $post->type == "series") {
            ?>
            <div id="<?php echo $post->imdbId ?>" class="movie_item gallery" onClick="createMovieInformation(
                    `<?php echo $post->title; ?>`,
                    `<?php echo $post->type; ?>`,
                    `<?php echo $post->year; ?>`,
                    `<?php echo $post->runtime; ?>`,
                    `<?php echo $post->plot; ?>`,
                    `<?php echo $post->actors; ?>`,
                    `<?php echo $post->poster; ?>`,
                    `<?php echo $post->director; ?>`,
                    `<?php echo $post->genre; ?>`
                    );">
                <div class="gallery-item">
                    <img class="center" src="<?php echo $post->poster ?>">
                    <h1 class="center movie_title"><?php echo $post->title ?></h1>
                </div>
            </div>
            <?php
        }
    }
    ?> </div>

<script>
    if (document.querySelectorAll('.movie_item').length <= 4) {
        document.getElementById("movie_container").style.marginBottom = "140%";
        document.getElementById("body").style.overflow = "hidden";
    } else {
        document.getElementById("movie_container").style.marginBottom = "15%";
    }
</script>

</body>