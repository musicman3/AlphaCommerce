<?php
/*
  $Id: $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2009 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
*/

  class osC_Feature_Admin {
    public static function getData($id) {
      global $osC_Database, $osC_Language;

      $Qfeature = $osC_Database->query('select p.products_id, pd.products_name, f.feature_id, f.feature_date_added, f.feature_last_modified, f.expires_date, f.date_status_change, f.status from :table_products p, :table_feature f, :table_products_description pd where f.feature_id = :feature_id and f.products_id = p.products_id and p.products_id = pd.products_id and pd.language_id = :language_id limit 1');
      $Qfeature->bindTable(':table_feature', TABLE_FEATURE);
      $Qfeature->bindTable(':table_products', TABLE_PRODUCTS);
      $Qfeature->bindTable(':table_products_description', TABLE_PRODUCTS_DESCRIPTION);
      $Qfeature->bindInt(':feature_id', $id);
      $Qfeature->bindInt(':language_id', $osC_Language->getID());
      $Qfeature->execute();

      $data = $Qfeature->toArray();

      $Qfeature->freeResult();

      return $data;
    }

    public static function save($id = null, $data) {
      global $osC_Database;

      $error = false;

      if ( $data['expires_date'] < $data['start_date'] ) {
        $error = true;

      }

      if ( $error === false ) {
        if ( is_numeric($id) ) {
          $Qfeature = $osC_Database->query('update :table_feature set feature_last_modified = now(), expires_date = :expires_date, start_date = :start_date, status = :status where feature_id = :feature_id');
          $Qfeature->bindInt(':feature_id', $id);
        } else {
          $Qfeature = $osC_Database->query('insert into :table_feature (products_id, feature_date_added, expires_date, start_date, status) values (:products_id, now(), :expires_date, :start_date, :status)');
          $Qfeature->bindInt(':products_id', $data['products_id']);
        }

        $Qfeature->bindTable(':table_feature', TABLE_FEATURE);
        $Qfeature->bindDate(':expires_date', $data['expires_date']);
        $Qfeature->bindDate(':start_date', $data['start_date']);
        $Qfeature->bindInt(':status', $data['status']);
        $Qfeature->setLogging($_SESSION['module'], $id);
        $Qfeature->execute();

        if ( $osC_Database->isError() ) {
          $error = true;
        }
      }

      if ( $error === false ) {
        return true;
      }

      return false;
    }

    public static function delete($id) {
      global $osC_Database;

      $Qfeature = $osC_Database->query('delete from :table_feature where feature_id = :feature_id');
      $Qfeature->bindTable(':table_feature', TABLE_FEATURE);
      $Qfeature->bindInt(':feature_id', $id);
      $Qfeature->setLogging($_SESSION['module'], $id);
      $Qfeature->execute();

      if ( !$osC_Database->isError() ) {
        return true;
      }

      return false;
    }
  }
?>
