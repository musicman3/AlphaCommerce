<script type="text/javascript">
$(document).ready(function () {
	$('#country').change(function () {
		var country = $(this).val();

		$('#state').attr('disabled', true);
		$('#state').html('<select id="state" name="state"><option><?php echo $osC_Language->get('loading_regions'); ?></option></select>');

		var url = 'select.php';

		$.get(
		url,
		"country=" + country,
		function (result) {
			if (result.type == 'error') {
				alert('error');
				return(false);
			}
			else {
				if (result.regions > '0') {
					var options = '<select id="state" name="state">';

					$(result.regions).each(function() {
						options += '<option value="' + $(this).attr('zone_name') + '">' + $(this).attr('zone_name') + '</option>';
					});

					$('#state').html(''+options+'</select>');
					$('#state').attr('disabled', false);
				} else {
					var options = '<input id="state" type="text" name="state">';


					$('#state').html(''+options);
					$('#state').attr('disabled', false);
				}

			}
		},
		"json"
		);
	});
});
</script>