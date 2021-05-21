<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="style.css">
    <script src="script.js" type="text/javascript"></script>
    <title>Login | Film storage</title>
</head>
<body id="login-body">
<?php
require_once('db.php');
session_start();
// When form submitted, check and create user session.
if (isset($_POST['username'])) {
    $username = $_REQUEST['username'];
    $password = $_REQUEST['password'];
    $sql = 'SELECT * FROM users WHERE username = :username && password = :password';
    $statement = $pdo->prepare($sql);
    $statement->execute(['username' => $username, 'password' => md5($password)]);
    $user = $statement->fetch();

    if (isset($user->username)) {
        $_SESSION['username'] = $username;
        // Redirect to user dashboard page
        header("Location: index.php");
    } else {
        echo "
                <div class='center_hor_and_ver'>
                  <h3 class='link'>Incorrect Username/password.</h3><br/>
                  <p class='link'><a href='login.php'>Click <u>here</u> to login again.</a></p>
                </div>
             ";
    }

} else {
    ?>
    <form class="login-form" method="post" name="login">
        <h1 class="login-title">Login to see the application</h1>
        <input type="text" class="login-input center" name="username" placeholder="Username" autofocus="true" required/>
        <input type="password" class="login-input center" name="password" placeholder="Password" required/>
        <input type="submit" value="Login" name="submit" class="login-button center"/>
        <p class="link"><a href="registration.php">New Registration</a></p>
    </form>
    <?php
}
?>
</body>
</html>