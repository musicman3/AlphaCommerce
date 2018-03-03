<?php
/*
  $Id: $
  
  author Dave Howarth
  copyright 2008
  web http://www.box25.net
  email sales@box25.net
 
  Filename cms.php
  Desc Basic CMS system for osCommerce V3.0A5
  Modify by Gergely Tóth
  http://oscommerce-extra.hu
  
  RuBiC modify (http://www.rubicshop.ru)
*/


  class osC_cms_Admin {
    public static function getData($id) {
      global $osC_Database, $osC_Language;


      $QcmsListItem = $osC_Database->query('select * from :table_products where products_id = :products_id and language_id = :language_id');
      $QcmsListItem->bindTable(':table_products', TABLE_PRODUCTS);
      $QcmsListItem->bindInt(':products_id', $id);
      $QcmsListItem->bindInt(':language_id', $osC_Language->getID());
      $QcmsListItem->execute();
      
      $data = $QcmsListItem->toArray(); 
      
      $QcmsListItem->freeResult();
      
      return $data;
      
    }
    
    public static function xsell_save_sort($data, $default = false) {
      global $osC_Database, $osC_Language;

      $error = false;

      $osC_Database->startTransaction();

            $Xupdate = $osC_Database->query('UPDATE :table_products_xsell SET sort_order = :sort_value WHERE products_xsell_id= :products_xsell_id and products_id = :products_id');
            $Xupdate->bindTable(':table_products_xsell', TABLE_PRODUCTS_XSELL);
            $Xupdate->bindInt(':sort_value', $data['short_order']);
            $Xupdate->bindInt(':products_xsell_id', $data['products_xsell_id']);
            $Xupdate->bindInt(':products_id', $data['products_id']);            
            $Xupdate->execute();
       
        if ( $osC_Database->isError() ) {
          $error = true;
          break;
        }
    
     

      if ( $error === false ) {
        $osC_Database->commitTransaction();

        if ( $default === true ) {
          //osC_Cache::clear('configuration');
        }

        return true;
      }

      $osC_Database->rollbackTransaction();

      return false;
    }
    
    public static function category_tree($id = null, $categories = null) {
      global $osC_Database, $osC_Language;

      $Qcategories = $osC_Database->query('select c.categories_id, c.parent_id, c.categories_image, cd.categories_name from :table_categories c, :table_categories_description cd where c.categories_id = cd.categories_id and cd.language_id = :language_id order by c.parent_id, c.sort_order, cd.categories_name');
      $Qcategories->bindTable(':table_categories', TABLE_CATEGORIES);
      $Qcategories->bindTable(':table_categories_description', TABLE_CATEGORIES_DESCRIPTION);
      $Qcategories->bindInt(':language_id', $osC_Language->getID());
      $Qcategories->execute();

      $data = array();

      while ( $Qcategories->next() ) {
//        $data[$Qcategories->valueInt('parent_id')][$Qcategories->valueInt('categories_id')] = array('name' => $Qcategories->value('categories_name'), 'image' => $Qcategories->value('categories_image'), 'count' => 0);
            $data[] = array('id' => $Qcategories->valueInt('categories_id'),
                           'text' => $Qcategories->value('categories_name'));        
//             array_push($data, $Qcategories->value('categories_name'));
      }

                  
//      $Qcategories->freeResult();

//      if ($this->_show_total_products === true) {
//        $this->_calculateProductTotals(false);
//      }
      return($data);
    }
    
    public static function xsell_delete_all($data, $default = false) {
      global $osC_Database, $osC_Language;

      $error = false;

      $osC_Database->startTransaction();
      
            $XsortList = $osC_Database->query('delete from :table_products_xsell where products_id = :products_idpost');
            $XsortList->bindTable(':table_products_xsell', TABLE_PRODUCTS_XSELL);
            $XsortList->bindInt(':products_idpost', $data['products_id']);
            $XsortList->execute();
            
        if ( $osC_Database->isError() ) {
          $error = true;
          break;
        }

      if ( $error === false ) {
        $osC_Database->commitTransaction();

        if ( $default === true ) {
          //osC_Cache::clear('configuration');
        }

        return true;
      }

      $osC_Database->rollbackTransaction();

      return false;
    }            

    public static function xsell_update($data_cms, $data_xsell, $default = false) {
      global $osC_Database, $osC_Language;

      $error = false;

      $osC_Database->startTransaction();
      
           $XaddList = $osC_Database->query('insert into :table_products_xsell (ID, products_id, products_xsell_id, sort_order) values (:id, :products_id, :products_xsell_id, :xsell_sort)' );
           $XaddList->bindTable(':table_products_xsell', TABLE_PRODUCTS_XSELL);
           $XaddList->bindInt(':id', '');           
           $XaddList->bindInt(':products_id', $data_cms);
           $XaddList->bindInt(':products_xsell_id', $data_xsell);
           $XaddList->bindInt(':xsell_sort', 1);      
           $XaddList->execute();
           
           $Number_addrow = 0;
           $Number_addrow = $XaddList->numberOfRows();
          
           if ( $Number_addrow >0 ) exit( $osC_Language->get('text_no_insert') );
            
        if ( $osC_Database->isError() ) {
          $error = true;
          break;
        }

      if ( $error === false ) {
        $osC_Database->commitTransaction();

        if ( $default === true ) {
          //osC_Cache::clear('configuration');
        }

        return true;
      }

      $osC_Database->rollbackTransaction();

      return false;
    } 
    
 }
?>
