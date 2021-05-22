<?php
require_once("auth_session.php");
require_once("db.php");
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
    <title>Profile | Film storage</title>
</head>
<body id="profile_body">
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

<div class="profile_forms">
    <form action="" method="post" id="change_name">
        <h1>Current name: <br><?php echo $_SESSION['username']; ?></h1>
        <h1>New name: <br><input name="new_name" type="text" required></h1>
        <input class="center submit_btn" type="submit" name="submit_name" value="Change name">
    </form>
    <form action="" method="post" id="change_password">
        <h1 class="">Current password: <br><input name="old_pass" type="password"" required></h1>
        <h1 class="">New password: <br><input name="new_pass" type="password"" required></h1>
        <input class="center submit_btn" type="submit" name="submit_pass" value="Change password">
    </form>
</div>

<form action="" method="post" class="contact_us">
    <h1 class="center_text" id="contact_us_h1">Contact us</h1>
    <h1>Subject: <input name="subject" type="text"></h1>
    <h1>Your email: <input name="guest_email" type="email"></h1>
    <h1>Your message: <input name="message" type="text"></h1>
    <input class="center" id="contact_submit" type="submit" name="submit" value="Submit">
</form>
</body>
<?php
//send email to chosen email address
if (isset($_POST['subject']) && isset($_POST['guest_email'])) {
    $to = 'davidpsencik01@gmail.com';
    $subject = $_POST['subject'];
    $message = $_POST['message'];
    $headers = array(
        'From' => $_POST['guest_email'],
        'Reply-To' => $_POST['guest_email'],
        'X-Mailer' => 'PHP/' . phpversion()
    );

    mail($to, $subject, $message, $headers);
    echo "Úspěšně odesláno!";
//set name to new name
} else if (isset($_POST['new_name'])) {
    $new_name = $_POST['new_name'];
    //updating the record of user's name in favorite movies database
    $sql = 'UPDATE user_movies SET user = :new_username WHERE user = :old_username';
    $statement = $pdo->prepare($sql);
    $statement->execute(['new_username' => $new_name, 'old_username' => $_SESSION['username']]);
    $user = $statement->fetch();

    //updating user's name
    $sql = 'UPDATE users SET username = :new_username WHERE username = :old_username';
    $statement = $pdo->prepare($sql);
    $statement->execute(['new_username' => $new_name, 'old_username' => $_SESSION['username']]);
    $user = $statement->fetch();
    $_SESSION['username'] = $new_name;
    header("Location: profile.php");
//set old pass to new pass
} else if (isset($_POST['old_pass']) && isset($_POST['new_pass'])) {
    $new_pass = $_POST['new_pass'];
    $old_pass = $_POST['old_pass'];
    $sql = 'UPDATE users SET password = :new_password WHERE password = :old_password && username = :username';
    $statement = $pdo->prepare($sql);
    $statement->execute(['new_password' => md5($new_pass), 'old_password' => md5($old_pass), 'username' => $_SESSION['username']]);
    $user = $statement->fetch();
}

