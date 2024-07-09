-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 09, 2024 at 09:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `storedatabase`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@domain.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'Motorolla'),
(5, 'LG'),
(6, 'Cloth Brand');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(1, 72, '::1', 1, 1),
(2, 1, '::1', 1, 4),
(3, 8, '::1', 1, 3),
(4, 71, '127.0.0.1', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Electronics'),
(2, 'Women'),
(3, 'Men'),
(4, 'Kids'),
(5, 'Furnitures'),
(6, 'Home Appliances');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(1, 'admin@domain.com'),
(2, 'batuhanbasoglu@mailbox.org');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 1, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 1, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 1, 'Batuhan Basoglu', 'batuhanbasoglu@mailbox.org', 'Montreal, Quebec, Canada', 'Montreal', 'Quebec', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 667, 1234);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` float NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Samsung Galaxy S7 Edge', 243, 'Samsung Galaxy S7 Edge', 'product07.png', 'samsung mobile electronics'),
(2, 1, 3, 'Apple iPhone 5S', 368, 'Apple iPhone 5S', 'http___pluspng.com_img-png_iphone-hd-png-iphone-apple-png-file-550.png', 'mobile iphone apple'),
(3, 1, 3, 'Apple iPad Air 2', 245, 'Apple iPad Air 2', 'da4371ffa192a115f922b1c0dff88193.png', 'apple ipad tablet'),
(4, 1, 3, 'Apple iPhone 6s', 203, 'Apple iPhone 6s', 'http___pluspng.com_img-png_iphone-6s-png-iphone-6s-gold-64gb-1000.png', 'iphone apple mobile'),
(5, 1, 2, 'Apple iPad 2', 54, 'Apple iPad 2', 'iPad-air.png', 'ipad tablet samsung'),
(6, 1, 1, 'Samsung R580', 165, 'Samsung R580', 'laptop_PNG5939.png', 'samsung laptop '),
(7, 1, 1, 'HP Pavillion', 598, 'HP Pavillion', 'laptop_PNG5930.png', 'Laptop Hp Pavillion'),
(8, 1, 4, 'Sony Ericsson w995', 221, 'Sony Ericsson w995', '530201353846AM_635_sony_xperia_z.png', 'sony mobile'),
(9, 1, 3, 'Apple iPhone SE 3. Gen', 523, 'Apple iPhone SE 3. Gen', 'iphone-hd-png-iphone-apple-png-file-550.png', 'iphone apple mobile'),
(10, 2, 6, 'Red Ladies\' Dress', 26, 'Red Ladies\' Dress', 'red dress.jpg', 'red dress '),
(11, 2, 6, 'Blue Heaven Dress', 20, 'Blue Heaven Dress', 'images.jpg', 'blue dress cloths'),
(12, 2, 6, 'Ladies\' Casual Dress', 8, 'Ladies\' Casual Dress', '7475-ladies-casual-dresses-summer-two-colors-pleated.jpg', 'girl dress clothes casual'),
(13, 2, 6, 'Spring Autumn Dress', 37, 'Spring Autumn Dress', 'Spring-Autumn-Winter-Young-Ladies-Casual-Wool-Dress-Women-s-One-Piece-Dresse-Dating-Clothes-Medium.jpg_640x640.jpg', 'girl dress'),
(14, 2, 6, 'Casual Dress', 39, 'Casual Dress', 'download.jpg', 'ladies cloths girl'),
(15, 2, 6, 'Formal Girl\'s Dress', 57, 'Formal Girl\'s Dress', 'shutterstock_203611819.jpg', 'ladies wears dress girl'),
(16, 3, 6, 'Sweater for Men', 60, '2012-Winter-Sweater-for-Men-for-better-outlook', '2012-Winter-Sweater-for-Men-for-better-outlook.jpg', 'black sweter cloth winter'),
(17, 3, 6, 'Gents´ Formal Shirt', 100, 'Gents´ Formal Shirt', 'gents-formal-250x250.jpg', 'gents wear cloths'),
(18, 4, 6, 'Kids´ Blue Shirt', 30, 'Kids´ Blue Shirt', '1543993724_pg4.jpg', 'kids blue dress'),
(19, 3, 6, 'Formal Coat', 300, 'Formal Coat', 'images (1).jpg', 'coat blazer gents'),
(20, 3, 6, 'Mens´ Sweater', 160, 'Sweater', 'Winter-fashion-men-burst-sweater.png', 'sweeter gents '),
(21, 3, 6, 'T-Shirt', 80, 'T-Shirt', 'IN-Mens-Apparel-Voodoo-Tiles-09._V333872612_.jpg', 'formal t shirt black'),
(22, 4, 6, 'Yellow T-Shirt ', 130, 'Yellow T-Shirt', '1.0x0.jpg', 'kids yellow t shirt'),
(23, 4, 6, 'Girls\' Dress', 190, 'Girls\' Dress', 'GirlsClothing_Widgets.jpg', 'formal kids wear dress'),
(24, 4, 6, 'Blue T-Shirt', 70, 'Blue T-Shirt', 'images.jpg', 'kids dress'),
(25, 4, 6, 'Yellow Girls\' Dress', 75, 'Girls\' Dress', 'images (3).jpg', 'yellow kids dress'),
(26, 1, 2, 'HD Digital Camera 16', 30, 'HD Digital Camera 16', 'product09.png', 'camera with 3D pixels camera electronics'),
(27, 4, 6, 'Formal look', 690, 'sd', 'image28.jpg', 'formal kids dress'),
(28, 1, 5, 'Dell Inspiron 15 15.6\" FHD Touchscreen', 572, 'Dell Inspiron 15 15.6\" FHD Touchscreen', 'product08.png', 'dell laptop 8gb ram intel integerated Graphics electronics'),
(29, 1, 4, '2020 MSI Prestige 14 A11SCX-090', 816, '2020 MSI Prestige 14 A11SCX-090', 'product06.png', 'msi laptop 16gb ram nvidia Graphics electronics'),
(30, 1, 5, 'Samsung Galaxy Tab S9', 890, 'Samsung Galaxy Tab S9', 'product04.png', 'sony note 6gb ram mobile electronics'),
(31, 1, 1, 'HP Elitebook 840 G3', 313, 'HP Elitebook 840 G3', 'product03.png', 'HP i7 laptop 8gb ram electronics'),
(32, 5, 0, 'Bookshelf', 67, 'Bookshelf', 'furniture-book-shelf-250x250.jpg', 'bookshelf furniture'),
(33, 6, 2, 'Refrigerator', 199, 'Refrigerator', 'CT_WM_BTS-BTC-AppliancesHome_20150723.jpg', 'refrigerator samsung'),
(34, 6, 4, 'Emergency Light', 30, 'Emergency Light', 'emergency light.JPG', 'emergency light'),
(35, 6, 0, 'Vaccum Cleaner', 100, 'Vaccum Cleaner', 'images (2).jpg', 'Vaccum Cleaner'),
(36, 6, 5, 'Iron', 23, 'Iron', 'iron.JPG', 'iron'),
(37, 6, 5, 'LED TV', 360, 'LED TV', 'images (4).jpg', 'led tv lg'),
(38, 6, 4, 'Microwave Oven', 140, 'Microwave Oven', 'images.jpg', 'Microwave Oven'),
(39, 6, 5, 'Mixer Grinder', 70, 'Mixer Grinder', 'singer-mixer-grinder-mg-46-medium_4bfa018096c25dec7ba0af40662856ef.jpg', 'Mixer Grinder'),
(40, 2, 6, 'Street Girl\'s Dress', 50, 'Street Girl\'s Dress', 'girl-walking.jpg', 'ladies'),
(41, 1, 1, 'HP EliteBook 2560p i5-2520m', 176, 'HP EliteBook 2560p i5-2520m', 'product01.png', 'HP i5 laptop electronics'),
(42, 1, 2, 'Zihnic Bluetooth Headphones', 35, 'Zihnic Bluetooth Headphones', 'product05.png', 'zihnic Headphones electronics'),
(43, 1, 2, 'Sony WH-1000XM5', 33, 'Sony WH-1000XM5', 'product02.png', 'sony Headphones electronics'),
(44, 1, 2, 'Samsung Galaxy s7', 226, 'Samsung Galaxy s7', 'product07.png', 'samsung mobile electronics'),
(45, 1, 2, 'Samsung Galaxy Note 3', 136, 'Samsung Galaxy Note 3', 'samsung_galaxy_note3_note3neo.JPG', 'samsung galaxy Note 3 neo'),
(46, 3, 6, 'Boys\' Jeans', 39, 'Boys\' Jeans', 'pt8.JPG', 'boys jeans pant'),
(47, 3, 6, 'Boys\' Jeans', 55, 'Boys\' Jeans', 'pt6.JPG', 'boys Jeans Pant'),
(48, 1, 7, 'BERIBES Bluetooth Headphones', 36, 'BERIBES Bluetooth Headphones', 'product05.png', 'Headphones beribes'),
(49, 3, 6, 'Boys\' Jeans', 38, 'Boys\' Jeans', 'pt7.JPG', 'boys jeans Pant'),
(50, 3, 6, 'Boys\' Shirt', 35, 'Boys\' Shirt', 'pm1.JPG', 'suit boys shirts'),
(51, 3, 6, 'Boys\' Shirt', 27, 'Boys\' Shirt', 'pm2.JPG', 'suit boys shirts'),
(52, 3, 6, 'Boys\' Shirt', 45, 'Boys\' Shirt', 'pm3.JPG', 'suit boys shirts'),
(53, 3, 6, 'Boys\' Shirt', 22, 'Boys\' Shirt', 'ms1.JPG', 'suit boys shirts'),
(54, 3, 6, 'Boys\' Shirt', 29, 'shirts', 'ms2.JPG', 'suit boys shirts'),
(55, 3, 6, 'Boys\' Shirt', 25, 'Boys\' Shirt', 'ms3.JPG', 'suit boys shirts'),
(56, 3, 6, 'Boys\' Shirt', 24, 'Boys\' Shirt', 'pm7.JPG', 'suit boys shirts'),
(57, 3, 6, 'Boys\' Shirt', 26, 'Boys\' Shirt', 'i3.JPG', 'suit boys shirts'),
(58, 3, 6, 'Boys\' Shirt', 35, 'Boys\' Shirt', 'pm9.JPG', 'suit boys shirts'),
(59, 3, 6, 'Boys\' Shirt', 85, 'Boys\' Shirt', 'a2.JPG', 'suit boys shirts'),
(60, 3, 6, 'Boys\' Shirt', 15, 'Boys\' Shirt', 'pm11.JPG', 'suit boys shirts'),
(61, 3, 6, 'Boys\' Shirt', 21, 'Boys\' Shirt', 'pm12.JPG', 'suit boys shirts'),
(62, 3, 6, 'Boys\' Shirt', 23, 'Boys\' Shirt', 'pm13.JPG', 'suit boys shirts'),
(63, 3, 6, 'Boys\' Jeans', 55, 'Boys\' Jeans', 'pt1.JPG', 'boys Jeans Pant'),
(64, 3, 6, 'Boys\' Jeans', 46, 'Boys\' Jeans', 'pt2.JPG', 'boys Jeans Pant'),
(65, 3, 6, 'Boys\' Jeans', 47, 'Boys\' Jeans', 'pt3.JPG', 'boys Jeans Pant'),
(66, 3, 6, 'Boys\' Jeans', 48, 'Boys\' Jeans', 'pt4.JPG', 'boys Jeans Pant'),
(67, 3, 6, 'Boys\' Jeans', 36, 'Boys\' Jeans', 'pt5.JPG', 'boys Jeans Pant');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `review` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL,
  `rating` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'John', 'Doe', 'user@domain.com', 'password', '1234567890', 'Montreal', '');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'John', 'Doe', 'user@domain.com', 'password', '1234567890', 'Montreal', '');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `p_id`, `ip_add`, `user_id`) VALUES
(1, 73, '::1', 1),
(2, 74, '::1', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
