-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2021 at 03:10 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `downline`
--

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`, `visible`) VALUES
(1, 'ธนาคารกรุงเทพ จำกัด (มหาชน)', 1),
(2, 'ธนาคารกรุงไทย จำกัด (มหาชน)', 1),
(3, 'ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)', 1),
(4, 'ธนาคารกสิกรไทย จำกัด (มหาชน)', 1),
(5, 'ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)', 1),
(6, 'ธนาคารซีไอเอ็มบี ไทย จำกัด (มหาชน)', 1),
(7, 'ธนาคารทหารไทย จำกัด (มหาชน)', 1),
(8, 'ธนาคารทิสโก้ จำกัด (มหาชน)', 1),
(9, 'ธนาคารไทยพาณิชย์ จำกัด (มหาชน)', 1),
(10, 'ธนาคารธนชาต จำกัด (มหาชน)', 1),
(11, 'ธนาคารยูโอบี จำกัด (มหาชน)', 1),
(12, 'ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)', 1),
(13, 'ธนาคารสแตนดาร์ดชาร์เตอร์ด (ไทย) จำกัด (มหาชน)', 1),
(14, 'ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)', 1),
(15, 'อื่นๆ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `stock_id`, `amount`) VALUES
(174, 71, 1, 162),
(175, 71, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `received_priceunit` float NOT NULL,
  `received_price` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `purchase_order_id`, `stock_id`, `amount`, `received_priceunit`, `received_price`, `price`) VALUES
(68, 71, 1, 500, 10, 5000, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`) VALUES
(1, 'เงินสด (Cash)'),
(2, 'โอนเงืน (Bank Transfer)'),
(3, 'บัตรเครดิต (Credit Card)');

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `start_total` int(11) NOT NULL,
  `end_total` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `user_id`, `stock_id`, `start_total`, `end_total`, `price`) VALUES
(19, 71, 1, 1, 100, 100),
(20, 71, 1, 101, 500, 80),
(21, 72, 2, 1, 350, 120),
(22, 72, 2, 351, 500, 100),
(32, 74, 9, 1, 100, 88),
(33, 71, 2, 1, 100, 90),
(34, 71, 2, 101, 300, 87);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int(11) NOT NULL,
  `purchase_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '631015XXXXXXXX',
  `year` int(4) NOT NULL COMMENT 'Thai Year / 2563',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `buyer_id` int(11) NOT NULL COMMENT 'user_id of a buyer',
  `seller_id` int(11) NOT NULL COMMENT 'user_id of his top line',
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `isPaid` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 not paid / 1 paid ',
  `payment_method_id` int(11) NOT NULL DEFAULT 2,
  `seller_comment` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `buyer_comment` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT 1,
  `user_bank_id` int(11) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `pay_time` time DEFAULT NULL,
  `pay_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `purchase_no`, `year`, `created_at`, `buyer_id`, `seller_id`, `visible`, `isPaid`, `payment_method_id`, `seller_comment`, `buyer_comment`, `status_id`, `user_bank_id`, `pay_date`, `pay_time`, `pay_price`) VALUES
