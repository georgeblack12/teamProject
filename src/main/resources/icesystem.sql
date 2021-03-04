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
--   'cPassword' varchar(30) NOT NULL, //added because every use needs a password in order to login
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
-- DROP TABLE IF EXISTS `order`;
-- CREATE TABLE `order` (
--   `orderID` int(255) NOT NULL AUTO_INCREMENT,
--   `orderType` varchar(255) NOT NULL,
--   `date` varchar(255) NOT NULL,
--   `iceCreamID` int(11) NOT NULL,
--   `customerID` int(11) NOT NULL,
--   PRIMARY KEY (`orderID`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
