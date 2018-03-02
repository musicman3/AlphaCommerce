<?php
/*
  RuBiC production (http://www.rubicshop.ru)
*/

  class osC_SlideManager_Admin {
    public static function getData($id) {
      global $osC_Database;

      $Qslide = $osC_Database->query('select * from :table_slides where image_id = :image_id');
      $Qslide->bindTable(':table_slides', TABLE_SLIDES);
      $Qslide->bindInt(':image_id', $id);
      $Qslide->execute();

      $data = $Qslide->toArray();

      $Qslide->freeResult();

      return $data;
    }

    public static function save($id = null, $data) {
      global $osC_Database, $osC_Image;

      $error = false;

			$images = array();

			$image = new img_upload('image');
			$image->set_extensions(array('gif', 'jpg', 'jpeg', 'png'));

			if (!file_exists(DIR_FS_CATALOG . DIR_WS_IMAGES . 'slideshow/')) {
				mkdir(DIR_FS_CATALOG . DIR_WS_IMAGES . 'slideshow/');
				@chmod(DIR_FS_CATALOG . DIR_WS_IMAGES . 'slideshow/', 0777);
			}

			if ( $image->exists() ) {
				$image->set_destination(realpath('../images/slideshow/'));

				if ( $image->parse() && $image->save() ) {
					$img = time().'_'.$image->filename;// image name
					$images[] = $img;
				}
			}

			if ( $error === false ) {


				$image_location = (!empty($data['image_local']) ? $data['image_local'] : (isset($image) ? $img : null));

				if ( is_numeric($id) ) {
          $Qslide = $osC_Database->query('update :table_slides set language_id = :language_id, image = :image, image_url = :image_url, status = :status, sort_order = :sort_order where image_id = :image_id');
          $Qslide->bindInt(':image_id', $id);
        } else {
          $Qslide = $osC_Database->query('insert into :table_slides (language_id, image, image_url, status, sort_order) values (:language_id, :image, :image_url, :status, :sort_order)');
        }

        $Qslide->bindTable(':table_slides', TABLE_SLIDES);
        $Qslide->bindValue(':language_id', $data['group']);
        $Qslide->bindValue(':image_url', $data['url']);
        $Qslide->bindValue(':image', $image_location);
				$Qslide->bindInt(':status', (($data['status'] === true) ? 1 : 0));
				$Qslide->bindInt(':sort_order', $data['sort_order']);

        $Qslide->setLogging($_SESSION['module'], $id);
        $Qslide->execute();

				//	categories/mini/$img	- create and resize
				if (!file_exists(DIR_FS_CATALOG . DIR_WS_IMAGES . 'slideshow/mini/')) {
					mkdir(DIR_FS_CATALOG . DIR_WS_IMAGES . 'slideshow/mini/');
					@chmod(DIR_FS_CATALOG . DIR_WS_IMAGES . 'slideshow/mini/', 0777);
				}

				if (isset($image_location)) {
					$categories_image_mini = copy(DIR_FS_CATALOG . DIR_WS_IMAGES . 'slideshow/' . $image_location, DIR_FS_CATALOG . DIR_WS_IMAGES . 'slideshow/mini/' . $image_location);

					//function resize slides start
					function image_resizeicon(
					$source_path,
					$destination_path,
					$newwidth,
					$newheight = FALSE,
					$quality = 100 // quality for jpeg
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
					//funtion resize slides end

					$width_image_mini = '175';
					$height_image_mini = '';

					image_resizeicon(DIR_FS_CATALOG . DIR_WS_IMAGES . 'slideshow/mini/'.$image_location, DIR_FS_CATALOG . DIR_WS_IMAGES . 'slideshow/mini/'.$image_location, $width_image_mini, $height_image_mini);
				}
				// end	categories/mini/$img

				if ( !$osC_Database->isError() ) {
          return true;
        }
      }

      return false;
    }

    public static function delete($id, $delete_image = false) {
      global $osC_Database;

      $error = false;

      $osC_Database->startTransaction();

      if ( $delete_image === true ) {
        $Qimage = $osC_Database->query('select image_id, image from :table_slides where image_id = :image_id');
        $Qimage->bindTable(':table_slides', TABLE_SLIDES);
        $Qimage->bindInt(':image_id', $id);
        $Qimage->execute();
      }

      $Qdelete = $osC_Database->query('delete from :table_slides where image_id = :image_id');
      $Qdelete->bindTable(':table_slides', TABLE_SLIDES);
      $Qdelete->bindInt(':image_id', $id);
      $Qdelete->setLogging($_SESSION['module'], $id);
      $Qdelete->execute();

      if ( $osC_Database->isError() ) {
        $error = true;
      }

      if ( $error === false ) {
        if ( $delete_image === true ) {
          if ( !osc_empty($Qimage->value('image')) ) {
            if ( is_file('../images/slideshow/' . $Qimage->value('image')) && is_writeable('../images/slideshow/' . $Qimage->value('image')) ) {
              @unlink('../images/slideshow/' . $Qimage->value('image'));
            }
          }
					if ( !osc_empty($Qimage->value('image')) ) {
						if ( is_file('../images/slideshow/mini/' . $Qimage->value('image')) && is_writeable('../images/slideshow/mini/' . $Qimage->value('image')) ) {
							@unlink('../images/slideshow/mini/' . $Qimage->value('image'));
            }
          }
        }

        $osC_Database->commitTransaction();

        return true;
      }

      $osC_Database->rollbackTransaction();

      return false;
    }
  }
?>
