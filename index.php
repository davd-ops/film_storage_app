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
    <title>Film storage</title>
</head>
<body>

<h1>AHOJ</h1>

<?php
if (isset($_REQUEST['title'])) {
    $title = str_replace(' ', '%20', $_REQUEST['title']);
    $query = new ApiQuery();
    $query->callApi($title);
} else {
?>
    <form action="" method="post">
        <h1>Enter film or serial title</h1>
        <input type="text" name="title" placeholder="Title" required/>
        <input type="submit" name="submit" value="Submit">
    </form>
<?php
}



?>

</body>
</html>