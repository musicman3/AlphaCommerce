#Slide show
INSERT INTO osc_slide_images (image_id, language_id, image, image_url, sort_order, status) VALUES
(1, 1, 'dell.png', 'products.php?dell1', 0, 1),
(2, 1, 'apple.png', 'products.php?apple1', 0, 1),
(3, 1, 'hp.png', 'products.php?hp1', 0, 1);

#CMS
INSERT INTO osc_cms (cms_id, language_id, cms_name, cms_description, cms_short_text, active, date_added, last_modified) VALUES
(1, 1, 'Ваша первая статья', 'Здесь должна быть указана полная необходимая информация.', 'Здесь должна быть указана краткая необходимая информация.',1, now(), 0);

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
(1, 1, 'Ноутбуки'),
(2, 1, 'Настольные');

#products
INSERT INTO osc_products (products_id, parent_id, products_quantity, products_price, products_model, products_date_added, products_last_modified, products_weight, products_weight_class, products_status, products_tax_class_id, manufacturers_id, products_ordered, has_children) VALUES
(1, 0, 5, 23970.0000, 'XPS 630', now(), NULL, 3.50, 2, 1, 0, 2, 0, 0),
(2, 0, 5, 17970.0000, 'Pavilion a6433w-b', now(), NULL, 3.70, 2, 1, 0, 3, 0, 0),
(3, 0, 5, 25470.0000, 'M57p', now(), NULL, 3.45, 2, 1, 0, 4, 0, 0),
(4, 0, 5, 32970.0000, 'MB134LL/A', now(), NULL, 1.20, 2, 1, 0, 1, 0, 0);

#products description
INSERT INTO osc_products_description (products_id, language_id, products_name, products_description, products_keyword, products_tags, products_url, products_viewed) VALUES
(1, 1, 'Dell XPS 630', 'Игровой компьютер XPS™ 630, обладающий фантастическим быстродействием, постоянно обеспечивает максимальный уровень возможностей и впечатлений благодаря разгону процессора с помощью системы BIOS или служебной программы Nvidia® nTune, широкому выбору многоядерных процессоров Intel серий Dual, Quad и Extreme, использованию одной или двух графических плат и источнику питания мощностью 750 Вт.', 'dell1', NULL, NULL, 4),
(2, 1, 'HP Pavilion a6433w-b', 'Этот компактный настольный ПК в корпусе Miditower, дизайн которого навеян гоночными автомобилями, обеспечивает производительность, необходимую насыщенным графикой играм и другим ресурсоемким приложениям. Это гибкое масштабируемое решение, которое способно удовлетворить ваши потребности и в будущем', 'hp1', NULL, NULL, 2),
(3, 1, 'ThinkCentre M57p', 'Полнофункциональный компьютер M57p отличается превосходным сочетанием быстродействия, энергосбережения, простоты обслуживания и сопровождается трехлетней гарантией. Если IT-персонал компании сможет быстро избавить его от ненужного ПО, то этот настольный ПК будет долго служить вашим коллегам.', 'lenovo1', NULL, NULL, 0),
(4, 1, 'Macbook Pro MB134LL/A', 'Теперь Multi-Touch есть и в MacBook Pro. Технология Multi-Touch, представленная в iPhone, iPod touch и MacBook Air, теперь реализована и в MacBook Pro — в его новом трекпаде Multi-Touch. Можно увеличивать текст, просматривать фотографии и корректировать изображение с помощью новых жестов: масштабирования, пролистывания и поворота. Полнота звучания MacBook Pro звучит так же отлично, как и выглядит: при его разработке звуку уделялось огромное внимание. Специально для «бродячих музыкантов» в MacBook Pro есть стереонаушники, встроенный микрофон и оптический цифровой аудиовход и аудиовыход, обеспечивающие живой, чёткий и чистый звук.', 'apple1', NULL, NULL, 5);

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

