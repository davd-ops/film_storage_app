<?php
$db_host = 'localhost';
$db_user = 'root';
$db_password = 'root';
$db_db = 'film_storage_app';

//set DNS
$dns = 'mysql:host='.$db_host.';dbname='.$db_db;

//create PDO instance
$pdo = new PDO($dns, $db_user, $db_password);
$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);