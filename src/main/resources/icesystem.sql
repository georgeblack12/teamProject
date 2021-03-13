-- /------------------------------------------NEW SQL----------------------------------------------/--
-- /------------------------------Author: Madeleine Towes, 13/03/21--------------------------------/--

-------------------- USER TABLE --------------------

-- DROP TABLE IF EXISTS `User`;
-- CREATE TABLE `User` (
-- 	`email` varchar(100) NOT NULL,
-- 	`password` varchar(16) NOT NULL,
-- 	PRIMARY KEY (`email`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-------------------- ADMIN TABLE --------------------

-- DROP TABLE IF EXISTS `Administrator`;
-- CREATE TABLE `Administrator` (
-- 	`email` varchar(100) NOT NULL,
-- 	PRIMARY KEY(`email`),
-- 	FOREIGN KEY(`email`) REFERENCES `User`(`email`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-------------------- CUSTOMER TABLE --------------------

-- DROP TABLE IF EXISTS `Customer`;
-- CREATE TABLE `Customer` (
-- 	`email` varchar(100) NOT NULL,
-- 	`customerID` varchar(6) UNIQUE NOT NULL,
-- 	`name` varchar(50) NOT NULL,
-- 	`phoneNo` varchar(20) NOT NULL,
-- 	PRIMARY KEY(`email`),
-- 	FOREIGN KEY(`email`) REFERENCES `User`(`email`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-------------------- ORDER TABLE --------------------

-- DROP TABLE IF EXISTS `Order`;
-- CREATE TABLE `Order` (
-- 	`orderID` int NOT NULL AUTO_INCREMENT,
-- 	`email` varchar(100) NOT NULL,
-- 	`date` date NOT NULL,
-- 	`time` time NOT NULL,
-- 	`type` varchar(10) NOT NULL,
-- 	`address` varchar(300),
-- 	`distanceFromShop` float(2),
-- 	`cost` float(2) NOT NULL,
-- 	PRIMARY KEY(`orderID`),
-- 	FOREIGN KEY(`email`) REFERENCES `Customer`(`email`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-------------------- ICE CREAM TABLE --------------------

-- DROP TABLE IF EXISTS `IceCream`;
-- CREATE TABLE `IceCream` (
-- 	`iceCreamID` int NOT NULL AUTO_INCREMENT,
-- 	`flavour` varchar(20) NOT NULL,
-- 	`size` varchar(3) NOT NULL,
-- 	`price` float(2) NOT NULL,
-- 	PRIMARY KEY(`iceCreamID`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-------------------- ORDER CONTAINS TABLE --------------------

-- DROP TABLE IF EXISTS `OrderContains`;
-- CREATE TABLE `OrderContains`(
-- 	`orderID` int NOT NULL,
-- 	`iceCreamID` int NOT NULL,
-- 	`quantity` int NOT NULL,
-- 	`cost` float(2) NOT NULL,
-- 	PRIMARY KEY(`orderID`,`iceCreamID`),
-- 	FOREIGN KEY(`orderID`) REFERENCES `Order`(`orderID`),
-- 	FOREIGN KEY(`iceCreamID`) REFERENCES `IceCream`(`iceCreamID`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-------------------- ICE CREAM DATA --------------------

-- INSERT INTO `IceCream` (flavour,`size`, price)
-- VALUES ('Vanilla', 'S', 1.75),
-- 	   ('Vanilla', 'M', 2.25),
-- 	   ('Vanilla', 'L', 2.75),
-- 	   ('Vanilla', 'XL', 3.50),
-- 	   ('Vanilla', 'XXL', 5.75),
-- 	   ('Dairy Free Vanilla', 'S', 1.75),
-- 	   ('Dairy Free Vanilla', 'M', 2.25),
-- 	   ('Dairy Free Vanilla', 'L', 2.75),
-- 	   ('Dairy Free Vanilla', 'XL', 3.50),
-- 	   ('Dairy Free Vanilla', 'XXL', 5.75),
-- 	   ('Honeycomb', 'S', 1.75),
-- 	   ('Honeycomb', 'M', 2.25),
-- 	   ('Honeycomb', 'L', 2.75),
-- 	   ('Honeycomb', 'XL', 3.50),
-- 	   ('Honeycomb', 'XXL', 5.75),
-- 	   ('Rum and Raisin', 'S', 1.75),
-- 	   ('Rum and Raisin', 'M', 2.25),
-- 	   ('Rum and Raisin', 'L', 2.75),
-- 	   ('Rum and Raisin', 'XL', 3.50),
-- 	   ('Rum and Raisin', 'XXL', 5.75),
-- 	   ('Mint', 'S', 1.75),
-- 	   ('Mint', 'M', 2.25),
-- 	   ('Mint', 'L', 2.75),
-- 	   ('Mint', 'XL', 3.50),
-- 	   ('Mint', 'XXL', 5.75),
-- 	   ('Cherry', 'S', 1.75),
-- 	   ('Cherry', 'M', 2.25),
-- 	   ('Cherry', 'L', 2.75),
-- 	   ('Cherry', 'XL', 3.50),
-- 	   ('Cherry', 'XXL', 5.75),
-- 	   ('Chocolate', 'S', 1.75),
-- 	   ('Chocolate', 'M', 2.25),
-- 	   ('Chocolate', 'L', 2.75),
-- 	   ('Chocolate', 'XL', 3.50),
-- 	   ('Chocolate', 'XXL', 5.75),
-- 	   ('Salted Caramel', 'S', 2.50),
-- 	   ('Salted Caramel', 'M', 3.00),
-- 	   ('Salted Caramel', 'L', 3.50),
-- 	   ('Salted Caramel', 'XL', 4.25),
-- 	   ('Salted Caramel', 'XXL', 6.50),
-- 	   ('Strawberry', 'S', 1.75),
-- 	   ('Strawberry', 'M', 2.25),
-- 	   ('Strawberry', 'L', 2.75),
-- 	   ('Strawberry', 'XL', 3.50),
-- 	   ('Strawberry', 'XXL', 5.75);

-------------------- ADMIN DATA --------------------

-- INSERT INTO `User` (email, password)
-- VALUES ('admin@gmail.com', 'CavalloTeam8');

-- INSERT INTO `Administrator` (email)
-- SELECT email
-- FROM `User`
-- WHERE email = 'admin@gmail.com';



-- /-----------------------------------------------------------------------------------------------/--
-- /------------------------------------------OLD SQL----------------------------------------------/--
-- /-----------------------------------------------------------------------------------------------/--

/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : icesystem

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2021-02-25 22:21:55
*/

-- SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
-- DROP TABLE IF EXISTS `administrator`;
-- CREATE TABLE `administrator` (
--   `userID` int(11) NOT NULL,
--   `password` varchar(255) NOT NULL,
--   `numberOfStock` int(11) NOT NULL,
--   `popularityOfFlavours` varchar(255) NOT NULL,
--   `ordersPerDay` varchar(255) NOT NULL,
--   `ordersPerMonth` varchar(255) NOT NULL,
--   `ordersPerYear` varchar(255) NOT NULL,
--   PRIMARY KEY (`userID`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of administrator
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
-- DROP TABLE IF EXISTS `customer`;
-- CREATE TABLE `customer` (
--   `customerID` int(11) NOT NULL AUTO_INCREMENT,
--   `customerName` varchar(255) NOT NULL,
--   `phoneNum` varchar(11) NOT NULL,
--   `address` varchar(255) NOT NULL,
--   `orderID` int(11) NOT NULL, //may need to me removed because customer can login but does not have
--   'password' varchar(30) NOT NULL, //added because every use needs a password in order to login
--   PRIMARY KEY (`customerID`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for driver
-- ----------------------------
-- DROP TABLE IF EXISTS `driver`;
-- CREATE TABLE `driver` (
--   `driverID` int(11) NOT NULL,
--   `driverPhone` varchar(255) NOT NULL,
--   `orderID` int(11) NOT NULL,
--   `driverName` varchar(255) NOT NULL,
--   PRIMARY KEY (`driverID`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of driver
-- ----------------------------

-- ----------------------------
-- Table structure for icecream
-- ----------------------------
-- DROP TABLE IF EXISTS `icecream`;
-- CREATE TABLE `icecream` (
--   `iceCreamID` int(30) NOT NULL AUTO_INCREMENT,
--   `iceCreamName` varchar(255) NOT NULL,
--   `size` varchar(30) NOT NULL,
--   `price` float(10,0) NOT NULL,
--   `number` int(255) NOT NULL,
--   PRIMARY KEY (`iceCreamID`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of icecream
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
-- DROP TABLE IF EXISTS iceCreamOrder;
-- CREATE TABLE `iceCreamOrder` (
--   `orderID` int(255) NOT NULL AUTO_INCREMENT,
--    `orderType` varchar(255) NOT NULL,
--   `date` varchar(255) NOT NULL,
--   `iceCreamID` int(11) NOT NULL,
--    `customerID` int(11) NOT NULL,
--     cost float(2) NOT NULL,
--   PRIMARY KEY (`orderID`));
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
