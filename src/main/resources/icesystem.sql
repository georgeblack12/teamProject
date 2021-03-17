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

-- DROP TABLE IF EXISTS `iceCreamOrder`;
-- CREATE TABLE `iceCreamOrder` (
-- 	`orderID` int NOT NULL AUTO_INCREMENT,
-- 	`customerID` varchar(6) NOT NULL,
-- 	`date` date NOT NULL,
-- 	`time` time NOT NULL,
-- 	`type` varchar(10) NOT NULL,
-- 	`address` varchar(300),
-- 	`distanceFromShop` float(2),
-- 	`cost` float(2) NOT NULL,
-- 	PRIMARY KEY(`orderID`),
-- 	FOREIGN KEY(`customerID`) REFERENCES `Customer`(`customerID`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-------------------- ICE CREAM TABLE --------------------

-- DROP TABLE IF EXISTS `IceCream`;
-- CREATE TABLE `IceCream` (
-- 	`iceCreamID` int NOT NULL AUTO_INCREMENT,
-- 	`flavour` varchar(20) NOT NULL,
-- 	`size` varchar(20) NOT NULL,
-- 	`price` float(2) NOT NULL,
-- 	PRIMARY KEY(`iceCreamID`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-------------------- ORDER CONTAINS TABLE --------------------

-- DROP TABLE IF EXISTS `OrderContains`;
-- CREATE TABLE `OrderContains`(
-- 	`orderID` int NOT NULL,
-- 	`iceCreamID` int NOT NULL,
-- 	`quantity` int NOT NULL,
-- 	PRIMARY KEY(`orderID`,`iceCreamID`),
-- 	FOREIGN KEY(`orderID`) REFERENCES `Order`(`orderID`),
-- 	FOREIGN KEY(`iceCreamID`) REFERENCES `IceCream`(`iceCreamID`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-------------------- ICE CREAM DATA --------------------

-- INSERT INTO `IceCream` (flavour,`size`, price)
-- VALUES ('Vanilla', 'Small', 1.75),
-- 	   ('Vanilla', 'Medium', 2.25),
-- 	   ('Vanilla', 'Large', 2.75),
-- 	   ('Vanilla', 'Extra Large', 3.50),
-- 	   ('Vanilla', 'Extra Extra Large', 5.75),
-- 	   ('Dairy Free Vanilla', 'Small', 1.75),
-- 	   ('Dairy Free Vanilla', 'Medium', 2.25),
-- 	   ('Dairy Free Vanilla', 'Large', 2.75),
-- 	   ('Dairy Free Vanilla', 'Extra Large', 3.50),
-- 	   ('Dairy Free Vanilla', 'Extra Extra Large', 5.75),
-- 	   ('Honeycomb', 'Small', 1.75),
-- 	   ('Honeycomb', 'Medium', 2.25),
-- 	   ('Honeycomb', 'Large', 2.75),
-- 	   ('Honeycomb', 'Extra Large', 3.50),
-- 	   ('Honeycomb', 'Extra Extra Large', 5.75),
-- 	   ('Rum and Raisin', 'Small', 1.75),
-- 	   ('Rum and Raisin', 'Medium', 2.25),
-- 	   ('Rum and Raisin', 'Large', 2.75),
-- 	   ('Rum and Raisin', 'Extra Large', 3.50),
-- 	   ('Rum and Raisin', 'Extra Extra Large', 5.75),
-- 	   ('Mint', 'Small', 1.75),
-- 	   ('Mint', 'Medium', 2.25),
-- 	   ('Mint', 'Large', 2.75),
-- 	   ('Mint', 'Extra Large', 3.50),
-- 	   ('Mint', 'Extra Extra Large', 5.75),
-- 	   ('Cherry', 'Small', 1.75),
-- 	   ('Cherry', 'Medium', 2.25),
-- 	   ('Cherry', 'Large', 2.75),
-- 	   ('Cherry', 'Extra Large', 3.50),
-- 	   ('Cherry', 'Extra Extra Large', 5.75),
-- 	   ('Chocolate', 'Small', 1.75),
-- 	   ('Chocolate', 'Medium', 2.25),
-- 	   ('Chocolate', 'Large', 2.75),
-- 	   ('Chocolate', 'Extra Large', 3.50),
-- 	   ('Chocolate', 'Extra Extra Large', 5.75),
-- 	   ('Salted Caramel', 'Small', 2.50),
-- 	   ('Salted Caramel', 'Medium', 3.00),
-- 	   ('Salted Caramel', 'Large', 3.50),
-- 	   ('Salted Caramel', 'Extra Large', 4.25),
-- 	   ('Salted Caramel', 'Extra Extra Large', 6.50),
-- 	   ('Strawberry', 'Small', 1.75),
-- 	   ('Strawberry', 'Medium', 2.25),
-- 	   ('Strawberry', 'Large', 2.75),
-- 	   ('Strawberry', 'Extra Large', 3.50),
-- 	   ('Strawberry', 'Extra Extra Large', 5.75);

-------------------- ADMIN DATA --------------------

-- INSERT INTO `User` (email, password)
-- VALUES ('admin@gmail.com', 'CavalloTeam8');
--
-- INSERT INTO `Administrator` (email)
-- SELECT email
-- FROM `User`
-- WHERE email = 'admin@gmail.com';

-- /----------------------------------SQL QUERIES FOR ANALYTICS------------------------------------/--
-- /------------------------------Author: Madeleine Towes, 13/03/21--------------------------------/--


-------------------- TOTAL NO ORDERS --------------------

-- SELECT COUNT(*)
-- FROM Order;

-------------------- NO ORDERS / DAY --------------------

-- SELECT COUNT(*)
-- FROM Order o
-- WHERE EXTRACT(DAY FROM o.`date`) = ? AND EXTRACT(MONTH FROM o.`date`) = ? AND EXTRACT(YEAR FROM o.`date`) = ?;

-- insert current day/month/year (in numbers)

-------------------- NO ORDERS / MONTH --------------------

-- SELECT COUNT(*)
-- FROM Order o
-- WHERE EXTRACT(MONTH FROM o.`date`) = ? AND EXTRACT(YEAR FROM o.`date`) = ?;

-- insert current month/year (in numbers)

-------------------- NO ORDERS / YEAR --------------------

-- SELECT COUNT(*)
-- FROM Order o
-- WHERE EXTRACT(YEAR FROM o.`date`) = ?;

-- insert current year (in numbers)

-------------------- TOTAL SALES PER FLAVOUR --------------------

-- SELECT ic.flavour, SUM(oc.quantity)
-- FROM IceCream ic, OrderContains oc
-- WHERE ic.iceCreamID = oc.iceCreamID
-- GROUP BY ic.flavour;

-------------------- MONTH SALES PER FLAVOUR --------------------

-- SELECT ic.flavour, SUM(oc.quantity)
-- FROM IceCream ic, OrderContains oc, Order o
-- WHERE ic.iceCreamID = oc.iceCreamID
--     AND oc.orderID = o.orderID
--     AND (EXTRACT(MONTH FROM o.`date`) = ?) AND (EXTRACT(YEAR FROM o.`date`) = ?)
-- GROUP BY ic.flavour;

-- insert current month/year (in numbers)

-------------------- MOST POPULAR FLAVOUR --------------------

--  working on it

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
