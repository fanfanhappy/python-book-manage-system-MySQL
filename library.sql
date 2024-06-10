/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 30/05/2024 17:23:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `bnum` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bclass` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `publisher` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `year` int NULL DEFAULT NULL,
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` decimal(7, 2) NULL DEFAULT NULL,
  `total` int NULL DEFAULT NULL,
  `collection` int NULL DEFAULT NULL,
  PRIMARY KEY (`bnum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('57', '历史', '明史', '江西', 10, '五2', 123.00, 1, 1);

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `cnum` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bnum` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `btime` datetime NULL DEFAULT NULL,
  `rtime` datetime NULL DEFAULT NULL,
  `times` int NULL DEFAULT NULL,
  PRIMARY KEY (`cnum`, `bnum`) USING BTREE,
  INDEX `bnum`(`bnum` ASC) USING BTREE,
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`cnum`) REFERENCES `card` (`cnum`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`bnum`) REFERENCES `book` (`bnum`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow
-- ----------------------------

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card`  (
  `cnum` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `department` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `numbers` int NULL DEFAULT NULL,
  PRIMARY KEY (`cnum`) USING BTREE,
  CONSTRAINT `card_chk_1` CHECK (`type` in (_utf8mb4'T',_utf8mb4'S'))
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of card
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
