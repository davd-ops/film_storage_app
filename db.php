<?php
$db_host = 'sql.endora.cz:3317';
$db_user = 'storageadmin';
$db_password = '7Ec3uHUkuQgCEXd';
$db_db = 'moviestorage';

//set DNS
$dns = 'mysql:host=' . $db_host . ';dbname=' . $db_db;

//create PDO instance
$pdo = new PDO($dns, $db_user, $db_password);
$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);