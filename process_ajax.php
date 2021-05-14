<?php
require_once("auth_session.php");
require_once('db.php');


if (isset($_POST['title'])){
        $sql = 'INSERT INTO favorite_movies (id, title, type, year, runtime, plot, actors, poster, director, genre) VALUES (:id, :title, :type, :year, :runtime, :plot, :actors, :poster, :director, :genre)';
        $statement = $pdo->prepare($sql);
        $statement->execute([
            'id' => $_POST['id'],
            'title' => $_POST['title'],
            'type' => $_POST['type'],
            'year' => $_POST['year'],
            'runtime' => $_POST['runtime'],
            'plot' => $_POST['plot'],
            'actors' => $_POST['actors'],
            'poster' => $_POST['poster'],
            'director' => $_POST['director'],
            'genre' => $_POST['genre']
        ]);
        $user = $statement->fetch();
    }

    if (isset($_POST['delete'])){
        $sql = 'DELETE FROM favorite_movies WHERE id = :id';
        $statement = $pdo->prepare($sql);
        $statement->execute([
            'id' => $_POST['id']
        ]);
        $user = $statement->fetch();

    }

    if (isset($_POST['select'])){
        $sql = 'SELECT * FROM favorite_movies';
        $statement = $pdo->prepare($sql);
        $statement->execute();
        $posts = $statement->fetchAll();

        $favorite_movies = array();

        foreach ($posts as $post){
            array_push($favorite_movies, [
                'id' => $post->id,
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
        }

        echo json_encode($favorite_movies);
    }



