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
?>

<?php if (file_exists('images/' . $osC_Template->getPageImage()) == true) {
	echo osc_image(DIR_WS_IMAGES . $osC_Template->getPageImage(), $osC_Template->getPageTitle(), HEADING_IMAGE_WIDTH, HEADING_IMAGE_HEIGHT, 'id="pageIcon"');
} else {}
?>

<h1><?php echo $osC_Template->getPageTitle(); ?></h1>
<div id="info"><!--ajax begin -->

	<?php
		if ($osC_ShoppingCart->hasContents()) {
	?>

		<div class="moduleBox">

			<h6><?php echo $osC_Language->get('shopping_cart_heading'); ?></h6>
			<div class="content">
			<form id="shopping_cart" name="shopping_cart" action="<?php echo osc_href_link(FILENAME_CHECKOUT, 'action=cart_update', 'SSL'); ?>" method="post">
				<table border="0" width="100%" cellspacing="0" cellpadding="2">

					<?php
						$_cart_date_added = null;

						foreach ($osC_ShoppingCart->getProducts() as $products) {
							if ($products['date_added'] != $_cart_date_added) {
								$_cart_date_added = $products['date_added'];
							?>

							<tr>
								<td colspan="4"><?php echo sprintf($osC_Language->get('date_added_to_shopping_cart'), $products['date_added']); ?></td>
							</tr>

							<?php
							}
							?>

						<tr>
							<td class="submitFormButtons" valign="top" width="60">
							<?php echo $osC_Template->osc_draw_image_jquery_button_click(array('click' => 'del('.$products['item_id'].')', 'icon' => 'trash', 'title' => $osC_Language->get('button_delete'))); ?></td>
							<td valign="top">

								<?php
									echo osc_link_object(osc_href_link(FILENAME_PRODUCTS, $products['keyword']), '<b>' . $products['name'] . '</b>');

									if ( (STOCK_CHECK == '1') && ($osC_ShoppingCart->isInStock($products['item_id']) === false) ) {
										echo '<span class="markProductOutOfStock">' . STOCK_MARK_PRODUCT_OUT_OF_STOCK . '</span>';
									}

									// HPDL      echo '&nbsp;(Top Category)';

									if ( $osC_ShoppingCart->isVariant($products['item_id']) ) {
										foreach ( $osC_ShoppingCart->getVariant($products['item_id']) as $variant) {
											echo '<br />- ' . $variant['group_title'] . ': ' . $variant['value_title'];
										}
									}
								?>

							</td>
							<td valign="top"><?php echo osc_draw_input_field('products[' . $products['item_id'] . ']', $products['quantity'], 'size="4"'); ?></td>
							<td valign="top" align="right"><?php echo '<b>' . $osC_Currencies->displayPrice($products['price'], $products['tax_class_id'], $products['quantity']) . '</b>'; ?></td>
						</tr>

						<?php
						}
						?>

				</table>
				</form>
			</div>
			<table border="0" width="100%" cellspacing="0" cellpadding="2">

				<?php
// HPDL
//    if ($osC_OrderTotal->hasActive()) {
//      foreach ($osC_OrderTotal->getResult() as $module) {
					foreach ($osC_ShoppingCart->getOrderTotals() as $module) {
						echo '    <tr>' . "\n" .
						'      <td align="right">' . $module['title'] . '</td>' . "\n" .
						'      <td align="right">' . $module['text'] . '</td>' . "\n" .
						'    </tr>';
					}
					//    }
				?>

			</table>

			<?php
				if ( (STOCK_CHECK == '1') && ($osC_ShoppingCart->hasStock() === false) ) {
					if (STOCK_ALLOW_CHECKOUT == '1') {
						echo '<p class="stockWarning" align="center">' . sprintf($osC_Language->get('products_out_of_stock_checkout_possible'), STOCK_MARK_PRODUCT_OUT_OF_STOCK) . '</p>';
					} else {
						echo '<p class="stockWarning" align="center">' . sprintf($osC_Language->get('products_out_of_stock_checkout_not_possible'), STOCK_MARK_PRODUCT_OUT_OF_STOCK) . '</p>';
					}
				}
			?>

		</div>

		<div class="submitFormButtons">
			<span style="float: right;"><?php echo $osC_Template->osc_draw_image_jquery_button(array('href' => osc_href_link(FILENAME_CHECKOUT, 'shipping', 'SSL'), 'icon' => 'check', 'title' => $osC_Language->get('button_checkout'))); ?></span>

			<?php echo $osC_Template->osc_draw_image_jquery_button_click(array('click' => 'update()', 'icon' => 'refresh', 'title' => $osC_Language->get('button_update_cart'))); ?>

		</div>

			<!-- ajax end -->
	<?php
		} else {
	?>
	<div class="moduleBox">
		<h6><?php echo $osC_Language->get('shopping_cart_heading'); ?></h6>
		<p id="empty"><?php echo $osC_Language->get('shopping_cart_empty'); ?></p>
		<div class="submitFormButtons" style="text-align: right;">
		<?php echo $osC_Template->osc_draw_image_jquery_button(array('href' => osc_href_link(FILENAME_DEFAULT), 'icon' => 'triangle-1-e', 'title' => $osC_Language->get('button_continue'))); ?></div></div><!-- ajax end -->
	<?php
		}
	?>
		</div>
