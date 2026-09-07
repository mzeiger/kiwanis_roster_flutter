<?php

require_once 'inc/db_connect.php';

 try
  {
  /*  $sql = "select A.firstname, A.middlename, A.lastname, A.cb_spousename, A.cb_address, A.cb_city, A.cb_state,
            A.cb_zipcode, A.cb_homephone, A.cb_mobilephone, A.cb_birthdate, B.email
            from mmp_jml_comprofiler A left join mmp_jml_users B on A.id = B.id where lastname is not null order by lastname";
  */
    $sql = "select A.firstname, A.middlename, A.lastname, A.cb_spouse as cb_spousename, A.cb_address, A.cb_city, A.cb_state,
            A.cb_zipcode, A.cb_phone_home as cb_homephone, A.cb_mobile_phone as cb_mobilephone, A.cb_birthdate, B.email, A.avatar,B.block
            from n4khq_comprofiler A left join n4khq_users B on A.id = B.id where lastname is not null and block = 0 order by lastname";

    $query = $dbh->prepare($sql);

    $query->execute();
   // $roster = $query->fetchAll(PDO::FETCH_ASSOC) ;
    $members = array();
    while ($member = $query->fetch()) {
        array_push($members, array (
             'firstname' => $member[0],
             'middlename' => $member[1],
             'lastname' => $member[2],
             'cb_spousename' => $member[3],
             'cb_address' => $member[4],
             'cb_city' => $member[5],
             'cb_state' => $member[6],
             'cb_zipcode' => $member[7],
             'cb_homephone' => $member[8],
             'cb_mobilephone' => $member[9],
             'cb_birthdate' => $member[10],
             'email' => $member[11],
             'avatar' => $member[12],
             'block' => $member[13]
        ));
    }

    header('Access-Control-Allow-Origin: *');

    echo json_encode(array('members' => $members));

  }
  catch (Exception $ex)
  {
        $msg = $ex->getMessage();
        echo $msg;
        return;
  }



?>