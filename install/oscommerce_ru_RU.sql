# $Id$
#
# osCommerce, Open Source E-Commerce Solutions
# http://www.oscommerce.com
#
# Copyright (c) 2009 osCommerce
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License v2 (1991)
# as published by the Free Software Foundation.

DROP TABLE IF EXISTS osc_address_book;
CREATE TABLE osc_address_book (
   address_book_id int NOT NULL auto_increment,
   customers_id int NOT NULL,
   entry_gender char(1) NOT NULL,
   entry_company varchar(255),
   entry_firstname varchar(255) NOT NULL,
   entry_lastname varchar(255) NOT NULL,
   entry_street_address varchar(255) NOT NULL,
   entry_suburb varchar(255),
   entry_postcode varchar(255) NOT NULL,
   entry_city varchar(255) NOT NULL,
   entry_state varchar(255),
   entry_country_id int DEFAULT '0' NOT NULL,
   entry_zone_id int DEFAULT '0' NOT NULL,
   entry_telephone varchar(255),
   entry_fax varchar(255),
   PRIMARY KEY (address_book_id),
   KEY idx_address_book_customers_id (customers_id)
);

DROP TABLE IF EXISTS osc_administrators;
CREATE TABLE osc_administrators (
  id int NOT NULL auto_increment,
  user_name varchar(255) binary NOT NULL,
  user_password varchar(40) NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS osc_administrators_access;
CREATE TABLE osc_administrators_access (
  administrators_id int NOT NULL,
  module varchar(255) NOT NULL,
  PRIMARY KEY (administrators_id, module)
);

DROP TABLE IF EXISTS osc_administrators_log;
CREATE TABLE osc_administrators_log (
  id int NOT NULL,
  module varchar(255) NOT NULL,
  module_action varchar(255),
  module_id int,
  field_key varchar(255) NOT NULL,
  old_value text,
  new_value text,
  action varchar(255) NOT NULL,
  administrators_id int NOT NULL,
  datestamp datetime NOT NULL,
  KEY idx_administrators_log_id (id)
);

DROP TABLE IF EXISTS osc_banners;
CREATE TABLE osc_banners (
  banners_id int NOT NULL auto_increment,
  banners_title varchar(255) NOT NULL,
  banners_url varchar(255) NOT NULL,
  banners_image varchar(255) NOT NULL,
  banners_group varchar(255) NOT NULL,
  banners_html_text text,
  expires_impressions int DEFAULT '0',
  expires_date datetime DEFAULT NULL,
  date_scheduled datetime DEFAULT NULL,
  date_added datetime NOT NULL,
  date_status_change datetime DEFAULT NULL,
  status int(1) DEFAULT '1' NOT NULL,
  PRIMARY KEY  (banners_id)
);

DROP TABLE IF EXISTS osc_banners_history;
CREATE TABLE osc_banners_history (
  banners_history_id int NOT NULL auto_increment,
  banners_id int NOT NULL,
  banners_shown int NOT NULL DEFAULT '0',
  banners_clicked int NOT NULL DEFAULT '0',
  banners_history_date datetime NOT NULL,
  PRIMARY KEY  (banners_history_id)
);

DROP TABLE IF EXISTS osc_categories;
CREATE TABLE osc_categories (
   categories_id int NOT NULL auto_increment,
   categories_image varchar(255),
   parent_id int DEFAULT '0' NOT NULL,
   sort_order int,
   date_added datetime,
   last_modified datetime,
   PRIMARY KEY (categories_id),
   KEY idx_categories_parent_id (parent_id)
);

DROP TABLE IF EXISTS osc_categories_description;
CREATE TABLE osc_categories_description (
   categories_id int DEFAULT '0' NOT NULL,
   language_id int DEFAULT '1' NOT NULL,
   categories_name varchar(255) NOT NULL,
   PRIMARY KEY (categories_id, language_id),
   KEY idx_categories_name (categories_name)
);

DROP TABLE IF EXISTS osc_cms;
CREATE TABLE osc_cms (
   cms_id int DEFAULT '0' NOT NULL,
   language_id int DEFAULT '1' NOT NULL,
   cms_name varchar(255) NOT NULL,
   cms_description text NOT NULL,
   cms_short_text text NOT NULL,
   active int DEFAULT '0' NOT NULL,
   date_added datetime default NULL,
   last_modified datetime default NULL,
   PRIMARY KEY  (cms_id,language_id),
   KEY idx_cms_name (cms_name)
);

DROP TABLE IF EXISTS osc_cms_xsell;
CREATE TABLE osc_cms_xsell (
  ID int NOT NULL auto_increment,
  cms_id int unsigned DEFAULT '1' NOT NULL,
  xsell_id int unsigned DEFAULT '1' NOT NULL,
  sort_order int unsigned DEFAULT '1' NOT NULL,
  PRIMARY KEY  (ID)
);

DROP TABLE IF EXISTS osc_configuration;
CREATE TABLE osc_configuration (
  configuration_id int NOT NULL auto_increment,
  configuration_title varchar(255) NOT NULL,
  configuration_key varchar(255) NOT NULL,
  configuration_value text NOT NULL,
  configuration_description varchar(255) NOT NULL,
  configuration_group_id int NOT NULL,
  sort_order int NULL,
  last_modified datetime NULL,
  date_added datetime NOT NULL,
  use_function varchar(255) NULL,
  set_function varchar(255) NULL,
  PRIMARY KEY (configuration_id)
);

DROP TABLE IF EXISTS osc_configuration_group;
CREATE TABLE osc_configuration_group (
  configuration_group_id int NOT NULL auto_increment,
  configuration_group_title varchar(255) NOT NULL,
  configuration_group_description varchar(255) NOT NULL,
  sort_order int NULL,
  visible int DEFAULT '1' NULL,
  PRIMARY KEY (configuration_group_id)
);

DROP TABLE IF EXISTS osc_counter;
CREATE TABLE osc_counter (
  startdate datetime,
  counter int
);

DROP TABLE IF EXISTS osc_countries;
CREATE TABLE osc_countries (
  countries_id int NOT NULL auto_increment,
  countries_name varchar(255) NOT NULL,
  countries_iso_code_2 char(2) NOT NULL,
  countries_iso_code_3 char(3) NOT NULL,
  address_format varchar(255) NULL,
  PRIMARY KEY (countries_id),
  KEY IDX_COUNTRIES_NAME (countries_name)
);

DROP TABLE IF EXISTS osc_credit_cards;
CREATE TABLE osc_credit_cards (
  id int NOT NULL auto_increment,
  credit_card_name varchar(255) NOT NULL,
  pattern varchar(255) NOT NULL,
  credit_card_status char(1) NOT NULL,
  sort_order int default '0',
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS osc_currencies;
CREATE TABLE osc_currencies (
  currencies_id int NOT NULL auto_increment,
  title varchar(255) NOT NULL,
  code char(3) NOT NULL,
  symbol_left varchar(12),
  symbol_right varchar(12),
  decimal_places char(1),
  value float(13,8),
  last_updated datetime NULL,
  PRIMARY KEY (currencies_id)
);

DROP TABLE IF EXISTS osc_customers;
CREATE TABLE osc_customers (
  customers_id int NOT NULL auto_increment,
  customers_gender char(1),
  customers_firstname varchar(255) NOT NULL,
  customers_lastname varchar(255) NOT NULL,
  customers_dob datetime,
  customers_email_address varchar(255) NOT NULL,
  customers_default_address_id int,
  customers_telephone varchar(255),
  customers_fax varchar(255),
  customers_password varchar(40),
  customers_newsletter char(1),
  customers_status int DEFAULT '0',
  customers_ip_address varchar(15),
  date_last_logon datetime,
  number_of_logons int,
  date_account_created datetime,
  date_account_last_modified datetime,
  global_product_notifications int DEFAULT '0',
  PRIMARY KEY (customers_id)
);

DROP TABLE IF EXISTS osc_languages;
CREATE TABLE osc_languages (
  languages_id int NOT NULL auto_increment,
  name varchar(255)  NOT NULL,
  code char(5) NOT NULL,
  locale varchar(255) NOT NULL,
  charset varchar(32) NOT NULL,
  date_format_short varchar(32) NOT NULL,
  date_format_long varchar(32) NOT NULL,
  time_format varchar(32) NOT NULL,
  text_direction varchar(12) NOT NULL,
  currencies_id int NOT NULL,
  numeric_separator_decimal varchar(12) NOT NULL,
  numeric_separator_thousands varchar(12) NOT NULL,
  parent_id int DEFAULT 0,
  sort_order int,
  PRIMARY KEY (languages_id)
);

DROP TABLE IF EXISTS osc_languages_definitions;
CREATE TABLE osc_languages_definitions (
  id int NOT NULL auto_increment,
  languages_id int NOT NULL,
  content_group varchar(255) NOT NULL,
  definition_key varchar(255) NOT NULL,
  definition_value text NOT NULL,
  PRIMARY KEY (id),
  KEY IDX_LANGUAGES_DEFINITIONS_LANGUAGES (languages_id),
  KEY IDX_LANGUAGES_DEFINITIONS (languages_id, content_group),
  KEY IDX_LANGUAGES_DEFINITIONS_GROUPS (content_group)
);

DROP TABLE IF EXISTS osc_manufacturers;
CREATE TABLE osc_manufacturers (
  manufacturers_id int NOT NULL auto_increment,
  manufacturers_name varchar(255) NOT NULL,
  manufacturers_image varchar(255),
  date_added datetime NULL,
  last_modified datetime NULL,
  PRIMARY KEY (manufacturers_id),
  KEY IDX_MANUFACTURERS_NAME (manufacturers_name)
);

DROP TABLE IF EXISTS osc_manufacturers_info;
CREATE TABLE osc_manufacturers_info (
  manufacturers_id int NOT NULL,
  languages_id int NOT NULL,
  manufacturers_url varchar(255) NOT NULL,
  url_clicked int NOT NULL default '0',
  date_last_click datetime NULL,
  PRIMARY KEY (manufacturers_id, languages_id)
);

DROP TABLE IF EXISTS osc_newsletters;
CREATE TABLE osc_newsletters (
  newsletters_id int NOT NULL auto_increment,
  title varchar(255) NOT NULL,
  content text NOT NULL,
  module varchar(255) NOT NULL,
  date_added datetime NOT NULL,
  date_sent datetime,
  status int,
  locked int DEFAULT '0',
  PRIMARY KEY (newsletters_id)
);

DROP TABLE IF EXISTS osc_newsletters_log;
CREATE TABLE osc_newsletters_log (
  newsletters_id int NOT NULL,
  email_address varchar(255) NOT NULL,
  date_sent datetime,
  KEY IDX_NEWSLETTERS_LOG_NEWSLETTERS_ID (newsletters_id),
  KEY IDX_NEWSLETTERS_LOG_EMAIL_ADDRESS (email_address)
);

DROP TABLE IF EXISTS osc_orders;
CREATE TABLE osc_orders (
  orders_id int NOT NULL auto_increment,
  customers_id int NOT NULL,
  customers_name varchar(255) NOT NULL,
  customers_company varchar(255),
  customers_street_address varchar(255) NOT NULL,
  customers_suburb varchar(255),
  customers_city varchar(255) NOT NULL,
  customers_postcode varchar(255) NOT NULL,
  customers_state varchar(255),
  customers_state_code varchar(255),
  customers_country varchar(255) NOT NULL,
  customers_country_iso2 char(2) NOT NULL,
  customers_country_iso3 char(3) NOT NULL,
  customers_telephone varchar(255) NOT NULL,
  customers_email_address varchar(255) NOT NULL,
  customers_address_format varchar(255) NOT NULL,
  customers_ip_address varchar(15),
  delivery_name varchar(255) NOT NULL,
  delivery_company varchar(255),
  delivery_street_address varchar(255) NOT NULL,
  delivery_suburb varchar(255),
  delivery_city varchar(255) NOT NULL,
  delivery_postcode varchar(255) NOT NULL,
  delivery_state varchar(255),
  delivery_state_code varchar(255),
  delivery_country varchar(255) NOT NULL,
  delivery_country_iso2 char(2) NOT NULL,
  delivery_country_iso3 char(3) NOT NULL,
  delivery_address_format varchar(255) NOT NULL,
  billing_name varchar(255) NOT NULL,
  billing_company varchar(255),
  billing_street_address varchar(255) NOT NULL,
  billing_suburb varchar(255),
  billing_city varchar(255) NOT NULL,
  billing_postcode varchar(255) NOT NULL,
  billing_state varchar(255),
  billing_state_code varchar(255),
  billing_country varchar(255) NOT NULL,
  billing_country_iso2 char(2) NOT NULL,
  billing_country_iso3 char(3) NOT NULL,
  billing_address_format varchar(255) NOT NULL,
  payment_method varchar(255) NOT NULL,
  payment_module varchar(255) NOT NULL,
  last_modified datetime,
  date_purchased datetime,
  orders_status int NOT NULL,
  orders_date_finished datetime,
  currency char(3),
  currency_value decimal(20,8),
  PRIMARY KEY (orders_id)
);

DROP TABLE IF EXISTS osc_orders_products;
CREATE TABLE osc_orders_products (
  orders_products_id int NOT NULL auto_increment,
  orders_id int NOT NULL,
  products_id int NOT NULL,
  products_model varchar(255),
  products_name varchar(255) NOT NULL,
  products_price decimal(15,4) NOT NULL,
  products_tax decimal(7,4) NOT NULL,
  products_quantity int NOT NULL,
  PRIMARY KEY (orders_products_id)
);

DROP TABLE IF EXISTS osc_orders_status;
CREATE TABLE osc_orders_status (
   orders_status_id int DEFAULT '0' NOT NULL,
   language_id int DEFAULT '1' NOT NULL,
   orders_status_name varchar(255) NOT NULL,
   PRIMARY KEY (orders_status_id, language_id),
   KEY idx_orders_status_name (orders_status_name)
);

DROP TABLE IF EXISTS osc_orders_status_history;
CREATE TABLE osc_orders_status_history (
   orders_status_history_id int NOT NULL auto_increment,
   orders_id int NOT NULL,
   orders_status_id int NOT NULL,
   date_added datetime NOT NULL,
   customer_notified int DEFAULT '0',
   comments text,
   PRIMARY KEY (orders_status_history_id)
);

DROP TABLE IF EXISTS osc_orders_products_variants;
CREATE TABLE osc_orders_products_variants (
  id int NOT NULL auto_increment,
  orders_id int NOT NULL,
  orders_products_id int NOT NULL,
  group_title varchar(255) NOT NULL,
  value_title text NOT NULL,
  PRIMARY KEY (id),
  KEY idx_orders_products_variants_orders_products_ids (orders_id, orders_products_id)
);

DROP TABLE IF EXISTS osc_orders_products_download;
CREATE TABLE osc_orders_products_download (
  orders_products_download_id int NOT NULL auto_increment,
  orders_id int NOT NULL default '0',
  orders_products_id int NOT NULL default '0',
  orders_products_filename varchar(255) NOT NULL default '',
  download_maxdays int NOT NULL default '0',
  download_count int NOT NULL default '0',
  PRIMARY KEY  (orders_products_download_id)
);

DROP TABLE IF EXISTS osc_orders_total;
CREATE TABLE osc_orders_total (
  orders_total_id int unsigned NOT NULL auto_increment,
  orders_id int NOT NULL,
  title varchar(255) NOT NULL,
  text varchar(255) NOT NULL,
  value decimal(15,4) NOT NULL,
  class varchar(255) NOT NULL,
  sort_order int NOT NULL,
  PRIMARY KEY (orders_total_id),
  KEY idx_orders_total_orders_id (orders_id)
);

DROP TABLE IF EXISTS osc_orders_transactions_history;
CREATE TABLE osc_orders_transactions_history (
  id int unsigned not null auto_increment,
  orders_id int unsigned not null,
  transaction_code int not null,
  transaction_return_value text not null,
  transaction_return_status int not null,
  date_added datetime,
  PRIMARY KEY (id),
  KEY idx_orders_transactions_history_orders_id (orders_id)
);

DROP TABLE IF EXISTS osc_orders_transactions_status;
CREATE TABLE osc_orders_transactions_status (
   id int unsigned NOT NULL,
   language_id int unsigned NOT NULL,
   status_name varchar(255) NOT NULL,
   PRIMARY KEY (id, language_id),
   KEY idx_orders_transactions_status_name (status_name)
);

DROP TABLE IF EXISTS osc_product_attributes;
CREATE TABLE osc_product_attributes (
  id INT UNSIGNED NOT NULL,
  products_id INT UNSIGNED NOT NULL,
  languages_id INT UNSIGNED NOT NULL,
  value TEXT NOT NULL,
  KEY idx_pa_id_products_id (id, products_id),
  KEY idx_pa_languages_id (languages_id)
);

DROP TABLE IF EXISTS osc_products;
CREATE TABLE osc_products (
  products_id int NOT NULL auto_increment,
  parent_id int NOT NULL DEFAULT 0,
  products_quantity int NOT NULL,
  products_price decimal(15,4) NOT NULL,
  products_model varchar(255) NOT NULL,
  products_date_added datetime NOT NULL,
  products_last_modified datetime,
  products_weight decimal(5,2) NOT NULL,
  products_weight_class int NOT NULL,
  products_status tinyint(1) NOT NULL,
  products_tax_class_id int NOT NULL,
  manufacturers_id int NULL,
  products_ordered int NOT NULL default '0',
  has_children int default 0,
  PRIMARY KEY (products_id),
  KEY idx_products_date_added (products_date_added)
);

DROP TABLE IF EXISTS osc_products_description;
CREATE TABLE osc_products_description (
  products_id int NOT NULL auto_increment,
  language_id int NOT NULL default '1',
  products_name varchar(255) NOT NULL default '',
  products_description text,
  products_keyword varchar(255),
  products_tags varchar(255),
  products_url varchar(255),
  products_viewed int default '0',
  PRIMARY KEY  (products_id,language_id),
  KEY products_name (products_name),
  KEY products_description_keyword (products_keyword)
);

DROP TABLE IF EXISTS osc_products_images;
CREATE TABLE osc_products_images (
  id int NOT NULL auto_increment,
  products_id int NOT NULL,
  image varchar(255) NOT NULL,
  default_flag tinyint(1) NOT NULL,
  sort_order int NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (id),
  KEY products_images_products_id (products_id)
);

DROP TABLE IF EXISTS osc_products_images_groups;
CREATE TABLE osc_products_images_groups (
  id int NOT NULL,
  language_id int NOT NULL,
  title varchar(255) not null,
  code varchar(255) not null,
  size_width int,
  size_height int,
  force_size tinyint(1) default 0,
  PRIMARY KEY (id, language_id)
);

DROP TABLE IF EXISTS osc_products_notifications;
CREATE TABLE osc_products_notifications (
  products_id int NOT NULL,
  customers_id int NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (products_id, customers_id)
);

DROP TABLE IF EXISTS osc_products_to_categories;
CREATE TABLE osc_products_to_categories (
  products_id int NOT NULL,
  categories_id int NOT NULL,
  PRIMARY KEY (products_id,categories_id)
);

DROP TABLE IF EXISTS osc_products_variants;
CREATE TABLE osc_products_variants (
  products_id INT UNSIGNED NOT NULL,
  products_variants_values_id INT UNSIGNED NOT NULL,
  default_combo TINYINT UNSIGNED DEFAULT 0,
  PRIMARY KEY (products_id, products_variants_values_id)
);

DROP TABLE IF EXISTS osc_products_variants_groups;
CREATE TABLE osc_products_variants_groups (
  id int NOT NULL auto_increment,
  languages_id int NOT NULL,
  title varchar(255) NOT NULL,
  sort_order int NOT NULL,
  module varchar(255) NOT NULL,
  PRIMARY KEY (id, languages_id)
);

DROP TABLE IF EXISTS osc_products_variants_values;
CREATE TABLE osc_products_variants_values (
  id int NOT NULL auto_increment,
  languages_id int NOT NULL,
  products_variants_groups_id int NOT NULL,
  title varchar(255) NOT NULL,
  sort_order int NOT NULL,
  PRIMARY KEY (id, languages_id),
  KEY idx_products_variants_values_groups_id (products_variants_groups_id)
);

DROP TABLE IF EXISTS osc_products_xsell;
CREATE TABLE osc_products_xsell (
  ID int NOT NULL auto_increment,
  products_id int unsigned DEFAULT '1' NOT NULL,
  products_xsell_id int unsigned DEFAULT '1' NOT NULL,
  sort_order int unsigned DEFAULT '1' NOT NULL,
  PRIMARY KEY  (ID)
);

DROP TABLE IF EXISTS osc_reviews;
CREATE TABLE osc_reviews (
  reviews_id int NOT NULL auto_increment,
  products_id int NOT NULL,
  customers_id int,
  customers_name varchar(255) NOT NULL,
  reviews_rating int,
  languages_id int NOT NULL,
  reviews_text text NOT NULL,
  date_added datetime,
  last_modified datetime,
  reviews_read int NOT NULL default '0',
  reviews_status tinyint(1) NOT NULL,
  PRIMARY KEY (reviews_id)
);

DROP TABLE IF EXISTS osc_sessions;
CREATE TABLE osc_sessions (
  id char(32) NOT NULL,
  expiry int unsigned NOT NULL,
  value text NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS osc_shipping_availability;
CREATE TABLE osc_shipping_availability (
  id INT UNSIGNED NOT NULL,
  languages_id INT UNSIGNED NOT NULL,
  title varchar(255) NOT NULL,
  css_key varchar(255),
  PRIMARY KEY (id, languages_id)
);

DROP TABLE IF EXISTS osc_shopping_carts;
CREATE TABLE osc_shopping_carts (
  customers_id INT UNSIGNED NOT NULL,
  item_id SMALLINT UNSIGNED NOT NULL,
  products_id INT UNSIGNED NOT NULL,
  quantity SMALLINT UNSIGNED NOT NULL,
  date_added DATETIME,
  KEY idx_sc_customers_id (customers_id),
  KEY idx_sc_customers_id_products_id (customers_id, products_id)
);

DROP TABLE IF EXISTS osc_shopping_carts_custom_variants_values;
CREATE TABLE osc_shopping_carts_custom_variants_values (
  shopping_carts_item_id SMALLINT UNSIGNED NOT NULL,
  customers_id INT UNSIGNED NOT NULL,
  products_id INT UNSIGNED NOT NULL,
  products_variants_values_id INT UNSIGNED NOT NULL,
  products_variants_values_text TEXT NOT NULL,
  KEY idx_sccvv_customers_id_products_id (customers_id, products_id)
);

DROP TABLE IF EXISTS osc_slide_images;
CREATE TABLE osc_slide_images (
  image_id int NOT NULL auto_increment,
  language_id int NOT NULL default '1',
  image varchar(255) NOT NULL,
  image_url varchar(255) NOT NULL,
  sort_order int default NULL,
  status int(1) NOT NULL default '1',
  PRIMARY KEY  (image_id,language_id)
);

DROP TABLE IF EXISTS osc_specials;
CREATE TABLE osc_specials (
  specials_id int NOT NULL auto_increment,
  products_id int NOT NULL,
  specials_new_products_price decimal(15,4) NOT NULL,
  specials_date_added datetime,
  specials_last_modified datetime,
  start_date datetime,
  expires_date datetime,
  date_status_change datetime,
  status int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (specials_id)
);

DROP TABLE IF EXISTS osc_tax_class;
CREATE TABLE osc_tax_class (
  tax_class_id int NOT NULL auto_increment,
  tax_class_title varchar(255) NOT NULL,
  tax_class_description varchar(255) NOT NULL,
  last_modified datetime NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (tax_class_id)
);

DROP TABLE IF EXISTS osc_tax_rates;
CREATE TABLE osc_tax_rates (
  tax_rates_id int NOT NULL auto_increment,
  tax_zone_id int NOT NULL,
  tax_class_id int NOT NULL,
  tax_priority int DEFAULT 1,
  tax_rate decimal(7,4) NOT NULL,
  tax_description varchar(255) NOT NULL,
  last_modified datetime NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (tax_rates_id)
);

DROP TABLE IF EXISTS osc_geo_zones;
CREATE TABLE osc_geo_zones (
  geo_zone_id int NOT NULL auto_increment,
  geo_zone_name varchar(255) NOT NULL,
  geo_zone_description varchar(255) NOT NULL,
  last_modified datetime NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (geo_zone_id)
);

DROP TABLE IF EXISTS osc_info;
CREATE TABLE osc_info (
  info_id int DEFAULT '0' NOT NULL,
  language_id int NOT NULL default '1',
  info_name varchar(255) not null,
  info_description text NOT NULL,
  active int NOT NULL default '0',
  date_added datetime default NULL,
  last_modified datetime default NULL,
  sort_order int NOT NULL default '0',
  PRIMARY KEY  (info_id,language_id)
);

DROP TABLE IF EXISTS osc_templates;
CREATE TABLE osc_templates (
  id int NOT NULL auto_increment,
  title varchar(255) not null,
  code varchar(255) not null,
  author_name varchar(255) not null,
  author_www varchar(255),
  markup_version varchar(255),
  css_based tinyint,
  medium varchar(255),
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS osc_templates_boxes;
CREATE TABLE osc_templates_boxes (
  id int NOT NULL auto_increment,
  title varchar(255) not null,
  code varchar(255) not null,
  author_name varchar(255) not null,
  author_www varchar(255),
  modules_group varchar(255) not null,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS osc_templates_boxes_to_pages;
CREATE TABLE osc_templates_boxes_to_pages (
  id int NOT NULL auto_increment,
  templates_boxes_id int not null,
  templates_id int not null,
  content_page varchar(255) not null,
  boxes_group varchar(32) not null,
  sort_order int default 0,
  page_specific int default 0,
  PRIMARY KEY (id),
  INDEX (templates_boxes_id, templates_id, content_page, boxes_group)
);

DROP TABLE IF EXISTS osc_weight_classes;
CREATE TABLE osc_weight_classes (
  weight_class_id int NOT NULL default '0',
  weight_class_key varchar(4) NOT NULL default '',
  language_id int NOT NULL default '0',
  weight_class_title varchar(255) NOT NULL default '',
  PRIMARY KEY (weight_class_id, language_id)
);

DROP TABLE IF EXISTS osc_weight_classes_rules;
CREATE TABLE osc_weight_classes_rules (
  weight_class_from_id int NOT NULL default '0',
  weight_class_to_id int NOT NULL default '0',
  weight_class_rule decimal(15,4) NOT NULL default '0.0000'
);
DROP TABLE IF EXISTS osc_whos_online;
CREATE TABLE osc_whos_online (
  customer_id int,
  full_name varchar(255) NOT NULL,
  session_id varchar(128) NOT NULL,
  ip_address varchar(15) NOT NULL,
  time_entry varchar(14) NOT NULL,
  time_last_click varchar(14) NOT NULL,
  last_page_url text NOT NULL
);

DROP TABLE IF EXISTS osc_zones;
CREATE TABLE osc_zones (
  zone_id int NOT NULL auto_increment,
  zone_country_id int NOT NULL,
  zone_code varchar(255) NOT NULL,
  zone_name varchar(255) NOT NULL,
  PRIMARY KEY (zone_id)
);

DROP TABLE IF EXISTS osc_zones_to_geo_zones;
CREATE TABLE osc_zones_to_geo_zones (
   association_id int NOT NULL auto_increment,
   zone_country_id int NOT NULL,
   zone_id int NULL,
   geo_zone_id int NULL,
   last_modified datetime NULL,
   date_added datetime NOT NULL,
   PRIMARY KEY (association_id)
);

DROP TABLE IF EXISTS osc_feature;
CREATE TABLE osc_feature (
   feature_id int(11) NOT NULL auto_increment,
   products_id int(11) NOT NULL,
   feature_date_added datetime default NULL,
   feature_last_modified datetime default NULL,
   start_date datetime default NULL,
   expires_date datetime default NULL,
   date_status_change datetime default NULL,
   status int(1) NOT NULL default '1',
   PRIMARY KEY  (feature_id)
);

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Название магазина', 'STORE_NAME', 'osCommerce', 'Название этого магазина', '1', '1', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Владелец магазина', 'STORE_OWNER', 'Владелец магазина', 'Имя владельца магазина', '1', '2', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('E-Mail адрес', 'STORE_OWNER_EMAIL_ADDRESS', 'root@localhost', 'E-Mail владельца этого магазина', '1', '3', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('E-Mail от', 'EMAIL_FROM', '"Владелец магазина" <root@localhost>', 'Этот E-Mail используется в отправленных E-Mail сообщениях', '1', '4', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Страна', 'STORE_COUNTRY', '176', 'Этот магазин расположен в стране <br /><br /><b>Примечание: пожалуйста, не забудьте обновить зону магазина.</b>', '1', '6', 'osC_Address::getCountryName', 'osc_cfg_set_countries_pulldown_menu', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Зона', 'STORE_ZONE', '2889', 'Этот магазин расположен в зоне', '1', '7', 'osC_Address::getZoneName', 'osc_cfg_set_zones_pulldown_menu', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Быстрая отправка сообщений о заказе', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Отправка оповещений о заказе по следующим E-Mail адресам, в таком формате: Имя 1 &lt;email@address1&gt;, Имя 2 &lt;email@address2&gt;', '1', '11', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Разрешить гостям рекомендации другу', 'ALLOW_GUEST_TO_TELL_A_FRIEND', '-1', 'Разрешить гостям рекомендовать другу товар', '1', '15', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Адрес магазина и телефон', 'STORE_NAME_ADDRESS', 'Название магазина\nАдрес\nСтрана\nТелефон', 'Эти название магазина, адрес и телефон будут использоваться при печати документов и отображаться на дисплее в онлайне', '1', '18', 'osc_cfg_set_textarea_field', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Десятичные знаки в налогах', 'TAX_DECIMAL_PLACES', '0', 'Укажите количество десятичных знаков в значениях налогов', '1', '20', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Отображать цену с налогом', 'DISPLAY_PRICE_WITH_TAX', '1', 'Отображать стоимость с учетом налога (верно) или указывать налог отдельно в конце (не верно)', '1', '21', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Выключить магазин на обслуживание', 'MAINTENANCE_MODE', '-1', 'Вы хотите выключить магазин на обслуживание?', 1, 22, now(), 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))');

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Имя владельца кредитной карты', 'CC_OWNER_MIN_LENGTH', '3', 'Минимальное количество символов в имени владельца кредитной карты', '2', '12', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Номер кредитной карты', 'CC_NUMBER_MIN_LENGTH', '10', 'Минимальное количество знаков в номере кредитной карты', '2', '13', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Текст отзывов', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Минимальное количество знаков в тексте отзывов', '2', '14', now());

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Записи адресной книги', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Максимум записей в адресной книге клиента', '3', '1', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Результаты поиска', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Количество товаров в листинге', '3', '2', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Ссылки страниц', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Количество \'чисел\' в линках, используемых для переключения страниц', '3', '3', now());

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Категории в строке', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'Количество категорий, отображаемых в строке', '3', '13', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Листинг новых товаров', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Максимальное количество новых товаров, отображаемых на главной странице', '3', '14', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('История заказов', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Максимальное количество заказов, отображаемых на странице истории заказов', '3', '18', now());

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Ширина основного изображения категорий в пикселях', 'HEADING_IMAGE_WIDTH', '90', 'Ширина основного изображения в пикселях', '4', '3', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Высота основного изображения категорий в пикселях', 'HEADING_IMAGE_HEIGHT', '80', 'Высота основного изображения в пикселях', '4', '4', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Необходимое изображение', 'IMAGE_REQUIRED', '1', 'Включите эту функцию для принудительного отображения испорченных изображений. Удобно для отладки.', '4', '5', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Высота изображения иконок в пикселях', 'HEADING_IMAGE_HEIGHT_ICON', '30', 'Высота изображения в пикселях', '4', '6', now());

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Пол', 'ACCOUNT_GENDER', '1', 'Установить относительно или обязательно пол клиента.', '5', '10', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, 0, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Имя', 'ACCOUNT_FIRST_NAME', '2', 'Минимальное количество знаков для имени клиента.', '5', '11', 'osc_cfg_set_boolean_value(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\'))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Фамилия', 'ACCOUNT_LAST_NAME', '2', 'Минимальное количество знаков для фамилии клиента.', '5', '12', 'osc_cfg_set_boolean_value(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\'))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Дата рождения', 'ACCOUNT_DATE_OF_BIRTH', '1', 'Спрашивать дату рождения клиента.', '5', '13', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('E-Mail адрес', 'ACCOUNT_EMAIL_ADDRESS', '6', 'Минимальное количество знаков для E-mail адреса клиента.', '5', '14', 'osc_cfg_set_boolean_value(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\'))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Пароль', 'ACCOUNT_PASSWORD', '5', 'Минимальное количество знаков для пароля клиента.', '5', '15', 'osc_cfg_set_boolean_value(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\'))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Новостная рассылка', 'ACCOUNT_NEWSLETTER', '1', 'Спрашивать подписку на новости.', '5', '16', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Название компании', 'ACCOUNT_COMPANY', '0', 'Установить относительно или обязательно название компании.', '5', '17', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(\'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\', 0, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Почтовый адрес', 'ACCOUNT_STREET_ADDRESS', '5', 'Минимальное количество знаков для почтового адреса клиента.', '5', '18', 'osc_cfg_set_boolean_value(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\'))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Район/Микрорайон', 'ACCOUNT_SUBURB', '0', 'Установить относительно или обязательно Район/Микрорайон клиента.', '5', '19', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(\'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\', 0, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Почтовый индекс', 'ACCOUNT_POST_CODE', '0', 'Минимальное количество знаков для почтового индекса клиента.', '5', '20', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(-1, 0, \'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\'))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Город/Поселок', 'ACCOUNT_CITY', '4', 'Минимальное количество знаков для Города/Поселка клиента.', '5', '21', 'osc_cfg_set_boolean_value(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\'))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Регион', 'ACCOUNT_STATE', '2', 'Установить относительно или обязательно Регион клиента.', '5', '22', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(\'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\', 0, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Страна', 'ACCOUNT_COUNTRY', '1', 'Спрашивать страну клиента.', '5', '23', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Номер телефона', 'ACCOUNT_TELEPHONE', '3', 'Установить относительно или обязательно номер телефона клиента.', '5', '24', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(\'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\', 0, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Номер факса', 'ACCOUNT_FAX', '0', 'Установить относительно или обязательно номер факса клиента.', '5', '25', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(\'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\', 0, -1))', now());

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Валюта по умолчанию', 'DEFAULT_CURRENCY', 'RUB', 'Валюта по умолчанию', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Язык по умолчанию', 'DEFAULT_LANGUAGE', 'ru_RU', 'Язык по умолчанию', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Статус заказа по умолчанию для нового заказа', 'DEFAULT_ORDERS_STATUS_ID', '1', 'При создании нового заказа будет назначаться этот статус.', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Группа изображений по умолчанию', 'DEFAULT_IMAGE_GROUP_ID', '2', 'Группа изображений по умолчанию.', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Шаблон по умолчанию', 'DEFAULT_TEMPLATE', 'richer_designs', 'Шаблон по умолчанию', '6', '0', now());

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Страна происхождения', 'SHIPPING_ORIGIN_COUNTRY', '176', 'Выберите страну местонахождения магазина, используемую для указания при доставке.', '7', '1', 'osC_Address::getCountryName', 'osc_cfg_set_countries_pulldown_menu', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Почтовый индекс', 'SHIPPING_ORIGIN_ZIP', 'Не установлен', 'Введите почтовый индекс (ZIP) магазина, используемый для указания при доставке.', '7', '2', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Введите максимальный вес груза, который Вы отправляете', 'SHIPPING_MAX_WEIGHT', '50', 'Курьерские службы имеют предел максимального веса для одного товара. Это будет общим значением для всех служб.', '7', '3', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Вес упаковки товара', 'SHIPPING_BOX_WEIGHT', '3', 'Каков типичный вес от маленьких до средних  упаковок?', '7', '4', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Большие упаковки - увеличение процента', 'SHIPPING_BOX_PADDING', '10', 'Для 10% введите 10', '7', '5', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Типичная упаковочная единица', 'SHIPPING_WEIGHT_UNIT',2, 'Введите единицу веса, используемую при отгрузке.', '7', '6', 'osC_Weight::getTitle', 'osc_cfg_set_weight_classes_pulldown_menu', now());

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Отображать изображение товара', 'PRODUCT_LIST_IMAGE', '1', 'Вы хотите отображать изображение товара?', '8', '1', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Отображать название производителя товара','PRODUCT_LIST_MANUFACTURER', '0', 'Вы хотите отображать название производителя товара?', '8', '2', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Отображать модель товара', 'PRODUCT_LIST_MODEL', '0', 'Вы хотите отображать модель товара?', '8', '3', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Отображать название товара', 'PRODUCT_LIST_NAME', '2', 'Вы хотите отображать название товара?', '8', '4', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Отображать стоимость товара', 'PRODUCT_LIST_PRICE', '3', 'Вы хотите отображать стоимость товара?', '8', '5', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Отображать количество товара', 'PRODUCT_LIST_QUANTITY', '0', 'Вы хотите отображать количество товара?', '8', '6', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Отображать вес товара', 'PRODUCT_LIST_WEIGHT', '0', 'Вы хотите отображать вес товара?', '8', '7', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Отображать колонку Купить', 'PRODUCT_LIST_BUY_NOW', '4', 'Вы хотите отображать колонку Купить?', '8', '8', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Отображать фильтр Категории/Производители (0=отключить; 1=включить)', 'PRODUCT_LIST_FILTER', '1', 'Вы хотите отображать фильтр Категории/Производители?', '8', '9', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Указывать навигационный бар Назад/Вперед (1-Сверху, 2-Снизу, 3-Оба)', 'PREV_NEXT_BAR_LOCATION', '2', 'Установить положение навигационного бара Назад/Вперед (1-Сверху, 2-Снизу, 3-Оба)', '8', '10', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Вид листинга товаров (0=таблицей; 1=колонками)', 'PRODUCTS_LIST_GRID', '0', 'Выберите внешний вид листинга товаров.', '8', '11', now());

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Проверка уровня складских запасов', 'STOCK_CHECK', '1', 'Укажите, чтобы видеть доступен ли складской запас', '9', '1', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Вычитать складские запасы', 'STOCK_LIMITED', '1', 'Вычитать товар со склада в соответствии с произведенными заказами', '9', '2', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Разрешить оплату', 'STOCK_ALLOW_CHECKOUT', '1', 'Разрешить клиенту оплачивать, даже если на складе недостаточно запаса товара', '9', '3', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Маркировать товар, испытывающий недостаток на складе', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Укажите что нибудь, чтобы клиент мог это видеть при недостаточном запасе товара на складе', '9', '4', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Уровень складского запаса для перезаказа', 'STOCK_REORDER_LEVEL', '5', 'Определите запас на складе, при котором нужно повторно перезаказывать', '9', '5', now());

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('E-Mail Transport Method', 'EMAIL_TRANSPORT', 'sendmail', 'Использовать сервером локальное соединение для E-Mail или использовать SMTP через TCP/IP. Серверы под Win и Mac должны сделать эти установки для SMTP', '12', '1', 'osc_cfg_set_boolean_value(array(\'sendmail\', \'smtp\'))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Определяет знаковую последовательность, используемую при сепарации заголовков E-mail.', '12', '2', 'osc_cfg_set_boolean_value(array(\'LF\', \'CRLF\'))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Использовать MIME HTML для отправки E-mail', 'EMAIL_USE_HTML', '-1', 'Отправлять E-mail в HTML формате', '12', '3', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Проверить E-Mail адрес через DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', '-1', 'Проверить E-mail адрес через DNS сервер', '12', '4', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Отправлять E-Mail', 'SEND_EMAILS', '1', 'Отправлять исходящие E-Mail', '12', '5', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Подтверждение условий по использованию в процессе процедуры оплаты', 'DISPLAY_CONDITIONS_ON_CHECKOUT', '-1', 'Показать условия по использованию, на которые должен согласиться клиент в процессе процедуры оплаты.', '16', '1', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Подтверждение условий по конфиденциальности в процессе создания аккаунта', 'DISPLAY_PRIVACY_CONDITIONS', '-1', 'Показать условия по конфиденциальности при создании аккаунта, на которые должен согласиться клиент.', '16', '2', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Сверять с образцами значений карт', 'CFG_CREDIT_CARDS_VERIFY_WITH_REGEXP', '1', 'Сверить номера кредитной карты с образцами значений, находящимися на сервере.', '17', '0', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Подтверждать с Javascript', 'CFG_CREDIT_CARDS_VERIFY_WITH_JS', '1', 'Подтвердить номера кредитных карт с использованием javascript базы образцов значений.', '17', '1', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Включить закачку', 'DOWNLOAD_ENABLED', '-1', 'Включить функцию закачки товаров.', '13', '1', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Закачка по редиректу', 'DOWNLOAD_BY_REDIRECT', '-1', 'Использовать редирект браузера для закачки. Отключить в не-Unix системах.', '13', '2', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Задержка до истечения срока закачки (дней)' ,'DOWNLOAD_MAX_DAYS', '7', 'Установить количество дней до истечения срока закачки. 0 - без лимита.', '13', '3', '', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Максимальное количество закачек' ,'DOWNLOAD_MAX_COUNT', '5', 'Установить максимальное количество закачек. 0 - без ограничений.', '13', '4', '', now());

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('GZIP', 'CFG_APP_GZIP', '/usr/bin/gzip', 'Программный путь к gzip.', '18', '1', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('GUNZIP', 'CFG_APP_GUNZIP', '/usr/bin/gunzip', 'Программный путь к gunzip.', '18', '2', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('ZIP', 'CFG_APP_ZIP', '/usr/bin/zip', 'Программный путь к zip.', '18', '3', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('UNZIP', 'CFG_APP_UNZIP', '/usr/bin/unzip', 'Программный путь к unzip.', '18', '4', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('cURL', 'CFG_APP_CURL', '/usr/bin/curl', 'Программный путь к cURL.', '18', '5', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('ImageMagick "convert"', 'CFG_APP_IMAGEMAGICK_CONVERT', '/usr/bin/convert', 'Программный путь к ImageMagicks "convert" для использования при манипуляциях с изображениями.', '18', '6', now());

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Размер листинга страницы', 'MAX_DISPLAY_CMS_ARTICLES', '5', 'Количество статей, отображаемых на странице.', 6, 0, now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Размер листинга бокса', 'BOX_CMS_LIST_SIZE', '5', 'Количество статей, отображаемых в боксе.', 6, 0, now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Отображать статьи в топике', 'MODULE_CONTENT_ARTICLES_TOPIC_DISPLAY', '-1', 'Вы хотите отображать статьи в топике?', 6, 0, now(), 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Интервал', 'MODULE_CONTENT_SLIDE_SHOW_INTERVAL', '5000', 'Интервал слайд-шоу (ms)', 6, 0, now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Скорость', 'MODULE_CONTENT_SLIDE_SHOW_DURATION', '1000', 'Скорость движения картинок слайд-шоу (ms)', 6, 0, now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Высота изображения', 'MODULE_CONTENT_SLIDE_SHOW_HEIGHT', '210', 'Высота изображения (px)', 6, 0, now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Ширина изображения', 'MODULE_CONTENT_SLIDE_SHOW_WIDTH', '960', 'Ширина изображения (px)', 6, 0, now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, set_function) VALUES ('Способ слайд-шоу', 'MODULE_CONTENT_SLIDE_SHOW_MODE', 'random', 'Способ слайд-шоу', 6, 0, now(), 'osc_cfg_set_boolean_value(array(''random'', ''scrollUp'', ''scrollDown'', ''scrollLeft'', ''scrollRight'', ''fade'', ''growX'', ''growY'', ''zoom'', ''zoomFade'', ''zoomTL'', ''zoomBR''))');
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Корзина в листинге новых товаров', 'NEW_PRODUCTS_CART', '-1', 'Вы хотите использовать корзину в листинге новых товаров?', 9, 11, now(), 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))');

INSERT INTO osc_configuration_group VALUES ('1', 'Мой магазин', 'Общая информация о моем магазине', '1', '1');
INSERT INTO osc_configuration_group VALUES ('2', 'Минимальные значения', 'Минимальное значение для функций / данных', '2', '1');
INSERT INTO osc_configuration_group VALUES ('3', 'Максимальные значения', 'Максимальное значение для функций / данных', '3', '1');
INSERT INTO osc_configuration_group VALUES ('4', 'Изображения', 'Параметры изображений', '4', '1');
INSERT INTO osc_configuration_group VALUES ('5', 'Настройки клиентов', 'Конфигурации аккаунтов клиентов', '5', '1');
INSERT INTO osc_configuration_group VALUES ('6', 'Настройки модулей', 'Скрытые настройки', '6', '0');
INSERT INTO osc_configuration_group VALUES ('7', 'Доставка/Упаковка', 'Опции доставки, доступные в моем магазине', '7', '1');
INSERT INTO osc_configuration_group VALUES ('8', 'Листинг товаров', 'Опции конфигурации листинга товаров', '8', '1');
INSERT INTO osc_configuration_group VALUES ('9', 'Продажа', 'Опции конфигурации продаж', '9', '1');
INSERT INTO osc_configuration_group VALUES ('12', 'E-Mail опции', 'Общие установки E-Mail доставки и HTML E-Mail', '12', '1');
INSERT INTO osc_configuration_group VALUES ('13', 'Закачки', 'Опции закачек товаров', '13', '1');
INSERT INTO osc_configuration_group VALUES ('16', 'Инструкции', 'Опции инструкций', '16', '1');
INSERT INTO osc_configuration_group VALUES ('17', 'Кредитные карты', 'Опции кредитных карт', '17', '1');
INSERT INTO osc_configuration_group VALUES ('18', 'Расположения программ', 'Пути к определенным программам на сервере.', '18', '1');

INSERT INTO osc_countries VALUES (1,'Afghanistan','AF','AFG','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'BDS','بد خشان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'BDG','بادغیس');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'BGL','بغلان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'BAL','بلخ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'BAM','بامیان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'DAY','دایکندی');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'FRA','فراه');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'FYB','فارياب');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'GHA','غزنى');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'GHO','غور');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'HEL','هلمند');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'HER','هرات');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'JOW','جوزجان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'KAB','کابل');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'KAN','قندھار');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'KAP','کاپيسا');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'KHO','خوست');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'KNR','کُنَر');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'KDZ','كندوز');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'LAG','لغمان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'LOW','لوګر');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'NAN','ننگرهار');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'NIM','نیمروز');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'NUR','نورستان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'ORU','ؤروزگان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'PIA','پکتیا');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'PKA','پکتيکا');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'PAN','پنج شیر');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'PAR','پروان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'SAM','سمنگان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'SAR','سر پل');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'TAK','تخار');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'WAR','وردک');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'ZAB','زابل');

INSERT INTO osc_countries VALUES (2,'Albania','AL','ALB','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'BR','Beratit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'BU','Bulqizës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'DI','Dibrës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'DL','Delvinës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'DR','Durrësit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'DV','Devollit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'EL','Elbasanit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'ER','Kolonjës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'FR','Fierit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'GJ','Gjirokastrës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'GR','Gramshit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'HA','Hasit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'KA','Kavajës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'KB','Kurbinit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'KC','Kuçovës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'KO','Korçës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'KR','Krujës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'KU','Kukësit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'LB','Librazhdit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'LE','Lezhës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'LU','Lushnjës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'MK','Mallakastrës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'MM','Malësisë së Madhe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'MR','Mirditës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'MT','Matit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'PG','Pogradecit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'PQ','Peqinit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'PR','Përmetit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'PU','Pukës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'SH','Shkodrës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'SK','Skraparit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'SR','Sarandës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'TE','Tepelenës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'TP','Tropojës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'TR','Tiranës');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'VL','Vlorës');

INSERT INTO osc_countries VALUES (3,'Algeria','DZ','DZA','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'01','ولاية أدرار');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'02','ولاية الشلف');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'03','ولاية الأغواط');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'04','ولاية أم البواقي');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'05','ولاية باتنة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'06','ولاية بجاية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'07','ولاية بسكرة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'08','ولاية بشار');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'09','البليدة‎');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'10','ولاية البويرة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'11','ولاية تمنراست');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'12','ولاية تبسة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'13','تلمسان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'14','ولاية تيارت');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'15','تيزي وزو');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'16','ولاية الجزائر');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'17','ولاية عين الدفلى');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'18','ولاية جيجل');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'19','ولاية سطيف');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'20','ولاية سعيدة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'21','السكيكدة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'22','ولاية سيدي بلعباس');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'23','ولاية عنابة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'24','ولاية قالمة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'25','قسنطينة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'26','ولاية المدية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'27','ولاية مستغانم');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'28','ولاية المسيلة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'29','ولاية معسكر');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'30','ورقلة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'31','وهران');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'32','ولاية البيض');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'33','ولاية اليزي');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'34','ولاية برج بوعريريج');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'35','ولاية بومرداس');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'36','ولاية الطارف');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'37','تندوف');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'38','ولاية تسمسيلت');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'39','ولاية الوادي');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'40','ولاية خنشلة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'41','ولاية سوق أهراس');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'42','ولاية تيبازة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'43','ولاية ميلة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'44','ولاية عين الدفلى');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'45','ولاية النعامة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'46','ولاية عين تموشنت');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'47','ولاية غرداية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'48','ولاية غليزان');

