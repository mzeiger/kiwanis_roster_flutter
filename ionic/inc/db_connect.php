<?php

// PDO documentation: http://www.phpro.org/tutorials/Introduction-to-PHP-PDO.html
try {
    //   $dbh = new PDO("mysql:host=localhost;dbname=monumen8_mhk-2015", "monumen8_ionic", "TopPy!%pUtTy", array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
    //   $dbh = new PDO("mysql:host=localhost;dbname=monumen8_mhk2022", "monumen8_ionic", "TopPy!%pUtTy", array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
    $dbh = new PDO("mysql:host=localhost;dbname=monumen8_wpmhk", "monumen8_flutter", "fornicate_32", array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Database connect: " . $e->getMessage();
}
