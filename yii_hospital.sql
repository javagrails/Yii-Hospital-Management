-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 13, 2012 at 07:48 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5


--
-- Database: `yii_hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer_invoice`
--

CREATE TABLE IF NOT EXISTS `customer_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `mobile` varchar(128) DEFAULT NULL,
  `refby` int(11) DEFAULT NULL,
  `original_refby` int(11) DEFAULT NULL,
  `subtotal` float(11,2) DEFAULT NULL,
  `less_discount` float(11,2) DEFAULT NULL,
  `netpay` float(11,2) NOT NULL,
  `recieved` float(11,2) DEFAULT NULL,
  `due` float(11,2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_invoice`
--

INSERT INTO `customer_invoice` (`id`, `patient_id`, `name`, `age`, `sex`, `mobile`, `refby`, `original_refby`, `subtotal`, `less_discount`, `netpay`, `recieved`, `due`, `create_date`, `update_date`) VALUES
(1, 'PATIENT_1', 'Md. Shaiful Islam', 28, 'Male', '01742093109', 1, 1, 100.00, 2.00, 98.00, 98.00, 0.00, '2012-10-13 10:35:45', NULL),
(3, 'PATIENT_2', 'Tanvir Karim Khan', 30, 'Male', NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient_tracker`
--

CREATE TABLE IF NOT EXISTS `patient_tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` VARCHAR( 128 ) NOT NULL,
  `test_id` int(11) NOT NULL,
  `testroom_no` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `patient_tracker`
--


-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(255) NOT NULL,
  `category_id` float NOT NULL,
  `refvalue` int(11) NOT NULL,
  `test_amount` float(11,2) NOT NULL,
  `test_room` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `test_name`, `category_id`, `refvalue`, `test_amount`, `test_room`) VALUES
(1, 'Blood group test', 2, 0, 150, '101');


-- --------------------------------------------------------

--
-- Table structure for table `test_category`
--

CREATE TABLE IF NOT EXISTS `test_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(128) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `test_category`
--

INSERT INTO `test_category` (`id`, `category_name`, `parent_id`) VALUES
(1, 'Blood', 0),
(2, 'group test', 1),
(3, 'MRI', 0),
(4, 'CT SCAN', 0),
(5, 'PLAIN X-RAY (Digital/Computed)', 0),
(6, 'MAMMOGRAM', 0),
(7, 'CONTRAST X-RAYS', 0),
(8, 'PLAIN X-RAYS (Conventional)', 0),
(9, 'OPG - Dental X-ray', 0),
(10, 'BMD (Bone Mineral Density)', 0),
(11, 'VASCULAR STUDY', 0),
(12, 'CARDIAC IMAGING', 0),
(13, 'SPECIAL PROCEDURES', 0),
(14, 'ULTRASOUND IMAGING', 0),
(15, 'OTHERS', 0),
(16, 'HAEMATOLOGY', 0),
(17, 'SUGAR PROFILE', 0),
(18, 'KIDNEY PROFILE', 0),
(19, 'COMPLEMENTS', 0),
(20, 'ELECTROLYTES-MINERALS', 0),
(21, 'LIPID PROFILE', 0),
(22, 'LIVER FUNCTION', 0),
(23, 'CARDIAC ENZYMES', 0),
(24, 'OTHER ENZYMES', 0),
(25, 'TUMOUR MARKER', 0),
(26, 'SEROLOGY', 0),
(27, 'MYCOBAC-TB Complex', 0),
(28, 'HORMONE ASSAYS', 0),
(29, 'HEPATITIES PANNEL', 0),
(30, 'IMMUNOGLOBULINS', 0),
(31, 'URINE EXAM', 0),
(32, 'DRUG ABUSE-TOXICITY', 0),
(33, 'STOOL EXAM', 0),
(34, '24 Hr. URINE for', 0),
(35, 'MICROBIOLOGY', 0),
(36, 'SPECIAL TESTS', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `firstname`, `lastname`, `create_date`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@localhost.com', 'Clark', 'Kent', '2012-10-10 11:28:57');

--
-- Table structure for table `original_ref_by`
--

CREATE TABLE IF NOT EXISTS `original_ref_by` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deg` varchar(255) NOT NULL,
  `hospital_name` varchar(255) NOT NULL,
  `mob` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `pic` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `original_ref_by`
--

INSERT INTO `original_ref_by` (`id`, `name`, `deg`, `hospital_name`, `mob`, `email`, `pic`) VALUES
(1, 'Shakil Ahmed', 'M.B.B.S', 'SQUAR HOSPITAL', '017465487', 'shakil@hotpital.com', '');

---
--- Changes SQL
---

---ALTER TABLE `customer_invoice` CHANGE `refby` `refby` VARCHAR( 255 ) NOT NULL


---ALTER TABLE `patient_tracker` ADD `status` TINYINT( 1 ) NOT NULL DEFAULT '0' COMMENT '0 - Test Not Done, 1 - Test Done' AFTER `invoice_id` ,
---ADD `report_publish` TINYINT( 1 ) NOT NULL DEFAULT '0' AFTER `status` ,
---ADD `report_delivered` TINYINT( 1 ) NOT NULL DEFAULT '0' AFTER `report_publish`  