INSERT INTO osc_countries VALUES (4,'American Samoa','AS','ASM','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (4,'EA','Eastern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (4,'MA','Manu\'a');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (4,'RI','Rose Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (4,'SI','Swains Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (4,'WE','Western');

INSERT INTO osc_countries VALUES (5,'Andorra','AD','AND','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (5,'AN','Andorra la Vella');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (5,'CA','Canillo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (5,'EN','Encamp');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (5,'LE','Escaldes-Engordany');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (5,'LM','La Massana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (5,'OR','Ordino');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (5,'SJ','Sant Juliá de Lória');

INSERT INTO osc_countries VALUES (6,'Angola','AO','AGO','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'BGO','Bengo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'BGU','Benguela');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'BIE','Bié');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'CAB','Cabinda');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'CCU','Cuando Cubango');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'CNO','Cuanza Norte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'CUS','Cuanza Sul');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'CNN','Cunene');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'HUA','Huambo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'HUI','Huíla');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'LUA','Luanda');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'LNO','Lunda Norte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'LSU','Lunda Sul');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'MAL','Malanje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'MOX','Moxico');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'NAM','Namibe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'UIG','Uíge');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'ZAI','Zaire');

INSERT INTO osc_countries VALUES (7,'Anguilla','AI','AIA','');
INSERT INTO osc_countries VALUES (8,'Antarctica','AQ','ATA','');

