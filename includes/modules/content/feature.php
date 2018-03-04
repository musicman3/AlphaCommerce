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

  class osC_Content_feature extends osC_Modules {
    var $_title,
        $_code = 'feature',
        $_author_name = 'RuBiC',
        $_author_www = 'http://www.rubicshop.ru',
        $_group = 'content';

/* Class constructor */

    function osC_Content_feature() {
      global $osC_Language;

      $this->_title = $osC_Language->get('feature_title');
    }

    function initialize() {
      global $osC_Database, $osC_Services, $osC_Language, $osC_Currencies, $osC_Image, $osC_Specials, $osC_Template;
      
        if ($osC_Services->isStarted('feature')) {

        $Qproducts = $osC_Database->query('select p.products_id, p.products_tax_class_id, p.products_price, pd.products_name, pd.products_keyword, i.image from :table_products p left join :table_products_images i on (p.products_id = i.products_id and i.default_flag = :default_flag), :table_products_description pd, :table_feature f where f.status = 1 and f.products_id = p.products_id and p.products_status = 1 and p.products_id = pd.products_id and pd.language_id = :language_id order by f.feature_date_added desc limit :max_display_feature_products');
        $Qproducts->bindTable(':table_feature', TABLE_FEATURE);
        $Qproducts->bindTable(':table_products', TABLE_PRODUCTS);
        $Qproducts->bindTable(':table_products_images', TABLE_PRODUCTS_IMAGES);
        $Qproducts->bindTable(':table_products_description', TABLE_PRODUCTS_DESCRIPTION);
        $Qproducts->bindInt(':default_flag', 1);
        $Qproducts->bindInt(':language_id', $osC_Language->getID());
        $Qproducts->bindInt(':max_display_feature_products', MODULE_FEATURE_PRODUCTS_MAX_DISPLAY);

        if (MODULE_FEATURE_PRODUCTS_CACHE > 0) {
        $Qproducts->setCache('feature-' . $osC_Language->getCode() . '-' . $osC_Currencies->getCode() . '', MODULE_FEATURE_PRODUCTS_CACHE);
      }
        $Qproducts->execute();
        
        if ($Qproducts->numberOfRows()) {
        $i = 0;
        while ($Qproducts->next()) {
          if(($i % 3 == 0) && ($i != 0))
            $this->_content .= '<div style="clear:both"></div>';

          $product = new osC_Product($Qproducts->valueInt('products_id'));
          $this->_content .= '<div style="float:left; width: 33%; text-align: center">' .
                             osc_link_object(osc_href_link(FILENAME_PRODUCTS, $Qproducts->value('products_keyword')), $osC_Image->show($Qproducts->value('image'), $Qproducts->value('products_name'))) .
                             '<span style="display:block; height: auto; text-align: center">' . osc_link_object(osc_href_link(FILENAME_PRODUCTS, $Qproducts->value('products_keyword')), $Qproducts->value('products_name')) . '</span>' . 
                             '<span style="display:block; padding: auto; text-align: center">' . $product->getPriceFormated(true) . '</span>' . '<br/></div>';
     
          $i++;
        }

        $this->_content .= '<div style="clear:both"></div>';
      }

      $Qproducts->freeResult();
    }
    }
    function install() {
      global $osC_Database;

      parent::install();

      $osC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Maximum Entries To Display', 'MODULE_FEATURE_PRODUCTS_MAX_DISPLAY', '9', 'Maximum number of feature products to display', '6', '0', now())");
      $osC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Cache Contents', 'MODULE_FEATURE_PRODUCTS_CACHE', '60', 'Number of minutes to keep the contents cached (0 = no cache)', '6', '0', now())");
    }

    function getKeys() {
      if (!isset($this->_keys)) {
        $this->_keys = array('MODULE_FEATURE_PRODUCTS_MAX_DISPLAY', 'MODULE_FEATURE_PRODUCTS_CACHE');
      }

      return $this->_keys;
    }
  }
?>