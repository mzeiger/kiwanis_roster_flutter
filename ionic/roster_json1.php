<?php

require_once 'inc/db_connect.php';

 try
  {
  /*  $sql = "select A.firstname, A.middlename, A.lastname, A.cb_spousename, A.cb_address, A.cb_city, A.cb_state,
            A.cb_zipcode, A.cb_homephone, A.cb_mobilephone, A.cb_birthdate, B.email
            from mmp_jml_comprofiler A left join mmp_jml_users B on A.id = B.id where lastname is not null order by lastname";
  */

  $sql = "select (@row_number:=@row_number + 1) AS id, A.firstname, A.middlename, A.lastname, A.cb_spouse as cb_spousename, A.cb_address, A.cb_city, A.cb_state,
            A.cb_zipcode, A.cb_phone_home as cb_homephone, A.cb_mobile_phone as cb_mobilephone, A.cb_birthdate, B.email ,
            A.avatar as avatar
            from n4khq_comprofiler A left join n4khq_users B on A.id = B.id,(SELECT @row_number:=0) AS t where lastname is not null order by lastname";

    $query = $dbh->prepare($sql);

    $query->execute();
    $roster = $query->fetchAll(PDO::FETCH_ASSOC) ;
    header('Access-Control-Allow-Origin: *');
    print json_encode($roster);

  }
  catch (Exception $ex)
  {
        $msg = $ex->getMessage();
        echo $msg;
        return;
  }



?>