INSERT INTO osc_countries VALUES (9,'Antigua and Barbuda','AG','ATG','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (9,'BAR','Barbuda');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (9,'SGE','Saint George');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (9,'SJO','Saint John');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (9,'SMA','Saint Mary');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (9,'SPA','Saint Paul');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (9,'SPE','Saint Peter');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (9,'SPH','Saint Philip');

INSERT INTO osc_countries VALUES (10,'Argentina','AR','ARG',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'A','Salta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'B','Buenos Aires Province');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'C','Capital Federal');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'D','San Luis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'E','Entre Ríos');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'F','La Rioja');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'G','Santiago del Estero');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'H','Chaco');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'J','San Juan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'K','Catamarca');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'L','La Pampa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'M','Mendoza');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'N','Misiones');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'P','Formosa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'Q','Neuquén');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'R','Río Negro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'S','Santa Fe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'T','Tucumán');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'U','Chubut');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'V','Tierra del Fuego');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'W','Corrientes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'X','Córdoba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'Y','Jujuy');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'Z','Santa Cruz');

INSERT INTO osc_countries VALUES (11,'Armenia','AM','ARM','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'AG','Արագածոտն');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'AR','Արարատ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'AV','Արմավիր');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'ER','Երևան');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'GR','Գեղարքունիք');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'KT','Կոտայք');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'LO','Լոռի');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'SH','Շիրակ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'SU','Սյունիք');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'TV','Տավուշ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'VD','Վայոց Ձոր');

INSERT INTO osc_countries VALUES (12,'Aruba','AW','ABW','');

INSERT INTO osc_countries VALUES (13,'Australia','AU','AUS',":name\n:street_address\n:suburb :state_code :postcode\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (13,'ACT','Australian Capital Territory');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (13,'NSW','New South Wales');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (13,'NT','Northern Territory');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (13,'QLD','Queensland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (13,'SA','South Australia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (13,'TAS','Tasmania');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (13,'VIC','Victoria');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (13,'WA','Western Australia');

INSERT INTO osc_countries VALUES (14,'Austria','AT','AUT',":name\n:street_address\nA-:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'1','Burgenland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'2','Kärnten');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'3','Niederösterreich');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'4','Oberösterreich');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'5','Salzburg');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'6','Steiermark');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'7','Tirol');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'8','Voralberg');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'9','Wien');

INSERT INTO osc_countries VALUES (15,'Azerbaijan','AZ','AZE','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'AB','Əli Bayramlı');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'ABS','Abşeron');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'AGC','Ağcabədi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'AGM','Ağdam');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'AGS','Ağdaş');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'AGA','Ağstafa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'AGU','Ağsu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'AST','Astara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'BA','Bakı');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'BAB','Babək');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'BAL','Balakən');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'BAR','Bərdə');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'BEY','Beyləqan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'BIL','Biləsuvar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'CAB','Cəbrayıl');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'CAL','Cəlilabab');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'CUL','Julfa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'DAS','Daşkəsən');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'DAV','Dəvəçi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'FUZ','Füzuli');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'GA','Gəncə');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'GAD','Gədəbəy');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'GOR','Goranboy');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'GOY','Göyçay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'HAC','Hacıqabul');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'IMI','İmişli');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'ISM','İsmayıllı');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'KAL','Kəlbəcər');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'KUR','Kürdəmir');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'LA','Lənkəran');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'LAC','Laçın');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'LAN','Lənkəran');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'LER','Lerik');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'MAS','Masallı');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'MI','Mingəçevir');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'NA','Naftalan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'NEF','Neftçala');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'OGU','Oğuz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'ORD','Ordubad');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'QAB','Qəbələ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'QAX','Qax');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'QAZ','Qazax');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'QOB','Qobustan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'QBA','Quba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'QBI','Qubadlı');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'QUS','Qusar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SA','Şəki');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SAT','Saatlı');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SAB','Sabirabad');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SAD','Sədərək');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SAH','Şahbuz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SAK','Şəki');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SAL','Salyan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SM','Sumqayıt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SMI','Şamaxı');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SKR','Şəmkir');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SMX','Samux');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SAR','Şərur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SIY','Siyəzən');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SS','Şuşa (City)');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SUS','Şuşa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'TAR','Tərtər');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'TOV','Tovuz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'UCA','Ucar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'XA','Xankəndi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'XAC','Xaçmaz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'XAN','Xanlar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'XIZ','Xızı');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'XCI','Xocalı');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'XVD','Xocavənd');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'YAR','Yardımlı');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'YE','Yevlax (City)');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'YEV','Yevlax');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'ZAN','Zəngilan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'ZAQ','Zaqatala');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'ZAR','Zərdab');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'NX','Nakhichevan');

INSERT INTO osc_countries VALUES (16,'Bahamas','BS','BHS','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'AC','Acklins and Crooked Islands');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'BI','Bimini');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'CI','Cat Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'EX','Exuma');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'FR','Freeport');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'FC','Fresh Creek');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'GH','Governor\'s Harbour');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'GT','Green Turtle Cay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'HI','Harbour Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'HR','High Rock');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'IN','Inagua');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'KB','Kemps Bay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'LI','Long Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'MH','Marsh Harbour');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'MA','Mayaguana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'NP','New Providence');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'NT','Nicholls Town and Berry Islands');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'RI','Ragged Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'RS','Rock Sound');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'SS','San Salvador and Rum Cay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'SP','Sandy Point');

INSERT INTO osc_countries VALUES (17,'Bahrain','BH','BHR','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'01','الحد');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'02','المحرق');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'03','المنامة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'04','جد حفص');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'05','المنطقة الشمالية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'06','سترة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'07','المنطقة الوسطى');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'08','مدينة عيسى');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'09','الرفاع والمنطقة الجنوبية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'10','المنطقة الغربية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'11','جزر حوار');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'12','مدينة حمد');

INSERT INTO osc_countries VALUES (18,'Bangladesh','BD','BGD','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'01','Bandarban');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'02','Barguna');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'03','Bogra');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'04','Brahmanbaria');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'05','Bagerhat');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'06','Barisal');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'07','Bhola');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'08','Comilla');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'09','Chandpur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'10','Chittagong');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'11','Cox\'s Bazar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'12','Chuadanga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'13','Dhaka');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'14','Dinajpur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'15','Faridpur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'16','Feni');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'17','Gopalganj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'18','Gazipur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'19','Gaibandha');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'20','Habiganj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'21','Jamalpur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'22','Jessore');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'23','Jhenaidah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'24','Jaipurhat');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'25','Jhalakati');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'26','Kishoreganj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'27','Khulna');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'28','Kurigram');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'29','Khagrachari');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'30','Kushtia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'31','Lakshmipur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'32','Lalmonirhat');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'33','Manikganj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'34','Mymensingh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'35','Munshiganj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'36','Madaripur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'37','Magura');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'38','Moulvibazar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'39','Meherpur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'40','Narayanganj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'41','Netrakona');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'42','Narsingdi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'43','Narail');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'44','Natore');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'45','Nawabganj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'46','Nilphamari');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'47','Noakhali');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'48','Naogaon');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'49','Pabna');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'50','Pirojpur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'51','Patuakhali');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'52','Panchagarh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'53','Rajbari');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'54','Rajshahi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'55','Rangpur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'56','Rangamati');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'57','Sherpur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'58','Satkhira');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'59','Sirajganj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'60','Sylhet');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'61','Sunamganj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'62','Shariatpur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'63','Tangail');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'64','Thakurgaon');

INSERT INTO osc_countries VALUES (19,'Barbados','BB','BRB','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'A','Saint Andrew');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'C','Christ Church');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'E','Saint Peter');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'G','Saint George');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'J','Saint John');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'L','Saint Lucy');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'M','Saint Michael');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'O','Saint Joseph');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'P','Saint Philip');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'S','Saint James');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'T','Saint Thomas');

INSERT INTO osc_countries VALUES (20,'Belarus','BY','BLR','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (20,'BR','Брэсцкая вобласць');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (20,'HO','Гомельская вобласць');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (20,'HR','Гродзенская вобласць');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (20,'MA','Магілёўская вобласць');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (20,'MI','Мінская вобласць');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (20,'VI','Віцебская вобласць');

INSERT INTO osc_countries VALUES (21,'Belgium','BE','BEL',":name\n:street_address\nB-:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'BRU','Brussel');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'VAN','Antwerpen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'VBR','Vlaams-Brabant');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'VLI','Limburg');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'VOV','Oost-Vlaanderen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'VWV','West-Vlaanderen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'WBR','Brabant Wallon');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'WHT','Hainaut');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'WLG','Liège/Lüttich');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'WLX','Luxembourg');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'WNA','Namur');

INSERT INTO osc_countries VALUES (22,'Belize','BZ','BLZ','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (22,'BZ','Belize District');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (22,'CY','Cayo District');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (22,'CZL','Corozal District');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (22,'OW','Orange Walk District');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (22,'SC','Stann Creek District');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (22,'TOL','Toledo District');

INSERT INTO osc_countries VALUES (23,'Benin','BJ','BEN','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'AL','Alibori');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'AK','Atakora');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'AQ','Atlantique');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'BO','Borgou');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'CO','Collines');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'DO','Donga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'KO','Kouffo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'LI','Littoral');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'MO','Mono');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'OU','Ouémé');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'PL','Plateau');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'ZO','Zou');

INSERT INTO osc_countries VALUES (24,'Bermuda','BM','BMU','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'DEV','Devonshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'HA','Hamilton City');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'HAM','Hamilton');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'PAG','Paget');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'PEM','Pembroke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'SAN','Sandys');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'SG','Saint George City');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'SGE','Saint George\'s');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'SMI','Smiths');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'SOU','Southampton');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'WAR','Warwick');

INSERT INTO osc_countries VALUES (25,'Bhutan','BT','BTN','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'11','Paro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'12','Chukha');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'13','Haa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'14','Samtse');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'15','Thimphu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'21','Tsirang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'22','Dagana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'23','Punakha');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'24','Wangdue Phodrang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'31','Sarpang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'32','Trongsa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'33','Bumthang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'34','Zhemgang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'41','Trashigang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'42','Mongar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'43','Pemagatshel');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'44','Luentse');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'45','Samdrup Jongkhar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'GA','Gasa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'TY','Trashiyangse');

INSERT INTO osc_countries VALUES (26,'Bolivia','BO','BOL','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'B','El Beni');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'C','Cochabamba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'H','Chuquisaca');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'L','La Paz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'N','Pando');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'O','Oruro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'P','Potosí');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'S','Santa Cruz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'T','Tarija');

INSERT INTO osc_countries VALUES (27,'Bosnia and Herzegowina','BA','BIH','');
INSERT INTO osc_countries VALUES (28,'Botswana','BW','BWA','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'CE','Central');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'GH','Ghanzi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'KG','Kgalagadi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'KL','Kgatleng');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'KW','Kweneng');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'NE','North-East');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'NW','North-West');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'SE','South-East');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'SO','Southern');

INSERT INTO osc_countries VALUES (29,'Bouvet Island','BV','BVT','');

INSERT INTO osc_countries VALUES (30,'Brazil','BR','BRA',":name\n:street_address\n:state\n:postcode\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'AC','Acre');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'AL','Alagoas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'AM','Amazônia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'AP','Amapá');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'BA','Bahia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'CE','Ceará');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'DF','Distrito Federal');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'ES','Espírito Santo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'GO','Goiás');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'MA','Maranhão');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'MG','Minas Gerais');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'MS','Mato Grosso do Sul');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'MT','Mato Grosso');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'PA','Pará');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'PB','Paraíba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'PE','Pernambuco');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'PI','Piauí');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'PR','Paraná');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'RJ','Rio de Janeiro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'RN','Rio Grande do Norte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'RO','Rondônia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'RR','Roraima');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'RS','Rio Grande do Sul');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'SC','Santa Catarina');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'SE','Sergipe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'SP','São Paulo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'TO','Tocantins');

INSERT INTO osc_countries VALUES (31,'British Indian Ocean Territory','IO','IOT','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (31,'PB','Peros Banhos');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (31,'SI','Salomon Islands');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (31,'NI','Nelsons Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (31,'TB','Three Brothers');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (31,'EA','Eagle Islands');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (31,'DI','Danger Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (31,'EG','Egmont Islands');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (31,'DG','Diego Garcia');

INSERT INTO osc_countries VALUES (32,'Brunei Darussalam','BN','BRN','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (32,'BE','Belait');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (32,'BM','Brunei-Muara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (32,'TE','Temburong');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (32,'TU','Tutong');

INSERT INTO osc_countries VALUES (33,'Bulgaria','BG','BGR','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'01','Blagoevgrad');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'02','Burgas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'03','Varna');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'04','Veliko Tarnovo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'05','Vidin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'06','Vratsa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'07','Gabrovo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'08','Dobrich');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'09','Kardzhali');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'10','Kyustendil');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'11','Lovech');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'12','Montana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'13','Pazardzhik');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'14','Pernik');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'15','Pleven');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'16','Plovdiv');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'17','Razgrad');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'18','Ruse');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'19','Silistra');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'20','Sliven');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'21','Smolyan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'23','Sofia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'22','Sofia Province');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'24','Stara Zagora');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'25','Targovishte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'26','Haskovo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'27','Shumen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'28','Yambol');

INSERT INTO osc_countries VALUES (34,'Burkina Faso','BF','BFA','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'BAL','Balé');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'BAM','Bam');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'BAN','Banwa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'BAZ','Bazèga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'BGR','Bougouriba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'BLG','Boulgou');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'BLK','Boulkiemdé');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'COM','Komoé');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'GAN','Ganzourgou');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'GNA','Gnagna');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'GOU','Gourma');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'HOU','Houet');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'IOB','Ioba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'KAD','Kadiogo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'KEN','Kénédougou');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'KMD','Komondjari');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'KMP','Kompienga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'KOP','Koulpélogo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'KOS','Kossi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'KOT','Kouritenga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'KOW','Kourwéogo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'LER','Léraba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'LOR','Loroum');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'MOU','Mouhoun');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'NAM','Namentenga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'NAO','Naouri');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'NAY','Nayala');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'NOU','Noumbiel');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'OUB','Oubritenga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'OUD','Oudalan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'PAS','Passoré');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'PON','Poni');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'SEN','Séno');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'SIS','Sissili');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'SMT','Sanmatenga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'SNG','Sanguié');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'SOM','Soum');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'SOR','Sourou');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'TAP','Tapoa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'TUI','Tui');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'YAG','Yagha');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'YAT','Yatenga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'ZIR','Ziro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'ZON','Zondoma');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'ZOU','Zoundwéogo');

INSERT INTO osc_countries VALUES (35,'Burundi','BI','BDI','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'BB','Bubanza');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'BJ','Bujumbura Mairie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'BR','Bururi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'CA','Cankuzo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'CI','Cibitoke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'GI','Gitega');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'KR','Karuzi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'KY','Kayanza');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'KI','Kirundo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'MA','Makamba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'MU','Muramvya');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'MY','Muyinga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'MW','Mwaro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'NG','Ngozi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'RT','Rutana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'RY','Ruyigi');

INSERT INTO osc_countries VALUES (36,'Cambodia','KH','KHM','');

INSERT INTO osc_countries VALUES (37,'Cameroon','CM','CMR','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'AD','Adamaoua');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'CE','Centre');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'EN','Extrême-Nord');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'ES','Est');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'LT','Littoral');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'NO','Nord');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'NW','Nord-Ouest');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'OU','Ouest');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'SU','Sud');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'SW','Sud-Ouest');

INSERT INTO osc_countries VALUES (38,'Canada','CA','CAN',":name\n:street_address\n:city :state_code :postcode\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'AB','Alberta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'BC','British Columbia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'MB','Manitoba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'NB','New Brunswick');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'NL','Newfoundland and Labrador');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'NS','Nova Scotia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'NT','Northwest Territories');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'NU','Nunavut');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'ON','Ontario');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'PE','Prince Edward Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'QC','Quebec');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'SK','Saskatchewan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'YT','Yukon Territory');

INSERT INTO osc_countries VALUES (39,'Cape Verde','CV','CPV','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'BR','Brava');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'BV','Boa Vista');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'CA','Santa Catarina');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'CR','Santa Cruz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'CS','Calheta de São Miguel');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'MA','Maio');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'MO','Mosteiros');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'PA','Paúl');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'PN','Porto Novo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'PR','Praia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'RG','Ribeira Grande');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'SD','São Domingos');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'SF','São Filipe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'SL','Sal');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'SN','São Nicolau');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'SV','São Vicente');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'TA','Tarrafal');

INSERT INTO osc_countries VALUES (40,'Cayman Islands','KY','CYM','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (40,'CR','Creek');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (40,'EA','Eastern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (40,'MI','Midland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (40,'SO','South Town');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (40,'SP','Spot Bay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (40,'ST','Stake Bay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (40,'WD','West End');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (40,'WN','Western');

INSERT INTO osc_countries VALUES (41,'Central African Republic','CF','CAF','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'AC ','Ouham');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'BB ','Bamingui-Bangoran');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'BGF','Bangui');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'BK ','Basse-Kotto');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'HK ','Haute-Kotto');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'HM ','Haut-Mbomou');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'HS ','Mambéré-Kadéï');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'KB ','Nana-Grébizi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'KG ','Kémo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'LB ','Lobaye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'MB ','Mbomou');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'MP ','Ombella-M\'Poko');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'NM ','Nana-Mambéré');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'OP ','Ouham-Pendé');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'SE ','Sangha-Mbaéré');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'UK ','Ouaka');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'VR ','Vakaga');

INSERT INTO osc_countries VALUES (42,'Chad','TD','TCD','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'BA ','Batha');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'BET','Borkou-Ennedi-Tibesti');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'BI ','Biltine');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'CB ','Chari-Baguirmi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'GR ','Guéra');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'KA ','Kanem');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'LC ','Lac');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'LR ','Logone-Oriental');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'LO ','Logone-Occidental');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'MC ','Moyen-Chari');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'MK ','Mayo-Kébbi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'OD ','Ouaddaï');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'SA ','Salamat');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'TA ','Tandjilé');

INSERT INTO osc_countries VALUES (43,'Chile','CL','CHL',":name\n:street_address\n:city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'AI','Aisén del General Carlos Ibañez');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'AN','Antofagasta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'AR','La Araucanía');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'AT','Atacama');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'BI','Biobío');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'CO','Coquimbo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'LI','Libertador Bernardo O\'Higgins');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'LL','Los Lagos');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'MA','Magallanes y de la Antartica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'ML','Maule');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'RM','Metropolitana de Santiago');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'TA','Tarapacá');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'VS','Valparaíso');

INSERT INTO osc_countries VALUES (44,'China','CN','CHN',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'11','北京');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'12','天津');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'13','河北');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'14','山西');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'15','内蒙古自治区');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'21','辽宁');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'22','吉林');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'23','黑龙江省');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'31','上海');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'32','江苏');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'33','浙江');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'34','安徽');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'35','福建');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'36','江西');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'37','山东');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'41','河南');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'42','湖北');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'43','湖南');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'44','广东');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'45','广西壮族自治区');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'46','海南');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'50','重庆');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'51','四川');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'52','贵州');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'53','云南');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'54','西藏自治区');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'61','陕西');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'62','甘肃');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'63','青海');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'64','宁夏');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'65','新疆');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'71','臺灣');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'91','香港');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'92','澳門');

INSERT INTO osc_countries VALUES (45,'Christmas Island','CX','CXR','');

INSERT INTO osc_countries VALUES (46,'Cocos (Keeling) Islands','CC','CCK','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (46,'D','Direction Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (46,'H','Home Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (46,'O','Horsburgh Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (46,'S','South Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (46,'W','West Island');

INSERT INTO osc_countries VALUES (47,'Colombia','CO','COL','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'AMA','Amazonas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'ANT','Antioquia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'ARA','Arauca');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'ATL','Atlántico');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'BOL','Bolívar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'BOY','Boyacá');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'CAL','Caldas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'CAQ','Caquetá');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'CAS','Casanare');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'CAU','Cauca');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'CES','Cesar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'CHO','Chocó');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'COR','Córdoba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'CUN','Cundinamarca');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'DC','Bogotá Distrito Capital');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'GUA','Guainía');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'GUV','Guaviare');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'HUI','Huila');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'LAG','La Guajira');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'MAG','Magdalena');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'MET','Meta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'NAR','Nariño');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'NSA','Norte de Santander');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'PUT','Putumayo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'QUI','Quindío');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'RIS','Risaralda');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'SAN','Santander');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'SAP','San Andrés y Providencia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'SUC','Sucre');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'TOL','Tolima');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'VAC','Valle del Cauca');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'VAU','Vaupés');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'VID','Vichada');

INSERT INTO osc_countries VALUES (48,'Comoros','KM','COM','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (48,'A','Anjouan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (48,'G','Grande Comore');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (48,'M','Mohéli');

INSERT INTO osc_countries VALUES (49,'Congo','CG','COG','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'BC','Congo-Central');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'BN','Bandundu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'EQ','Équateur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'KA','Katanga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'KE','Kasai-Oriental');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'KN','Kinshasa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'KW','Kasai-Occidental');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'MA','Maniema');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'NK','Nord-Kivu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'OR','Orientale');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'SK','Sud-Kivu');

INSERT INTO osc_countries VALUES (50,'Cook Islands','CK','COK','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'PU','Pukapuka');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'RK','Rakahanga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'MK','Manihiki');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'PE','Penrhyn');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'NI','Nassau Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'SU','Surwarrow');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'PA','Palmerston');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'AI','Aitutaki');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'MA','Manuae');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'TA','Takutea');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'MT','Mitiaro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'AT','Atiu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'MU','Mauke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'RR','Rarotonga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'MG','Mangaia');

INSERT INTO osc_countries VALUES (51,'Costa Rica','CR','CRI','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (51,'A','Alajuela');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (51,'C','Cartago');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (51,'G','Guanacaste');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (51,'H','Heredia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (51,'L','Limón');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (51,'P','Puntarenas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (51,'SJ','San José');

INSERT INTO osc_countries VALUES (52,'Cote D\'Ivoire','CI','CIV','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'01','Lagunes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'02','Haut-Sassandra');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'03','Savanes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'04','Vallée du Bandama');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'05','Moyen-Comoé');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'06','Dix-Huit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'07','Lacs');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'08','Zanzan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'09','Bas-Sassandra');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'10','Denguélé');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'11','N\'zi-Comoé');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'12','Marahoué');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'13','Sud-Comoé');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'14','Worodouqou');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'15','Sud-Bandama');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'16','Agnébi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'17','Bafing');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'18','Fromager');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'19','Moyen-Cavally');

INSERT INTO osc_countries VALUES (53,'Croatia','HR','HRV','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'01','Zagrebačka županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'02','Krapinsko-zagorska županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'03','Sisačko-moslavačka županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'04','Karlovačka županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'05','Varaždinska županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'06','Koprivničko-križevačka županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'07','Bjelovarsko-bilogorska županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'08','Primorsko-goranska županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'09','Ličko-senjska županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'10','Virovitičko-podravska županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'11','Požeško-slavonska županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'12','Brodsko-posavska županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'13','Zadarska županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'14','Osječko-baranjska županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'15','Šibensko-kninska županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'16','Vukovarsko-srijemska županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'17','Splitsko-dalmatinska županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'18','Istarska županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'19','Dubrovačko-neretvanska županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'20','Međimurska županija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'21','Zagreb');

INSERT INTO osc_countries VALUES (54,'Cuba','CU','CUB','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'01','Pinar del Río');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'02','La Habana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'03','Ciudad de La Habana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'04','Matanzas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'05','Villa Clara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'06','Cienfuegos');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'07','Sancti Spíritus');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'08','Ciego de Ávila');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'09','Camagüey');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'10','Las Tunas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'11','Holguín');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'12','Granma');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'13','Santiago de Cuba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'14','Guantánamo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'99','Isla de la Juventud');

INSERT INTO osc_countries VALUES (55,'Cyprus','CY','CYP','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (55,'01','Κερύvεια');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (55,'02','Λευκωσία');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (55,'03','Αμμόχωστος');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (55,'04','Λάρνακα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (55,'05','Λεμεσός');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (55,'06','Πάφος');

INSERT INTO osc_countries VALUES (56,'Czech Republic','CZ','CZE','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'JC','Jihočeský kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'JM','Jihomoravský kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'KA','Karlovarský kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'VY','Vysočina kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'KR','Královéhradecký kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'LI','Liberecký kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'MO','Moravskoslezský kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'OL','Olomoucký kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'PA','Pardubický kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'PL','Plzeňský kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'PR','Hlavní město Praha');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'ST','Středočeský kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'US','Ústecký kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'ZL','Zlínský kraj');

INSERT INTO osc_countries VALUES (57,'Denmark','DK','DNK',":name\n:street_address\nDK-:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'040','Bornholms Regionskommune');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'101','København');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'147','Frederiksberg');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'070','Århus Amt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'015','Københavns Amt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'020','Frederiksborg Amt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'042','Fyns Amt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'080','Nordjyllands Amt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'055','Ribe Amt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'065','Ringkjøbing Amt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'025','Roskilde Amt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'050','Sønderjyllands Amt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'035','Storstrøms Amt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'060','Vejle Amt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'030','Vestsjællands Amt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'076','Viborg Amt');

INSERT INTO osc_countries VALUES (58,'Djibouti','DJ','DJI','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (58,'AS','Region d\'Ali Sabieh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (58,'AR','Region d\'Arta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (58,'DI','Region de Dikhil');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (58,'DJ','Ville de Djibouti');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (58,'OB','Region d\'Obock');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (58,'TA','Region de Tadjourah');

INSERT INTO osc_countries VALUES (59,'Dominica','DM','DMA','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'AND','Saint Andrew Parish');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'DAV','Saint David Parish');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'GEO','Saint George Parish');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'JOH','Saint John Parish');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'JOS','Saint Joseph Parish');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'LUK','Saint Luke Parish');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'MAR','Saint Mark Parish');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'PAT','Saint Patrick Parish');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'PAU','Saint Paul Parish');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'PET','Saint Peter Parish');

INSERT INTO osc_countries VALUES (60,'Dominican Republic','DO','DOM','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'01','Distrito Nacional');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'02','Ázua');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'03','Baoruco');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'04','Barahona');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'05','Dajabón');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'06','Duarte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'07','Elías Piña');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'08','El Seibo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'09','Espaillat');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'10','Independencia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'11','La Altagracia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'12','La Romana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'13','La Vega');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'14','María Trinidad Sánchez');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'15','Monte Cristi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'16','Pedernales');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'17','Peravia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'18','Puerto Plata');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'19','Salcedo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'20','Samaná');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'21','San Cristóbal');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'22','San Juan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'23','San Pedro de Macorís');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'24','Sánchez Ramírez');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'25','Santiago');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'26','Santiago Rodríguez');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'27','Valverde');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'28','Monseñor Nouel');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'29','Monte Plata');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'30','Hato Mayor');

