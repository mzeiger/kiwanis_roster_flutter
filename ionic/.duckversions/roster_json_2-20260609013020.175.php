<?php

require_once 'inc/db_connect.php';

try {
  /*  $sql = "select A.firstname, A.middlename, A.lastname, A.cb_spousename, A.cb_address, A.cb_city, A.cb_state,
            A.cb_zipcode, A.cb_homephone, A.cb_mobilephone, A.cb_birthdate, B.email
            from mmp_jml_comprofiler A left join mmp_jml_users B on A.id = B.id where lastname is not null order by lastname";
  */
  // $sql = "select A.firstname, A.middlename, A.lastname, A.cb_spouse as cb_spousename, A.cb_address, A.cb_city, A.cb_state,
  //         A.cb_zipcode, A.cb_phone_home as cb_homephone, A.cb_mobile_phone as cb_mobilephone, A.cb_birthdate, B.email, A.avatar,B.block
  //         from n4khq_comprofiler A left join n4khq_users B on A.id = B.id where lastname is not null order by lastname";
  $sql = "select first_name as firstname,  'x' as middlename, last_name as lastname, spouse as cb_spousename, street_address as cb_address,
            city as cb_city, state as cb_state, zip as cb_zipcode, home_phone as cb_homephone, mobile_phone as cb_mobilephone,
            CONCAT(birth_day, ' - ', birth_month) as cb_birthdate, user_email as email,
            '' as avatar from v_user_info order by lastname";

  $query = $dbh->prepare($sql);

  $query->execute();
  // $roster = $query->fetchAll(PDO::FETCH_ASSOC) ;
  $members = array();
  while ($member = $query->fetch()) {
 //   $block = isset($member[13]) ? (int)$member[13] : 0;
  //  $block = $block ? "0" : "1";
    array_push($members, array(
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
      'avatar' => $member[12]
    //  'block' => $block
    ));



  }

      header('Access-Control-Allow-Origin: *');
      // header('Content-Type: application/json; charset=utf-8');
  	// echo json_encode($members);
	echo json_encode(array('members' => $members));
} catch (PDOException $e) {
  header('Content-Type: application/json; charset=utf-8');
  echo json_encode(array('error' => $e->getMessage()));
  exit;
}


exit;
