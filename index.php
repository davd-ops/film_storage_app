<?php
require_once("auth_session.php");
require_once('db.php');
require_once ("ApiQuery.php");

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
    <title>Film storage</title>
</head>
<body id="body">

<div class="movie_view_background" id="movie_view_background" onclick="hideMovieInformation();"></div>

<div class="container2">
    <p class="lead">You are logged in as <?php echo $_SESSION['username']; ?></p>
    <div class="header-bar">
        <h1 class="logo">C</h1>
        <ul class="slider-menu">
            <a href="index.php">Search</a>
            <a>Profile</a>
            <a>Favorite</a>
            <a href="logout.php">Log out</a>
        </ul>
    </div>
</div>

<div class="movie_view" id="movie_view">
    <div class="movie_view_left">
        <p id="year"></p>
        <p id="runtime"></p>
        <h1 id="title">Movie name</h1>
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

<?php
if (isset($_REQUEST['title'])) {
    $title = str_replace(' ', '%20', $_REQUEST['title']);
    $query = new ApiQuery();
    $query->callApi($title);
} else {
?>
    <form action="" method="post" class="search">
        <h1>Enter movie or series title</h1>
        <input class="center" type="text" name="title" placeholder="..." required/>
        <input class="center" id="submit" type="submit" name="submit" value="Submit">
    </form>
<?php
}



?>

</body>
</html>