<?php
/*
  $Id: password.php 64 2005-03-12 16:36:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2005 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
*/

  class osC_Products_Feature extends osC_Template {

/* Private variables */

    var $_module = 'feature',
        $_group = 'products',
        $_page_title,
        $_page_contents = 'feature.php',
        $_page_image = 'table_background_feature.gif';

/* Class constructor */

    function osC_Products_Feature() {
      global $osC_Services, $osC_Language, $osC_Breadcrumb;

      $this->_page_title = $osC_Language->get('feature_heading');

      if ($osC_Services->isStarted('breadcrumb')) {
        $osC_Breadcrumb->add($osC_Language->get('breadcrumb_feature'), osc_href_link(FILENAME_PRODUCTS, $this->_module));
      }
    }
  }
?>
