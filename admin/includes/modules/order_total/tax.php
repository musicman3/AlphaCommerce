<?php
/*
  $Id: $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2006 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
*/

  class osC_OrderTotal_tax extends osC_OrderTotal_Admin {
    var $_title,
        $_code = 'tax',
        $_author_name = 'osCommerce',
        $_author_www = 'http://www.oscommerce.com',
        $_status = false,
        $_sort_order;

    function osC_OrderTotal_tax() {
      global $osC_Database, $osC_Language;

      $this->_title = $osC_Language->get('order_total_tax_title');
      $this->_description = $osC_Language->get('order_total_tax_description');
      $this->_status = (defined('MODULE_ORDER_TOTAL_TAX_STATUS') && (MODULE_ORDER_TOTAL_TAX_STATUS == '1') ? true : false);
      $this->_sort_order = (defined('MODULE_ORDER_TOTAL_TAX_SORT_ORDER') ? MODULE_ORDER_TOTAL_TAX_SORT_ORDER : null);
    
	  $title1 = $osC_Language->get('order_total_tax_admin_1');
	  $title2 = $osC_Language->get('order_total_tax_admin_2');
	  $title3 = $osC_Language->get('order_total_tax_admin_3');
	  $title4 = $osC_Language->get('order_total_tax_admin_4');

	$titlex = $osC_Language->get('access_configuration_title27');
	$titley = $osC_Language->get('access_configuration_title93');
	$Ckey = $osC_Database->query("SELECT * FROM " . DB_TABLE_PREFIX . "configuration WHERE configuration_key = 'STORE_NAME_ADDRESS'");	
	$configuration_title = $Ckey->value('configuration_title');
	$configuration_description = $Ckey->value('configuration_description');
	if (($configuration_title & $configuration_description) != ($titlex & $titley)) {		  

	  $osC_Database->simpleQuery("UPDATE " . TABLE_CONFIGURATION . " SET configuration_title = '$title1', configuration_description = '$title3' WHERE configuration_key = 'MODULE_ORDER_TOTAL_TAX_STATUS'");
	  $osC_Database->simpleQuery("UPDATE " . TABLE_CONFIGURATION . " SET configuration_title = '$title2', configuration_description = '$title4' WHERE configuration_key = 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER'");	  
	
	}
	}

    function isInstalled() {
      return (bool)defined('MODULE_ORDER_TOTAL_TAX_STATUS');
    }

    function install() {
      global $osC_Database;

      parent::install();

      $osC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Display Tax', 'MODULE_ORDER_TOTAL_TAX_STATUS', '1', 'Do you want to display the order tax value?', '6', '1', 'osc_cfg_set_boolean_value(array(1, -1))', now())");
      $osC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '3', 'Sort order of display.', '6', '2', now())");
    }

    function getKeys() {
      if (!isset($this->_keys)) {
        $this->_keys = array('MODULE_ORDER_TOTAL_TAX_STATUS',
                             'MODULE_ORDER_TOTAL_TAX_SORT_ORDER');
      }

      return $this->_keys;
    }
  }
?>
