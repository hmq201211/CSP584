/*
 Navicat Premium Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : soccerfan

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 30/11/2018 08:55:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accessory
-- ----------------------------
DROP TABLE IF EXISTS `accessory`;
CREATE TABLE `accessory`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `maker` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accessory
-- ----------------------------
INSERT INTO `accessory` VALUES ('clothes1', 'clothes1', 19.99, 'UEFA', 0.4);
INSERT INTO `accessory` VALUES ('clothes2', 'clothes2', 29.99, 'UEFA', 0.4);
INSERT INTO `accessory` VALUES ('gloves1', 'gloves1', 19.99, 'AFC', 0.4);
INSERT INTO `accessory` VALUES ('soccer1', 'soccer1', 15.99, 'FIFA', 0.4);
INSERT INTO `accessory` VALUES ('soccer2', 'soccer2', 16.99, 'FIFA', 0.4);
INSERT INTO `accessory` VALUES ('soccer3', 'soccer3', 17.99, 'FIFA', 0.4);
INSERT INTO `accessory` VALUES ('soccer4', 'soccer4', 18.99, 'FIFA', 0.4);

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`, `itemid`, `itemtype`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES ('4632fadca78f470ca9e397676e6026d9', '1', '3', 'game');
INSERT INTO `follow` VALUES ('66138279295c44b49eb15111914f7df1', '1', 'gloves1', 'accessory');

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `league` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `home_team` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `guest_team` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES ('1', 'FIFA', '1999-12-31 18:00:02', 'Croatia', '4:1', 'Greece', 'Croatia');
INSERT INTO `game` VALUES ('2', 'FIFA', '2016-12-08 00:00:00', 'Ireland', '0:1', 'Switzerland', 'Ireland');
INSERT INTO `game` VALUES ('3', 'UEFA', '2017-12-08 00:00:00', 'Turkey', '0:2', 'Russia', 'Turkey');
INSERT INTO `game` VALUES ('4', 'AFC', '2018-12-08 00:00:00', 'Thailand', '0:3', 'Saudi_Arabia', 'Thailand');

-- ----------------------------
-- Table structure for game_accessory
-- ----------------------------
DROP TABLE IF EXISTS `game_accessory`;
CREATE TABLE `game_accessory`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of game_accessory
-- ----------------------------
INSERT INTO `game_accessory` VALUES ('4', '2', 'clothes1');
INSERT INTO `game_accessory` VALUES ('5', '2', 'soccer2');
INSERT INTO `game_accessory` VALUES ('6', '3', 'soccer2');
INSERT INTO `game_accessory` VALUES ('7', '3', 'soccer1');
INSERT INTO `game_accessory` VALUES ('8', '4', 'soccer1');

-- ----------------------------
-- Table structure for player
-- ----------------------------
DROP TABLE IF EXISTS `player`;
CREATE TABLE `player`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `teamid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player
-- ----------------------------
INSERT INTO `player` VALUES ('1', 'Aubameyang', '29', 'Asenal', '14', 'Forward');
INSERT INTO `player` VALUES ('2', 'Aguero', '30', 'Manchester', '10', 'Forward');
INSERT INTO `player` VALUES ('3', 'Hazard', '27', 'Chelsea', '10', 'Forward');
INSERT INTO `player` VALUES ('4', 'Salah', '26', 'Liverpool', '11', 'Forward');

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `league` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('Chelsea', 'Chelsea', 'Premier_League', 'England', 'chelsea');
INSERT INTO `team` VALUES ('Hotspur', 'Hotspur', 'Premier_League', 'England', 'tottenham');
INSERT INTO `team` VALUES ('Liverpool', 'Liverpool', 'Premier_League', 'England', 'liverpool');
INSERT INTO `team` VALUES ('Manchester', 'Manchester', 'Premier_League', 'England', 'manchester');
INSERT INTO `team` VALUES ('Manchester_United', 'Manchester_United', 'Premier_League', 'England', 'manchester');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `usertype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', 'Manager');
INSERT INTO `user` VALUES ('132', '132', 'User');
INSERT INTO `user` VALUES ('2', '2', 'Member');
INSERT INTO `user` VALUES ('435', '232222', 'User');
INSERT INTO `user` VALUES ('b', 'b', 'Member');
INSERT INTO `user` VALUES ('b232', '111', 'Manager');
INSERT INTO `user` VALUES ('cc', 'cc', 'Member');

-- ----------------------------
-- Table structure for userorder
-- ----------------------------
DROP TABLE IF EXISTS `userorder`;
CREATE TABLE `userorder`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creditnumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userorder
-- ----------------------------
INSERT INTO `userorder` VALUES ('22d3a38e2fe3426680a5b1f74f2f8dee', '1', 'clothes2', '29.99', '123', '123', '2018-11-30');
INSERT INTO `userorder` VALUES ('5f2fde921ab14344bf9533394a0551ee', '1', 'clothes1', '19.99', '22', '22', '2018-11-30');
INSERT INTO `userorder` VALUES ('6684a31cae504f8ab7c3c7287eadf526', '1', 'clothes1', '19.99', '444', '444', '2018-11-30');
INSERT INTO `userorder` VALUES ('6c5aeadb27f347369fdfdc3173085436', '1', 'gloves1', '19.99', '555', '555', '2018-11-30');
INSERT INTO `userorder` VALUES ('7ecd8a5a5f514176bbe5f2e3469c5ff1', '1', 'soccer2', '16.99', '123', '123', '2018-11-30');
INSERT INTO `userorder` VALUES ('e6056901133648c389b62ffadc104107', '1', 'gloves1', '19.99', '22', '22', '2018-11-30');
INSERT INTO `userorder` VALUES ('fd56d43c792b488289792f863390988c', '1', 'soccer2', '16.99', '123', '123', '2018-11-30');
INSERT INTO `userorder` VALUES ('select * from order where username =\"2\";', NULL, NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