INSERT INTO osc_countries VALUES (61,'East Timor','TP','TMP','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'AL','Aileu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'AN','Ainaro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'BA','Baucau');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'BO','Bobonaro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'CO','Cova-Lima');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'DI','Dili');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'ER','Ermera');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'LA','Lautem');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'LI','Liquiçá');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'MF','Manufahi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'MT','Manatuto');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'OE','Oecussi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'VI','Viqueque');

INSERT INTO osc_countries VALUES (62,'Ecuador','EC','ECU','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'A','Azuay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'B','Bolívar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'C','Carchi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'D','Orellana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'E','Esmeraldas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'F','Cañar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'G','Guayas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'H','Chimborazo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'I','Imbabura');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'L','Loja');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'M','Manabí');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'N','Napo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'O','El Oro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'P','Pichincha');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'R','Los Ríos');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'S','Morona-Santiago');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'T','Tungurahua');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'U','Sucumbíos');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'W','Galápagos');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'X','Cotopaxi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'Y','Pastaza');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'Z','Zamora-Chinchipe');

INSERT INTO osc_countries VALUES (63,'Egypt','EG','EGY','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'ALX','الإسكندرية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'ASN','أسوان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'AST','أسيوط');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'BA','البحر الأحمر');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'BH','البحيرة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'BNS','بني سويف');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'C','القاهرة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'DK','الدقهلية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'DT','دمياط');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'FYM','الفيوم');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'GH','الغربية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'GZ','الجيزة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'IS','الإسماعيلية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'JS','جنوب سيناء');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'KB','القليوبية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'KFS','كفر الشيخ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'KN','قنا');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'MN','محافظة المنيا');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'MNF','المنوفية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'MT','مطروح');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'PTS','محافظة بور سعيد');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'SHG','محافظة سوهاج');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'SHR','المحافظة الشرقيّة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'SIN','شمال سيناء');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'SUZ','السويس');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'WAD','الوادى الجديد');

INSERT INTO osc_countries VALUES (64,'El Salvador','SV','SLV','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'AH','Ahuachapán');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'CA','Cabañas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'CH','Chalatenango');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'CU','Cuscatlán');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'LI','La Libertad');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'MO','Morazán');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'PA','La Paz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'SA','Santa Ana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'SM','San Miguel');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'SO','Sonsonate');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'SS','San Salvador');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'SV','San Vicente');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'UN','La Unión');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'US','Usulután');

INSERT INTO osc_countries VALUES (65,'Equatorial Guinea','GQ','GNQ','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (65,'AN','Annobón');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (65,'BN','Bioko Norte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (65,'BS','Bioko Sur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (65,'CS','Centro Sur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (65,'KN','Kié-Ntem');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (65,'LI','Litoral');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (65,'WN','Wele-Nzas');

INSERT INTO osc_countries VALUES (66,'Eritrea','ER','ERI','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (66,'AN','Zoba Anseba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (66,'DK','Zoba Debubawi Keyih Bahri');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (66,'DU','Zoba Debub');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (66,'GB','Zoba Gash-Barka');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (66,'MA','Zoba Ma\'akel');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (66,'SK','Zoba Semienawi Keyih Bahri');

INSERT INTO osc_countries VALUES (67,'Estonia','EE','EST','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'37','Harju maakond');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'39','Hiiu maakond');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'44','Ida-Viru maakond');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'49','Jõgeva maakond');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'51','Järva maakond');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'57','Lääne maakond');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'59','Lääne-Viru maakond');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'65','Põlva maakond');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'67','Pärnu maakond');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'70','Rapla maakond');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'74','Saare maakond');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'78','Tartu maakond');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'82','Valga maakond');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'84','Viljandi maakond');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'86','Võru maakond');

INSERT INTO osc_countries VALUES (68,'Ethiopia','ET','ETH','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'AA','አዲስ አበባ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'AF','አፋር');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'AH','አማራ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'BG','ቤንሻንጉል-ጉምዝ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'DD','ድሬዳዋ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'GB','ጋምቤላ ሕዝቦች');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'HR','ሀረሪ ሕዝብ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'OR','ኦሮሚያ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'SM','ሶማሌ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'SN','ደቡብ ብሔሮች ብሔረሰቦችና ሕዝቦች');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'TG','ትግራይ');

INSERT INTO osc_countries VALUES (69,'Falkland Islands (Malvinas)','FK','FLK','');
INSERT INTO osc_countries VALUES (70,'Faroe Islands','FO','FRO','');

INSERT INTO osc_countries VALUES (71,'Fiji','FJ','FJI','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (71,'C','Central');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (71,'E','Northern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (71,'N','Eastern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (71,'R','Rotuma');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (71,'W','Western');

INSERT INTO osc_countries VALUES (72,'Finland','FI','FIN',":name\n:street_address\nFIN-:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (72,'AL','Ahvenanmaan maakunta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (72,'ES','Etelä-Suomen lääni');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (72,'IS','Itä-Suomen lääni');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (72,'LL','Lapin lääni');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (72,'LS','Länsi-Suomen lääni');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (72,'OL','Oulun lääni');

INSERT INTO osc_countries VALUES (73,'France','FR','FRA',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'01','Ain');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'02','Aisne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'03','Allier');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'04','Alpes-de-Haute-Provence');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'05','Hautes-Alpes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'06','Alpes-Maritimes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'07','Ardèche');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'08','Ardennes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'09','Ariège');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'10','Aube');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'11','Aude');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'12','Aveyron');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'13','Bouches-du-Rhône');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'14','Calvados');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'15','Cantal');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'16','Charente');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'17','Charente-Maritime');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'18','Cher');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'19','Corrèze');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'21','Côte-d\'Or');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'22','Côtes-d\'Armor');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'23','Creuse');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'24','Dordogne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'25','Doubs');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'26','Drôme');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'27','Eure');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'28','Eure-et-Loir');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'29','Finistère');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'2A','Corse-du-Sud');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'2B','Haute-Corse');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'30','Gard');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'31','Haute-Garonne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'32','Gers');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'33','Gironde');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'34','Hérault');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'35','Ille-et-Vilaine');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'36','Indre');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'37','Indre-et-Loire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'38','Isère');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'39','Jura');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'40','Landes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'41','Loir-et-Cher');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'42','Loire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'43','Haute-Loire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'44','Loire-Atlantique');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'45','Loiret');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'46','Lot');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'47','Lot-et-Garonne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'48','Lozère');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'49','Maine-et-Loire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'50','Manche');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'51','Marne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'52','Haute-Marne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'53','Mayenne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'54','Meurthe-et-Moselle');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'55','Meuse');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'56','Morbihan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'57','Moselle');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'58','Nièvre');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'59','Nord');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'60','Oise');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'61','Orne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'62','Pas-de-Calais');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'63','Puy-de-Dôme');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'64','Pyrénées-Atlantiques');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'65','Hautes-Pyrénées');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'66','Pyrénées-Orientales');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'67','Bas-Rhin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'68','Haut-Rhin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'69','Rhône');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'70','Haute-Saône');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'71','Saône-et-Loire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'72','Sarthe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'73','Savoie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'74','Haute-Savoie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'75','Paris');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'76','Seine-Maritime');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'77','Seine-et-Marne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'78','Yvelines');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'79','Deux-Sèvres');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'80','Somme');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'81','Tarn');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'82','Tarn-et-Garonne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'83','Var');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'84','Vaucluse');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'85','Vendée');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'86','Vienne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'87','Haute-Vienne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'88','Vosges');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'89','Yonne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'90','Territoire de Belfort');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'91','Essonne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'92','Hauts-de-Seine');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'93','Seine-Saint-Denis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'94','Val-de-Marne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'95','Val-d\'Oise');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'NC','Territoire des Nouvelle-Calédonie et Dependances');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'PF','Polynésie Française');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'PM','Saint-Pierre et Miquelon');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'TF','Terres australes et antarctiques françaises');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'YT','Mayotte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'WF','Territoire des îles Wallis et Futuna');

INSERT INTO osc_countries VALUES (74,'France, Metropolitan','FX','FXX',":name\n:street_address\n:postcode :city\n:country");
INSERT INTO osc_countries VALUES (75,'French Guiana','GF','GUF',":name\n:street_address\n:postcode :city\n:country");
INSERT INTO osc_countries VALUES (76,'French Polynesia','PF','PYF',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (76,'M','Archipel des Marquises');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (76,'T','Archipel des Tuamotu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (76,'I','Archipel des Tubuai');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (76,'V','Iles du Vent');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (76,'S','Iles Sous-le-Vent ');

INSERT INTO osc_countries VALUES (77,'French Southern Territories','TF','ATF',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (77,'C','Iles Crozet');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (77,'K','Iles Kerguelen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (77,'A','Ile Amsterdam');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (77,'P','Ile Saint-Paul');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (77,'D','Adelie Land');

INSERT INTO osc_countries VALUES (78,'Gabon','GA','GAB','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'ES','Estuaire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'HO','Haut-Ogooue');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'MO','Moyen-Ogooue');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'NG','Ngounie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'NY','Nyanga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'OI','Ogooue-Ivindo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'OL','Ogooue-Lolo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'OM','Ogooue-Maritime');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'WN','Woleu-Ntem');

INSERT INTO osc_countries VALUES (79,'Gambia','GM','GMB','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'AH','Ashanti');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'BA','Brong-Ahafo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'CP','Central');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'EP','Eastern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'AA','Greater Accra');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'NP','Northern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'UE','Upper East');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'UW','Upper West');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'TV','Volta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'WP','Western');

INSERT INTO osc_countries VALUES (80,'Georgia','GE','GEO','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'AB','აფხაზეთი');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'AJ','აჭარა');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'GU','გურია');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'IM','იმერეთი');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'KA','კახეთი');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'KK','ქვემო ქართლი');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'MM','მცხეთა-მთიანეთი');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'RL','რაჭა-ლეჩხუმი და ქვემო სვანეთი');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'SJ','სამცხე-ჯავახეთი');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'SK','შიდა ქართლი');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'SZ','სამეგრელო-ზემო სვანეთი');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'TB','თბილისი');

INSERT INTO osc_countries VALUES (81,'Germany','DE','DEU',":name\n:street_address\nD-:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'BE','Berlin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'BR','Brandenburg');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'BW','Baden-Württemberg');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'BY','Bayern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'HB','Bremen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'HE','Hessen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'HH','Hamburg');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'MV','Mecklenburg-Vorpommern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'NI','Niedersachsen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'NW','Nordrhein-Westfalen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'RP','Rheinland-Pfalz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'SH','Schleswig-Holstein');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'SL','Saarland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'SN','Sachsen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'ST','Sachsen-Anhalt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'TH','Thüringen');

INSERT INTO osc_countries VALUES (82,'Ghana','GH','GHA','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'AA','Greater Accra');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'AH','Ashanti');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'BA','Brong-Ahafo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'CP','Central');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'EP','Eastern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'NP','Northern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'TV','Volta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'UE','Upper East');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'UW','Upper West');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'WP','Western');

INSERT INTO osc_countries VALUES (83,'Gibraltar','GI','GIB','');

INSERT INTO osc_countries VALUES (84,'Greece','GR','GRC','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'01','Αιτωλοακαρνανία');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'03','Βοιωτία');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'04','Εύβοια');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'05','Ευρυτανία');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'06','Φθιώτιδα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'07','Φωκίδα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'11','Αργολίδα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'12','Αρκαδία');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'13','Ἀχαΐα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'14','Ηλεία');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'15','Κορινθία');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'16','Λακωνία');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'17','Μεσσηνία');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'21','Ζάκυνθος');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'22','Κέρκυρα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'23','Κεφαλλονιά');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'24','Λευκάδα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'31','Άρτα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'32','Θεσπρωτία');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'33','Ιωάννινα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'34','Πρεβεζα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'41','Καρδίτσα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'42','Λάρισα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'43','Μαγνησία');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'44','Τρίκαλα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'51','Γρεβενά');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'52','Δράμα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'53','Ημαθία');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'54','Θεσσαλονίκη');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'55','Καβάλα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'56','Καστοριά');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'57','Κιλκίς');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'58','Κοζάνη');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'59','Πέλλα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'61','Πιερία');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'62','Σερρών');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'63','Φλώρινα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'64','Χαλκιδική');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'69','Όρος Άθως');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'71','Έβρος');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'72','Ξάνθη');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'73','Ροδόπη');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'81','Δωδεκάνησα');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'82','Κυκλάδες');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'83','Λέσβου');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'84','Σάμος');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'85','Χίος');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'91','Ηράκλειο');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'92','Λασίθι');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'93','Ρεθύμνο');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'94','Χανίων');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'A1','Αττική');

INSERT INTO osc_countries VALUES (85,'Greenland','GL','GRL',":name\n:street_address\nDK-:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (85,'A','Avannaa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (85,'T','Tunu ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (85,'K','Kitaa');

INSERT INTO osc_countries VALUES (86,'Grenada','GD','GRD','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (86,'A','Saint Andrew');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (86,'D','Saint David');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (86,'G','Saint George');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (86,'J','Saint John');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (86,'M','Saint Mark');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (86,'P','Saint Patrick');

INSERT INTO osc_countries VALUES (87,'Guadeloupe','GP','GLP','');
INSERT INTO osc_countries VALUES (88,'Guam','GU','GUM','');

INSERT INTO osc_countries VALUES (89,'Guatemala','GT','GTM','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'AV','Alta Verapaz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'BV','Baja Verapaz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'CM','Chimaltenango');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'CQ','Chiquimula');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'ES','Escuintla');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'GU','Guatemala');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'HU','Huehuetenango');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'IZ','Izabal');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'JA','Jalapa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'JU','Jutiapa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'PE','El Petén');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'PR','El Progreso');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'QC','El Quiché');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'QZ','Quetzaltenango');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'RE','Retalhuleu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'SA','Sacatepéquez');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'SM','San Marcos');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'SO','Sololá');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'SR','Santa Rosa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'SU','Suchitepéquez');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'TO','Totonicapán');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'ZA','Zacapa');

INSERT INTO osc_countries VALUES (90,'Guinea','GN','GIN','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'BE','Beyla');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'BF','Boffa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'BK','Boké');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'CO','Coyah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'DB','Dabola');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'DI','Dinguiraye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'DL','Dalaba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'DU','Dubréka');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'FA','Faranah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'FO','Forécariah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'FR','Fria');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'GA','Gaoual');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'GU','Guékédou');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'KA','Kankan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'KB','Koubia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'KD','Kindia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'KE','Kérouané');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'KN','Koundara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'KO','Kouroussa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'KS','Kissidougou');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'LA','Labé');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'LE','Lélouma');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'LO','Lola');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'MC','Macenta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'MD','Mandiana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'ML','Mali');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'MM','Mamou');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'NZ','Nzérékoré');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'PI','Pita');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'SI','Siguiri');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'TE','Télimélé');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'TO','Tougué');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'YO','Yomou');

INSERT INTO osc_countries VALUES (91,'Guinea-Bissau','GW','GNB','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'BF','Bafata');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'BB','Biombo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'BS','Bissau');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'BL','Bolama');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'CA','Cacheu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'GA','Gabu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'OI','Oio');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'QU','Quinara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'TO','Tombali');

INSERT INTO osc_countries VALUES (92,'Guyana','GY','GUY','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'BA','Barima-Waini');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'CU','Cuyuni-Mazaruni');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'DE','Demerara-Mahaica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'EB','East Berbice-Corentyne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'ES','Essequibo Islands-West Demerara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'MA','Mahaica-Berbice');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'PM','Pomeroon-Supenaam');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'PT','Potaro-Siparuni');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'UD','Upper Demerara-Berbice');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'UT','Upper Takutu-Upper Essequibo');

INSERT INTO osc_countries VALUES (93,'Haiti','HT','HTI','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'AR','Artibonite');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'CE','Centre');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'GA','Grand\'Anse');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'NI','Nippes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'ND','Nord');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'NE','Nord-Est');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'NO','Nord-Ouest');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'OU','Ouest');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'SD','Sud');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'SE','Sud-Est');

INSERT INTO osc_countries VALUES (94,'Heard and McDonald Islands','HM','HMD','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (94,'F','Flat Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (94,'M','McDonald Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (94,'S','Shag Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (94,'H','Heard Island');

INSERT INTO osc_countries VALUES (95,'Honduras','HN','HND','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'AT','Atlántida');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'CH','Choluteca');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'CL','Colón');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'CM','Comayagua');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'CP','Copán');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'CR','Cortés');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'EP','El Paraíso');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'FM','Francisco Morazán');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'GD','Gracias a Dios');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'IB','Islas de la Bahía');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'IN','Intibucá');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'LE','Lempira');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'LP','La Paz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'OC','Ocotepeque');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'OL','Olancho');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'SB','Santa Bárbara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'VA','Valle');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'YO','Yoro');

INSERT INTO osc_countries VALUES (96,'Hong Kong','HK','HKG',":name\n:street_address\n:city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'HCW','中西區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'HEA','東區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'HSO','南區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'HWC','灣仔區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'KKC','九龍城區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'KKT','觀塘區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'KSS','深水埗區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'KWT','黃大仙區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'KYT','油尖旺區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NIS','離島區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NKT','葵青區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NNO','北區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NSK','西貢區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NST','沙田區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NTP','大埔區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NTW','荃灣區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NTM','屯門區');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NYL','元朗區');

INSERT INTO osc_countries VALUES (97,'Hungary','HU','HUN','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'BA','Baranja megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'BC','Békéscsaba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'BE','Békés megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'BK','Bács-Kiskun megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'BU','Budapest');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'BZ','Borsod-Abaúj-Zemplén megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'CS','Csongrád megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'DE','Debrecen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'DU','Dunaújváros');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'EG','Eger');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'FE','Fejér megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'GS','Győr-Moson-Sopron megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'GY','Győr');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'HB','Hajdú-Bihar megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'HE','Heves megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'HV','Hódmezővásárhely');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'JN','Jász-Nagykun-Szolnok megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'KE','Komárom-Esztergom megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'KM','Kecskemét');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'KV','Kaposvár');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'MI','Miskolc');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'NK','Nagykanizsa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'NO','Nógrád megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'NY','Nyíregyháza');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'PE','Pest megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'PS','Pécs');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'SD','Szeged');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'SF','Székesfehérvár');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'SH','Szombathely');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'SK','Szolnok');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'SN','Sopron');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'SO','Somogy megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'SS','Szekszárd');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'ST','Salgótarján');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'SZ','Szabolcs-Szatmár-Bereg megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'TB','Tatabánya');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'TO','Tolna megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'VA','Vas megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'VE','Veszprém megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'VM','Veszprém');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'ZA','Zala megye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'ZE','Zalaegerszeg');

INSERT INTO osc_countries VALUES (98,'Iceland','IS','ISL',":name\n:street_address\nIS:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (98,'1','Höfuðborgarsvæðið');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (98,'2','Suðurnes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (98,'3','Vesturland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (98,'4','Vestfirðir');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (98,'5','Norðurland vestra');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (98,'6','Norðurland eystra');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (98,'7','Austfirðir');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (98,'8','Suðurland');

INSERT INTO osc_countries VALUES (99,'India','IN','IND',":name\n:street_address\n:city-:postcode\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-AN','अंडमान और निकोबार द्वीप');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-AP','ఆంధ్ర ప్రదేశ్');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-AR','अरुणाचल प्रदेश');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-AS','অসম');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-BR','बिहार');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-CH','चंडीगढ़');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-CT','छत्तीसगढ़');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-DD','દમણ અને દિવ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-DL','दिल्ली');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-DN','દાદરા અને નગર હવેલી');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-GA','गोंय');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-GJ','ગુજરાત');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-HP','हिमाचल प्रदेश');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-HR','हरियाणा');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-JH','झारखंड');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-JK','जम्मू और कश्मीर');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-KA','ಕನಾ೯ಟಕ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-KL','കേരളം');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-LD','ലക്ഷദ്വീപ്');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-ML','मेघालय');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-MH','महाराष्ट्र');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-MN','मणिपुर');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-MP','मध्य प्रदेश');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-MZ','मिज़ोरम');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-NL','नागालैंड');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-OR','उड़ीसा');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-PB','ਪੰਜਾਬ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-PY','புதுச்சேரி');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-RJ','राजस्थान');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-SK','सिक्किम');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-TN','தமிழ் நாடு');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-TR','ত্রিপুরা');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-UL','उत्तरांचल');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-UP','उत्तर प्रदेश');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-WB','পশ্চিমবঙ্গ');

INSERT INTO osc_countries VALUES (100,'Indonesia','ID','IDN',":name\n:street_address\n:city :postcode\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'AC','Aceh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'BA','Bali');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'BB','Bangka-Belitung');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'BE','Bengkulu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'BT','Banten');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'GO','Gorontalo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'IJ','Papua');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'JA','Jambi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'JI','Jawa Timur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'JK','Jakarta Raya');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'JR','Jawa Barat');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'JT','Jawa Tengah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'KB','Kalimantan Barat');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'KI','Kalimantan Timur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'KS','Kalimantan Selatan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'KT','Kalimantan Tengah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'LA','Lampung');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'MA','Maluku');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'MU','Maluku Utara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'NB','Nusa Tenggara Barat');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'NT','Nusa Tenggara Timur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'RI','Riau');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'SB','Sumatera Barat');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'SG','Sulawesi Tenggara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'SL','Sumatera Selatan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'SN','Sulawesi Selatan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'ST','Sulawesi Tengah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'SW','Sulawesi Utara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'SU','Sumatera Utara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'YO','Yogyakarta');

INSERT INTO osc_countries VALUES (101,'Iran','IR','IRN','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'01','محافظة آذربایجان شرقي');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'02','محافظة آذربایجان غربي');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'03','محافظة اردبیل');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'04','محافظة اصفهان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'05','محافظة ایلام');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'06','محافظة بوشهر');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'07','محافظة طهران');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'08','محافظة چهارمحل و بختیاري');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'09','محافظة خراسان رضوي');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'10','محافظة خوزستان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'11','محافظة زنجان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'12','محافظة سمنان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'13','محافظة سيستان وبلوتشستان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'14','محافظة فارس');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'15','محافظة کرمان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'16','محافظة کردستان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'17','محافظة کرمانشاه');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'18','محافظة کهکیلویه و بویر أحمد');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'19','محافظة گیلان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'20','محافظة لرستان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'21','محافظة مازندران');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'22','محافظة مرکزي');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'23','محافظة هرمزگان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'24','محافظة همدان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'25','محافظة یزد');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'26','محافظة قم');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'27','محافظة گلستان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'28','محافظة قزوين');

INSERT INTO osc_countries VALUES (102,'Iraq','IQ','IRQ','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'AN','محافظة الأنبار');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'AR','أربيل');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'BA','محافظة البصرة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'BB','بابل');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'BG','محافظة بغداد');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'DA','دهوك');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'DI','ديالى');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'DQ','ذي قار');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'KA','كربلاء');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'MA','ميسان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'MU','المثنى');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'NA','النجف');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'NI','نینوى');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'QA','القادسية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'SD','صلاح الدين');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'SW','محافظة السليمانية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'TS','التأمیم');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'WA','واسط');

