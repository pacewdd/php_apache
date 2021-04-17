<?php

$dbh = new PDO('mysql:host=mariadb;dbname=blogsite', 'web_user', 'mypass');
$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

var_dump($dbh);
