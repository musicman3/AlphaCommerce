<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2006 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
*/

  class osC_Boxes_feature extends osC_Modules {
    var $_title,
        $_code = 'feature',
        $_author_name = 'RuBiC',
        $_author_www = 'http://www.rubicshop.ru',
        $_group = 'boxes';

    function __construct() {
      global $osC_Language;

      $this->_title = $osC_Language->get('box_feature_heading');
    }

    function initialize() {
      global $osC_Cache, $osC_Database, $osC_Services, $osC_Currencies, $osC_Specials, $osC_Language, $osC_Image;

      $this->_title_link = osc_href_link(FILENAME_PRODUCTS, 'feature');

			if ($osC_Services->isStarted('feature')) {
      $data = array();

      if ( (BOX_FEATURE_CACHE > 0) && $osC_Cache->read('box-feature-' . $osC_Language->getCode() . '-' . $osC_Currencies->getCode(), BOX_FEATURE_CACHE) ) {
        $data = $osC_Cache->getCache();
      } else {
        $Qfeature = $osC_Database->query('select p.products_id, p.products_tax_class_id, p.products_price, pd.products_name, pd.products_keyword, i.image from :table_products p left join :table_products_images i on (p.products_id = i.products_id and i.default_flag = :default_flag), :table_products_description pd, :table_feature f where f.status = 1 and f.products_id = p.products_id and p.products_status = 1 and p.products_id = pd.products_id and pd.language_id = :language_id order by f.feature_date_added desc limit :max_random_select_feature');
        $Qfeature->bindTable(':table_feature', TABLE_FEATURE);
        $Qfeature->bindTable(':table_products', TABLE_PRODUCTS);
        $Qfeature->bindTable(':table_products_images', TABLE_PRODUCTS_IMAGES);
        $Qfeature->bindTable(':table_products_description', TABLE_PRODUCTS_DESCRIPTION);
        $Qfeature->bindInt(':default_flag', 1);
        $Qfeature->bindInt(':language_id', $osC_Language->getID());
        $Qfeature->bindInt(':max_random_select_feature', BOX_FEATURE_RANDOM_SELECT);
        $Qfeature->executeRandomMulti();

        if ( $Qfeature->numberOfRows() ) {
          $osC_Product = new osC_Product($Qfeature->valueInt('products_id'));

          $data = $osC_Product->getData();

          $data['display_price'] = $osC_Product->getPriceFormated(true);
          $data['display_image'] = $osC_Product->getImage();
        }

        $osC_Cache->write($data);
      }

      if ( !empty($data) ) {
        $this->_content = '';

        if ( !empty($data['display_image']) ) {
          $this->_content .= osc_link_object(osc_href_link(FILENAME_PRODUCTS, $data['keyword']), $osC_Image->show($data['display_image'], $data['name'])) . '<br />';
        }

        $this->_content .= osc_link_object(osc_href_link(FILENAME_PRODUCTS, $data['keyword']), $data['name']) . '<br />' . $data['display_price'];
      }
			}
    }

    function install() {
      global $osC_Database;

      parent::install();

      $osC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Random Feature Product Selection', 'BOX_FEATURE_RANDOM_SELECT', '10', 'Select a random feature product from this amount of the newest products available', '6', '0', now())");
      $osC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Cache Contents', 'BOX_FEATURE_CACHE', '1', 'Number of minutes to keep the contents cached (0 = no cache)', '6', '0', now())");
    }

    function getKeys() {
      if ( !isset($this->_keys) ) {
        $this->_keys = array('BOX_FEATURE_RANDOM_SELECT', 'BOX_FEATURE_CACHE');
      }

      return $this->_keys;
    }
  }
?>
