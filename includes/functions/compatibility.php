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

/**
 * Forcefully disable register_globals if enabled
 *
 * Based from work by Richard Heyes (http://www.phpguru.org)
 */

  if ((int)ini_get('register_globals') > 0) {
    if (isset($_REQUEST['GLOBALS'])) {
      die('GLOBALS overwrite attempt detected');
    }

    $noUnset = array('GLOBALS', '_GET', '_POST', '_COOKIE', '_REQUEST', '_SERVER', '_ENV', '_FILES');

    $input = array_merge($_GET, $_POST, $_COOKIE, $_SERVER, $_ENV, $_FILES, isset($_SESSION) ? (array)$_SESSION : array());

    foreach ($input as $k => $v) {
      if (!in_array($k, $noUnset) && isset($GLOBALS[$k])) {
        unset($GLOBALS[$k]);
      }
    }

    unset($noUnset);
    unset($input);
    unset($k);
    unset($v);
  }

/**
 * Forcefully disable magic_quotes_gpc if enabled
 *
 * Based from work by Ilia Alshanetsky (Advanced PHP Security)
 */

  if ((int)get_magic_quotes_gpc() > 0) {
    $in = array(&$_GET, &$_POST, &$_COOKIE);

    while (list($k, $v) = each($in)) {
      foreach ($v as $key => $val) {
        if (!is_array($val)) {
          $in[$k][$key] = stripslashes($val);

          continue;
        }

        $in[] =& $in[$k][$key];
      }
    }

    unset($in);
    unset($k);
    unset($v);
    unset($key);
    unset($val);
  }

/**
 * checkdnsrr() not implemented on Microsoft Windows platforms
 */

  if (!function_exists('checkdnsrr')) {
    function checkdnsrr($host, $type) {
      if(!empty($host) && !empty($type)) {
        @exec('nslookup -type=' . escapeshellarg($type) . ' ' . escapeshellarg($host), $output);

        foreach ($output as $k => $line) {
           if(preg_match('/^/i' . $host, $line)) {//if(eregi('^' . $host, $line)) {
            return true;
          }
        }
      }

      return false;
    }
  }

/**
 * ctype_alnum() natively supported from PHP 4.3
 */

  if (!function_exists('ctype_alnum')) {
    function ctype_alnum($string) {
      return (preg_match('/^[a-z0-9]*$/i', $string) > 0);//return (eregi('^[a-z0-9]*$', $string) > 0);
    }
  }

/**
 * ctype_xdigit() natively supported from PHP 4.3
 */

  if (!function_exists('ctype_xdigit')) {
    function ctype_xdigit($string) {
      return (preg_match('/^([a-f0-9][a-f0-9])*$/i', $string) > 0);//return (eregi('^([a-f0-9][a-f0-9])*$', $string) > 0);
    }
  }

/**
 * is_a() natively supported from PHP 4.2
 */

  if (!function_exists('is_a')) {
    function is_a($object, $class) {
      if (!is_object($object)) {
        return false;
      }

      if (get_class($object) == strtolower($class)) {
        return true;
      } else {
        return is_subclass_of($object, $class);
      }
    }
  }

/**
 * floatval() natively supported from PHP 4.2
 */

  if (!function_exists('floatval')) {
    function floatval($float) {
      return doubleval($float);
    }
  }

/**
 * stream_get_contents() natively supported from PHP 5.0
 */

  if (!function_exists('stream_get_contents')) {
    function stream_get_contents($resource) {
      $result = '';

      if (is_resource($resource)) {
        while (!feof($resource)) {
          $result .= @fread($resource, 2048);
        }
      }

      return $result;
    }
  }

/**
 * sha1() natively supported from PHP 4.3
 */

  if (!function_exists('sha1')) {
    function sha1($source) {
      if (function_exists('mhash')) {
        if (($hash = @mhash(MHASH_SHA1, $source)) !== false) {
          return bin2hex($hash);
        }
      }

      if (!function_exists('calc_sha1')) {
        include('ext/sha1/sha1.php');
      }

      return calc_sha1($source);
    }
  }

  function osc_strrpos_string($haystack, $needle, $offset = 0) {
    if ( !empty($haystack) && !empty($needle) && ( $offset <= strlen($haystack) ) ) {
      $last_pos = $offset;
      $found = false;

      while ( ( $curr_pos = strpos($haystack, $needle, $last_pos) ) !== false ) {
        $found = true;
        $last_pos = $curr_pos + 1;
      }

      if ( $found === true ) {
        return $last_pos - 1;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
?>
