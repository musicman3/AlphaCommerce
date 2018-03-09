<?php
/*
  $Id: captcha.php $
  RuBiC Open Source
  http://www.rubicshop.ru

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
*/

	class osC_CaptchaClass {
		protected $_code;
		protected $_width  = 30;
		protected $_height = 150;

		function osC_Captcha() {
			$this->_code = osc_create_random_string(6);
		}

		function setWidth ($width) {
			$this->_width = $width;
		}

		function setHeight($height) {
			$this->_height = $height;
		}

		function getCode(){
			return $this->_code;
		}

		function genCaptcha() {
			$image = imagecreatetruecolor($this->_height, $this->_width);

			$_width = imagesx($image);
			$_height = imagesy($image);

			$black = imagecolorallocate($image, 0, 0, 0);
			$white = imagecolorallocate($image, 255, 255, 255);
			$red = imagecolorallocatealpha($image, 220, 65, 50, 50);
			$green = imagecolorallocatealpha($image, 131, 191, 0, 50);
			$blue = imagecolorallocatealpha($image, 59, 122, 166, 50);

			imagefilledrectangle($image, 0, 0, $_width, $_height, $white);

			imagefilledellipse($image, ceil(rand(5, 145)), ceil(rand(0, 35)), 30, 30, $red);
			imagefilledellipse($image, ceil(rand(5, 145)), ceil(rand(0, 35)), 30, 30, $green);
			imagefilledellipse($image, ceil(rand(5, 145)), ceil(rand(0, 35)), 30, 30, $blue);
			imagefilledellipse($image, ceil(rand(5, 145)), ceil(rand(0, 35)), 30, 30, $red);
			imagefilledellipse($image, ceil(rand(5, 145)), ceil(rand(0, 35)), 30, 30, $green);
			imagefilledellipse($image, ceil(rand(5, 145)), ceil(rand(0, 35)), 30, 30, $blue);
			imagefilledellipse($image, ceil(rand(5, 145)), ceil(rand(0, 35)), 30, 30, $red);
			imagefilledellipse($image, ceil(rand(5, 145)), ceil(rand(0, 35)), 30, 30, $green);
			imagefilledellipse($image, ceil(rand(5, 145)), ceil(rand(0, 35)), 30, 30, $blue);
			imagefilledellipse($image, ceil(rand(5, 145)), ceil(rand(0, 35)), 30, 30, $red);
			imagefilledellipse($image, ceil(rand(5, 145)), ceil(rand(0, 35)), 30, 30, $green);
			imagefilledellipse($image, ceil(rand(5, 145)), ceil(rand(0, 35)), 30, 30, $blue);

			imagefilledrectangle($image, 0, 0, $_width, 0, $black);
			imagefilledrectangle($image, $_width - 1, 0, $_width - 1, $_height - 1, $black);
			imagefilledrectangle($image, 0, 0, 0, $_height - 1, $black);
			imagefilledrectangle($image, 0, $_height - 1, $_width, $_height - 1, $black);

			imagestring($image, 10, intval(($_width - (strlen($this->_code) * 9)) / 2),  intval(($_height - 15) / 2), $this->_code, $black);

			header('Content-type: image/jpeg');

			imagejpeg($image);
			imagedestroy($image);
		}
	}
?>