<?php

require_once 'inc/db_connect.php';

 try
  {
   /* $sql = "select A.lastname as 'Last Name',A.firstname as 'First Name', middlename as 'Middle Name', B.email as 'Email',
            A.cb_spousename as 'Spouse Name', A.cb_address as 'Address', A.cb_city as 'City', A.cb_state as 'State',
            A.cb_zipcode as 'Zip Code', A.cb_homephone as 'Home Phone', A.cb_mobilephone as 'Cell Phone',
            A.cb_birthdate as 'Birth Date', cb_joinedkiwanis as 'Date Joined Kiwanis', cb_sponsor as Sponsor, cb_life_member as 'Life Member',
            cb_honorary_member as 'Honorary Member'
            from mmp_jml_comprofiler A left join mmp_jml_users B on A.id = B.id where lastname is not null order by lastname";
   */

    $sql = "select A.firstname, A.middlename, A.lastname, A.cb_spouse, A.cb_address, A.cb_city, A.cb_state, A.cb_birth_month_day,
                   A.cb_zipcode, A.cb_phone_home as cb_homephone, A.cb_mobile_phone, A.cb_joined_kiwanis, A.cb_sponsor, A.cb_lifemember,
                   A.cb_honorary_member,
            B.email
            from n4khq_comprofiler A left join n4khq_users B on A.id = B.id where lastname is not null and block = 0 order by lastname";


    $query = $dbh->prepare($sql);

    $query->execute();
   // $roster = $query->fetchAll(PDO::FETCH_ASSOC) ;
    $x = "";
    $colCount = $query->columnCount();
    for ($i = 0; $i < $colCount; $i++) {
        $col = $query->getColumnMeta($i);
        $x  .=  $col['name'] . "\t";
    }
    $x .= "\r\n";

   while ($roster = $query->fetch())    {

        for ($i = 0; $i < $colCount; $i++) {
            $x .= $roster[$i] . "\t";
        }
        $x .= "\r\n";
   }
   header('Content-Type: application/force-download');
   header('Content-disposition: attachment; filename=export.xls');
   // Fix for crappy IE bug in download.
   header("Pragma: ");
   header("Cache-Control: ");
   echo $x;

  }
  catch (Exception $ex)
  {
        $msg = $ex->getMessage();
        echo $msg;
        return;
  }



?>