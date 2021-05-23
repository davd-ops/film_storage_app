<?php
require_once("auth_session.php");

$db_host = 'sql.endora.cz';
$db_port = '3317';
$db_user = 'storageadmin';
$db_password = '7Ec3uHUkuQgCEXd';
$db_db = 'moviestorage';

//set DSN
$dsn = 'mysql:host=' . $db_host;
if (isset($db_port)) $dsn .= ';port=' . $db_port;
$dsn .= ';dbname=' . $db_db;

$pdo = new PDO($dsn, $db_user, $db_password);
$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
$sql = 'SELECT imdbId, title, type, year, runtime, plot, actors, poster, director, genre
                FROM favorite_movies AS fm
                INNER JOIN
                user_movies AS um
                ON fm.imdbId = um.movieId
                INNER JOIN
                users AS u
                ON um.user = u.username
                WHERE user = :user
                ';
$statement = $pdo->prepare($sql);
$statement->execute([
    'user' => $_SESSION['username']
]);
$posts = $statement->fetchAll();
$favorite_movies = array();
foreach ($posts as $post)
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
echo json_encode($favorite_movies);

echo $_SESSION['username'];