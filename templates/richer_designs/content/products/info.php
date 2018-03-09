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
?>
<?php if (file_exists('templates/' . $osC_Template->getCode() . '/' . DIR_WS_IMAGES . 'icons/' . $osC_Template->getPageImage()) == true) {
echo osc_image('templates/' . $osC_Template->getCode() . '/' . DIR_WS_IMAGES . 'icons/' . $osC_Template->getPageImage(), '', '', HEADING_IMAGE_HEIGHT_ICON, 'id="pageIcon"');
} else {}
?>

<h1><?php echo $osC_Template->getPageTitle(); ?></h1>
<div>

<!-- Preload image lightbox -->
<script type="text/javascript">
	<!--//--><![CDATA[//><!--
	var img = new Object();
	img["overlay"] = new Image;
	img["overlay"].src = "images/lightbox/overlay.png";
	//--><!]]>
</script>

<!-- Start Lightbox -->
<script type="text/javascript" src="ext/jquery/jquery.colorbox.min.js"></script>
<link rel="stylesheet" type="text/css" href="templates/<?php echo $osC_Template->getCode(); ?>/colorbox.css" />
<script type="text/javascript">
	$(document).ready(function(){$("a[rel='example1']").colorbox({transition:"fade",maxWidth:"80%", maxHeight:"80%"});});
</script>
<!-- End Lightbox -->

<div style="float: left; text-align: center; padding: 0 10px 10px 0; width: <?php echo $osC_Image->getWidth('product_info'); ?>px;">
    <?php $group_id = $osC_Image->getID('large');
		$lightboxcaption = $osC_Template->getPageTitle();// text for lightbox

		if (!$osC_Product->hasImage()) {
			echo osc_link_object(osc_href_link(DIR_WS_IMAGES.'products/'.$osC_Image->getCode($group_id).'/photo_not_available.png', null, 'NONSSL', false), $osC_Image->show($osC_Product->getImage(), $osC_Product->getTitle(), null, 'product_info'),'rel="example1" title="'.$lightboxcaption.'"');
		}else{

			echo osc_link_object(osc_href_link(DIR_WS_IMAGES.'products/'.$osC_Image->getCode($group_id).'/'.$osC_Product->getImage(), null, 'NONSSL', false), $osC_Image->show($osC_Product->getImage(), $osC_Product->getTitle(), null, 'product_info'),'rel="example1" title="'.$lightboxcaption.'"');

			if ($osC_Product->numberOfImages() > 1) {
				echo '<div id="counterst">';
				foreach ($osC_Product->getImages() as $images) {
					if ($osC_Product->getImage() != $images['image']) echo osc_link_object(osc_href_link(DIR_WS_IMAGES. 'products/' . $osC_Image->getCode($group_id) . '/' . $images['image'], null, 'NONSSL', false), $osC_Image->show($images['image'], $osC_Product->getTitle(), null, 'mini'), 'rel="example1" title="'.$lightboxcaption.'"');
				}
				echo '</div>';
			}

			if ($osC_Product->numberOfImages() > 1) {
				echo "\n<div id=\"gallerydiv\" style=\"display:none;\">";
				foreach ($osC_Product->getImages() as $images) {
					if ($osC_Product->getImage() != $images['image']) echo osc_link_object(osc_href_link(DIR_WS_IMAGES. 'products/' . $osC_Image->getCode($group_id) . '/' . $images['image'], null, 'NONSSL', false),  $osC_Image->show($images['image'], $osC_Product->getTitle(), null, 'product_info'), 'rel="example1-1" title="'.$lightboxcaption.'"');
				}
				echo "</div>";
			}
		}

	?>
</div>

<div style="<?php if ( $osC_Product->hasImage() ) { echo 'margin-left: ' . ($osC_Image->getWidth('product_info') + 60) . 'px; '; } ?>min-height: <?php echo $osC_Image->getHeight('product_info'); ?>px;">

    <?php if ( $osC_Product->hasVariants() ) { ?>
		<form name="cart_quantity" action="<?php echo osc_href_link(FILENAME_PRODUCTS, $osC_Product->getKeyword() . '&action=cart_add'); ?>" method="post">
    <?php } ?>

	<table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="productInfoKey"><?php echo $osC_Language->get('listing_price_heading') ?>:</td>
			<td class="productInfoValue"><span id="productInfoPrice"><?php echo $osC_Product->getPriceFormated(true); ?></span> <?php echo osc_link_object(osc_href_link(FILENAME_INFO, 'view=3'), $osC_Language->get('shipping_template_info')); ?></td>
		</tr>

		<?php
			if ( $osC_Product->hasAttribute('shipping_availability') ) {
			?>

			<tr>
				<td class="productInfoKey"><?php echo $osC_Language->get('shipping_method_available') ?>:</td>
				<td class="productInfoValue" id="productInfoAvailability"><?php echo $osC_Product->getAttribute('shipping_availability'); ?></td>
			</tr>

			<?php
			}
			?>

	</table>

	<?php
		if ( $osC_Product->hasVariants() ) {
	?>

		<div id="variantsBlock">
			<div id="variantsBlockTitle"><?php echo $osC_Language->get('product_attributes'); ?></div>

			<div id="variantsBlockData">

				<?php
					$osC_Variants = new osC_Variants();
					foreach ( $osC_Product->getVariants() as $group_id => $value ) {
						echo $osC_Variants->parse($value['module'], $value);
					}

					echo $osC_Variants->defineJavascript($osC_Product->getVariants(false));
				?>

			</div>
		</div>

		<div style="margin-top: 10px; float: left;">
			<?php echo $osC_Template->osc_draw_image_jquery_button_buy(array('buy' => '', 'icon' => 'cart', 'title' => $osC_Language->get('button_add_to_cart'))); ?>
		</div>
		<?php }else{ ?>
		<div style="margin-top: 10px; float: left;">
			<?php echo $osC_Template->osc_draw_image_jquery_button_buy(array('buy' => $osC_Product->getKeyword(), 'icon' => 'cart', 'title' => $osC_Language->get('button_add_to_cart'))); ?>
		</div>
<?php } ?>
</div>
</div>

