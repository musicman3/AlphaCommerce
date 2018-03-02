<!-- jQuery Cart -->
<script type="text/javascript">
var session;
var wait;
var loading;
var url;
var data;
var error;
var retry;
var b;
var c;
session="<?php echo '&osCsid='.$osC_Session->getID(); ?>";
wait='<?php echo $osC_Language->get('cart_wait'); ?>';
loading='templates/<?php echo $osC_Template->getCode(); ?>/images/loadingfinal.gif';
error='<?php echo $osC_Language->get('cart_error'); ?>';
retry='<?php echo $osC_Language->get('cart_retry'); ?>';
b='#basket';
c='#cart';

function update()
{
	$.showprogress(wait,'<?php echo $osC_Language->get('ajaxcart_update'); ?>',loading);
	data=$("#shopping_cart").serialize();
	url="checkout.php?action=cart_update"+session;
	var jqxhr = $.post(url, data)
	.success(function(msg) {
		if ( $(b).length ){
			link=msg.match(/id=\"basket\"\>(.+?)\<\/\a\>/);
			$(b).html(link[1]);
		}
		if ( $(c).length ){
			link=msg.match(/id=\"cart\"\>(.+?)<\/div\>/);
			$(c).html(link[1]);
		}
		txt=msg.split('<!--ajax begin -->');
		txt=txt[3];
		txt=txt.split('<!-- ajax end -->');
		txt=txt[0];
		$('#info').html(txt);
		setTimeout(function () { $.hideprogress(); },1500);
	})
	<!-- Error message -->
	.error(function() {
		$.showprogress(error, retry, loading);
		setTimeout(function () { $.hideprogress(); }, 3500);
	});
};

function del(key)
{
	$.showprogress(wait,'<?php echo $osC_Language->get('ajaxcart_delete'); ?>',loading);
	url="checkout.php";
	data="action=cart_remove&item="+key+session;
	var jqxhr = $.get(url, data)
	.success(function(msg) {
		if ( $(b).length ){
			link=msg.match(/id=\"basket\"\>(.+?)\<\/\a\>/);
			$(b).html(link[1]);
		}
		if ( $(c).length ){
			link=msg.match(/id=\"cart\"\>(.+?)<\/div\>/);
			$(c).html(link[1]);
		}
		txt=msg.split('<!--ajax begin -->');
		txt=txt[3];
		txt=txt.split('<!-- ajax end -->');
		txt=txt[0];
		$('#info').html(txt);
		setTimeout(function () { $.hideprogress(); },1500);
	})
	<!-- Error message -->
	.error(function() {
		$.showprogress(error, retry, loading);
		setTimeout(function () { $.hideprogress(); }, 3500);
	});
};

function buy(key)
{
	$.showprogress(wait,'<?php echo $osC_Language->get('cart_loading'); ?>',loading);
	url="products.php?"+key;
	data="action=cart_add"+session;
	var jqxhr = $.get(url, data)
	.success(function(msg) {
		if ( $(b).length ){
			link=msg.match(/id=\"basket\"\>(.+?)\<\/\a\>/);
			$(b).html(link[1]);
		}
		if ( $(c).length ){
			link=msg.match(/id=\"cart\"\>(.+?)<\/div\>/);
			$(c).html(link[1]);
		}
		setTimeout(function () { $.hideprogress(); },1500);
	})
	<!-- Request 2 -->
	.error(function() {
		$.showprogress(wait,'<?php echo $osC_Language->get('cart_loading'); ?>',loading);
		url="products.php?"+key;
		var jqxhr = $.get(url, data)
		.success(function(msg) {
			if ( $(b).length ){
				link=msg.match(/id=\"basket\"\>(.+?)\<\/\a\>/);
				$(b).html(link[1]);
			}
			if ( $(c).length ){
				link=msg.match(/id=\"cart\"\>(.+?)<\/div\>/);
				$(c).html(link[1]);
			}
			setTimeout(function () { $.hideprogress(); }, 1500);
		})
		<!-- Error message -->
		.error(function() {
			$.showprogress(error, retry, loading);
			setTimeout(function () { $.hideprogress(); }, 3500);
		});});
};
</script>