INSERT INTO osc_countries VALUES (103,'Ireland','IE','IRL',":name\n:street_address\nIE-:city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'C','Corcaigh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'CE','Contae an Chláir');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'CN','An Cabhán');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'CW','Ceatharlach');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'D','Baile Átha Cliath');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'DL','Dún na nGall');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'G','Gaillimh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'KE','Cill Dara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'KK','Cill Chainnigh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'KY','Contae Chiarraí');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'LD','An Longfort');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'LH','Contae Lú');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'LK','Luimneach');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'LM','Contae Liatroma');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'LS','Contae Laoise');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'MH','Contae na Mí');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'MN','Muineachán');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'MO','Contae Mhaigh Eo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'OY','Contae Uíbh Fhailí');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'RN','Ros Comáin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'SO','Sligeach');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'TA','Tiobraid Árann');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'WD','Port Lairge');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'WH','Contae na hIarmhí');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'WW','Cill Mhantáin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'WX','Loch Garman');

INSERT INTO osc_countries VALUES (104,'Israel','IL','ISR',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (104,'D ','מחוז הדרום');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (104,'HA','מחוז חיפה');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (104,'JM','ירושלים');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (104,'M ','מחוז המרכז');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (104,'TA','תל אביב-יפו');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (104,'Z ','מחוז הצפון');

INSERT INTO osc_countries VALUES (105,'Italy','IT','ITA',":name\n:street_address\n:postcode-:city :state_code\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AG','Agrigento');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AL','Alessandria');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AN','Ancona');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AO','Valle d\'Aosta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AP','Ascoli Piceno');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AQ','L\'Aquila');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AR','Arezzo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AT','Asti');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AV','Avellino');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BA','Bari');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BG','Bergamo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BI','Biella');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BL','Belluno');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BN','Benevento');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BO','Bologna');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BR','Brindisi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BS','Brescia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BT','Barletta-Andria-Trani');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BZ','Alto Adige');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CA','Cagliari');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CB','Campobasso');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CE','Caserta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CH','Chieti');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CI','Carbonia-Iglesias');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CL','Caltanissetta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CN','Cuneo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CO','Como');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CR','Cremona');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CS','Cosenza');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CT','Catania');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CZ','Catanzaro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'EN','Enna');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'FE','Ferrara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'FG','Foggia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'FI','Firenze');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'FM','Fermo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'FO','Forlì-Cesena');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'FR','Frosinone');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'GE','Genova');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'GO','Gorizia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'GR','Grosseto');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'IM','Imperia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'IS','Isernia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'KR','Crotone');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'LC','Lecco');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'LE','Lecce');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'LI','Livorno');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'LO','Lodi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'LT','Latina');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'LU','Lucca');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'MC','Macerata');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'MD','Medio Campidano');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'ME','Messina');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'MI','Milano');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'MN','Mantova');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'MO','Modena');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'MS','Massa-Carrara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'MT','Matera');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'MZ','Monza e Brianza');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'NA','Napoli');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'NO','Novara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'NU','Nuoro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'OG','Ogliastra');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'OR','Oristano');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'OT','Olbia-Tempio');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PA','Palermo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PC','Piacenza');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PD','Padova');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PE','Pescara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PG','Perugia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PI','Pisa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PN','Pordenone');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PO','Prato');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PR','Parma');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PS','Pesaro e Urbino');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PT','Pistoia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PV','Pavia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PZ','Potenza');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'RA','Ravenna');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'RC','Reggio Calabria');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'RE','Reggio Emilia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'RG','Ragusa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'RI','Rieti');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'RM','Roma');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'RN','Rimini');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'RO','Rovigo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'SA','Salerno');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'SI','Siena');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'SO','Sondrio');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'SP','La Spezia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'SR','Siracusa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'SS','Sassari');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'SV','Savona');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'TA','Taranto');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'TE','Teramo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'TN','Trento');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'TO','Torino');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'TP','Trapani');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'TR','Terni');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'TS','Trieste');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'TV','Treviso');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'UD','Udine');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'VA','Varese');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'VB','Verbano-Cusio-Ossola');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'VC','Vercelli');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'VE','Venezia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'VI','Vicenza');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'VR','Verona');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'VT','Viterbo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'VV','Vibo Valentia');

INSERT INTO osc_countries VALUES (106,'Jamaica','JM','JAM','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'01','Kingston');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'02','Half Way Tree');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'03','Morant Bay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'04','Port Antonio');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'05','Port Maria');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'06','Saint Ann\'s Bay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'07','Falmouth');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'08','Montego Bay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'09','Lucea');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'10','Savanna-la-Mar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'11','Black River');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'12','Mandeville');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'13','May Pen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'14','Spanish Town');

INSERT INTO osc_countries VALUES (107,'Japan','JP','JPN',":name\n:street_address, :suburb\n:city :postcode\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'01','北海道');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'02','青森');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'03','岩手');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'04','宮城');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'05','秋田');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'06','山形');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'07','福島');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'08','茨城');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'09','栃木');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'10','群馬');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'11','埼玉');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'12','千葉');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'13','東京');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'14','神奈川');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'15','新潟');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'16','富山');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'17','石川');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'18','福井');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'19','山梨');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'20','長野');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'21','岐阜');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'22','静岡');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'23','愛知');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'24','三重');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'25','滋賀');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'26','京都');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'27','大阪');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'28','兵庫');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'29','奈良');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'30','和歌山');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'31','鳥取');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'32','島根');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'33','岡山');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'34','広島');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'35','山口');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'36','徳島');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'37','香川');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'38','愛媛');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'39','高知');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'40','福岡');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'41','佐賀');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'42','長崎');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'43','熊本');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'44','大分');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'45','宮崎');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'46','鹿児島');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'47','沖縄');

INSERT INTO osc_countries VALUES (108,'Jordan','JO','JOR','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'AJ','محافظة عجلون');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'AM','محافظة العاصمة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'AQ','محافظة العقبة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'AT','محافظة الطفيلة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'AZ','محافظة الزرقاء');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'BA','محافظة البلقاء');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'JA','محافظة جرش');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'JR','محافظة إربد');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'KA','محافظة الكرك');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'MA','محافظة المفرق');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'MD','محافظة مادبا');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'MN','محافظة معان');

INSERT INTO osc_countries VALUES (109,'Kazakhstan','KZ','KAZ','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'AL','Алматы');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'AC','Almaty City');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'AM','Ақмола');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'AQ','Ақтөбе');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'AS','Астана');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'AT','Атырау');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'BA','Батыс Қазақстан');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'BY','Байқоңыр');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'MA','Маңғыстау');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'ON','Оңтүстік Қазақстан');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'PA','Павлодар');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'QA','Қарағанды');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'QO','Қостанай');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'QY','Қызылорда');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'SH','Шығыс Қазақстан');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'SO','Солтүстік Қазақстан');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'ZH','Жамбыл');

INSERT INTO osc_countries VALUES (110,'Kenya','KE','KEN','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (110,'110','Nairobi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (110,'200','Central');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (110,'300','Mombasa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (110,'400','Eastern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (110,'500','North Eastern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (110,'600','Nyanza');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (110,'700','Rift Valley');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (110,'900','Western');

INSERT INTO osc_countries VALUES (111,'Kiribati','KI','KIR','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (111,'G','Gilbert Islands');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (111,'L','Line Islands');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (111,'P','Phoenix Islands');

INSERT INTO osc_countries VALUES (112,'Korea, North','KP','PRK','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'CHA','자강도');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'HAB','함경 북도');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'HAN','함경 남도');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'HWB','황해 북도');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'HWN','황해 남도');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'KAN','강원도');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'KAE','개성시');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'NAJ','라선 직할시');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'NAM','남포 특급시');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'PYB','평안 북도');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'PYN','평안 남도');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'PYO','평양 직할시');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'YAN','량강도');

INSERT INTO osc_countries VALUES (113,'Korea, South','KR','KOR','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'11','서울특별시');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'26','부산 광역시');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'27','대구 광역시');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'28','인천광역시');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'29','광주 광역시');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'30','대전 광역시');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'31','울산 광역시');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'41','경기도');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'42','강원도');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'43','충청 북도');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'44','충청 남도');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'45','전라 북도');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'46','전라 남도');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'47','경상 북도');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'48','경상 남도');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'49','제주특별자치도');

INSERT INTO osc_countries VALUES (114,'Kuwait','KW','KWT','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (114,'AH','الاحمدي');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (114,'FA','الفروانية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (114,'JA','الجهراء');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (114,'KU','ألعاصمه');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (114,'HW','حولي');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (114,'MU','مبارك الكبير');

INSERT INTO osc_countries VALUES (115,'Kyrgyzstan','KG','KGZ','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (115,'B','Баткен областы');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (115,'C','Чүй областы');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (115,'GB','Бишкек');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (115,'J','Жалал-Абад областы');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (115,'N','Нарын областы');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (115,'O','Ош областы');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (115,'T','Талас областы');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (115,'Y','Ысык-Көл областы');

INSERT INTO osc_countries VALUES (116,'Laos','LA','LAO','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'AT','ອັດຕະປື');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'BK','ບໍ່ແກ້ວ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'BL','ບໍລິຄໍາໄຊ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'CH','ຈໍາປາສັກ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'HO','ຫົວພັນ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'KH','ຄໍາມ່ວນ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'LM','ຫລວງນໍ້າທາ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'LP','ຫລວງພະບາງ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'OU','ອຸດົມໄຊ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'PH','ຜົງສາລີ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'SL','ສາລະວັນ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'SV','ສະຫວັນນະເຂດ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'VI','ວຽງຈັນ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'VT','ວຽງຈັນ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'XA','ໄຊຍະບູລີ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'XE','ເຊກອງ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'XI','ຊຽງຂວາງ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'XN','ໄຊສົມບູນ');

INSERT INTO osc_countries VALUES (117,'Latvia','LV','LVA','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'AI','Aizkraukles rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'AL','Alūksnes rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'BL','Balvu rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'BU','Bauskas rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'CE','Cēsu rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'DA','Daugavpils rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'DGV','Daugpilis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'DO','Dobeles rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'GU','Gulbenes rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'JEL','Jelgava');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'JK','Jēkabpils rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'JL','Jelgavas rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'JUR','Jūrmala');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'KR','Krāslavas rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'KU','Kuldīgas rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'LE','Liepājas rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'LM','Limbažu rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'LPX','Liepoja');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'LU','Ludzas rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'MA','Madonas rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'OG','Ogres rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'PR','Preiļu rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'RE','Rēzeknes rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'REZ','Rēzekne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'RI','Rīgas rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'RIX','Rīga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'SA','Saldus rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'TA','Talsu rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'TU','Tukuma rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'VE','Ventspils rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'VEN','Ventspils');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'VK','Valkas rajons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'VM','Valmieras rajons');

INSERT INTO osc_countries VALUES (118,'Lebanon','LB','LBN','');

INSERT INTO osc_countries VALUES (119,'Lesotho','LS','LSO','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'A','Maseru');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'B','Butha-Buthe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'C','Leribe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'D','Berea');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'E','Mafeteng');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'F','Mohale\'s Hoek');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'G','Quthing');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'H','Qacha\'s Nek');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'J','Mokhotlong');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'K','Thaba-Tseka');

INSERT INTO osc_countries VALUES (120,'Liberia','LR','LBR','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'BG','Bong');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'BM','Bomi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'CM','Grand Cape Mount');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'GB','Grand Bassa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'GG','Grand Gedeh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'GK','Grand Kru');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'GP','Gbarpolu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'LO','Lofa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'MG','Margibi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'MO','Montserrado');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'MY','Maryland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'NI','Nimba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'RG','River Gee');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'RI','Rivercess');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'SI','Sinoe');

INSERT INTO osc_countries VALUES (121,'Libyan Arab Jamahiriya','LY','LBY','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'AJ','Ajdābiyā');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'BA','Banghāzī');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'BU','Al Buţnān');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'BW','Banī Walīd');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'DR','Darnah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'GD','Ghadāmis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'GR','Gharyān');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'GT','Ghāt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'HZ','Al Ḩizām al Akhḑar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'JA','Al Jabal al Akhḑar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'JB','Jaghbūb');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'JI','Al Jifārah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'JU','Al Jufrah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'KF','Al Kufrah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'MB','Al Marqab');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'MI','Mişrātah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'MJ','Al Marj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'MQ','Murzuq');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'MZ','Mizdah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'NL','Nālūt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'NQ','An Nuqaţ al Khams');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'QB','Al Qubbah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'QT','Al Qaţrūn');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'SB','Sabhā');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'SH','Ash Shāţi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'SR','Surt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'SS','Şabrātah Şurmān');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'TB','Ţarābulus');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'TM','Tarhūnah-Masallātah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'TN','Tājūrā wa an Nawāḩī al Arbāʻ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'WA','Al Wāḩah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'WD','Wādī al Ḩayāt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'YJ','Yafran-Jādū');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'ZA','Az Zāwiyah');

INSERT INTO osc_countries VALUES (122,'Liechtenstein','LI','LIE','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'B','Balzers');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'E','Eschen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'G','Gamprin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'M','Mauren');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'P','Planken');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'R','Ruggell');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'A','Schaan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'L','Schellenberg');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'N','Triesen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'T','Triesenberg');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'V','Vaduz');

INSERT INTO osc_countries VALUES (123,'Lithuania','LT','LTU','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'AL','Alytaus Apskritis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'KL','Klaipėdos Apskritis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'KU','Kauno Apskritis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'MR','Marijampolės Apskritis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'PN','Panevėžio Apskritis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'SA','Šiaulių Apskritis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'TA','Tauragės Apskritis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'TE','Telšių Apskritis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'UT','Utenos Apskritis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'VL','Vilniaus Apskritis');

INSERT INTO osc_countries VALUES (124,'Luxembourg','LU','LUX',":name\n:street_address\nL-:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (124,'D','Diekirch');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (124,'G','Grevenmacher');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (124,'L','Luxemburg');

INSERT INTO osc_countries VALUES (125,'Macau','MO','MAC','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (125,'I','海島市');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (125,'M','澳門市');

INSERT INTO osc_countries VALUES (126,'Macedonia','MK','MKD','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'BR','Berovo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'CH','Чешиново-Облешево');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'DL','Делчево');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'KB','Карбинци');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'OC','Кочани');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'LO','Лозово');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'MK','Македонска каменица');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'PH','Пехчево');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'PT','Пробиштип');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'ST','Штип');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'SL','Свети Николе');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'NI','Виница');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'ZR','Зрновци');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'KY','Кратово');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'KZ','Крива Паланка');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'UM','Куманово');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'LI','Липково');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'RN','Ранковце');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'NA','Старо Нагоричане');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'TL','Битола');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'DM','Демир Хисар');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'DE','Долнени');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'KG','Кривогаштани');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'KS','Крушево');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'MG','Могила');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'NV','Новаци');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'PP','Прилеп');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'RE','Ресен');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'VJ','Боговиње');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'BN','Брвеница');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'GT','Гостивар');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'JG','Јегуновце');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'MR','Маврово и Ростуша');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'TR','Теарце');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'ET','Тетово');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'VH','Врапчиште');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'ZE','Желино');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'AD','Аеродром');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'AR','Арачиново');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'BU','Бутел');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'CI','Чаир');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'CE','Центар');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'CS','Чучер Сандево');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'GB','Гази Баба');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'GP','Ѓорче Петров');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'IL','Илинден');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'KX','Карпош');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'VD','Кисела Вода');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'PE','Петровец');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'AJ','Сарај');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'SS','Сопиште');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'SU','Студеничани');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'SO','Шуто Оризари');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'ZK','Зелениково');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'BG','Богданци');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'BS','Босилово');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'GV','Гевгелија');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'KN','Конче');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'NS','Ново Село');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'RV','Радовиш');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'SD','Стар Дојран');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'RU','Струмица');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'VA','Валандово');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'VL','Василево');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'CZ','Центар Жупа');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'DB','Дебар');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'DA','Дебарца');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'DR','Другово');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'KH','Кичево');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'MD','Македонски Брод');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'OD','Охрид');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'OS','Осломеј');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'PN','Пласница');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'UG','Струга');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'VV','Вевчани');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'VC','Вранештица');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'ZA','Зајас');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'CA','Чашка');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'DK','Демир Капија');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'GR','Градско');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'AV','Кавадарци');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'NG','Неготино');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'RM','Росоман');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'VE','Велес');

INSERT INTO osc_countries VALUES (127,'Madagascar','MG','MDG','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (127,'A','Toamasina');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (127,'D','Antsiranana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (127,'F','Fianarantsoa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (127,'M','Mahajanga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (127,'T','Antananarivo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (127,'U','Toliara');

INSERT INTO osc_countries VALUES (128,'Malawi','MW','MWI','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'BA','Balaka');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'BL','Blantyre');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'C','Central');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'CK','Chikwawa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'CR','Chiradzulu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'CT','Chitipa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'DE','Dedza');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'DO','Dowa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'KR','Karonga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'KS','Kasungu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'LK','Likoma Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'LI','Lilongwe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'MH','Machinga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'MG','Mangochi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'MC','Mchinji');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'MU','Mulanje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'MW','Mwanza');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'MZ','Mzimba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'N','Northern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'NB','Nkhata');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'NK','Nkhotakota');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'NS','Nsanje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'NU','Ntcheu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'NI','Ntchisi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'PH','Phalombe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'RU','Rumphi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'S','Southern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'SA','Salima');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'TH','Thyolo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'ZO','Zomba');

INSERT INTO osc_countries VALUES (129,'Malaysia','MY','MYS','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'01','Johor Darul Takzim');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'02','Kedah Darul Aman');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'03','Kelantan Darul Naim');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'04','Melaka Negeri Bersejarah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'05','Negeri Sembilan Darul Khusus');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'06','Pahang Darul Makmur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'07','Pulau Pinang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'08','Perak Darul Ridzuan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'09','Perlis Indera Kayangan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'10','Selangor Darul Ehsan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'11','Terengganu Darul Iman');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'12','Sabah Negeri Di Bawah Bayu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'13','Sarawak Bumi Kenyalang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'14','Wilayah Persekutuan Kuala Lumpur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'15','Wilayah Persekutuan Labuan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'16','Wilayah Persekutuan Putrajaya');

INSERT INTO osc_countries VALUES (130,'Maldives','MV','MDV','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'THU','Thiladhunmathi Uthuru');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'THD','Thiladhunmathi Dhekunu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'MLU','Miladhunmadulu Uthuru');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'MLD','Miladhunmadulu Dhekunu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'MAU','Maalhosmadulu Uthuru');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'MAD','Maalhosmadulu Dhekunu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'FAA','Faadhippolhu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'MAA','Male Atoll');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'AAU','Ari Atoll Uthuru');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'AAD','Ari Atoll Dheknu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'FEA','Felidhe Atoll');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'MUA','Mulaku Atoll');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'NAU','Nilandhe Atoll Uthuru');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'NAD','Nilandhe Atoll Dhekunu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'KLH','Kolhumadulu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'HDH','Hadhdhunmathi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'HAU','Huvadhu Atoll Uthuru');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'HAD','Huvadhu Atoll Dhekunu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'FMU','Fua Mulaku');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'ADD','Addu');

INSERT INTO osc_countries VALUES (131,'Mali','ML','MLI','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'1','Kayes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'2','Koulikoro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'3','Sikasso');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'4','Ségou');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'5','Mopti');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'6','Tombouctou');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'7','Gao');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'8','Kidal');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'BK0','Bamako');

INSERT INTO osc_countries VALUES (132,'Malta','MT','MLT','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'ATT','Attard');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'BAL','Balzan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'BGU','Birgu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'BKK','Birkirkara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'BRZ','Birzebbuga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'BOR','Bormla');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'DIN','Dingli');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'FGU','Fgura');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'FLO','Floriana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'GDJ','Gudja');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'GZR','Gzira');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'GRG','Gargur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'GXQ','Gaxaq');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'HMR','Hamrun');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'IKL','Iklin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'ISL','Isla');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'KLK','Kalkara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'KRK','Kirkop');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'LIJ','Lija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'LUQ','Luqa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MRS','Marsa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MKL','Marsaskala');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MXL','Marsaxlokk');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MDN','Mdina');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MEL','Melliea');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MGR','Mgarr');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MST','Mosta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MQA','Mqabba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MSI','Msida');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MTF','Mtarfa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'NAX','Naxxar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'PAO','Paola');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'PEM','Pembroke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'PIE','Pieta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'QOR','Qormi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'QRE','Qrendi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'RAB','Rabat');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SAF','Safi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SGI','San Giljan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SLU','Santa Lucija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SPB','San Pawl il-Bahar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SGW','San Gwann');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SVE','Santa Venera');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SIG','Siggiewi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SLM','Sliema');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SWQ','Swieqi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'TXB','Ta Xbiex');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'TRX','Tarxien');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'VLT','Valletta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'XGJ','Xgajra');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'ZBR','Zabbar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'ZBG','Zebbug');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'ZJT','Zejtun');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'ZRQ','Zurrieq');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'FNT','Fontana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'GHJ','Ghajnsielem');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'GHR','Gharb');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'GHS','Ghasri');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'KRC','Kercem');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MUN','Munxar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'NAD','Nadur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'QAL','Qala');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'VIC','Victoria');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SLA','San Lawrenz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SNT','Sannat');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'ZAG','Xagra');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'XEW','Xewkija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'ZEB','Zebbug');

INSERT INTO osc_countries VALUES (133,'Marshall Islands','MH','MHL','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'ALK','Ailuk');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'ALL','Ailinglapalap');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'ARN','Arno');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'AUR','Aur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'EBO','Ebon');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'ENI','Eniwetok');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'JAB','Jabat');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'JAL','Jaluit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'KIL','Kili');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'KWA','Kwajalein');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'LAE','Lae');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'LIB','Lib');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'LIK','Likiep');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'MAJ','Majuro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'MAL','Maloelap');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'MEJ','Mejit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'MIL','Mili');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'NMK','Namorik');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'NMU','Namu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'RON','Rongelap');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'UJA','Ujae');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'UJL','Ujelang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'UTI','Utirik');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'WTJ','Wotje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'WTN','Wotho');

INSERT INTO osc_countries VALUES (134,'Martinique','MQ','MTQ','');

INSERT INTO osc_countries VALUES (135,'Mauritania','MR','MRT','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'01','ولاية الحوض الشرقي');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'02','ولاية الحوض الغربي');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'03','ولاية العصابة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'04','ولاية كركول');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'05','ولاية البراكنة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'06','ولاية الترارزة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'07','ولاية آدرار');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'08','ولاية داخلت نواذيبو');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'09','ولاية تكانت');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'10','ولاية كيدي ماغة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'11','ولاية تيرس زمور');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'12','ولاية إينشيري');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'NKC','نواكشوط');

INSERT INTO osc_countries VALUES (136,'Mauritius','MU','MUS','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'AG','Agalega Islands');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'BL','Black River');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'BR','Beau Bassin-Rose Hill');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'CC','Cargados Carajos Shoals');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'CU','Curepipe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'FL','Flacq');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'GP','Grand Port');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'MO','Moka');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'PA','Pamplemousses');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'PL','Port Louis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'PU','Port Louis City');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'PW','Plaines Wilhems');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'QB','Quatre Bornes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'RO','Rodrigues');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'RR','Riviere du Rempart');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'SA','Savanne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'VP','Vacoas-Phoenix');

INSERT INTO osc_countries VALUES (137,'Mayotte','YT','MYT','');

INSERT INTO osc_countries VALUES (138,'Mexico','MX','MEX',":name\n:street_address\n:postcode :city, :state_code\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'AGU','Aguascalientes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'BCN','Baja California');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'BCS','Baja California Sur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'CAM','Campeche');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'CHH','Chihuahua');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'CHP','Chiapas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'COA','Coahuila');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'COL','Colima');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'DIF','Distrito Federal');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'DUR','Durango');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'GRO','Guerrero');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'GUA','Guanajuato');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'HID','Hidalgo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'JAL','Jalisco');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'MEX','Mexico');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'MIC','Michoacán');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'MOR','Morelos');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'NAY','Nayarit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'NLE','Nuevo León');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'OAX','Oaxaca');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'PUE','Puebla');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'QUE','Querétaro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'ROO','Quintana Roo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'SIN','Sinaloa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'SLP','San Luis Potosí');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'SON','Sonora');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'TAB','Tabasco');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'TAM','Tamaulipas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'TLA','Tlaxcala');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'VER','Veracruz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'YUC','Yucatan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'ZAC','Zacatecas');

INSERT INTO osc_countries VALUES (139,'Micronesia','FM','FSM','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (139,'KSA','Kosrae');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (139,'PNI','Pohnpei');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (139,'TRK','Chuuk');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (139,'YAP','Yap');

INSERT INTO osc_countries VALUES (140,'Moldova','MD','MDA','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'BA','Bălţi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'CA','Cahul');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'CU','Chişinău');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'ED','Edineţ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'GA','Găgăuzia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'LA','Lăpuşna');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'OR','Orhei');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'SN','Stânga Nistrului');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'SO','Soroca');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'TI','Tighina');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'UN','Ungheni');

INSERT INTO osc_countries VALUES (141,'Monaco','MC','MCO','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'MC','Monte Carlo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'LR','La Rousse');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'LA','Larvotto');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'MV','Monaco Ville');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'SM','Saint Michel');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'CO','Condamine');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'LC','La Colle');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'RE','Les Révoires');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'MO','Moneghetti');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'FV','Fontvieille');

INSERT INTO osc_countries VALUES (142,'Mongolia','MN','MNG','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'1','Улаанбаатар');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'035','Орхон аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'037','Дархан-Уул аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'039','Хэнтий аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'041','Хөвсгөл аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'043','Ховд аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'046','Увс аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'047','Төв аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'049','Сэлэнгэ аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'051','Сүхбаатар аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'053','Өмнөговь аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'055','Өвөрхангай аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'057','Завхан аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'059','Дундговь аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'061','Дорнод аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'063','Дорноговь аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'064','Говьсүмбэр аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'065','Говь-Алтай аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'067','Булган аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'069','Баянхонгор аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'071','Баян Өлгий аймаг');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'073','Архангай аймаг');

