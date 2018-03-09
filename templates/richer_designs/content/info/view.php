<?php

  // grab the item requested
  $osC_Info = new osC_InfoClass();
  $QinfoDetails = $osC_Info->getDetails();
  
?>

<?php if (file_exists('templates/' . $osC_Template->getCode() . '/' . DIR_WS_IMAGES . 'icons/' . $osC_Template->getPageImage()) == true) {
echo osc_image('templates/' . $osC_Template->getCode() . '/' . DIR_WS_IMAGES . 'icons/' . $osC_Template->getPageImage(), '', '', HEADING_IMAGE_HEIGHT_ICON, 'id="pageIcon"');
} else {}
?>

<h1><?php echo $osC_Template->getPageTitle(); ?></h1>
<?php
    echo '<div class="moduleBox">
    		<div>' . $QinfoDetails->value("info_description") . '</div>
		  </div>'
			  
?>

<div class="submitFormButtons" style="text-align: right;">
  <?php echo $osC_Template->osc_draw_image_jquery_button(array('href' => osc_href_link(FILENAME_INFO), 'icon' => 'triangle-1-e', 'title' => $osC_Language->get('button_continue'))); ?>
</div>

