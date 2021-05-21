<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="style.css">
    <script src="script.js" type="text/javascript"></script>
    <title>Registration | Film storage</title>
</head>
<body id="registration-body">
<?php
require_once('db.php');


// When form submitted, insert values into the database.

if (isset($_REQUEST['username'])) {
    $username = $_REQUEST['username'];
    $email    = $_REQUEST['email'];
    $password = $_REQUEST['password'];
    $create_datetime = date("Y-m-d H:i:s");
    $sql = 'SELECT * FROM users WHERE username = :username';
    $statement = $pdo->prepare($sql);
    $statement->execute(['username' => $username]);
    $post = $statement->fetch();
    if (!$post){
        $sql = 'INSERT INTO users(username,email,password,create_datetime) VALUES(:username, :email, :password, :create_datetime)';
        $statement = $pdo->prepare($sql);
        if (!empty($_REQUEST['username']) && !empty($_REQUEST['email']) && !empty($_REQUEST['password'])) {
            if (strlen($_REQUEST['password']) < 8){
                echo "
                <div class='form'>
                <h3>Password must be atleast 8 characters long.</h3><br/>
                <p class='link'><a href='registration.php'>Click here to register again.</a></p>
                </div>
             ";
            }else {
                $statement->execute(['username' => $username,'email' => $email,'password' => md5($password), 'create_datetime' => $create_datetime]);
                echo "
                <div class='form'>
                    <h3 class='link'>You are registered successfully.</h3><br/>
                    <p class='link'><a href='login.php'>Click here to login.</a></p>
                </div>
             ";
            }
        } else {
            echo "
                <div class='form'>
                <h3 class='link'>Required fields are missing.</h3><br/>
                <p class='link'><a href='registration.php'>Click here to register again.</a></p>
                </div>
             ";
        }
    }else{
        echo "
                <div class='form'>
                <h3 class='link'>This name is already taken.</h3><br/>
                <p class='link'><a href='registration.php'>Click here to register again.</a></p>
                </div>
             ";
    }

} else {
    ?>
    <form class="login-form" action="" method="post">
        <h1 class="login-title">Register to see the application</h1>
        <input type="text" class="login-input center" name="username" placeholder="Username" required/>
        <input type="email" class="login-input center" name="email" placeholder="Email Adress" required>
        <input type="password" class="login-input center" name="password" placeholder="Password" minlength="8" required>
        <input type="submit" name="submit" value="Register" class="login-button center">
        <p class="link"><a href="login.php">Click to Login</a></p>
    </form>
    <?php
}
?>
</body>
</html>