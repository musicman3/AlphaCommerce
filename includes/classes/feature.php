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

  class osC_FeatureClass {

/* Private variables */

    var $_feature = array();

/* Class constructor */

    function osC_Feature() {
    }

/* Public methods */

    function activateAll() {
      global $osC_Database;

      $Qfeature = $osC_Database->query('select feature_id from :table_feature where status = 0 and now() >= start_date and start_date > 0 and now() < expires_date');
      $Qfeature->bindTable(':table_feature', TABLE_FEATURE);
      $Qfeature->execute();

      while ($Qfeature->next()) {
        $this->_setStatus($Qfeature->valueInt('feature_id'), true);
      }

      $Qfeature->freeResult();
    }

    function expireAll() {
      global $osC_Database;

      $Qfeature = $osC_Database->query('select feature_id from :table_feature where status = 1 and now() >= expires_date and expires_date > 0');
      $Qfeature->bindTable(':table_feature', TABLE_FEATURE);
      $Qfeature->execute();

      while ($Qfeature->next()) {
        $this->_setStatus($Qfeature->valueInt('feature_id'), false);
      }

      $Qfeature->freeResult();
    }

        function &getListing() {
      global $osC_Database, $osC_Services, $osC_Language, $osC_Currencies, $osC_Image, $osC_Specials, $current_category_id, $osC_Template;

      $Qfeature = $osC_Database->query('select p.products_id, p.products_tax_class_id, p.products_price, pd.products_name, pd.products_keyword, i.image from :table_products p left join :table_products_images i on (p.products_id = i.products_id and i.default_flag = :default_flag), :table_products_description pd, :table_feature f where f.status = 1 and f.products_id = p.products_id and p.products_status = 1 and p.products_id = pd.products_id and pd.language_id = :language_id order by f.feature_date_added desc');
      $Qfeature->bindTable(':table_feature', TABLE_FEATURE);
      $Qfeature->bindTable(':table_products', TABLE_PRODUCTS);
      $Qfeature->bindTable(':table_products_images', TABLE_PRODUCTS_IMAGES);
      $Qfeature->bindTable(':table_products_description', TABLE_PRODUCTS_DESCRIPTION);
      $Qfeature->bindInt(':default_flag', 1);
      $Qfeature->bindInt(':language_id', $osC_Language->getID());
      $Qfeature->setBatchLimit((isset($_GET['page']) && is_numeric($_GET['page']) ? $_GET['page'] : 1), MAX_DISPLAY_FEATURE_PRODUCTS);
      $Qfeature->execute();

      return $Qfeature;
    }
    
/* Private methods */

    function _setStatus($id, $status) {
      global $osC_Database;

      $Qstatus = $osC_Database->query('update :table_feature set status = :status, date_status_change = now() where feature_id = :feature_id');
      $Qstatus->bindTable(':table_feature', TABLE_FEATURE);
      $Qstatus->bindInt(':status', ($status === true) ? '1' : '0');
      $Qstatus->bindInt(':feature_id', $id);
      $Qstatus->execute();

      $Qstatus->freeResult();
    }
  }
?>