<div style="clear: both;"></div>

	<table border="0" cellspacing="0" cellpadding="0">

		<?php
			if ( $osC_Product->hasAttribute('manufacturers') ) {
			?>

			<tr>
				<td class="productInfoKey"><?php echo $osC_Language->get('manufacturer') ?></td>
				<td class="productInfoValue"><?php echo $osC_Product->getAttribute('manufacturers'); ?></td>
			</tr>

			<?php
			}
			if ( ($osC_Product->hasVariants()) || (strlen($osC_Product->getModel())) > 1) {
			?>

			<tr>
				<td class="productInfoKey"><?php echo $osC_Language->get('listing_model_heading') ?>:</td>
				<td class="productInfoValue"><span id="productInfoModel"><?php echo $osC_Product->getModel(); ?></span></td>
			</tr>

			<?php
			}
			if ( $osC_Product->hasAttribute('date_available') ) {
			?>

			<tr>
				<td class="productInfoKey" style="color:#ff0000"><?php echo $osC_Language->get('upcoming_products_title_2') ?>:</td>
				<?php $osC_DateTime = new osC_DateTime(); ?>
				<td class="productInfoValue" style="color:#ff0000"><?php echo $osC_DateTime->getLong($osC_Product->getAttribute('date_available')); ?></td>
			</tr>

			<?php
			}
			?>

	</table>

	<?php
		if ( $osC_Product->hasVariants() ) {
	?>

		<script type="text/javascript">
			var originalPrice = '<?php echo $osC_Product->getPriceFormated(true); ?>';
			var productInfoNotAvailable = '<span id="productVariantCombinationNotAvailable"><?php echo $osC_Language->get('product_not_available') ?></span>';
			var productInfoAvailability = '<?php if ( $osC_Product->hasAttribute('shipping_availability') ) { echo addslashes($osC_Product->getAttribute('shipping_availability')); } ?>';

			refreshVariants();
		</script>

		<?php
			}
		?>

	<div>
		<?php echo $osC_Product->getDescription(); ?>
	</div>

	<?php
		if ($osC_Product->hasURL()) {
	?>

		<br /><?php echo sprintf($osC_Language->get('go_to_external_products_webpage'), osc_href_link(FILENAME_REDIRECT, 'action=url&goto=' . urlencode($osC_Product->getURL()), 'NONSSL', null, false)); ?></br>

		<?php
			}
			{
		?>
		<!-- bof osCommerce Quantity Discounts Contribution Example 2 Marketing Text -->
		<br />
		<?php if ((defined('MODULE_ORDER_TOTAL_QUANTITY_DISCOUNTS_STATUS') && (MODULE_ORDER_TOTAL_QUANTITY_DISCOUNTS_STATUS == '1') ? true : false)) {
			require_once("includes/classes/order_total.php");
			require_once("includes/modules/order_total/quantity_discounts.php");
			$osC_Language->load('modules-order_total');
			$discount = new osC_OrderTotal_quantity_discounts();
			$prid = $osC_Product->getMasterID();
			if (($discount->check()) &&
				($discount->is_discountable($prid))) {
					echo '<div class="content" id="discountPolicy2">';
					echo '<table width="100%">';
					echo '<tr><td><b><span style="text-decoration: underline;">' . $discount->STORE_POLICY . '</span></b><br /><br /></td></tr>';
					$dislist = $discount->get_discount_info($prid);
					for ($i = 0; $i < sizeof($dislist); $i++) {
						echo '<tr><td>'. $dislist[$i] . "</td></tr>";
					}
					echo '</table>';
					echo '<br /></div>';
				}
			}
			}
		?>
<!-- eof Quantity Discounts Contribution Example 2 Marketing Text -->

	<div class="submitFormButtons" style="text-align: right;">

		<?php
			$osC_Reviews = new osC_Reviews();
			if ($osC_Services->isStarted('reviews')) {
				echo $osC_Template->osc_draw_image_jquery_button(array('href' => osc_href_link(FILENAME_PRODUCTS, 'reviews&' . osc_get_all_get_params()), 'icon' => 'comment', 'title' => $osC_Language->get('button_reviews') .' ('. $osC_Reviews->getTotal(osc_get_product_id($osC_Product->getID())).')'));
			}
		?>

	</div>
		<?php if ( $osC_Product->hasVariants() ) { ?>
			</form>
		<?php } ?>