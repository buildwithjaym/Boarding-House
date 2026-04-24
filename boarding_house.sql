-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2026 at 06:33 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `boarding_house`
--

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `action_type` varchar(50) DEFAULT NULL,
  `action_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `details` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `tenant_id`, `action_type`, `action_date`, `details`) VALUES
(2, 4, 'ADD', '2026-04-24 18:57:00', 'Added tenant Joselity Magraig to room 1'),
(3, 4, 'UPDATE', '2026-04-24 18:57:13', 'Updated tenant Joselity Magraig'),
(4, 4, 'UPDATE PAYMENT', '2026-04-24 21:20:33', 'Updated payment for Joselity Magraig, amount: 233.0'),
(5, 4, 'ADD PAYMENT', '2026-04-24 21:24:22', 'Added payment for Joselity Magraig, amount: 222.0'),
(6, 4, 'UPDATE PAYMENT', '2026-04-24 21:24:39', 'Updated payment for Joselity Magraig, amount: 222.0'),
(7, 5, 'ADD', '2026-04-24 21:48:28', 'Added tenant Ben Ten to room 2'),
(8, 5, 'ADD PAYMENT', '2026-04-24 21:49:06', 'Added payment for Ben Ten, amount: 500.0'),
(9, 4, 'DELETE PAYMENT', '2026-04-24 23:18:15', 'Deleted payment for Joselity Magraig, amount: 233.00, period covered: 1'),
(11, 4, 'ADD PAYMENT', '2026-04-24 23:43:02', 'Added payment for Joselity Magraig, amount: 500.0, period covered: May 23 - June 23, 2026'),
(12, 5, 'UPDATE PAYMENT', '2026-04-25 00:11:43', 'Updated payment for Ben Ten, amount: 500.0, period covered: April 24 - May 24, 2026'),
(13, 5, 'UPDATE', '2026-04-25 00:16:08', 'Updated tenant Ben Ten'),
(14, 2, 'ADD PAYMENT', '2026-04-25 00:17:25', 'Added payment for Charity Taglindo, amount: 3444.0, period covered: April 25 - May 25, 2026');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_for` varchar(50) DEFAULT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `period_from` date DEFAULT NULL,
  `period_to` date DEFAULT NULL,
  `period_covered` varchar(100) DEFAULT NULL,
  `status` enum('paid','unpaid') DEFAULT 'unpaid',
  `remarks` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `tenant_id`, `amount`, `payment_for`, `payment_mode`, `payment_date`, `period_from`, `period_to`, `period_covered`, `status`, `remarks`) VALUES
(1, 2, '1500.00', 'Monthly Rent', 'Cash', '2026-04-24', '2026-04-24', '2026-05-24', '1', 'paid', 'He is already good for 1 month (April)'),
(3, 4, '222.00', 'Advance Payment', 'Gcash', '2026-04-15', '2026-04-15', '2026-06-15', '2', 'paid', 'sdcad'),
(5, 5, '500.00', 'Advance Payment', 'Cash', '2026-04-24', '2026-04-24', '2026-05-24', 'April 24 - May 24, 2026', 'paid', 'sadxsa'),
(6, 4, '500.00', 'Advance Payment', 'Gcash', '2026-04-23', '2026-05-23', '2026-06-23', 'May 23 - June 23, 2026', 'paid', 'He pays 500 an advance ayment for may to june'),
(7, 2, '3444.00', 'Advance Payment', 'Gcash', '2026-04-01', '2026-04-25', '2026-05-25', 'April 25 - May 25, 2026', 'paid', 'caccasf');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_number` varchar(10) NOT NULL,
  `capacity` int(11) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `occupied` int(11) DEFAULT '0',
  `status` enum('Available','Not Available') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_number`, `capacity`, `gender`, `occupied`, `status`) VALUES
(1, '101', 2, 'male', 1, 'Available'),
(2, '202', 8, 'female', 1, 'Available'),
(3, '121', 6, 'female', 0, 'Available'),
(4, '211', 2, 'male', 0, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `months_stayed` int(11) DEFAULT NULL,
  `payment_status` enum('paid','unpaid') DEFAULT 'unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `name`, `contact`, `address`, `gender`, `age`, `room_id`, `check_in`, `check_out`, `months_stayed`, `payment_status`) VALUES
(2, 'Charity Taglindo', '093629238923', 'santa clara', 'Female', 21, 1, '2026-04-24', '2026-05-24', 1, 'unpaid'),
(4, 'Joselity Magraig', '0392323', 'Maluso', 'Female', 19, 1, '2026-04-24', '2026-05-24', 1, 'unpaid'),
(5, 'Ben Ten', '09232323', 'America', 'Male', 19, 2, '2026-04-24', '2026-06-24', 2, 'unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', 'admin', '2026-04-24 04:25:15'),
(2, 'joan', 'admin', '2026-04-24 05:28:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tenant_id` (`tenant_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tenant_payment_unique` (`tenant_id`,`payment_date`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_number` (`room_number`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tenants`
--
ALTER TABLE `tenants`
  ADD CONSTRAINT `tenants_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE SET NULL;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
