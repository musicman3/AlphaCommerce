<?php
/*
  osCommerce, Open Source E-Commerce Solutions
  http://www.rubicshop.ru

  Copyright (c) 2007 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
*/

	// include server parameters
	require('includes/configure.php');

	// connect to database
	$osC_Database = new mysqli(DB_SERVER, DB_SERVER_USERNAME, DB_SERVER_PASSWORD, DB_DATABASE);

	//------------------------------------------------------------------------------------------------

	$country = @intval($_GET['country']);

	$regs = $osC_Database->query("SELECT * FROM " . DB_TABLE_PREFIX . "zones WHERE zone_country_id = '$country' order by zone_name");

	if ($regs) {
		$num = $regs->num_rows;
		$i = 0;
		while ($i < $num) {
			$regions[$i] = $regs->fetch_assoc();
			$i++;
		}
		$result = array('regions'=>$regions);
	}
	else {
		$result = array('type'=>'error');
	}

	print json_encode($result);

	$osC_Database->close();
?>