(71, '1614588366', 2564, '2021-03-01 15:46:06', 71, 22, 1, 0, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_images`
--

CREATE TABLE `purchase_order_images` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `path` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_status`
--

CREATE TABLE `purchase_order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchase_order_status`
--

INSERT INTO `purchase_order_status` (`id`, `name`) VALUES
(1, 'รอการยืนยัน'),
(2, 'ยืนยันแล้ว'),
(3, 'ยกเลิก'),
(4, 'คืนเงิน');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `received_price` float NOT NULL,
  `spent_price` float NOT NULL,
  `spent_unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `amount` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `name`, `received_price`, `spent_price`, `spent_unit`, `visible`, `amount`, `type`) VALUES
(1, 'Vitamin A', 10, 16, 'ซอง', 1, 400, NULL),
(2, 'Vitamin C', 15, 21, 'ถุง', 1, 1012, NULL),
(3, 'ยาแก้ไอ ตราโควิด นะครับ', 30, 50, 'ขวด', 1, 415, NULL),
(4, 'ถ่านไฟฉาย ตรากบ', 150, 200, 'ก้อน', 1, 400, NULL),
(5, 'testสินค้า', 550, 700, 'ขวด', 1, 50000, NULL),
(6, 'testลบสินค้า', 9, 15, 'ซอง', 0, 32411, NULL),
(7, 'test สร้างสินค้า', 240, 333, 'ชาม', 1, 1000, NULL),
(8, 'ขนมแพนด้าตาดำ', 13, 19, 'ซอง', 1, 1000, NULL),
(9, 'นาฬิกา ยืมเพื่อน', 40, 60, 'ถุง', 1, 490, NULL),
(10, 'โอ่งมังกร', 2000, 2800, 'ถุง', 1, 21, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock_history`
--

CREATE TABLE `stock_history` (
  `id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `cost` float NOT NULL,
  `price` float NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `status`) VALUES
(1, 'myname', 111),
(2, 'yourname', 22);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` int(10) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `level_id` int(11) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `tel`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `level_id`) VALUES
(22, 'พิเชษฐ์ มณีรัตน์', 988301026, 'weare12we@gmail.com', NULL, '$2y$10$KK5AJ4VFVFiDRyJK4yCEDeIeIzjhboGIHTNr4hIEMVxNKqeO0midO', '95pAjrxDhN0x6rBFzHeQSPqjPQZJkPwlq3EZGi5dwnn51Hy7LjH50c6hCdRo', '2020-11-25 19:19:48', '2020-11-25 19:19:48', 1),
(45, 'พี่แนน', 988301022, 'weare1211we@gmail.com', NULL, '$2y$10$h5tYY0bdSI0iI/DQYQfpH.O1j/e4Mp.hqio3WQrXiOBe70HCHrulm', 'RZgebSYJ86M67Jp2v0ExCij3tvpQRcOH56tSYBJ8NIDN3Q15tWqNYGGJfBt2', '2020-12-02 19:28:41', '2020-12-02 19:28:41', 3),
(52, 'ลุงปรีชา', 988301000, 'weare1212we@gmail.com', NULL, '$2y$10$6R0EDxUb56ew8.uTgJY3I.sK11wTMip/zaRHEknhgonZTfceVUDKi', NULL, '2020-12-02 20:56:42', '2020-12-02 20:56:42', 3),
(60, 'ประยูล จันทร์โทรลา', 988301028, 'weare1214we@gmail.com', NULL, '$2y$10$qstAnlXiVUwI96oK6QVxFO55TyMobEI53enZ7TPiTneXgjqRlplgW', NULL, '2020-12-02 22:05:44', '2020-12-02 22:05:44', 3),
(68, 'test ตัวแทน', 988301026, 'weare3333we@gmail.com', NULL, '$2y$10$4d4TAypXoAHW2Vw7smu9i.GT8DHr1PmbL2W/8zLp5z9ADUx.AJDNS', 'isb4YbvtwOlbRqvhyglt6qIgZqErEAlgHXGZrimr65DC1Z1Rnx5tN6dgtvqY', '2021-01-10 20:02:19', '2021-01-10 20:02:19', 2),
(69, 'ตัวแทน สร้างลูกทีม', 988301026, 'weare1414we@gmail.com', NULL, '$2y$10$mbtvprciDHhAWfiWtNHzR.nD8fNdKF69TFpuQnBf9ZHSiPXAs1xIa', NULL, '2021-01-10 20:05:17', '2021-01-10 20:05:17', 3),
(70, 'ตัวแทน สร้างลูกทีม2', 988301022, 'w12111we@gmail.com', NULL, '$2y$10$RVMf35fDT5UHP4Y6G/6Wm.n5Xnh0G/0lgmiNbarhzwtRorgNHxXK6', NULL, '2021-01-10 20:06:39', '2021-01-10 20:06:39', 3),
(71, 'ตัวแทน พิเชษฐ์นะ', 122131234, 'weare33we@gmail.com', NULL, '$2y$10$zZDbef50RunWFykbzKP8oe5y5.eYEqBZXqAvJuTRJBReFU1/hkq/O', '5JxkJ6GGDp78ZanjxOQBQygn1vc60RnaY6XwEKIduEyCnZTm1BftCA38h7xD', '2021-01-15 00:52:00', '2021-02-14 19:05:12', 2),
(72, 'ลูกทีม ตัวแทนพิเชษฐ์ มาณีรัตน์', 988301026, 'weare212121we@gmail.com', NULL, '$2y$10$UoGWkzjYjSsuyvQLRWngjOL4W2pQEUm1FWS67fZfOj8VeFuPPyAxC', 'Mgs57ULH53HEQtsVVlSRqfT27rZ8VPP0VlY7FVxSAmzABA9AMfScBlKoNwfo', '2021-01-15 00:53:41', '2021-01-21 20:12:51', 3),
(74, 'กชกร', 988301022, 'khoanan.nan@gmail.com', NULL, '$2y$10$huRmgAEtmogwz2bMEye.Ouj1wI47hnYlKhqn9pbb6PEOrwh.o/8F2', 'IVHuml29tlEGfHaioG2cVDKiDo4953JA5MJcYdItqYZduNXem0kdXEz85xMV', '2021-02-11 02:07:23', '2021-02-11 02:07:23', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_bank`
--

CREATE TABLE `user_bank` (
  `id` int(11) NOT NULL,
  `bank_id` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `visible` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_bank`
--

INSERT INTO `user_bank` (`id`, `bank_id`, `user_id`, `name`, `account_no`, `visible`) VALUES
(22, 14, 45, 'พี่แนน1', '1221321321', 1),
(23, 5, 45, 'พี่แนน2', '232323232323', 1),
(24, 2, 45, 'พี่แนน3', '12213123333', 1),
(27, 10, 52, 'ลุงปรีชา', '1221321321', 1),
(29, 14, 22, 'พิเชด1', '56565656565656', 1),
(30, 1, 22, 'พิเชด2', '213213213213331111', 1),
(31, 4, 22, 'พิเชด3', '12121244114411', 1),
(32, 12, 22, 'พิเชด4', '1234512345', 0),
(34, 2, 71, 'ตัวแทนพิเชด1', '555534455555551', 1),
(36, 9, 74, NULL, '2132343431232', 1),
(37, 8, 22, NULL, '213213123', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE `user_level` (
  `id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `level` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_level`
--

INSERT INTO `user_level` (`id`, `name`, `level`) VALUES
(1, 'ผู้ดูแลระบบ', 10),
(2, 'ตัวแทนหลัก', 50),
(3, 'ตัวแทน', 100),
(4, 'Superman', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_mail_forward`
--

CREATE TABLE `user_mail_forward` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `forward_email` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_mail_forward`
--

INSERT INTO `user_mail_forward` (`id`, `user_id`, `name`, `forward_email`) VALUES
(1, 22, 'ประยูล จันทร์โทรลา', 'eeexx17@hotmail.com'),
(4, 22, 'พิเชษฐ์ มณีรัตน์2', 'weare33we@gmail.com'),
(5, 22, 'พี่อ้น', 'kkomjaturut@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_tree`
--

CREATE TABLE `user_tree` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_tree`
--

INSERT INTO `user_tree` (`id`, `parent_id`, `child_id`) VALUES
(2, 22, 45),
(7, 45, 52),
(15, 45, 60),
(23, 22, 68),
(24, 68, 69),
(25, 68, 70),
(26, 22, 71),
(27, 71, 72),
(28, 22, 74);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_purchase_order_id` (`purchase_order_id`),
  ADD KEY `fk_orders_stock_id` (`stock_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_prices_user_id` (`user_id`),
  ADD KEY `fk_prices_stock_id` (`stock_id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_purchase_order_payment_method_id` (`payment_method_id`),
  ADD KEY `fk_purchase_order_status_id` (`status_id`),
  ADD KEY `fk_purchase_order_user_bank_id` (`user_bank_id`);

--
-- Indexes for table `purchase_order_images`
--
ALTER TABLE `purchase_order_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_purchase_order_purchase_order_id` (`purchase_order_id`);

--
-- Indexes for table `purchase_order_status`
--
ALTER TABLE `purchase_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_history`
--
ALTER TABLE `stock_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stock_history_stock_id` (`stock_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `fk_user_user_level` (`level_id`);

--
-- Indexes for table `user_bank`
--
ALTER TABLE `user_bank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_bank_user_id` (`user_id`),
  ADD KEY `fk_user_bank_bank_id` (`bank_id`);

--
-- Indexes for table `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_mail_forward`
--
ALTER TABLE `user_mail_forward`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_tree`
--
ALTER TABLE `user_tree`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_parent_id` (`parent_id`),
  ADD KEY `fk_user_child_id` (`child_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `purchase_order_images`
--
ALTER TABLE `purchase_order_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `purchase_order_status`
--
ALTER TABLE `purchase_order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stock_history`
--
ALTER TABLE `stock_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `user_bank`
--
ALTER TABLE `user_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_mail_forward`
--
ALTER TABLE `user_mail_forward`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_tree`
--
ALTER TABLE `user_tree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_purchase_order_id` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`),
  ADD CONSTRAINT `fk_orders_stock_id` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`);

--
-- Constraints for table `prices`
--
ALTER TABLE `prices`
  ADD CONSTRAINT `fk_prices_stock_id` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`),
  ADD CONSTRAINT `fk_prices_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `fk_purchase_order_payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  ADD CONSTRAINT `fk_purchase_order_status_id` FOREIGN KEY (`status_id`) REFERENCES `purchase_order_status` (`id`),
  ADD CONSTRAINT `fk_purchase_order_user_bank_id` FOREIGN KEY (`user_bank_id`) REFERENCES `user_bank` (`id`);

--
-- Constraints for table `stock_history`
--
ALTER TABLE `stock_history`
  ADD CONSTRAINT `fk_stock_history_stock_id` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
