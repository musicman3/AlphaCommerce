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
?>
<?php if (file_exists('images/' . $osC_Template->getPageImage()) == true) {
echo osc_image(DIR_WS_IMAGES . $osC_Template->getPageImage(), '', '', HEADING_IMAGE_HEIGHT_ICON, 'id="pageIcon"');
} else {}
?>

<h1><?php echo $osC_Template->getPageTitle(); ?></h1>

<table border="0" width="100%" cellspacing="0" cellpadding="2">
			<tr>

		<?php
			if (isset($cPath) && strpos($cPath, '_')) {
				// check to see if there are deeper categories within the current category
				$category_links = array_reverse($cPath_array);
				for($i=0, $n=sizeof($category_links); $i<$n; $i++) {
					$Qcategories = $osC_Database->query('select count(*) as total from :table_categories c, :table_categories_description cd where c.parent_id = :parent_id and c.categories_id = cd.categories_id and cd.language_id = :language_id');
					$Qcategories->bindTable(':table_categories', TABLE_CATEGORIES);
					$Qcategories->bindTable(':table_categories_description', TABLE_CATEGORIES_DESCRIPTION);
					$Qcategories->bindInt(':parent_id', $category_links[$i]);
					$Qcategories->bindInt(':language_id', $osC_Language->getID());
					$Qcategories->execute();

					if ($Qcategories->valueInt('total') < 1) {
						// do nothing, go through the loop
					} else {
						$Qcategories = $osC_Database->query('select c.categories_id, cd.categories_name, c.categories_image, c.parent_id from :table_categories c, :table_categories_description cd where c.parent_id = :parent_id and c.categories_id = cd.categories_id and cd.language_id = :language_id order by sort_order, cd.categories_name');
						$Qcategories->bindTable(':table_categories', TABLE_CATEGORIES);
						$Qcategories->bindTable(':table_categories_description', TABLE_CATEGORIES_DESCRIPTION);
						$Qcategories->bindInt(':parent_id', $category_links[$i]);
						$Qcategories->bindInt(':language_id', $osC_Language->getID());
						$Qcategories->execute();
						break; // we've found the deepest category the customer is in
					}
				}
			} else {
				$Qcategories = $osC_Database->query('select c.categories_id, cd.categories_name, c.categories_image, c.parent_id from :table_categories c, :table_categories_description cd where c.parent_id = :parent_id and c.categories_id = cd.categories_id and cd.language_id = :language_id order by sort_order, cd.categories_name');
				$Qcategories->bindTable(':table_categories', TABLE_CATEGORIES);
				$Qcategories->bindTable(':table_categories_description', TABLE_CATEGORIES_DESCRIPTION);
				$Qcategories->bindInt(':parent_id', $current_category_id);
				$Qcategories->bindInt(':language_id', $osC_Language->getID());
				$Qcategories->execute();
			}

			$number_of_categories = $Qcategories->numberOfRows();

			$rows = 0;
			{
				if ((defined('SERVICES_CATEGORY_PATH_CALCULATE_PRODUCT_COUNT') && (SERVICES_CATEGORY_PATH_CALCULATE_PRODUCT_COUNT == '1') ? true : false)) {
					while ($Qcategories->next()) {
						if($osC_CategoryTree->getNumberOfProducts($Qcategories->valueInt('categories_id'))>0){
							$rows++;
							if($osC_CategoryTree->getNumberOfProducts($Qcategories->valueInt('categories_id'))>0){
								$width = (int)(100 / MAX_DISPLAY_CATEGORIES_PER_ROW) . '%';
								if (file_exists('images/categories/' .$Qcategories->value('categories_image')) == $Qcategories->value('categories_image')) {
									echo '    <td align="center" class="smallText" width="' . $width . '" valign="top">' . osc_link_object(osc_href_link(FILENAME_DEFAULT, 'cPath=' . $osC_CategoryTree->buildBreadcrumb($Qcategories->valueInt('categories_id'))), osc_image(DIR_WS_IMAGES . 'categories/' . $Qcategories->value('categories_image'), $Qcategories->value('categories_name')) . '<br />' . $Qcategories->value('categories_name')) . '</td>' . "\n";
								} else {
									echo '    <td align="center" class="smallText" width="' . $width . '" valign="top">' . osc_link_object(osc_href_link(FILENAME_DEFAULT, 'cPath=' . $osC_CategoryTree->buildBreadcrumb($Qcategories->valueInt('categories_id'))), $Qcategories->value('categories_name')) . '</td>' . "\n";
								}
								if ((($rows / MAX_DISPLAY_CATEGORIES_PER_ROW) == floor($rows / MAX_DISPLAY_CATEGORIES_PER_ROW)) && ($rows != $number_of_categories)) {
									echo '  </tr>' . "\n";
									echo '  <tr>' . "\n";
								}}}
				}} else {
					if ((defined('SERVICES_CATEGORY_PATH_CALCULATE_PRODUCT_COUNT') && (SERVICES_CATEGORY_PATH_CALCULATE_PRODUCT_COUNT == '-1') ? true : false)) {
						while ($Qcategories->next()) {
							$rows++;
							$width = (int)(100 / MAX_DISPLAY_CATEGORIES_PER_ROW) . '%';
							if (file_exists('images/categories/' .$Qcategories->value('categories_image')) == $Qcategories->value('categories_image')) {
								echo '    <td align="center" class="smallText" width="' . $width . '" valign="top">' . osc_link_object(osc_href_link(FILENAME_DEFAULT, 'cPath=' . $osC_CategoryTree->buildBreadcrumb($Qcategories->valueInt('categories_id'))), osc_image(DIR_WS_IMAGES . 'categories/' . $Qcategories->value('categories_image'), $Qcategories->value('categories_name')) . '<br />' . $Qcategories->value('categories_name')) . '</td>' . "\n";
							} else {
								echo '    <td align="center" class="smallText" width="' . $width . '" valign="top">' . osc_link_object(osc_href_link(FILENAME_DEFAULT, 'cPath=' . $osC_CategoryTree->buildBreadcrumb($Qcategories->valueInt('categories_id'))), $Qcategories->value('categories_name')) . '</td>' . "\n";
							}
							if ((($rows / MAX_DISPLAY_CATEGORIES_PER_ROW) == floor($rows / MAX_DISPLAY_CATEGORIES_PER_ROW)) && ($rows != $number_of_categories)) {
								echo '  </tr>' . "\n";
								echo '  <tr>' . "\n";
							}}}
				}}
						?>

			</tr>
</table>
