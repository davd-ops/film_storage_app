<?php

/*
//LOCALHOST
$db_host = 'localhost';
$db_user = 'root';
$db_password = 'root';
$db_db = 'film_storage_app';

//set DSN
$dsn = 'mysql:host=' . $db_host . ';dbname=' . $db_db;

*/


$db_host = 'sql.endora.cz';
$db_port = '3310';
$db_user = 'moviestorage';
$db_password = 'Moviestorage123';
$db_db = 'moviestorage';

//set DSN
$dsn = 'mysql:host=' . $db_host;
if (isset($db_port)) $dsn .= ';port=' . $db_port;
$dsn .= ';dbname=' . $db_db;


//create PDO instance
$pdo = new PDO($dsn, $db_user, $db_password);
$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);

