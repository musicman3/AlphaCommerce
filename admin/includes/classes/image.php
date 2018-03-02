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

  require('../includes/classes/image.php');

  class osC_Image_Admin extends osC_Image {

// Private variables

    var $_title, $_header, $_data = array();

    var $_has_parameters = false;

// Class constructor

    function osC_Image_Admin() {
      parent::osC_Image();
    }

// Public methods

    function &getGroups() {
      return $this->_groups;
    }

    function resize($image, $group_id) {
      if (osc_empty(CFG_APP_IMAGEMAGICK_CONVERT) || !file_exists(CFG_APP_IMAGEMAGICK_CONVERT)) {
        return $this->resizeWithGD($image, $group_id);
      }

      if (!file_exists(DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[$group_id]['code'])) {
        mkdir(DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[$group_id]['code']);
        @chmod(DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[$group_id]['code'], 0777);
      }

      exec(escapeshellarg(CFG_APP_IMAGEMAGICK_CONVERT) . ' -resize ' . (int)$this->_groups[$group_id]['size_width'] . 'x' . (int)$this->_groups[$group_id]['size_height'] . (($this->_groups[$group_id]['force_size']) == '1' ? '!' : '') . ' ' . escapeshellarg(DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[1]['code'] . '/' . $image) . ' ' . escapeshellarg(DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[$group_id]['code'] . '/' . $image));
      @chmod(DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[$group_id]['code'] . '/' . $image, 0777);
    }

    public static function hasGDSupport() {
      if ( imagetypes() & ( IMG_JPG || IMG_GIF || IMG_PNG ) ) {
        return true;
      }

      return false;
    }

    function resizeWithGD($image, $group_id) {
      $img_type = false;

      switch (substr($image, (strrpos($image, '.')+1))) {
        case 'jpg':
        case 'jpeg':
		case 'JPG':
		case 'JPEG':
          if (imagetypes() & IMG_JPG) {
            $img_type = 'jpg';
          }

          break;

        case 'gif':
		case 'GIF':
          if (imagetypes() & IMG_GIF) {
            $img_type = 'gif';
          }

          break;

        case 'png':
		case 'PNG':
          if (imagetypes() & IMG_PNG) {
            $img_type = 'png';
          }

          break;
      }

      if ($img_type !== false) {
        if (!file_exists(DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[$group_id]['code'])) {
          mkdir(DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[$group_id]['code'], 0777);
        }

        list($orig_width, $orig_height) = getimagesize(DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[1]['code'] . '/' . $image);

        $height = $this->_groups[$group_id]['size_height'];

        if ($this->_groups[$group_id]['force_size'] == '1') {
          $width = $this->_groups[$group_id]['size_width'];
        } else {
          $width = round($orig_width * $height / $orig_height);
        }

        $im_p = imagecreatetruecolor($width, $height);

        if ( ($img_type == 'gif') || ($img_type == 'png') ) {
          imagealphablending($im_p, false);
          imagesavealpha($im_p, true);

          $transparent = imagecolorallocatealpha($im_p, 255, 255, 255, 127);
          imagefilledrectangle($im_p, 0, 0, $height, $width, $transparent);
        }

        $x = 0;

        if ($this->_groups[$group_id]['force_size'] == '1') {
          if ( ($img_type != 'gif') && ($img_type != 'png') ) {
            $bgcolour = imagecolorallocate($im_p, 255, 255, 255); // white
            imagefill($im_p, 0, 0, $bgcolour);
          }

          $width = round($orig_width * $height / $orig_height);

          if ($width < $this->_groups[$group_id]['size_width']) {
            $x = floor(($this->_groups[$group_id]['size_width'] - $width) / 2);
          }
        }

        switch ($img_type) {
          case 'jpg':
            $im = imagecreatefromjpeg(DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[1]['code'] . '/' . $image);
            break;

          case 'gif':
            $im = imagecreatefromgif(DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[1]['code'] . '/' . $image);
            break;

          case 'png':
            $im = imagecreatefrompng(DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[1]['code'] . '/' . $image);
            break;
        }

        imagecopyresampled($im_p, $im, $x, 0, 0, 0, $width, $height, $orig_width, $orig_height);

        switch ($img_type) {
          case 'jpg':
            imagejpeg($im_p, DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[$group_id]['code'] . '/' . $image, 92.5); //JPG QUALITY 92.5%
            break;

          case 'gif':
            imagegif($im_p, DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[$group_id]['code'] . '/' . $image);
            break;

          case 'png':
            imagepng($im_p, DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[$group_id]['code'] . '/' . $image);
            break;
        }

        imagedestroy($im_p);
        imagedestroy($im);

        chmod(DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[$group_id]['code'] . '/' . $image, 0777);
      } else {
        return false;
      }
    }

	function image_resizeicon(
		$source_path,
		$destination_path,
		$newwidth,
		$newheight = FALSE,
		$quality = 92.5 // quality for jpeg
		) {	  
		
		ini_set("gd.jpeg_ignore_warning", 1);
   
		list($oldwidth, $oldheight, $type) = getimagesize($source_path);
   
		switch ($type) {
			case 1: $typestr = 'gif' ;break;
			case 2: $typestr = 'jpeg'; break;
			case 3: $typestr = 'png'; break;
			case 4: $typestr = 'jpg'; break;
			case 5: $typestr = 'GIF' ;break;
			case 6: $typestr = 'JPEG'; break;
			case 7: $typestr = 'PNG'; break;
			case 8: $typestr = 'JPG'; break;
		}
		$function = "imagecreatefrom$typestr";
		$src_resource = $function($source_path);
   
		if (!$newheight) { $newheight = round($newwidth * $oldheight/$oldwidth); }
		elseif (!$newwidth) { $newwidth = round($newheight * $oldwidth/$oldheight); }
		$destination_resource = imagecreatetruecolor($newwidth,$newheight);
   
		imagecopyresampled($destination_resource, $src_resource, 0, 0, 0, 0, $newwidth, $newheight, $oldwidth, $oldheight);
   
		if ($type = 2) { # jpeg, jpg, JPEG, JPG
			imageinterlace($destination_resource, 1); 
			if ($quality) imagejpeg($destination_resource, $destination_path, $quality);
			else imagejpeg($destination_resource, $destination_path);
		}
		else { # gif, png, GIF, PNG
			$function = "image$typestr";
			$function($destination_resource, $destination_path);
		}
 
        chmod($source_path, 0777);
		imagedestroy($destination_resource);
		imagedestroy($src_resource);
	}		
	
    function getModuleCode() {
      return $this->_code;
    }

    function &getTitle() {
      return $this->_title;
    }

    function &getHeader() {
      return $this->_header;
    }

    function &getData() {
      return $this->_data;
    }

    function activate() {
      $this->_setHeader();
      $this->_setData();
    }

    function hasParameters() {
      return $this->_has_parameters;
    }

    function existsInGroup($id, $group_id) {
      global $osC_Database;

      $Qimage = $osC_Database->query('select image from :table_products_images where id = :id');
      $Qimage->bindTable(':table_products_images', TABLE_PRODUCTS_IMAGES);
      $Qimage->bindInt(':id', $id);
      $Qimage->execute();

      return file_exists(DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $this->_groups[$group_id]['code'] . '/' . $Qimage->value('image'));
    }

    function delete($id) {
      global $osC_Database;

      $Qimage = $osC_Database->query('select image from :table_products_images where id = :id');
      $Qimage->bindTable(':table_products_images', TABLE_PRODUCTS_IMAGES);
      $Qimage->bindInt(':id', $id);
      $Qimage->execute();

      foreach ($this->_groups as $group) {
        @unlink(DIR_FS_CATALOG . DIR_WS_IMAGES . 'products/' . $group['code'] . '/' . $Qimage->value('image'));
      }

      $Qdel = $osC_Database->query('delete from :table_products_images where id = :id');
      $Qdel->bindTable(':table_products_images', TABLE_PRODUCTS_IMAGES);
      $Qdel->bindInt(':id', $id);
      $Qdel->execute();

      return ($Qdel->affectedRows() === 1);
    }

    function setAsDefault($id) {
      global $osC_Database;

      $Qimage = $osC_Database->query('select products_id from :table_products_images where id = :id');
      $Qimage->bindTable(':table_products_images', TABLE_PRODUCTS_IMAGES);
      $Qimage->bindInt(':id', $id);
      $Qimage->execute();

      if ($Qimage->numberOfRows() === 1) {
        $Qupdate = $osC_Database->query('update :table_products_images set default_flag = :default_flag where products_id = :products_id and default_flag = :default_flag');
        $Qupdate->bindTable(':table_products_images', TABLE_PRODUCTS_IMAGES);
        $Qupdate->bindInt(':default_flag', 0);
        $Qupdate->bindInt(':products_id', $Qimage->valueInt('products_id'));
        $Qupdate->bindInt(':default_flag', 1);
        $Qupdate->execute();

        $Qupdate = $osC_Database->query('update :table_products_images set default_flag = :default_flag where id = :id');
        $Qupdate->bindTable(':table_products_images', TABLE_PRODUCTS_IMAGES);
        $Qupdate->bindInt(':default_flag', 1);
        $Qupdate->bindInt(':id', $id);
        $Qupdate->execute();

        return ($Qupdate->affectedRows() === 1);
      }
    }

    function reorderImages($images_array) {
      global $osC_Database;

      $counter = 0;

      foreach ($images_array as $id) {
        $counter++;

        $Qupdate = $osC_Database->query('update :table_products_images set sort_order = :sort_order where id = :id');
        $Qupdate->bindTable(':table_products_images', TABLE_PRODUCTS_IMAGES);
        $Qupdate->bindInt(':sort_order', $counter);
        $Qupdate->bindInt(':id', $id);
        $Qupdate->execute();
      }

      return ($counter > 0);
    }

    function show($image, $title, $parameters = '', $group = '') {
      if (empty($group) || !$this->exists($group)) {
        $group = $this->getCode(DEFAULT_IMAGE_GROUP_ID);
      }

      $group_id = $this->getID($group);

      $width = $height = '';

      if ( ($this->_groups[$group_id]['force_size'] == '1') || empty($image) ) {
        $width = $this->_groups[$group_id]['size_width'];
        $height = $this->_groups[$group_id]['size_height'];
      }

      if (empty($image)) {
        $image = 'pixel_trans.gif';
      } else {
        $image = 'products/' . $this->_groups[$group_id]['code'] . '/' . $image;
      }

      return osc_image('../' . DIR_WS_IMAGES . $image, $title, $width, $height, $parameters);
    }
  }
?>
