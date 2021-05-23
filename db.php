<?php
/*
$db_host = 'localhost';
$db_user = 'root';
$db_password = 'root';
$db_db = 'film_storage_app';

//set DNS
$dsn = 'mysql:host=' . $db_host . ';dbname=' . $db_db;
*/


$db_host = 'sql.endora.cz';
$db_port = '3317';
$db_user = 'storageadmin';
$db_password = '7Ec3uHUkuQgCEXd';
$db_db = 'moviestorage';

//set DNS
$dsn = 'mysql:host=' . $db_host;
if (isset($db_port)) $dsn .= ';port=' . $db_port;
$dsn .= ';dbname=' . $db_db;

//create PDO instance
$pdo = new PDO($dsn, $db_user, $db_password);
$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);