INSERT INTO osc_countries VALUES (143,'Montserrat','MS','MSR','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (143,'A','Saint Anthony');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (143,'G','Saint Georges');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (143,'P','Saint Peter');

INSERT INTO osc_countries VALUES (144,'Morocco','MA','MAR','');

INSERT INTO osc_countries VALUES (145,'Mozambique','MZ','MOZ','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'A','Niassa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'B','Manica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'G','Gaza');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'I','Inhambane');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'L','Maputo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'MPM','Maputo cidade');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'N','Nampula');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'P','Cabo Delgado');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'Q','Zambézia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'S','Sofala');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'T','Tete');

INSERT INTO osc_countries VALUES (146,'Myanmar','MM','MMR','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'AY','ဧရာ၀တီတိုင္‌း');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'BG','ပဲခူးတုိင္‌း');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'MG','မကေ္ဝးတိုင္‌း');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'MD','မန္တလေးတုိင္‌း');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'SG','စစ္‌ကုိင္‌း‌တုိင္‌း');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'TN','တနင္သာရိတုိင္‌း');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'YG','ရန္‌ကုန္‌တုိင္‌း');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'CH','ခ္ယင္‌းပ္ရည္‌နယ္‌');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'KC','ကခ္ယင္‌ပ္ရည္‌နယ္‌');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'KH','ကယား‌ပ္ရည္‌နယ္‌');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'KN','ကရင္‌‌ပ္ရည္‌နယ္‌');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'MN','မ္ဝန္‌ပ္ရည္‌နယ္‌');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'RK','ရခုိင္‌ပ္ရည္‌နယ္‌');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'SH','ရုမ္‌းပ္ရည္‌နယ္‌');

INSERT INTO osc_countries VALUES (147,'Namibia','NA','NAM','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'CA','Caprivi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'ER','Erongo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'HA','Hardap');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'KA','Karas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'KH','Khomas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'KU','Kunene');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'OD','Otjozondjupa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'OH','Omaheke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'OK','Okavango');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'ON','Oshana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'OS','Omusati');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'OT','Oshikoto');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'OW','Ohangwena');

INSERT INTO osc_countries VALUES (148,'Nauru','NR','NRU','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'AO','Aiwo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'AA','Anabar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'AT','Anetan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'AI','Anibare');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'BA','Baiti');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'BO','Boe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'BU','Buada');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'DE','Denigomodu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'EW','Ewa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'IJ','Ijuw');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'ME','Meneng');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'NI','Nibok');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'UA','Uaboe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'YA','Yaren');

INSERT INTO osc_countries VALUES (149,'Nepal','NP','NPL','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'BA','Bagmati');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'BH','Bheri');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'DH','Dhawalagiri');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'GA','Gandaki');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'JA','Janakpur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'KA','Karnali');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'KO','Kosi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'LU','Lumbini');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'MA','Mahakali');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'ME','Mechi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'NA','Narayani');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'RA','Rapti');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'SA','Sagarmatha');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'SE','Seti');

INSERT INTO osc_countries VALUES (150,'Netherlands','NL','NLD',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'DR','Drenthe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'FL','Flevoland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'FR','Friesland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'GE','Gelderland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'GR','Groningen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'LI','Limburg');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'NB','Noord-Brabant');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'NH','Noord-Holland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'OV','Overijssel');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'UT','Utrecht');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'ZE','Zeeland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'ZH','Zuid-Holland');

INSERT INTO osc_countries VALUES (151,'Netherlands Antilles','AN','ANT',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO osc_countries VALUES (152,'New Caledonia','NC','NCL','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (152,'L','Province des Îles');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (152,'N','Province Nord');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (152,'S','Province Sud');

INSERT INTO osc_countries VALUES (153,'New Zealand','NZ','NZL',":name\n:street_address\n:suburb\n:city :postcode\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'AUK','Auckland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'BOP','Bay of Plenty');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'CAN','Canterbury');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'GIS','Gisborne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'HKB','Hawke\'s Bay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'MBH','Marlborough');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'MWT','Manawatu-Wanganui');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'NSN','Nelson');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'NTL','Northland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'OTA','Otago');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'STL','Southland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'TAS','Tasman');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'TKI','Taranaki');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'WGN','Wellington');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'WKO','Waikato');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'WTC','West Coast');

INSERT INTO osc_countries VALUES (154,'Nicaragua','NI','NIC','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'AN','Atlántico Norte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'AS','Atlántico Sur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'BO','Boaco');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'CA','Carazo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'CI','Chinandega');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'CO','Chontales');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'ES','Estelí');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'GR','Granada');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'JI','Jinotega');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'LE','León');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'MD','Madriz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'MN','Managua');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'MS','Masaya');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'MT','Matagalpa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'NS','Nueva Segovia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'RI','Rivas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'SJ','Río San Juan');

INSERT INTO osc_countries VALUES (155,'Niger','NE','NER','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (155,'1','Agadez');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (155,'2','Daffa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (155,'3','Dosso');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (155,'4','Maradi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (155,'5','Tahoua');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (155,'6','Tillabéry');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (155,'7','Zinder');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (155,'8','Niamey');

INSERT INTO osc_countries VALUES (156,'Nigeria','NG','NGA','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'AB','Abia State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'AD','Adamawa State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'AK','Akwa Ibom State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'AN','Anambra State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'BA','Bauchi State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'BE','Benue State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'BO','Borno State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'BY','Bayelsa State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'CR','Cross River State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'DE','Delta State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'EB','Ebonyi State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'ED','Edo State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'EK','Ekiti State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'EN','Enugu State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'GO','Gombe State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'IM','Imo State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'JI','Jigawa State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'KB','Kebbi State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'KD','Kaduna State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'KN','Kano State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'KO','Kogi State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'KT','Katsina State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'KW','Kwara State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'LA','Lagos State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'NA','Nassarawa State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'NI','Niger State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'OG','Ogun State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'ON','Ondo State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'OS','Osun State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'OY','Oyo State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'PL','Plateau State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'RI','Rivers State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'SO','Sokoto State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'TA','Taraba State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'ZA','Zamfara State');

INSERT INTO osc_countries VALUES (157,'Niue','NU','NIU','');
INSERT INTO osc_countries VALUES (158,'Norfolk Island','NF','NFK','');

INSERT INTO osc_countries VALUES (159,'Northern Mariana Islands','MP','MNP','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (159,'N','Northern Islands');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (159,'R','Rota');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (159,'S','Saipan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (159,'T','Tinian');

INSERT INTO osc_countries VALUES (160,'Norway','NO','NOR',":name\n:street_address\nNO-:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'01','Østfold fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'02','Akershus fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'03','Oslo fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'04','Hedmark fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'05','Oppland fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'06','Buskerud fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'07','Vestfold fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'08','Telemark fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'09','Aust-Agder fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'10','Vest-Agder fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'11','Rogaland fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'12','Hordaland fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'14','Sogn og Fjordane fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'15','Møre og Romsdal fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'16','Sør-Trøndelag fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'17','Nord-Trøndelag fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'18','Nordland fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'19','Troms fylke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'20','Finnmark fylke');

INSERT INTO osc_countries VALUES (161,'Oman','OM','OMN','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (161,'BA','الباطنة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (161,'DA','الداخلية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (161,'DH','ظفار');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (161,'MA','مسقط');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (161,'MU','مسندم');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (161,'SH','الشرقية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (161,'WU','الوسطى');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (161,'ZA','الظاهرة');

INSERT INTO osc_countries VALUES (162,'Pakistan','PK','PAK','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (162,'BA','بلوچستان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (162,'IS','وفاقی دارالحکومت');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (162,'JK','آزاد کشمیر');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (162,'NA','شمالی علاقہ جات');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (162,'NW','شمال مغربی سرحدی صوبہ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (162,'PB','پنجاب');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (162,'SD','سندھ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (162,'TA','وفاقی قبائلی علاقہ جات');

INSERT INTO osc_countries VALUES (163,'Palau','PW','PLW','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'AM','Aimeliik');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'AR','Airai');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'AN','Angaur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'HA','Hatohobei');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'KA','Kayangel');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'KO','Koror');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'ME','Melekeok');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'NA','Ngaraard');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'NG','Ngarchelong');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'ND','Ngardmau');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'NT','Ngatpang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'NC','Ngchesar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'NR','Ngeremlengui');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'NW','Ngiwal');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'PE','Peleliu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'SO','Sonsorol');

INSERT INTO osc_countries VALUES (164,'Panama','PA','PAN','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'1','Bocas del Toro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'2','Coclé');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'3','Colón');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'4','Chiriquí');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'5','Darién');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'6','Herrera');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'7','Los Santos');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'8','Panamá');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'9','Veraguas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'Q','Kuna Yala');

INSERT INTO osc_countries VALUES (165,'Papua New Guinea','PG','PNG','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'CPK','Chimbu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'CPM','Central');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'EBR','East New Britain');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'EHG','Eastern Highlands');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'EPW','Enga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'ESW','East Sepik');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'GPK','Gulf');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'MBA','Milne Bay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'MPL','Morobe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'MPM','Madang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'MRL','Manus');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'NCD','National Capital District');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'NIK','New Ireland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'NPP','Northern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'NSA','North Solomons');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'SAN','Sandaun');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'SHM','Southern Highlands');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'WBK','West New Britain');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'WHM','Western Highlands');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'WPD','Western');

INSERT INTO osc_countries VALUES (166,'Paraguay','PY','PRY','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'1','Concepción');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'2','San Pedro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'3','Cordillera');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'4','Guairá');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'5','Caaguazú');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'6','Caazapá');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'7','Itapúa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'8','Misiones');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'9','Paraguarí');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'10','Alto Paraná');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'11','Central');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'12','Ñeembucú');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'13','Amambay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'14','Canindeyú');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'15','Presidente Hayes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'16','Alto Paraguay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'19','Boquerón');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'ASU','Asunción');

INSERT INTO osc_countries VALUES (167,'Peru','PE','PER','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'AMA','Amazonas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'ANC','Ancash');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'APU','Apurímac');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'ARE','Arequipa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'AYA','Ayacucho');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'CAJ','Cajamarca');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'CAL','Callao');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'CUS','Cuzco');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'HUC','Huánuco');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'HUV','Huancavelica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'ICA','Ica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'JUN','Junín');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'LAL','La Libertad');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'LAM','Lambayeque');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'LIM','Lima');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'LOR','Loreto');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'MDD','Madre de Dios');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'MOQ','Moquegua');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'PAS','Pasco');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'PIU','Piura');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'PUN','Puno');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'SAM','San Martín');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'TAC','Tacna');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'TUM','Tumbes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'UCA','Ucayali');

INSERT INTO osc_countries VALUES (168,'Philippines','PH','PHL','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ABR','Abra');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'AGN','Agusan del Norte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'AGS','Agusan del Sur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'AKL','Aklan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ALB','Albay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ANT','Antique');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'APA','Apayao');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'AUR','Aurora');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BAN','Bataan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BAS','Basilan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BEN','Benguet');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BIL','Biliran');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BOH','Bohol');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BTG','Batangas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BTN','Batanes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BUK','Bukidnon');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BUL','Bulacan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'CAG','Cagayan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'CAM','Camiguin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'CAN','Camarines Norte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'CAP','Capiz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'CAS','Camarines Sur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'CAT','Catanduanes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'CAV','Cavite');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'CEB','Cebu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'COM','Compostela Valley');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'DAO','Davao Oriental');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'DAS','Davao del Sur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'DAV','Davao del Norte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'EAS','Eastern Samar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'GUI','Guimaras');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'IFU','Ifugao');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ILI','Iloilo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ILN','Ilocos Norte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ILS','Ilocos Sur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ISA','Isabela');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'KAL','Kalinga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'LAG','Laguna');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'LAN','Lanao del Norte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'LAS','Lanao del Sur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'LEY','Leyte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'LUN','La Union');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'MAD','Marinduque');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'MAG','Maguindanao');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'MAS','Masbate');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'MDC','Mindoro Occidental');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'MDR','Mindoro Oriental');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'MOU','Mountain Province');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'MSC','Misamis Occidental');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'MSR','Misamis Oriental');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'NCO','Cotabato');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'NSA','Northern Samar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'NEC','Negros Occidental');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'NER','Negros Oriental');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'NUE','Nueva Ecija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'NUV','Nueva Vizcaya');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'PAM','Pampanga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'PAN','Pangasinan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'PLW','Palawan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'QUE','Quezon');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'QUI','Quirino');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'RIZ','Rizal');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ROM','Romblon');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SAR','Sarangani');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SCO','South Cotabato');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SIG','Siquijor');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SLE','Southern Leyte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SLU','Sulu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SOR','Sorsogon');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SUK','Sultan Kudarat');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SUN','Surigao del Norte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SUR','Surigao del Sur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'TAR','Tarlac');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'TAW','Tawi-Tawi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'WSA','Samar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ZAN','Zamboanga del Norte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ZAS','Zamboanga del Sur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ZMB','Zambales');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ZSI','Zamboanga Sibugay');

INSERT INTO osc_countries VALUES (169,'Pitcairn','PN','PCN','');

INSERT INTO osc_countries VALUES (170,'Poland','PL','POL',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'DS','Dolnośląskie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'KP','Kujawsko-Pomorskie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'LU','Lubelskie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'LB','Lubuskie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'LD','Łódzkie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'MA','Małopolskie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'MZ','Mazowieckie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'OP','Opolskie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'PK','Podkarpackie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'PD','Podlaskie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'PM','Pomorskie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'SL','Śląskie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'SK','Świętokrzyskie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'WN','Warmińsko-Mazurskie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'WP','Wielkopolskie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'ZP','Zachodniopomorskie');

INSERT INTO osc_countries VALUES (171,'Portugal','PT','PRT',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'01','Aveiro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'02','Beja');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'03','Braga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'04','Bragança');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'05','Castelo Branco');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'06','Coimbra');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'07','Évora');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'08','Faro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'09','Guarda');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'10','Leiria');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'11','Lisboa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'12','Portalegre');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'13','Porto');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'14','Santarém');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'15','Setúbal');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'16','Viana do Castelo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'17','Vila Real');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'18','Viseu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'20','Região Autónoma dos Açores');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'30','Região Autónoma da Madeira');

INSERT INTO osc_countries VALUES (172,'Puerto Rico','PR','PRI','');

INSERT INTO osc_countries VALUES (173,'Qatar','QA','QAT','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'DA','الدوحة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'GH','الغويرية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'JB','جريان الباطنة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'JU','الجميلية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'KH','الخور');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'ME','مسيعيد');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'MS','الشمال');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'RA','الريان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'US','أم صلال');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'WA','الوكرة');

INSERT INTO osc_countries VALUES (174,'Reunion','RE','REU','');

INSERT INTO osc_countries VALUES (175,'Romania','RO','ROM','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'AB','Alba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'AG','Argeş');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'AR','Arad');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'B','Bucureşti');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'BC','Bacău');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'BH','Bihor');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'BN','Bistriţa-Năsăud');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'BR','Brăila');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'BT','Botoşani');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'BV','Braşov');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'BZ','Buzău');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'CJ','Cluj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'CL','Călăraşi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'CS','Caraş-Severin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'CT','Constanţa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'CV','Covasna');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'DB','Dâmboviţa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'DJ','Dolj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'GJ','Gorj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'GL','Galaţi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'GR','Giurgiu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'HD','Hunedoara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'HG','Harghita');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'IF','Ilfov');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'IL','Ialomiţa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'IS','Iaşi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'MH','Mehedinţi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'MM','Maramureş');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'MS','Mureş');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'NT','Neamţ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'OT','Olt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'PH','Prahova');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'SB','Sibiu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'SJ','Sălaj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'SM','Satu Mare');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'SV','Suceava');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'TL','Tulcea');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'TM','Timiş');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'TR','Teleorman');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'VL','Vâlcea');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'VN','Vrancea');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'VS','Vaslui');

INSERT INTO osc_countries VALUES (176,'Российская Федерация','RU','RUS',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'AD','Республика Адыгея');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'AL','Республика Алтай');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'ALT','Алтайский край');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'AMU','Амурская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'ARK','Архангельская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'AST','Астраханская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'BA','Республика Башкортостан');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'BEL','Белгородская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'BRY','Брянская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'BU','Республика Бурятия');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'CE','Чеченская Республика');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'CHE','Челябинская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'ZAB','Забайкальский край');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'CHU','Чукотский автономный округ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'CU','Чувашская Республика');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'DA','Республика Дагестан');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'IN','Республика Ингушетия');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'IRK','Иркутская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'IVA','Ивановская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KAM','Камчатский край');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KB','Кабардино-Балкарская Республика');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KC','Карачаево-Черкесская Республика');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KDA','Краснодарский край');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KEM','Кемеровская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KGD','Калининградская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KGN','Курганская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KHA','Хабаровский край');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KHM','Ханты-Мансийский автономный округ—Югра');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KIA','Красноярский край');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KIR','Кировская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KK','Республика Хакасия');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KL','Республика Калмыкия');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KLU','Калужская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KO','Республика Коми');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KOS','Костромская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KR','Республика Карелия');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KRS','Курская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'LEN','Ленинградская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'LIP','Липецкая область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'MAG','Магаданская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'ME','Республика Марий Эл');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'MO','Республика Мордовия');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'MOS','Московская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'MOW','Москва');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'MUR','Мурманская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'NEN','Ненецкий автономный округ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'NGR','Новгородская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'NIZ','Нижегородская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'NVS','Новосибирская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'OMS','Омская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'ORE','Оренбургская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'ORL','Орловская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'PNZ','Пензенская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'PRI','Приморский край');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'PSK','Псковская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'ROS','Ростовская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'RYA','Рязанская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'SA','Республика Саха (Якутия)');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'SAK','Сахалинская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'SAM','Самарская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'SAR','Саратовская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'SE','Республика Северная Осетия–Алания');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'SMO','Смоленская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'SPE','Санкт-Петербург');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'STA','Ставропольский край');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'SVE','Свердловская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'TA','Республика Татарстан');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'TAM','Тамбовская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'TOM','Томская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'TUL','Тульская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'TVE','Тверская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'TY','Республика Тыва');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'TYU','Тюменская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'UD','Удмуртская Республика');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'ULY','Ульяновская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'VGG','Волгоградская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'VLA','Владимирская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'VLG','Вологодская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'VOR','Воронежская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'PER','Пермский край');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'YAN','Ямало-Ненецкий автономный округ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'YAR','Ярославская область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'YEV','Еврейская автономная область');

INSERT INTO osc_countries VALUES (177,'Rwanda','RW','RWA','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (177,'N','Nord');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (177,'E','Est');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (177,'S','Sud');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (177,'O','Ouest');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (177,'K','Kigali');

INSERT INTO osc_countries VALUES (178,'Saint Kitts and Nevis','KN','KNA','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (178,'K','Saint Kitts');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (178,'N','Nevis');

INSERT INTO osc_countries VALUES (179,'Saint Lucia','LC','LCA','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'AR','Anse-la-Raye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'CA','Castries');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'CH','Choiseul');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'DA','Dauphin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'DE','Dennery');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'GI','Gros-Islet');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'LA','Laborie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'MI','Micoud');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'PR','Praslin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'SO','Soufriere');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'VF','Vieux-Fort');

INSERT INTO osc_countries VALUES (180,'Saint Vincent and the Grenadines','VC','VCT','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (180,'C','Charlotte');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (180,'R','Grenadines');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (180,'A','Saint Andrew');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (180,'D','Saint David');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (180,'G','Saint George');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (180,'P','Saint Patrick');

INSERT INTO osc_countries VALUES (181,'Samoa','WS','WSM','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'AA','A\'ana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'AL','Aiga-i-le-Tai');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'AT','Atua');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'FA','Fa\'asaleleaga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'GE','Gaga\'emauga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'GI','Gaga\'ifomauga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'PA','Palauli');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'SA','Satupa\'itea');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'TU','Tuamasaga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'VF','Va\'a-o-Fonoti');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'VS','Vaisigano');

INSERT INTO osc_countries VALUES (182,'San Marino','SM','SMR','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'AC','Acquaviva');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'BM','Borgo Maggiore');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'CH','Chiesanuova');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'DO','Domagnano');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'FA','Faetano');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'FI','Fiorentino');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'MO','Montegiardino');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'SM','Citta di San Marino');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'SE','Serravalle');

INSERT INTO osc_countries VALUES (183,'Sao Tome and Principe','ST','STP','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (183,'P','Príncipe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (183,'S','São Tomé');

INSERT INTO osc_countries VALUES (184,'Saudi Arabia','SA','SAU','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'01','الرياض');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'02','مكة المكرمة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'03','المدينه');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'04','الشرقية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'05','القصيم');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'06','حائل');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'07','تبوك');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'08','الحدود الشمالية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'09','جيزان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'10','نجران');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'11','الباحة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'12','الجوف');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'14','عسير');

INSERT INTO osc_countries VALUES (185,'Senegal','SN','SEN','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'DA','Dakar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'DI','Diourbel');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'FA','Fatick');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'KA','Kaolack');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'KO','Kolda');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'LO','Louga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'MA','Matam');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'SL','Saint-Louis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'TA','Tambacounda');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'TH','Thies ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'ZI','Ziguinchor');

INSERT INTO osc_countries VALUES (186,'Seychelles','SC','SYC','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'AP','Anse aux Pins');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'AB','Anse Boileau');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'AE','Anse Etoile');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'AL','Anse Louis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'AR','Anse Royale');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'BL','Baie Lazare');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'BS','Baie Sainte Anne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'BV','Beau Vallon');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'BA','Bel Air');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'BO','Bel Ombre');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'CA','Cascade');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'GL','Glacis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'GM','Grand\' Anse (on Mahe)');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'GP','Grand\' Anse (on Praslin)');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'DG','La Digue');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'RA','La Riviere Anglaise');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'MB','Mont Buxton');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'MF','Mont Fleuri');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'PL','Plaisance');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'PR','Pointe La Rue');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'PG','Port Glaud');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'SL','Saint Louis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'TA','Takamaka');

INSERT INTO osc_countries VALUES (187,'Sierra Leone','SL','SLE','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (187,'E','Eastern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (187,'N','Northern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (187,'S','Southern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (187,'W','Western');

INSERT INTO osc_countries VALUES (188,'Singapore','SG','SGP', ":name\n:street_address\n:city :postcode\n:country");

INSERT INTO osc_countries VALUES (189,'Slovakia','SK','SVK','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (189,'BC','Banskobystrický kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (189,'BL','Bratislavský kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (189,'KI','Košický kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (189,'NJ','Nitrianský kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (189,'PV','Prešovský kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (189,'TA','Trnavský kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (189,'TC','Trenčianský kraj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (189,'ZI','Žilinský kraj');

INSERT INTO osc_countries VALUES (190,'Slovenia','SI','SVN','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'001','Ajdovščina');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'002','Beltinci');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'003','Bled');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'004','Bohinj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'005','Borovnica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'006','Bovec');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'007','Brda');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'008','Brezovica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'009','Brežice');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'010','Tišina');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'011','Celje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'012','Cerklje na Gorenjskem');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'013','Cerknica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'014','Cerkno');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'015','Črenšovci');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'016','Črna na Koroškem');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'017','Črnomelj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'018','Destrnik');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'019','Divača');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'020','Dobrepolje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'021','Dobrova-Polhov Gradec');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'022','Dol pri Ljubljani');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'023','Domžale');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'024','Dornava');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'025','Dravograd');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'026','Duplek');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'027','Gorenja vas-Poljane');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'028','Gorišnica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'029','Gornja Radgona');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'030','Gornji Grad');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'031','Gornji Petrovci');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'032','Grosuplje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'033','Šalovci');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'034','Hrastnik');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'035','Hrpelje-Kozina');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'036','Idrija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'037','Ig');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'038','Ilirska Bistrica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'039','Ivančna Gorica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'040','Izola');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'041','Jesenice');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'042','Juršinci');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'043','Kamnik');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'044','Kanal ob Soči');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'045','Kidričevo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'046','Kobarid');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'047','Kobilje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'048','Kočevje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'049','Komen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'050','Koper');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'051','Kozje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'052','Kranj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'053','Kranjska Gora');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'054','Krško');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'055','Kungota');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'056','Kuzma');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'057','Laško');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'058','Lenart');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'059','Lendava');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'060','Litija');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'061','Ljubljana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'062','Ljubno');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'063','Ljutomer');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'064','Logatec');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'065','Loška Dolina');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'066','Loški Potok');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'067','Luče');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'068','Lukovica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'069','Majšperk');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'070','Maribor');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'071','Medvode');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'072','Mengeš');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'073','Metlika');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'074','Mežica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'075','Miren-Kostanjevica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'076','Mislinja');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'077','Moravče');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'078','Moravske Toplice');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'079','Mozirje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'080','Murska Sobota');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'081','Muta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'082','Naklo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'083','Nazarje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'084','Nova Gorica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'085','Novo mesto');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'086','Odranci');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'087','Ormož');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'088','Osilnica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'089','Pesnica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'090','Piran');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'091','Pivka');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'092','Podčetrtek');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'093','Podvelka');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'094','Postojna');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'095','Preddvor');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'096','Ptuj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'097','Puconci');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'098','Rače-Fram');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'099','Radeče');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'100','Radenci');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'101','Radlje ob Dravi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'102','Radovljica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'103','Ravne na Koroškem');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'104','Ribnica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'106','Rogaška Slatina');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'105','Rogašovci');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'107','Rogatec');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'108','Ruše');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'109','Semič');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'110','Sevnica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'111','Sežana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'112','Slovenj Gradec');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'113','Slovenska Bistrica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'114','Slovenske Konjice');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'115','Starše');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'116','Sveti Jurij');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'117','Šenčur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'118','Šentilj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'119','Šentjernej');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'120','Šentjur pri Celju');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'121','Škocjan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'122','Škofja Loka');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'123','Škofljica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'124','Šmarje pri Jelšah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'125','Šmartno ob Paki');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'126','Šoštanj');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'127','Štore');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'128','Tolmin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'129','Trbovlje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'130','Trebnje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'131','Tržič');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'132','Turnišče');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'133','Velenje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'134','Velike Lašče');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'135','Videm');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'136','Vipava');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'137','Vitanje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'138','Vodice');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'139','Vojnik');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'140','Vrhnika');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'141','Vuzenica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'142','Zagorje ob Savi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'143','Zavrč');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'144','Zreče');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'146','Železniki');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'147','Žiri');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'148','Benedikt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'149','Bistrica ob Sotli');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'150','Bloke');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'151','Braslovče');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'152','Cankova');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'153','Cerkvenjak');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'154','Dobje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'155','Dobrna');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'156','Dobrovnik');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'157','Dolenjske Toplice');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'158','Grad');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'159','Hajdina');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'160','Hoče-Slivnica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'161','Hodoš');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'162','Horjul');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'163','Jezersko');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'164','Komenda');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'165','Kostel');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'166','Križevci');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'167','Lovrenc na Pohorju');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'168','Markovci');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'169','Miklavž na Dravskem polju');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'170','Mirna Peč');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'171','Oplotnica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'172','Podlehnik');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'173','Polzela');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'174','Prebold');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'175','Prevalje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'176','Razkrižje');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'177','Ribnica na Pohorju');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'178','Selnica ob Dravi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'179','Sodražica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'180','Solčava');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'181','Sveta Ana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'182','Sveti Andraž v Slovenskih goricah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'183','Šempeter-Vrtojba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'184','Tabor');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'185','Trnovska vas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'186','Trzin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'187','Velika Polana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'188','Veržej');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'189','Vransko');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'190','Žalec');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'191','Žetale');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'192','Žirovnica');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'193','Žužemberk');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'194','Šmartno pri Litiji');

