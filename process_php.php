<?php
require_once("auth_session.php");
require_once('db.php');

//inserting favorite movies into database
if (isset($_POST['title'])) {
    $sql = 'INSERT INTO favorite_movies (imdbId, title, type, year, runtime, plot, actors, poster, director, genre, user) VALUES (:imdbId, :title, :type, :year, :runtime, :plot, :actors, :poster, :director, :genre, :user)';
    $statement = $pdo->prepare($sql);
    $statement->execute([
        'imdbId' => $_POST['id'],
        'title' => $_POST['title'],
        'type' => $_POST['type'],
        'year' => $_POST['year'],
        'runtime' => $_POST['runtime'],
        'plot' => $_POST['plot'],
        'actors' => $_POST['actors'],
        'poster' => $_POST['poster'],
        'director' => $_POST['director'],
        'genre' => $_POST['genre'],
        'user' => $_SESSION['username']
    ]);
    $user = $statement->fetch();

    die(json_encode([]));
}

//delete favorite movie from array
if (isset($_POST['delete'])) {
    $sql = 'DELETE FROM favorite_movies WHERE imdbId = :imdbId AND user = :user';
    $statement = $pdo->prepare($sql);
    $statement->execute([
        'imdbId' => $_POST['id'],
        'user' => $_SESSION['username']
    ]);
    $user = $statement->fetch();

    die(json_encode([]));
}

//creating array with informations about favorite movies and sending to javascript
if (isset($_POST['select'])) {
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
            'genre' => $post->genre,
        ]);
    }

    echo json_encode($favorite_movies);
}



