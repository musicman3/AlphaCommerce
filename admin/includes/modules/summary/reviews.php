<?php
/*
$Id$

osCommerce, Open Source E-Commerce Solutions
http://www.oscommerce.com

Copyright (c) 2007 osCommerce

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License v2 (1991)
as published by the Free Software Foundation.
*/

	if ( !class_exists('osC_Summary') ) {
		include('includes/classes/summary.php');
	}

	class osC_Summary_reviews extends osC_Summary {

		/* Class constructor */

		function osC_Summary_reviews() {
			global $osC_Language, $osC_Access;

			$osC_Language->loadIniFile('modules/summary/reviews.php');

			$this->_title = $osC_Language->get('summary_reviews_title');
			$this->_title_link = osc_href_link_admin(FILENAME_DEFAULT, 'reviews');

			if ( $osC_Access->hasAccess('reviews') ) {
				$this->_setData();
			}
		}

		/* Private methods */

		function _setData() {
			global $osC_Database, $osC_Language;

			$this->_data = '<table border="0" width="100%" cellspacing="0" cellpadding="2" class="dataDashboard">' .
			'  <thead>' .
			'    <tr>' .
			'      <th align="left">' . $osC_Language->get('summary_reviews_table_heading_products') . '</th>' .
			'      <th align="center">' . $osC_Language->get('summary_reviews_table_heading_language') . '</th>' .
			'      <th align="center">' . $osC_Language->get('summary_reviews_table_heading_rating') . '</th>' .
			'      <th align="center">' . $osC_Language->get('summary_reviews_table_heading_date') . '</th>' .
			'    </tr>' .
			'  </thead>' .
			'  <tbody>';

			$Qreviews = $osC_Database->query('select r.reviews_id, r.products_id, greatest(r.date_added, greatest(r.date_added, r.date_added)) as date_added, r.reviews_rating, pd.products_name, l.name as languages_name, l.code as languages_code from :table_reviews r left join :table_products_description pd on (r.products_id = pd.products_id and r.languages_id = pd.language_id), :table_languages l where r.languages_id = l.languages_id order by date_added desc limit 6');
			$Qreviews->bindTable(':table_reviews', TABLE_REVIEWS);
			$Qreviews->bindTable(':table_products_description', TABLE_PRODUCTS_DESCRIPTION);
			$Qreviews->bindTable(':table_languages', TABLE_LANGUAGES);
			$Qreviews->execute();

			while ( $Qreviews->next() ) {
				if ($Qreviews->value('date_added') > date("Y-m-d H:i:s",time()-60*60*24)) {
					$this->_data .= '    <tr bgcolor="#C4F293" onmouseover="rowOverEffect(this);" onmouseout="rowOutEffect(this);">' .
					'      <td>' . osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, 'reviews&rID=' . $Qreviews->valueInt('reviews_id') . '&action=save'), osc_icon('reviews.png') . '&nbsp;<b>' . $Qreviews->value('products_name')) . '</b></td>' .
					'      <td align="center">' . $osC_Language->showImage($Qreviews->value('languages_code')) . '</td>' .
					'      <td align="center">' . osc_image('../images/stars_' . $Qreviews->valueInt('reviews_rating') . '.png', $Qreviews->valueInt('reviews_rating') . '/5') . '</td>' .
					'      <td align="center"><b>' . $Qreviews->value('date_added') . '</b></td>' .
					'    </tr>';
				}else{
					$this->_data .= '    <tr bgcolor="#DEEDF7" onmouseover="rowOverEffect(this);" onmouseout="rowOutEffect(this);">' .
					'      <td>' . osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, 'reviews&rID=' . $Qreviews->valueInt('reviews_id') . '&action=save'), osc_icon('reviews.png') . '&nbsp;' . $Qreviews->value('products_name')) . '</td>' .
					'      <td align="center">' . $osC_Language->showImage($Qreviews->value('languages_code')) . '</td>' .
					'      <td align="center">' . osc_image('../images/stars_' . $Qreviews->valueInt('reviews_rating') . '.png', $Qreviews->valueInt('reviews_rating') . '/5') . '</td>' .
					'      <td align="center">' . $Qreviews->value('date_added') . '</td>' .
					'    </tr>';
				}
			}

			$this->_data .= '  </tbody>' .
			'</table>';

			$Qreviews->freeResult();
		}
	}
?>