INSERT INTO osc_countries VALUES (191,'Solomon Islands','SB','SLB','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'CE','Central');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'CH','Choiseul');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'GC','Guadalcanal');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'HO','Honiara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'IS','Isabel');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'MK','Makira');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'ML','Malaita');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'RB','Rennell and Bellona');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'TM','Temotu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'WE','Western');

INSERT INTO osc_countries VALUES (192,'Somalia','SO','SOM','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'AD','Awdal');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'BK','Bakool');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'BN','Banaadir');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'BR','Bari');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'BY','Bay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'GD','Gedo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'GG','Galguduud');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'HR','Hiiraan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'JD','Jubbada Dhexe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'JH','Jubbada Hoose');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'MD','Mudug');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'NG','Nugaal');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'SD','Shabeellaha Dhexe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'SG','Sanaag');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'SH','Shabeellaha Hoose');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'SL','Sool');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'TG','Togdheer');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'WG','Woqooyi Galbeed');

INSERT INTO osc_countries VALUES (193,'South Africa','ZA','ZAF',":name\n:street_address\n:suburb\n:city\n:postcode :country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'EC','Eastern Cape');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'FS','Free State');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'GT','Gauteng');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'LP','Limpopo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'MP','Mpumalanga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'NC','Northern Cape');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'NL','KwaZulu-Natal');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'NW','North-West');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'WC','Western Cape');

INSERT INTO osc_countries VALUES (194,'South Georgia and the South Sandwich Islands','GS','SGS','');

INSERT INTO osc_countries VALUES (195,'Spain','ES','ESP',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'AN','Andalucía');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'AR','Aragón');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'A','Alicante');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'AB','Albacete');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'AL','Almería');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'AN','Andalucía');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'AV','Ávila');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'B','Barcelona');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'BA','Badajoz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'BI','Vizcaya');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'BU','Burgos');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'C','A Coruña');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CA','Cádiz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CC','Cáceres');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CE','Ceuta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CL','Castilla y León');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CM','Castilla-La Mancha');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CN','Islas Canarias');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CO','Córdoba');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CR','Ciudad Real');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CS','Castellón');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CT','Catalonia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CU','Cuenca');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'EX','Extremadura');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'GA','Galicia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'GC','Las Palmas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'GI','Girona');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'GR','Granada');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'GU','Guadalajara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'H','Huelva');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'HU','Huesca');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'IB','Islas Baleares');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'J','Jaén');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'L','Lleida');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'LE','León');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'LO','La Rioja');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'LU','Lugo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'M','Madrid');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'MA','Málaga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'ML','Melilla');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'MU','Murcia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'NA','Navarre');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'O','Asturias');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'OR','Ourense');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'P','Palencia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'PM','Baleares');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'PO','Pontevedra');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'PV','Basque Euskadi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'S','Cantabria');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'SA','Salamanca');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'SE','Seville');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'SG','Segovia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'SO','Soria');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'SS','Guipúzcoa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'T','Tarragona');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'TE','Teruel');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'TF','Santa Cruz De Tenerife');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'TO','Toledo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'V','Valencia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'VA','Valladolid');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'VI','Álava');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'Z','Zaragoza');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'ZA','Zamora');

INSERT INTO osc_countries VALUES (196,'Sri Lanka','LK','LKA','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'CE','Central');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'NC','North Central');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'NO','North');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'EA','Eastern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'NW','North Western');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'SO','Southern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'UV','Uva');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'SA','Sabaragamuwa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'WE','Western');

INSERT INTO osc_countries VALUES (197,'St. Helena','SH','SHN','');
INSERT INTO osc_countries VALUES (198,'St. Pierre and Miquelon','PM','SPM','');

INSERT INTO osc_countries VALUES (199,'Sudan','SD','SDN','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'ANL','أعالي النيل');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'BAM','البحر الأحمر');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'BRT','البحيرات');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'JZR','ولاية الجزيرة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'KRT','الخرطوم');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'QDR','القضارف');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'WDH','الوحدة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'ANB','النيل الأبيض');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'ANZ','النيل الأزرق');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'ASH','الشمالية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'BJA','الاستوائية الوسطى');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'GIS','غرب الاستوائية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'GBG','غرب بحر الغزال');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'GDA','غرب دارفور');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'GKU','غرب كردفان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'JDA','جنوب دارفور');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'JKU','جنوب كردفان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'JQL','جونقلي');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'KSL','كسلا');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'NNL','ولاية نهر النيل');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'SBG','شمال بحر الغزال');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'SDA','شمال دارفور');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'SKU','شمال كردفان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'SIS','شرق الاستوائية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'SNR','سنار');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'WRB','واراب');

INSERT INTO osc_countries VALUES (200,'Suriname','SR','SUR','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'BR','Brokopondo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'CM','Commewijne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'CR','Coronie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'MA','Marowijne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'NI','Nickerie');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'PM','Paramaribo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'PR','Para');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'SA','Saramacca');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'SI','Sipaliwini');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'WA','Wanica');

INSERT INTO osc_countries VALUES (201,'Svalbard and Jan Mayen Islands','SJ','SJM','');

INSERT INTO osc_countries VALUES (202,'Swaziland','SZ','SWZ','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (202,'HH','Hhohho');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (202,'LU','Lubombo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (202,'MA','Manzini');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (202,'SH','Shiselweni');

INSERT INTO osc_countries VALUES (203,'Sweden','SE','SWE',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'AB','Stockholms län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'C','Uppsala län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'D','Södermanlands län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'E','Östergötlands län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'F','Jönköpings län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'G','Kronobergs län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'H','Kalmar län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'I','Gotlands län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'K','Blekinge län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'M','Skåne län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'N','Hallands län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'O','Västra Götalands län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'S','Värmlands län;');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'T','Örebro län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'U','Västmanlands län;');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'W','Dalarnas län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'X','Gävleborgs län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'Y','Västernorrlands län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'Z','Jämtlands län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'AC','Västerbottens län');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'BD','Norrbottens län');

INSERT INTO osc_countries VALUES (204,'Switzerland','CH','CHE',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'ZH','Zürich');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'BE','Bern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'LU','Luzern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'UR','Uri');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'SZ','Schwyz');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'OW','Obwalden');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'NW','Nidwalden');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'GL','Glasrus');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'ZG','Zug');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'FR','Fribourg');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'SO','Solothurn');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'BS','Basel-Stadt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'BL','Basel-Landschaft');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'SH','Schaffhausen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'AR','Appenzell Ausserrhoden');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'AI','Appenzell Innerrhoden');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'SG','Saint Gallen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'GR','Graubünden');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'AG','Aargau');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'TG','Thurgau');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'TI','Ticino');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'VD','Vaud');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'VS','Valais');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'NE','Nuechâtel');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'GE','Genève');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'JU','Jura');

INSERT INTO osc_countries VALUES (205,'Syrian Arab Republic','SY','SYR','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'DI','دمشق');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'DR','درعا');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'DZ','دير الزور');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'HA','الحسكة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'HI','حمص');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'HL','حلب');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'HM','حماه');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'ID','ادلب');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'LA','اللاذقية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'QU','القنيطرة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'RA','الرقة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'RD','ریف دمشق');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'SU','السويداء');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'TA','طرطوس');

INSERT INTO osc_countries VALUES (206,'Taiwan','TW','TWN',":name\n:street_address\n:city :postcode\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'CHA','彰化縣');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'CYI','嘉義市');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'CYQ','嘉義縣');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'HSQ','新竹縣');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'HSZ','新竹市');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'HUA','花蓮縣');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'ILA','宜蘭縣');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'KEE','基隆市');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'KHH','高雄市');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'KHQ','高雄縣');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'MIA','苗栗縣');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'NAN','南投縣');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'PEN','澎湖縣');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'PIF','屏東縣');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'TAO','桃源县');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'TNN','台南市');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'TNQ','台南縣');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'TPE','臺北市');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'TPQ','臺北縣');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'TTT','台東縣');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'TXG','台中市');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'TXQ','台中縣');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'YUN','雲林縣');

INSERT INTO osc_countries VALUES (207,'Tajikistan','TJ','TJK','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (207,'GB','کوهستان بدخشان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (207,'KT','ختلان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (207,'SU','سغد');

INSERT INTO osc_countries VALUES (208,'Tanzania','TZ','TZA','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'01','Arusha');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'02','Dar es Salaam');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'03','Dodoma');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'04','Iringa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'05','Kagera');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'06','Pemba Sever');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'07','Zanzibar Sever');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'08','Kigoma');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'09','Kilimanjaro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'10','Pemba Jih');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'11','Zanzibar Jih');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'12','Lindi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'13','Mara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'14','Mbeya');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'15','Zanzibar Západ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'16','Morogoro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'17','Mtwara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'18','Mwanza');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'19','Pwani');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'20','Rukwa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'21','Ruvuma');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'22','Shinyanga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'23','Singida');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'24','Tabora');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'25','Tanga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'26','Manyara');

INSERT INTO osc_countries VALUES (209,'Thailand','TH','THA','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-10','กรุงเทพมหานคร');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-11','สมุทรปราการ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-12','นนทบุรี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-13','ปทุมธานี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-14','พระนครศรีอยุธยา');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-15','อ่างทอง');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-16','ลพบุรี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-17','สิงห์บุรี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-18','ชัยนาท');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-19','สระบุรี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-20','ชลบุรี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-21','ระยอง');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-22','จันทบุรี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-23','ตราด');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-24','ฉะเชิงเทรา');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-25','ปราจีนบุรี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-26','นครนายก');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-27','สระแก้ว');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-30','นครราชสีมา');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-31','บุรีรัมย์');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-32','สุรินทร์');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-33','ศรีสะเกษ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-34','อุบลราชธานี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-35','ยโสธร');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-36','ชัยภูมิ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-37','อำนาจเจริญ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-39','หนองบัวลำภู');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-40','ขอนแก่น');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-41','อุดรธานี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-42','เลย');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-43','หนองคาย');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-44','มหาสารคาม');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-45','ร้อยเอ็ด');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-46','กาฬสินธุ์');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-47','สกลนคร');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-48','นครพนม');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-49','มุกดาหาร');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-50','เชียงใหม่');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-51','ลำพูน');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-52','ลำปาง');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-53','อุตรดิตถ์');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-55','น่าน');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-56','พะเยา');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-57','เชียงราย');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-58','แม่ฮ่องสอน');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-60','นครสวรรค์');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-61','อุทัยธานี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-62','กำแพงเพชร');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-63','ตาก');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-64','สุโขทัย');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-66','ชุมพร');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-67','พิจิตร');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-70','ราชบุรี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-71','กาญจนบุรี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-72','สุพรรณบุรี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-73','นครปฐม');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-74','สมุทรสาคร');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-75','สมุทรสงคราม');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-76','เพชรบุรี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-77','ประจวบคีรีขันธ์');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-80','นครศรีธรรมราช');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-81','กระบี่');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-82','พังงา');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-83','ภูเก็ต');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-84','สุราษฎร์ธานี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-85','ระนอง');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-86','ชุมพร');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-90','สงขลา');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-91','สตูล');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-92','ตรัง');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-93','พัทลุง');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-94','ปัตตานี');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-95','ยะลา');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-96','นราธิวาส');

INSERT INTO osc_countries VALUES (210,'Togo','TG','TGO','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (210,'C','Centrale');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (210,'K','Kara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (210,'M','Maritime');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (210,'P','Plateaux');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (210,'S','Savanes');

INSERT INTO osc_countries VALUES (211,'Tokelau','TK','TKL','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (211,'A','Atafu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (211,'F','Fakaofo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (211,'N','Nukunonu');

INSERT INTO osc_countries VALUES (212,'Tonga','TO','TON','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (212,'H','Ha\'apai');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (212,'T','Tongatapu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (212,'V','Vava\'u');

INSERT INTO osc_countries VALUES (213,'Trinidad and Tobago','TT','TTO','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'ARI','Arima');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'CHA','Chaguanas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'CTT','Couva-Tabaquite-Talparo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'DMN','Diego Martin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'ETO','Eastern Tobago');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'RCM','Rio Claro-Mayaro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'PED','Penal-Debe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'PTF','Point Fortin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'POS','Port of Spain');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'PRT','Princes Town');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'SFO','San Fernando');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'SGE','Sangre Grande');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'SJL','San Juan-Laventille');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'SIP','Siparia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'TUP','Tunapuna-Piarco');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'WTO','Western Tobago');

INSERT INTO osc_countries VALUES (214,'Tunisia','TN','TUN','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'11','ولاية تونس');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'12','ولاية أريانة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'13','ولاية بن عروس');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'14','ولاية منوبة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'21','ولاية نابل');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'22','ولاية زغوان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'23','ولاية بنزرت');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'31','ولاية باجة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'32','ولاية جندوبة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'33','ولاية الكاف');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'34','ولاية سليانة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'41','ولاية القيروان');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'42','ولاية القصرين');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'43','ولاية سيدي بوزيد');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'51','ولاية سوسة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'52','ولاية المنستير');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'53','ولاية المهدية');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'61','ولاية صفاقس');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'71','ولاية قفصة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'72','ولاية توزر');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'73','ولاية قبلي');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'81','ولاية قابس');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'82','ولاية مدنين');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'83','ولاية تطاوين');

INSERT INTO osc_countries VALUES (215,'Turkey','TR','TUR','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'01','Adana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'02','Adıyaman');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'03','Afyonkarahisar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'04','Ağrı');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'05','Amasya');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'06','Ankara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'07','Antalya');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'08','Artvin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'09','Aydın');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'10','Balıkesir');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'11','Bilecik');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'12','Bingöl');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'13','Bitlis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'14','Bolu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'15','Burdur');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'16','Bursa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'17','Çanakkale');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'18','Çankırı');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'19','Çorum');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'20','Denizli');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'21','Diyarbakır');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'22','Edirne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'23','Elazığ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'24','Erzincan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'25','Erzurum');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'26','Eskişehir');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'27','Gaziantep');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'28','Giresun');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'29','Gümüşhane');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'30','Hakkari');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'31','Hatay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'32','Isparta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'33','Mersin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'34','İstanbul');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'35','İzmir');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'36','Kars');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'37','Kastamonu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'38','Kayseri');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'39','Kırklareli');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'40','Kırşehir');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'41','Kocaeli');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'42','Konya');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'43','Kütahya');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'44','Malatya');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'45','Manisa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'46','Kahramanmaraş');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'47','Mardin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'48','Muğla');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'49','Muş');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'50','Nevşehir');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'51','Niğde');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'52','Ordu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'53','Rize');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'54','Sakarya');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'55','Samsun');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'56','Siirt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'57','Sinop');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'58','Sivas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'59','Tekirdağ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'60','Tokat');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'61','Trabzon');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'62','Tunceli');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'63','Şanlıurfa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'64','Uşak');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'65','Van');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'66','Yozgat');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'67','Zonguldak');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'68','Aksaray');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'69','Bayburt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'70','Karaman');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'71','Kırıkkale');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'72','Batman');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'73','Şırnak');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'74','Bartın');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'75','Ardahan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'76','Iğdır');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'77','Yalova');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'78','Karabük');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'79','Kilis');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'80','Osmaniye');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'81','Düzce');

INSERT INTO osc_countries VALUES (216,'Turkmenistan','TM','TKM','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (216,'A','Ahal welaýaty');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (216,'B','Balkan welaýaty');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (216,'D','Daşoguz welaýaty');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (216,'L','Lebap welaýaty');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (216,'M','Mary welaýaty');

INSERT INTO osc_countries VALUES (217,'Turks and Caicos Islands','TC','TCA','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'AC','Ambergris Cays');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'DC','Dellis Cay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'FC','French Cay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'LW','Little Water Cay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'RC','Parrot Cay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'PN','Pine Cay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'SL','Salt Cay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'GT','Grand Turk');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'SC','South Caicos');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'EC','East Caicos');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'MC','Middle Caicos');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'NC','North Caicos');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'PR','Providenciales');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'WC','West Caicos');

INSERT INTO osc_countries VALUES (218,'Tuvalu','TV','TUV','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (218,'FUN','Funafuti');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (218,'NMA','Nanumea');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (218,'NMG','Nanumanga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (218,'NIT','Niutao');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (218,'NIU','Nui');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (218,'NKF','Nukufetau');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (218,'NKL','Nukulaelae');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (218,'VAI','Vaitupu');

INSERT INTO osc_countries VALUES (219,'Uganda','UG','UGA','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'101','Kalangala');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'102','Kampala');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'103','Kiboga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'104','Luwero');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'105','Masaka');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'106','Mpigi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'107','Mubende');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'108','Mukono');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'109','Nakasongola');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'110','Rakai');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'111','Sembabule');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'112','Kayunga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'113','Wakiso');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'201','Bugiri');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'202','Busia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'203','Iganga');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'204','Jinja');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'205','Kamuli');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'206','Kapchorwa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'207','Katakwi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'208','Kumi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'209','Mbale');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'210','Pallisa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'211','Soroti');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'212','Tororo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'213','Kaberamaido');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'214','Mayuge');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'215','Sironko');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'301','Adjumani');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'302','Apac');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'303','Arua');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'304','Gulu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'305','Kitgum');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'306','Kotido');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'307','Lira');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'308','Moroto');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'309','Moyo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'310','Nebbi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'311','Nakapiripirit');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'312','Pader');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'313','Yumbe');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'401','Bundibugyo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'402','Bushenyi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'403','Hoima');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'404','Kabale');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'405','Kabarole');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'406','Kasese');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'407','Kibale');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'408','Kisoro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'409','Masindi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'410','Mbarara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'411','Ntungamo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'412','Rukungiri');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'413','Kamwenge');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'414','Kanungu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'415','Kyenjojo');

INSERT INTO osc_countries VALUES (220,'Ukraine','UA','UKR','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'05','Вінницька область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'07','Волинська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'09','Луганська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'12','Дніпропетровська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'14','Донецька область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'18','Житомирська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'19','Рівненська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'21','Закарпатська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'23','Запорізька область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'26','Івано-Франківська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'30','Київ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'32','Київська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'35','Кіровоградська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'40','Севастополь');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'43','Автономная Республика Крым');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'46','Львівська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'48','Миколаївська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'51','Одеська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'53','Полтавська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'59','Сумська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'61','Тернопільська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'63','Харківська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'65','Херсонська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'68','Хмельницька область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'71','Черкаська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'74','Чернігівська область');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'77','Чернівецька область');

INSERT INTO osc_countries VALUES (221,'United Arab Emirates','AE','ARE','');

INSERT INTO osc_countries VALUES (222,'United Kingdom','GB','GBR',":name\n:street_address\n:city\n:postcode\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ABD','Aberdeenshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ABE','Aberdeen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'AGB','Argyll and Bute');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'AGY','Isle of Anglesey');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ANS','Angus');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ANT','Antrim');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ARD','Ards');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ARM','Armagh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BAS','Bath and North East Somerset');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BBD','Blackburn with Darwen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BDF','Bedfordshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BDG','Barking and Dagenham');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BEN','Brent');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BEX','Bexley');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BFS','Belfast');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BGE','Bridgend');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BGW','Blaenau Gwent');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BIR','Birmingham');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BKM','Buckinghamshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BLA','Ballymena');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BLY','Ballymoney');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BMH','Bournemouth');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BNB','Banbridge');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BNE','Barnet');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BNH','Brighton and Hove');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BNS','Barnsley');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BOL','Bolton');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BPL','Blackpool');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BRC','Bracknell');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BRD','Bradford');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BRY','Bromley');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BST','Bristol');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BUR','Bury');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CAM','Cambridgeshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CAY','Caerphilly');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CGN','Ceredigion');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CGV','Craigavon');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CHS','Cheshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CKF','Carrickfergus');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CKT','Cookstown');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CLD','Calderdale');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CLK','Clackmannanshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CLR','Coleraine');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CMA','Cumbria');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CMD','Camden');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CMN','Carmarthenshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CON','Cornwall');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'COV','Coventry');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CRF','Cardiff');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CRY','Croydon');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CSR','Castlereagh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CWY','Conwy');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DAL','Darlington');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DBY','Derbyshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DEN','Denbighshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DER','Derby');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DEV','Devon');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DGN','Dungannon and South Tyrone');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DGY','Dumfries and Galloway');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DNC','Doncaster');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DND','Dundee');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DOR','Dorset');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DOW','Down');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DRY','Derry');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DUD','Dudley');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DUR','Durham');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'EAL','Ealing');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'EAY','East Ayrshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'EDH','Edinburgh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'EDU','East Dunbartonshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ELN','East Lothian');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ELS','Eilean Siar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ENF','Enfield');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ERW','East Renfrewshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ERY','East Riding of Yorkshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ESS','Essex');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ESX','East Sussex');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'FAL','Falkirk');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'FER','Fermanagh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'FIF','Fife');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'FLN','Flintshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'GAT','Gateshead');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'GLG','Glasgow');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'GLS','Gloucestershire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'GRE','Greenwich');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'GSY','Guernsey');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'GWN','Gwynedd');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HAL','Halton');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HAM','Hampshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HAV','Havering');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HCK','Hackney');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HEF','Herefordshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HIL','Hillingdon');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HLD','Highland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HMF','Hammersmith and Fulham');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HNS','Hounslow');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HPL','Hartlepool');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HRT','Hertfordshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HRW','Harrow');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HRY','Haringey');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'IOS','Isles of Scilly');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'IOW','Isle of Wight');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ISL','Islington');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'IVC','Inverclyde');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'JSY','Jersey');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'KEC','Kensington and Chelsea');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'KEN','Kent');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'KHL','Kingston upon Hull');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'KIR','Kirklees');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'KTT','Kingston upon Thames');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'KWL','Knowsley');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LAN','Lancashire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LBH','Lambeth');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LCE','Leicester');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LDS','Leeds');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LEC','Leicestershire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LEW','Lewisham');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LIN','Lincolnshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LIV','Liverpool');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LMV','Limavady');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LND','London');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LRN','Larne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LSB','Lisburn');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LUT','Luton');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MAN','Manchester');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MDB','Middlesbrough');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MDW','Medway');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MFT','Magherafelt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MIK','Milton Keynes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MLN','Midlothian');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MON','Monmouthshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MRT','Merton');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MRY','Moray');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MTY','Merthyr Tydfil');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MYL','Moyle');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NAY','North Ayrshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NBL','Northumberland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NDN','North Down');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NEL','North East Lincolnshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NET','Newcastle upon Tyne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NFK','Norfolk');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NGM','Nottingham');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NLK','North Lanarkshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NLN','North Lincolnshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NSM','North Somerset');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NTA','Newtownabbey');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NTH','Northamptonshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NTL','Neath Port Talbot');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NTT','Nottinghamshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NTY','North Tyneside');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NWM','Newham');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NWP','Newport');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NYK','North Yorkshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NYM','Newry and Mourne');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'OLD','Oldham');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'OMH','Omagh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ORK','Orkney Islands');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'OXF','Oxfordshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'PEM','Pembrokeshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'PKN','Perth and Kinross');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'PLY','Plymouth');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'POL','Poole');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'POR','Portsmouth');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'POW','Powys');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'PTE','Peterborough');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'RCC','Redcar and Cleveland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'RCH','Rochdale');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'RCT','Rhondda Cynon Taf');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'RDB','Redbridge');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'RDG','Reading');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'RFW','Renfrewshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'RIC','Richmond upon Thames');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ROT','Rotherham');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'RUT','Rutland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SAW','Sandwell');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SAY','South Ayrshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SCB','Scottish Borders');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SFK','Suffolk');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SFT','Sefton');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SGC','South Gloucestershire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SHF','Sheffield');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SHN','Saint Helens');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SHR','Shropshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SKP','Stockport');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SLF','Salford');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SLG','Slough');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SLK','South Lanarkshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SND','Sunderland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SOL','Solihull');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SOM','Somerset');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SOS','Southend-on-Sea');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SRY','Surrey');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'STB','Strabane');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'STE','Stoke-on-Trent');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'STG','Stirling');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'STH','Southampton');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'STN','Sutton');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'STS','Staffordshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'STT','Stockton-on-Tees');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'STY','South Tyneside');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SWA','Swansea');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SWD','Swindon');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SWK','Southwark');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'TAM','Tameside');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'TFW','Telford and Wrekin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'THR','Thurrock');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'TOB','Torbay');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'TOF','Torfaen');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'TRF','Trafford');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'TWH','Tower Hamlets');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'VGL','Vale of Glamorgan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WAR','Warwickshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WBK','West Berkshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WDU','West Dunbartonshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WFT','Waltham Forest');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WGN','Wigan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WIL','Wiltshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WKF','Wakefield');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WLL','Walsall');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WLN','West Lothian');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WLV','Wolverhampton');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WNM','Windsor and Maidenhead');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WOK','Wokingham');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WOR','Worcestershire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WRL','Wirral');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WRT','Warrington');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WRX','Wrexham');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WSM','Westminster');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WSX','West Sussex');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'YOR','York');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ZET','Shetland Islands');

INSERT INTO osc_countries VALUES (223,'United States of America','US','USA',":name\n:street_address\n:city :state_code :postcode\n:country");

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'AK','Alaska');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'AL','Alabama');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'AS','American Samoa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'AR','Arkansas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'AZ','Arizona');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'CA','California');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'CO','Colorado');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'CT','Connecticut');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'DC','District of Columbia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'DE','Delaware');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'FL','Florida');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'GA','Georgia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'GU','Guam');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'HI','Hawaii');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'IA','Iowa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'ID','Idaho');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'IL','Illinois');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'IN','Indiana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'KS','Kansas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'KY','Kentucky');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'LA','Louisiana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'MA','Massachusetts');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'MD','Maryland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'ME','Maine');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'MI','Michigan');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'MN','Minnesota');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'MO','Missouri');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'MS','Mississippi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'MT','Montana');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'NC','North Carolina');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'ND','North Dakota');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'NE','Nebraska');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'NH','New Hampshire');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'NJ','New Jersey');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'NM','New Mexico');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'NV','Nevada');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'NY','New York');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'MP','Northern Mariana Islands');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'OH','Ohio');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'OK','Oklahoma');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'OR','Oregon');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'PA','Pennsylvania');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'PR','Puerto Rico');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'RI','Rhode Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'SC','South Carolina');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'SD','South Dakota');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'TN','Tennessee');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'TX','Texas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'UM','U.S. Minor Outlying Islands');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'UT','Utah');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'VA','Virginia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'VI','Virgin Islands of the U.S.');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'VT','Vermont');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'WA','Washington');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'WI','Wisconsin');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'WV','West Virginia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'WY','Wyoming');

