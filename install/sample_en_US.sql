#Slide show
INSERT INTO osc_slide_images (image_id, language_id, image, image_url, sort_order, status) VALUES
(1, 1, 'dell.png', 'products.php?dell1', 0, 1),
(2, 1, 'apple.png', 'products.php?apple1', 0, 1),
(3, 1, 'hp.png', 'products.php?hp1', 0, 1);

#CMS
INSERT INTO osc_cms (cms_id, language_id, cms_name, cms_description, cms_short_text, active, date_added, last_modified) VALUES
(1, 1, 'Your first article', 'It should be indicated, the information is complete.', 'It should be stated briefly, the information.',1, now(), 0);

#manufacturers
INSERT INTO osc_manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) VALUES 
(1, 'Apple', 'apple.png', now(), now()),
(2, 'Dell', 'dell.png', now(), now()),
(3, 'HP', 'hp.png', now(), now()),
(4, 'Lenovo', 'lenovo.png', now(), now());

#manufacturers_info
INSERT INTO osc_manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) VALUES 
(1, 1, 'http://www.apple.ru', 0, NULL),
(2, 1, 'http://www.dell.ru', 0, NULL),
(3, 1, 'http://www.hp.ru', 0, NULL),
(4, 1, 'http://www.lenovo.ru', 0, NULL);

#product categories
INSERT INTO osc_categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) VALUES
(1, 'categories_notebooks.jpg', 0, 0, now(), NULL),
(2, 'categories_desktops.jpg', 0, 0, now(), NULL);

#categories description
INSERT INTO osc_categories_description (categories_id, language_id, categories_name) VALUES
(1, 1, 'Laptop'),
(2, 1, 'Desktops');

#products
INSERT INTO osc_products (products_id, parent_id, products_quantity, products_price, products_model, products_date_added, products_last_modified, products_weight, products_weight_class, products_status, products_tax_class_id, manufacturers_id, products_ordered, has_children) VALUES
(1, 0, 5, 799.0000, 'XPS 630', now(), NULL, 3.50, 2, 1, 0, 2, 0, 0),
(2, 0, 5, 599.0000, 'Pavilion a6433w-b', now(), NULL, 3.70, 2, 1, 0, 3, 0, 0),
(3, 0, 5, 849.0000, 'M57p', now(), NULL, 3.45, 2, 1, 0, 4, 0, 0),
(4, 0, 5, 1099.0000, 'MB134LL/A', now(), NULL, 1.20, 2, 1, 0, 1, 0, 0);

#products description
INSERT INTO osc_products_description (products_id, language_id, products_name, products_description, products_keyword, products_tags, products_url, products_viewed) VALUES
(1, 1, 'Dell XPS 630', 'Dell advertised this computer perfect. The 630 was a nice base computer, with tons of room to expand. So I bought it, added two video cards from navidia in the SLI slots.<br />I maxed out the memory and the hard drives. It had very easy to follow instructions in the owners manual that helped be with upgrades.<br />I also added a card reader and Blue ray. The machine has operated flawlessly. Im frustrated Dell is changing over to this alien ware stuff that gives you less computing and more looks for more money, or I would buy another.<br />Dells customer service is horrible. So hope you don`t have to use it.<br />I had to look up all my questions online. Once they sell you the computer you are pretty much on your own. Dell has been that way for years.', 'dell1', NULL, NULL, 4),
(2, 1, 'HP Pavilion a6433w-b', 'This HP Pavilion a6433w-b desktop includes a 22-inch LCD monitor, and some of the main benefits are a SuperMulti DVD+/-RW drive, 500 GB hard drive, 3 GB of RAM and a 2 GHz Intel Pentium dual-core E2180 processor.', 'hp1', NULL, NULL, 2),
(3, 1, 'ThinkCentre M57p', 'Lenovo`s ThinkCentre M57p is really a hard item to place in the PC world. The system is great for those looking for a general purpose business platform. Much of this is thanks to Lenovo`s excellent warranty and strong support. The problem is that for the cost the consumer ends up with much less PC than what is available from other companies.', 'lenovo1', NULL, NULL, 0),
(4, 1, 'Macbook Pro MB134LL/A', 'MacBook Pro now features Intel Core 2 Duo processors running at up to 2.5GHz, the new NVIDIA GeForce 8600M GT graphics processor, a 1440 x 900 resolution and a system memory expandable up to 4GB. There is a new larger hard drive and a built-in AirPort Extreme wireless 802.11n draft protocol to allow you to connect in more places than ever. Let Apple`s MacBook Pro take you to the top.', 'apple1', NULL, NULL, 5);

#products categories
INSERT INTO osc_products_to_categories (products_id, categories_id) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 1);

#products images
INSERT INTO osc_products_images (id, products_id, image, default_flag, sort_order, date_added) VALUES
(1, 1, '4589430859034895043.jpg', 1, 0, now()),
(2, 2, '5443523452354.jpg', 1, 0, now()),
(3, 3, '437893748943838943.jpg', 1, 0, now()),
(4, 4, '54892437589237584.jpg', 1, 0, now()),
(5, 4, '0904856904586475689.jpg', 0, 0, now()),
(6, 4, '098489508435893845.jpg', 0, 0, now());

#product_attributes
INSERT INTO osc_product_attributes (id, products_id, languages_id, value) VALUES
(21, 1, 0, '2'),
(21, 2, 0, '3'),
(21, 4, 0, '1'),
(21, 3, 0, '4');