INSERT INTO osc_countries VALUES (224,'United States Minor Outlying Islands','UM','UMI','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'BI','Baker Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'HI','Howland Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'JI','Jarvis Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'JA','Johnston Atoll');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'KR','Kingman Reef');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'MA','Midway Atoll');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'NI','Navassa Island');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'PA','Palmyra Atoll');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'WI','Wake Island');

INSERT INTO osc_countries VALUES (225,'Uruguay','UY','URY','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'AR','Artigas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'CA','Canelones');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'CL','Cerro Largo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'CO','Colonia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'DU','Durazno');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'FD','Florida');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'FS','Flores');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'LA','Lavalleja');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'MA','Maldonado');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'MO','Montevideo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'PA','Paysandu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'RN','Río Negro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'RO','Rocha');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'RV','Rivera');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'SA','Salto');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'SJ','San José');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'SO','Soriano');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'TA','Tacuarembó');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'TT','Treinta y Tres');

INSERT INTO osc_countries VALUES (226,'Uzbekistan','UZ','UZB','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'AN','Andijon viloyati');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'BU','Buxoro viloyati');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'FA','Farg\'ona viloyati');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'JI','Jizzax viloyati');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'NG','Namangan viloyati');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'NW','Navoiy viloyati');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'QA','Qashqadaryo viloyati');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'QR','Qoraqalpog\'iston Respublikasi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'SA','Samarqand viloyati');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'SI','Sirdaryo viloyati');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'SU','Surxondaryo viloyati');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'TK','Toshkent');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'TO','Toshkent viloyati');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'XO','Xorazm viloyati');

INSERT INTO osc_countries VALUES (227,'Vanuatu','VU','VUT','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (227,'MAP','Malampa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (227,'PAM','Pénama');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (227,'SAM','Sanma');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (227,'SEE','Shéfa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (227,'TAE','Taféa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (227,'TOB','Torba');

INSERT INTO osc_countries VALUES (228,'Vatican City State (Holy See)','VA','VAT','');

INSERT INTO osc_countries VALUES (229,'Venezuela','VE','VEN','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'A','Distrito Capital');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'B','Anzoátegui');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'C','Apure');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'D','Aragua');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'E','Barinas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'F','Bolívar');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'G','Carabobo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'H','Cojedes');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'I','Falcón');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'J','Guárico');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'K','Lara');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'L','Mérida');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'M','Miranda');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'N','Monagas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'O','Nueva Esparta');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'P','Portuguesa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'R','Sucre');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'S','Tachira');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'T','Trujillo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'U','Yaracuy');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'V','Zulia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'W','Capital Dependencia');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'X','Vargas');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'Y','Delta Amacuro');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'Z','Amazonas');

INSERT INTO osc_countries VALUES (230,'Vietnam','VN','VNM','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'01','Lai Châu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'02','Lào Cai');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'03','Hà Giang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'04','Cao Bằng');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'05','Sơn La');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'06','Yên Bái');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'07','Tuyên Quang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'09','Lạng Sơn');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'13','Quảng Ninh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'14','Hòa Bình');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'15','Hà Tây');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'18','Ninh Bình');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'20','Thái Bình');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'21','Thanh Hóa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'22','Nghệ An');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'23','Hà Tĩnh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'24','Quảng Bình');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'25','Quảng Trị');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'26','Thừa Thiên-Huế');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'27','Quảng Nam');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'28','Kon Tum');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'29','Quảng Ngãi');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'30','Gia Lai');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'31','Bình Định');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'32','Phú Yên');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'33','Đắk Lắk');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'34','Khánh Hòa');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'35','Lâm Đồng');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'36','Ninh Thuận');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'37','Tây Ninh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'39','Đồng Nai');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'40','Bình Thuận');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'41','Long An');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'43','Bà Rịa-Vũng Tàu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'44','An Giang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'45','Đồng Tháp');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'46','Tiền Giang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'47','Kiên Giang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'48','Cần Thơ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'49','Vĩnh Long');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'50','Bến Tre');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'51','Trà Vinh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'52','Sóc Trăng');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'53','Bắc Kạn');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'54','Bắc Giang');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'55','Bạc Liêu');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'56','Bắc Ninh');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'57','Bình Dương');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'58','Bình Phước');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'59','Cà Mau');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'60','Đà Nẵng');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'61','Hải Dương');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'62','Hải Phòng');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'63','Hà Nam');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'64','Hà Nội');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'65','Sài Gòn');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'66','Hưng Yên');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'67','Nam Định');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'68','Phú Thọ');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'69','Thái Nguyên');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'70','Vĩnh Phúc');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'71','Điện Biên');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'72','Đắk Nông');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'73','Hậu Giang');

INSERT INTO osc_countries VALUES (231,'Virgin Islands (British)','VG','VGB','');
INSERT INTO osc_countries VALUES (232,'Virgin Islands (U.S.)','VI','VIR','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (232,'C','Saint Croix');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (232,'J','Saint John');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (232,'T','Saint Thomas');

INSERT INTO osc_countries VALUES (233,'Wallis and Futuna Islands','WF','WLF','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (233,'A','Alo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (233,'S','Sigave');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (233,'W','Wallis');

INSERT INTO osc_countries VALUES (234,'Western Sahara','EH','ESH','');
INSERT INTO osc_countries VALUES (235,'Yemen','YE','YEM','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'AB','أبين‎');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'AD','عدن');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'AM','عمران');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'BA','البيضاء');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'DA','الضالع');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'DH','ذمار');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'HD','حضرموت');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'HJ','حجة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'HU','الحديدة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'IB','إب');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'JA','الجوف');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'LA','لحج');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'MA','مأرب');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'MR','المهرة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'MW','المحويت');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'SD','صعدة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'SN','صنعاء');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'SH','شبوة');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'TA','تعز');

INSERT INTO osc_countries VALUES (236,'Yugoslavia','YU','YUG','');
INSERT INTO osc_countries VALUES (237,'Zaire','ZR','ZAR','');

INSERT INTO osc_countries VALUES (238,'Zambia','ZM','ZMB','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'01','Western');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'02','Central');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'03','Eastern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'04','Luapula');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'05','Northern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'06','North-Western');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'07','Southern');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'08','Copperbelt');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'09','Lusaka');

INSERT INTO osc_countries VALUES (239,'Zimbabwe','ZW','ZWE','');

INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (239,'MA','Manicaland');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (239,'MC','Mashonaland Central');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (239,'ME','Mashonaland East');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (239,'MI','Midlands');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (239,'MN','Matabeleland North');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (239,'MS','Matabeleland South');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (239,'MV','Masvingo');
INSERT INTO osc_zones (zone_country_id, zone_code, zone_name) VALUES (239,'MW','Mashonaland West');

# Regular expression patterns from http://www.creditcardcode.net
INSERT INTO osc_credit_cards VALUES (1,'American Express','/^(34|37)\\d{13}$/','0','0');
INSERT INTO osc_credit_cards VALUES (2,'Diners Club','/^(30|36|38)\\d{12}$/','0','0');
INSERT INTO osc_credit_cards VALUES (3,'JCB','/^((2131|1800)\\d{11}|3[0135]\\d{14})$/','0','0');
INSERT INTO osc_credit_cards VALUES (4,'MasterCard','/^5[1-5]\\d{14}$/','1','0');
INSERT INTO osc_credit_cards VALUES (5,'Visa','/^4\\d{12}(\\d{3})?$/','1','0');
INSERT INTO osc_credit_cards VALUES (6,'Discover Card','/^6011\\d{12}$/','0','0');
INSERT INTO osc_credit_cards VALUES (7,'Solo','/^(63|67)\\d{14}(\\d{2,3})?$/','0','0');
INSERT INTO osc_credit_cards VALUES (8,'Switch','/^(49|56|63|67)\\d{14}(\\d{2,3})?$/','0','0');
INSERT INTO osc_credit_cards VALUES (9,'Australian Bankcard','/^5610\\d{12}$/','0','0');
INSERT INTO osc_credit_cards VALUES (10,'enRoute','/^(2014|2149)\\d{11}$/','0','0');
INSERT INTO osc_credit_cards VALUES (11,'Laser','/^6304\\d{12}(\\d{2,3})?$/','0','0');
INSERT INTO osc_credit_cards VALUES (12,'Maestro','/^(50|56|57|58|6)/','0','0');
INSERT INTO osc_credit_cards VALUES (13,'Saferpay Test Card','/^9451123100000004$/','0','0');

INSERT INTO osc_currencies VALUES (1,'Российский рубль','RUB','',' руб.','2','1.0000', now());
INSERT INTO osc_currencies VALUES (2,'Dollar USA','USD','$','','2','0.0315', now());
INSERT INTO osc_currencies VALUES (3,'Euro','EUR','€','','2','0.0220', now());

INSERT INTO osc_languages VALUES (1,'Russian','ru_RU','ru_RU.UTF-8,ru_RU,russian','utf-8','%d.%m.%Y','%d.%m.%Y','%H:%M:%S','ltr',1,'.',',',0,1);

INSERT INTO osc_orders_status VALUES ( '1', '1', 'Оплачен');
INSERT INTO osc_orders_status VALUES ( '2', '1', 'Обрабатывается');
INSERT INTO osc_orders_status VALUES ( '3', '1', 'Доставлен');
INSERT INTO osc_orders_status VALUES ( '4', '1', 'Ожидает оплаты');

INSERT INTO osc_orders_transactions_status VALUES ( '1', '1', 'Платеж авторизируется');
INSERT INTO osc_orders_transactions_status VALUES ( '2', '1', 'Платеж отменен');
INSERT INTO osc_orders_transactions_status VALUES ( '3', '1', 'Платеж зачислен');
INSERT INTO osc_orders_transactions_status VALUES ( '4', '1', 'Производится запрос');

INSERT INTO osc_products_images_groups values (1, 1, 'Оригиналы', 'originals', 0, 0, 0);
INSERT INTO osc_products_images_groups values (2, 1, 'Эскизы', 'thumbnails', 104, 78, 0);
INSERT INTO osc_products_images_groups values (3, 1, 'Информационная страница товара', 'product_info', 192, 144, 0);
INSERT INTO osc_products_images_groups values (4, 1, 'Большие', 'large', 1024, 768, 0);
INSERT INTO osc_products_images_groups values (5, 1, 'Мини', 'mini', 52, 39, 0);

INSERT INTO osc_tax_class VALUES (1, 'НДС 18%', 'Налог на добавочную стоимость', now(), now());

# Russia/NDS
INSERT INTO osc_tax_rates VALUES (1, 1, 1, 1, 18.0, 'НДС 18.0%', now(), now());
INSERT INTO osc_geo_zones (geo_zone_id,geo_zone_name,geo_zone_description,date_added) VALUES (1,"Все регионы Российской Федерации","Все регионы Российской Федерации - для вычета НДС",now());
INSERT INTO osc_zones_to_geo_zones (association_id,zone_country_id,zone_id,geo_zone_id,date_added) VALUES (1,176,0,1,now());

# Templates

INSERT INTO osc_templates VALUES (1, 'Richer Designs Template', 'richer_designs', 'Richer Designs', 'http://www.richerdesigns.com', 'XHTML 1.0 Transitional', 1, 'Screen');

INSERT INTO osc_templates_boxes VALUES (1,'Бестселлеры','best_sellers','osCommerce','http://www.oscommerce.com','boxes');
INSERT INTO osc_templates_boxes VALUES (2,'Категории','categories','osCommerce','http://www.oscommerce.com','boxes');
INSERT INTO osc_templates_boxes VALUES (3,'Валюты','currencies','osCommerce','http://www.oscommerce.com','boxes');
INSERT INTO osc_templates_boxes VALUES (4,'Информация','information','osCommerce','http://www.oscommerce.com','boxes');
INSERT INTO osc_templates_boxes VALUES (5,'Языки','languages','osCommerce','http://www.oscommerce.com','boxes');
INSERT INTO osc_templates_boxes VALUES (6,'О производителе','manufacturer_info','osCommerce','http://www.oscommerce.com','boxes');
INSERT INTO osc_templates_boxes VALUES (7,'Производители','manufacturers','osCommerce','http://www.oscommerce.com','boxes');
INSERT INTO osc_templates_boxes VALUES (8,'История заказов','order_history','osCommerce','http://www.oscommerce.com','boxes');
INSERT INTO osc_templates_boxes VALUES (9,'Уведомления о товарах','product_notifications','osCommerce','http://www.oscommerce.com','boxes');
INSERT INTO osc_templates_boxes VALUES (10,'Отзывы','reviews','osCommerce','http://www.oscommerce.com','boxes');
INSERT INTO osc_templates_boxes VALUES (11,'Поиск','search','osCommerce','http://www.oscommerce.com','boxes');
INSERT INTO osc_templates_boxes VALUES (12,'Корзина','shopping_cart','osCommerce','http://www.oscommerce.com','boxes');
INSERT INTO osc_templates_boxes VALUES (13,'Специальная цена','specials','osCommerce','http://www.oscommerce.com','boxes');
INSERT INTO osc_templates_boxes VALUES (14,'Сообщить другу','tell_a_friend','osCommerce','http://www.oscommerce.com','boxes');
INSERT INTO osc_templates_boxes VALUES (15,'Новые товары','whats_new','osCommerce','http://www.oscommerce.com','boxes');
INSERT INTO osc_templates_boxes VALUES (16,'Новые товары','new_products','osCommerce','http://www.oscommerce.com','content');
INSERT INTO osc_templates_boxes VALUES (17,'Ожидаемые товары','upcoming_products','osCommerce','http://www.oscommerce.com','content');
INSERT INTO osc_templates_boxes VALUES (18,'Недавние посещения','recently_visited','osCommerce','http://www.oscommerce.com','content');
INSERT INTO osc_templates_boxes VALUES (19,'Также покупаемые товары','also_purchased_products','osCommerce','http://www.oscommerce.com','content');
INSERT INTO osc_templates_boxes VALUES (20,'Дата поступления товара','date_available','osCommerce','http://www.oscommerce.com','product_attributes');
INSERT INTO osc_templates_boxes VALUES (21,'Производители','manufacturers','osCommerce','http://www.oscommerce.com','product_attributes');
INSERT INTO osc_templates_boxes VALUES (22,'Шаблоны','templates','osCommerce','http://www.oscommerce.com','boxes');
INSERT INTO osc_templates_boxes VALUES (23,'Слайдшоу','slide_show','osCommerce','http://www.oscommerce.com','content');
INSERT INTO osc_templates_boxes VALUES (24,'Статьи','cms','Box 25','http://www.box25.net','boxes');
INSERT INTO osc_templates_boxes VALUES (25,'Статьи','cms_sitemap','Gergely','http://www.oscommerce-extra.hu','content');
INSERT INTO osc_templates_boxes VALUES (26,'Прикрепленные статьи','cms_xsell','Gergely','http://www.oscommerce-extra.hu','content');
INSERT INTO osc_templates_boxes VALUES (27,'Прикрепленные товары','cms_xsell_products','Gergely','http://www.oscommerce-extra.hu','content');
INSERT INTO osc_templates_boxes VALUES (28,'Шаги заказа','checkout_trail','osCommerce','http://www.oscommerce.com','content');

INSERT INTO osc_templates_boxes_to_pages VALUES (1,2,1,'*','left',100,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (2,7,1,'*','left',200,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (3,15,1,'*','left',300,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (4,11,1,'*','left',400,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (5,4,1,'*','left',500,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (6,12,1,'*','right',100,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (7,6,1,'products/info','right',200,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (8,8,1,'*','right',300,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (9,1,1,'*','right',400,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (10,9,1,'products/info','right',500,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (11,14,1,'products/info','right',600,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (12,13,1,'*','right',700,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (13,10,1,'*','right',800,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (14,5,1,'*','right',900,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (15,3,1,'*','right',1000,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (16,16,1,'index/category_listing','after',400,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (17,16,1,'index/index','after',400,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (18,17,1,'index/index','after',450,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (19,18,1,'*','after',500,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (20,19,1,'products/info','after',100,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (21,22,1,'*','left',600,0);
INSERT INTO osc_templates_boxes_to_pages VALUES (22, 23, 1, 'index/index', 'slideshow', 100, 0);
INSERT INTO osc_templates_boxes_to_pages VALUES (23, 25, 1, 'info/info_sitemap', 'after', 200, 0);
INSERT INTO osc_templates_boxes_to_pages VALUES (24, 26, 1, 'products/*', 'after', 200, 0);
INSERT INTO osc_templates_boxes_to_pages VALUES (25, 27, 1, 'cms/view', 'after', 200, 0);
INSERT INTO osc_templates_boxes_to_pages VALUES (26, 28, 1, 'checkout/*', 'before', 100, 0);
INSERT INTO osc_templates_boxes_to_pages VALUES (27, 24, 1, '*', 'right', 1100, 0);

INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Минимальный размер листинга', 'BOX_BEST_SELLERS_MIN_LIST', '3', 'Минимальное количество товаров, показываемых в списке', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Максимальный размер листинга', 'BOX_BEST_SELLERS_MAX_LIST', '10', 'Максимальное количество товаров, показываемых в списке', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Кэширование контента', 'BOX_BEST_SELLERS_CACHE', '60', 'Количество минут для кэширования контента (0 = без кэша)', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) values ('Показывать количество товара', 'BOX_CATEGORIES_SHOW_PRODUCT_COUNT', '1', 'Показывать количество товара в каждой категории', '6', '0', 'osc_cfg_use_get_boolean_value', 'osc_cfg_set_boolean_value(array(1, -1))', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Размер листинга производителей', 'BOX_MANUFACTURERS_LIST_SIZE', '1', 'Размер производителей в листинге всплывающего меню', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Максимальный размер листинга', 'BOX_ORDER_HISTORY_MAX_LIST', '5', 'Максимальное количество товаров, показываемых в листинге', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Случайный показ отзывов', 'BOX_REVIEWS_RANDOM_SELECT', '10', 'Выберите случайные отзывы из количества самых новых доступных отзывов', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Кэширование контента', 'BOX_REVIEWS_CACHE', '1', 'Количество минут для кэширования контента (0 = без кэша)', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Случайный показ специальных цен товаров', 'BOX_SPECIALS_RANDOM_SELECT', '10', 'Выберите количество специальных товаров из этих товаров для случайного отображения', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Кэширование контента', 'BOX_SPECIALS_CACHE', '1', 'Количество минут для кэширования контента (0 = без кэша)', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Случайный показ новых товаров', 'BOX_WHATS_NEW_RANDOM_SELECT', '10', 'Выберите случайный новый товар из этого количества самых новых доступных товаров', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Кэширование контента', 'BOX_WHATS_NEW_CACHE', '1', 'Количество минут для кэширования контента (0 = без кэша)', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Максимальное количество новых товаров', 'MODULE_CONTENT_NEW_PRODUCTS_MAX_DISPLAY', '9', 'Максимальное количество отображаемых новых товаров', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Кэширование контента', 'MODULE_CONTENT_NEW_PRODUCTS_CACHE', '60', 'Количество минут для кэширования контента (0 = без кэша)', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Минимум купленных товаров вместе с товаром', 'MODULE_CONTENT_ALSO_PURCHASED_MIN_DISPLAY', '1', 'Минимальное количество товаров, отображаемых как купленных вместе с этим товаром', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Максимум купленных товаров вместе с товаром', 'MODULE_CONTENT_ALSO_PURCHASED_MAX_DISPLAY', '6', 'Максимальное количество товаров, отображаемых как купленных вместе с этим товаром', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Кэширование контента', 'MODULE_CONTENT_ALSO_PURCHASED_PRODUCTS_CACHE', '60', 'Количество минут для кэширования контента (0 = без кэша)', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Максимум ожидаемых товаров', 'MODULE_CONTENT_UPCOMING_PRODUCTS_MAX_DISPLAY', '10', 'Максимальное количество ожидаемых товаров, отображаемых на дисплее', '6', '0', now());
INSERT INTO osc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Кэширование контента', 'MODULE_CONTENT_UPCOMING_PRODUCTS_CACHE', '1440', 'Количество минут для кэширования контента (0 = без кэша)', '6', '0', now());

# Weight Classes
INSERT INTO osc_weight_classes VALUES (1, 'г', 1, 'Граммы');
INSERT INTO osc_weight_classes VALUES (2, 'кг', 1, 'Килограммы');
INSERT INTO osc_weight_classes VALUES (3, 'oz', 1, 'Унции');
INSERT INTO osc_weight_classes VALUES (4, 'lb', 1, 'Фунты');

INSERT INTO osc_weight_classes_rules VALUES (1, 2, '0.0010');
INSERT INTO osc_weight_classes_rules VALUES (1, 3, '0.0352');
INSERT INTO osc_weight_classes_rules VALUES (1, 4, '0.0022');
INSERT INTO osc_weight_classes_rules VALUES (2, 1, '1000.0000');
INSERT INTO osc_weight_classes_rules VALUES (2, 3, '35.2739');
INSERT INTO osc_weight_classes_rules VALUES (2, 4, '2.2046');
INSERT INTO osc_weight_classes_rules VALUES (3, 1, '28.3495');
INSERT INTO osc_weight_classes_rules VALUES (3, 2, '0.0283');
INSERT INTO osc_weight_classes_rules VALUES (3, 4, '0.0625');
INSERT INTO osc_weight_classes_rules VALUES (4, 1, '453.5923');
INSERT INTO osc_weight_classes_rules VALUES (4, 2, '0.4535');
INSERT INTO osc_weight_classes_rules VALUES (4, 3, '16.0000');

#Info
INSERT INTO osc_info (info_id, language_id, info_name, info_description, active, date_added, last_modified, sort_order) VALUES (1, 1, 'Приватность', 'Здесь должна быть указана необходимая информация.', 1, now(), 0, 2);
INSERT INTO osc_info (info_id, language_id, info_name, info_description, active, date_added, last_modified, sort_order) VALUES (2, 1, 'Условия магазина', 'Здесь должна быть указана необходимая информация.', 1, now(), 0, 3);
INSERT INTO osc_info (info_id, language_id, info_name, info_description, active, date_added, last_modified, sort_order) VALUES (3, 1, 'Доставка и возврат', 'Здесь должна быть указана необходимая информация.', 1, now(), 0, 1);
