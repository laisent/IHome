/*
 Navicat MySQL Data Transfer

 Source Server         : aliyun_ubuntu
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 47.98.34.63:3306
 Source Schema         : ihome

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 22/02/2020 21:51:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version`  (
  `version_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`version_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO `alembic_version` VALUES ('cc49d48f7545');

-- ----------------------------
-- Table structure for ih_area_info
-- ----------------------------
DROP TABLE IF EXISTS `ih_area_info`;
CREATE TABLE `ih_area_info`  (
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ih_area_info
-- ----------------------------
INSERT INTO `ih_area_info` VALUES (NULL, NULL, 1, '东城区');
INSERT INTO `ih_area_info` VALUES (NULL, NULL, 2, '西城区');
INSERT INTO `ih_area_info` VALUES (NULL, NULL, 3, '朝阳区');
INSERT INTO `ih_area_info` VALUES (NULL, NULL, 4, '海淀区');
INSERT INTO `ih_area_info` VALUES (NULL, NULL, 5, '昌平区');
INSERT INTO `ih_area_info` VALUES (NULL, NULL, 6, '丰台区');
INSERT INTO `ih_area_info` VALUES (NULL, NULL, 7, '房山区');
INSERT INTO `ih_area_info` VALUES (NULL, NULL, 8, '通州区');
INSERT INTO `ih_area_info` VALUES (NULL, NULL, 9, '顺义区');
INSERT INTO `ih_area_info` VALUES (NULL, NULL, 10, '大兴区');
INSERT INTO `ih_area_info` VALUES (NULL, NULL, 11, '怀柔区');
INSERT INTO `ih_area_info` VALUES (NULL, NULL, 12, '平谷区');
INSERT INTO `ih_area_info` VALUES (NULL, NULL, 13, '密云区');
INSERT INTO `ih_area_info` VALUES (NULL, NULL, 14, '延庆区');
INSERT INTO `ih_area_info` VALUES (NULL, NULL, 15, '石景山区');

-- ----------------------------
-- Table structure for ih_facility_info
-- ----------------------------
DROP TABLE IF EXISTS `ih_facility_info`;
CREATE TABLE `ih_facility_info`  (
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ih_facility_info
-- ----------------------------
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 1, '无线网络');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 2, '热水淋浴');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 3, '空调');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 4, '暖气');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 5, '允许吸烟');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 6, '饮水设备');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 7, '牙具');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 8, '香皂');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 9, '拖鞋');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 10, '手纸');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 11, '毛巾');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 12, '沐浴露、洗发露');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 13, '冰箱');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 14, '洗衣机');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 15, '电梯');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 16, '允许做饭');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 17, '允许带宠物');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 18, '允许聚会');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 19, '门禁系统');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 20, '停车位');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 21, '有线网络');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 22, '电视');
INSERT INTO `ih_facility_info` VALUES (NULL, NULL, 23, '浴缸');

-- ----------------------------
-- Table structure for ih_house_facility
-- ----------------------------
DROP TABLE IF EXISTS `ih_house_facility`;
CREATE TABLE `ih_house_facility`  (
  `house_id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL,
  PRIMARY KEY (`house_id`, `facility_id`) USING BTREE,
  INDEX `facility_id`(`facility_id`) USING BTREE,
  CONSTRAINT `ih_house_facility_ibfk_1` FOREIGN KEY (`facility_id`) REFERENCES `ih_facility_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ih_house_facility_ibfk_2` FOREIGN KEY (`house_id`) REFERENCES `ih_house_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ih_house_facility
-- ----------------------------
INSERT INTO `ih_house_facility` VALUES (1, 1);
INSERT INTO `ih_house_facility` VALUES (2, 1);
INSERT INTO `ih_house_facility` VALUES (3, 1);
INSERT INTO `ih_house_facility` VALUES (4, 1);
INSERT INTO `ih_house_facility` VALUES (5, 1);
INSERT INTO `ih_house_facility` VALUES (6, 1);
INSERT INTO `ih_house_facility` VALUES (7, 1);
INSERT INTO `ih_house_facility` VALUES (1, 2);
INSERT INTO `ih_house_facility` VALUES (2, 2);
INSERT INTO `ih_house_facility` VALUES (3, 2);
INSERT INTO `ih_house_facility` VALUES (4, 2);
INSERT INTO `ih_house_facility` VALUES (5, 2);
INSERT INTO `ih_house_facility` VALUES (6, 2);
INSERT INTO `ih_house_facility` VALUES (7, 2);
INSERT INTO `ih_house_facility` VALUES (1, 3);
INSERT INTO `ih_house_facility` VALUES (2, 3);
INSERT INTO `ih_house_facility` VALUES (3, 3);
INSERT INTO `ih_house_facility` VALUES (4, 3);
INSERT INTO `ih_house_facility` VALUES (5, 3);
INSERT INTO `ih_house_facility` VALUES (6, 3);
INSERT INTO `ih_house_facility` VALUES (7, 3);
INSERT INTO `ih_house_facility` VALUES (1, 4);
INSERT INTO `ih_house_facility` VALUES (2, 4);
INSERT INTO `ih_house_facility` VALUES (3, 4);
INSERT INTO `ih_house_facility` VALUES (4, 4);
INSERT INTO `ih_house_facility` VALUES (5, 4);
INSERT INTO `ih_house_facility` VALUES (6, 4);
INSERT INTO `ih_house_facility` VALUES (7, 4);
INSERT INTO `ih_house_facility` VALUES (2, 5);
INSERT INTO `ih_house_facility` VALUES (3, 5);
INSERT INTO `ih_house_facility` VALUES (4, 5);
INSERT INTO `ih_house_facility` VALUES (5, 5);
INSERT INTO `ih_house_facility` VALUES (6, 5);
INSERT INTO `ih_house_facility` VALUES (7, 5);
INSERT INTO `ih_house_facility` VALUES (2, 6);
INSERT INTO `ih_house_facility` VALUES (3, 6);
INSERT INTO `ih_house_facility` VALUES (4, 6);
INSERT INTO `ih_house_facility` VALUES (5, 6);
INSERT INTO `ih_house_facility` VALUES (6, 6);
INSERT INTO `ih_house_facility` VALUES (7, 6);
INSERT INTO `ih_house_facility` VALUES (3, 7);
INSERT INTO `ih_house_facility` VALUES (4, 7);
INSERT INTO `ih_house_facility` VALUES (5, 7);
INSERT INTO `ih_house_facility` VALUES (6, 7);
INSERT INTO `ih_house_facility` VALUES (7, 7);
INSERT INTO `ih_house_facility` VALUES (2, 8);
INSERT INTO `ih_house_facility` VALUES (3, 8);
INSERT INTO `ih_house_facility` VALUES (5, 8);
INSERT INTO `ih_house_facility` VALUES (6, 8);
INSERT INTO `ih_house_facility` VALUES (7, 8);
INSERT INTO `ih_house_facility` VALUES (2, 9);
INSERT INTO `ih_house_facility` VALUES (3, 9);
INSERT INTO `ih_house_facility` VALUES (4, 9);
INSERT INTO `ih_house_facility` VALUES (5, 9);
INSERT INTO `ih_house_facility` VALUES (6, 9);
INSERT INTO `ih_house_facility` VALUES (7, 9);
INSERT INTO `ih_house_facility` VALUES (2, 10);
INSERT INTO `ih_house_facility` VALUES (3, 10);
INSERT INTO `ih_house_facility` VALUES (5, 10);
INSERT INTO `ih_house_facility` VALUES (6, 10);
INSERT INTO `ih_house_facility` VALUES (7, 10);
INSERT INTO `ih_house_facility` VALUES (2, 11);
INSERT INTO `ih_house_facility` VALUES (3, 11);
INSERT INTO `ih_house_facility` VALUES (5, 11);
INSERT INTO `ih_house_facility` VALUES (6, 11);
INSERT INTO `ih_house_facility` VALUES (7, 11);
INSERT INTO `ih_house_facility` VALUES (2, 12);
INSERT INTO `ih_house_facility` VALUES (3, 12);
INSERT INTO `ih_house_facility` VALUES (5, 12);
INSERT INTO `ih_house_facility` VALUES (6, 12);
INSERT INTO `ih_house_facility` VALUES (7, 12);
INSERT INTO `ih_house_facility` VALUES (2, 13);
INSERT INTO `ih_house_facility` VALUES (3, 13);
INSERT INTO `ih_house_facility` VALUES (5, 13);
INSERT INTO `ih_house_facility` VALUES (6, 13);
INSERT INTO `ih_house_facility` VALUES (7, 13);
INSERT INTO `ih_house_facility` VALUES (2, 14);
INSERT INTO `ih_house_facility` VALUES (5, 14);
INSERT INTO `ih_house_facility` VALUES (6, 14);
INSERT INTO `ih_house_facility` VALUES (7, 14);
INSERT INTO `ih_house_facility` VALUES (2, 15);
INSERT INTO `ih_house_facility` VALUES (5, 15);
INSERT INTO `ih_house_facility` VALUES (7, 15);
INSERT INTO `ih_house_facility` VALUES (4, 16);
INSERT INTO `ih_house_facility` VALUES (5, 16);
INSERT INTO `ih_house_facility` VALUES (5, 17);
INSERT INTO `ih_house_facility` VALUES (5, 18);
INSERT INTO `ih_house_facility` VALUES (5, 19);
INSERT INTO `ih_house_facility` VALUES (7, 19);
INSERT INTO `ih_house_facility` VALUES (5, 20);
INSERT INTO `ih_house_facility` VALUES (7, 20);
INSERT INTO `ih_house_facility` VALUES (5, 21);
INSERT INTO `ih_house_facility` VALUES (7, 21);
INSERT INTO `ih_house_facility` VALUES (5, 22);
INSERT INTO `ih_house_facility` VALUES (7, 22);
INSERT INTO `ih_house_facility` VALUES (5, 23);
INSERT INTO `ih_house_facility` VALUES (7, 23);

-- ----------------------------
-- Table structure for ih_house_image
-- ----------------------------
DROP TABLE IF EXISTS `ih_house_image`;
CREATE TABLE `ih_house_image`  (
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` int(11) NOT NULL,
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `house_id`(`house_id`) USING BTREE,
  CONSTRAINT `ih_house_image_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `ih_house_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ih_house_image
-- ----------------------------
INSERT INTO `ih_house_image` VALUES ('2020-02-17 00:25:25', '2020-02-17 00:25:25', 1, 1, 'FsxYqPJ-fJtVZZH2LEshL7o9Ivxn');
INSERT INTO `ih_house_image` VALUES ('2020-02-17 00:25:39', '2020-02-17 00:25:39', 2, 1, 'FsHyv4WUHKUCpuIRftvwSO_FJWOG');
INSERT INTO `ih_house_image` VALUES ('2020-02-17 21:40:12', '2020-02-17 21:40:12', 3, 2, 'FsxYqPJ-fJtVZZH2LEshL7o9Ivxn');
INSERT INTO `ih_house_image` VALUES ('2020-02-17 21:40:22', '2020-02-17 21:40:22', 4, 2, 'FsHyv4WUHKUCpuIRftvwSO_FJWOG');
INSERT INTO `ih_house_image` VALUES ('2020-02-17 21:40:33', '2020-02-17 21:40:33', 5, 2, 'FoZg1QLpRi4vckq_W3tBBQe1wJxn');
INSERT INTO `ih_house_image` VALUES ('2020-02-18 22:44:31', '2020-02-18 22:44:31', 7, 3, 'FoZg1QLpRi4vckq_W3tBBQe1wJxn');
INSERT INTO `ih_house_image` VALUES ('2020-02-18 22:44:47', '2020-02-18 22:44:47', 8, 3, 'FsxYqPJ-fJtVZZH2LEshL7o9Ivxn');
INSERT INTO `ih_house_image` VALUES ('2020-02-18 22:44:54', '2020-02-18 22:44:54', 9, 3, 'FsHyv4WUHKUCpuIRftvwSO_FJWOG');
INSERT INTO `ih_house_image` VALUES ('2020-02-18 22:46:29', '2020-02-18 22:46:29', 10, 4, 'FsxYqPJ-fJtVZZH2LEshL7o9Ivxn');
INSERT INTO `ih_house_image` VALUES ('2020-02-18 22:46:34', '2020-02-18 22:46:34', 11, 4, 'FsHyv4WUHKUCpuIRftvwSO_FJWOG');
INSERT INTO `ih_house_image` VALUES ('2020-02-18 22:46:39', '2020-02-18 22:46:39', 12, 4, 'FoZg1QLpRi4vckq_W3tBBQe1wJxn');
INSERT INTO `ih_house_image` VALUES ('2020-02-18 22:48:00', '2020-02-18 22:48:00', 13, 5, 'FsHyv4WUHKUCpuIRftvwSO_FJWOG');
INSERT INTO `ih_house_image` VALUES ('2020-02-18 22:48:07', '2020-02-18 22:48:07', 14, 5, 'FsxYqPJ-fJtVZZH2LEshL7o9Ivxn');
INSERT INTO `ih_house_image` VALUES ('2020-02-18 22:48:11', '2020-02-18 22:48:11', 15, 5, 'FoZg1QLpRi4vckq_W3tBBQe1wJxn');
INSERT INTO `ih_house_image` VALUES ('2020-02-18 22:49:10', '2020-02-18 22:49:10', 16, 6, 'FoZg1QLpRi4vckq_W3tBBQe1wJxn');
INSERT INTO `ih_house_image` VALUES ('2020-02-18 22:49:14', '2020-02-18 22:49:14', 17, 6, 'FsHyv4WUHKUCpuIRftvwSO_FJWOG');
INSERT INTO `ih_house_image` VALUES ('2020-02-18 22:49:19', '2020-02-18 22:49:19', 18, 6, 'FsxYqPJ-fJtVZZH2LEshL7o9Ivxn');
INSERT INTO `ih_house_image` VALUES ('2020-02-22 18:29:58', '2020-02-22 18:29:58', 19, 7, 'FsHyv4WUHKUCpuIRftvwSO_FJWOG');
INSERT INTO `ih_house_image` VALUES ('2020-02-22 18:30:07', '2020-02-22 18:30:07', 20, 7, 'FsxYqPJ-fJtVZZH2LEshL7o9Ivxn');

-- ----------------------------
-- Table structure for ih_house_info
-- ----------------------------
DROP TABLE IF EXISTS `ih_house_info`;
CREATE TABLE `ih_house_info`  (
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `address` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `room_count` int(11) NULL DEFAULT NULL,
  `acreage` int(11) NULL DEFAULT NULL,
  `unit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `capacity` int(11) NULL DEFAULT NULL,
  `beds` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deposit` int(11) NULL DEFAULT NULL,
  `min_days` int(11) NULL DEFAULT NULL,
  `max_days` int(11) NULL DEFAULT NULL,
  `order_count` int(11) NULL DEFAULT NULL,
  `index_image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `area_id`(`area_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `ih_house_info_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `ih_area_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ih_house_info_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `ih_user_profile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ih_house_info
-- ----------------------------
INSERT INTO `ih_house_info` VALUES ('2020-02-17 00:23:22', '2020-02-17 00:25:25', 1, 1, 1, '房屋1', 39900, '测试地址1', 7, 400, '复式', 12, '双人床4张', 50000, 4, 0, 0, 'FsxYqPJ-fJtVZZH2LEshL7o9Ivxn');
INSERT INTO `ih_house_info` VALUES ('2020-02-17 21:40:03', '2020-02-17 21:40:12', 2, 1, 1, '房屋2', 49900, '测试地点2', 1, 60, '两室一厅一卫', 4, '双人床*4', 50000, 1, 0, 0, 'FsHyv4WUHKUCpuIRftvwSO_FJWOG');
INSERT INTO `ih_house_info` VALUES ('2020-02-18 22:44:22', '2020-02-18 22:44:31', 3, 1, 1, '房屋3', 49900, '测试地点3', 5, 60, '一室一厅', 3, '双人床*1', 20000, 1, 0, 0, 'FoZg1QLpRi4vckq_W3tBBQe1wJxn');
INSERT INTO `ih_house_info` VALUES ('2020-02-18 22:46:23', '2020-02-18 22:46:29', 4, 1, 1, '房屋4', 29900, '测试地址4', 1, 50, '一室一厅', 3, '单人床', 20000, 1, 0, 0, 'FsxYqPJ-fJtVZZH2LEshL7o9Ivxn');
INSERT INTO `ih_house_info` VALUES ('2020-02-18 22:47:54', '2020-02-20 20:19:37', 5, 1, 1, '房屋5', 69900, '测试地址5', 3, 150, '三室两厅', 6, '双人床*4', 50000, 1, 0, 1, 'FsHyv4WUHKUCpuIRftvwSO_FJWOG');
INSERT INTO `ih_house_info` VALUES ('2020-02-18 22:49:05', '2020-02-22 13:03:54', 6, 1, 1, '房屋6', 49900, '测试地点6', 3, 80, '两室两厅', 4, '双人床*2', 40000, 1, 0, 1, 'FoZg1QLpRi4vckq_W3tBBQe1wJxn');
INSERT INTO `ih_house_info` VALUES ('2020-02-22 18:29:24', '2020-02-22 18:29:58', 7, 1, 1, '房屋7', 59900, '测试地点7', 3, 90, '三室两厅两卫', 5, '双人床*2', 50000, 1, 0, 0, 'FsHyv4WUHKUCpuIRftvwSO_FJWOG');

-- ----------------------------
-- Table structure for ih_order_info
-- ----------------------------
DROP TABLE IF EXISTS `ih_order_info`;
CREATE TABLE `ih_order_info`  (
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `begin_date` datetime(0) NOT NULL,
  `end_date` datetime(0) NOT NULL,
  `days` int(11) NOT NULL,
  `house_price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` enum('WAIT_ACCEPT','WAIT_PAYMENT','PAID','WAIT_COMMENT','COMPLETE','CANCELED','REJECTED') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `trade_no` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `house_id`(`house_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `ix_ih_order_info_status`(`status`) USING BTREE,
  CONSTRAINT `ih_order_info_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `ih_house_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ih_order_info_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `ih_user_profile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ih_order_info
-- ----------------------------
INSERT INTO `ih_order_info` VALUES ('2020-02-19 21:44:00', '2020-02-20 20:19:38', 12, 4, 5, '2020-02-19 00:00:00', '2020-02-20 00:00:00', 2, 69900, 139800, 'COMPLETE', '价格合适 下次一定!', '2020022022001400991000071972');
INSERT INTO `ih_order_info` VALUES ('2020-02-22 18:41:15', '2020-02-22 18:41:54', 14, 4, 4, '2020-02-22 00:00:00', '2020-02-22 00:00:00', 1, 29900, 29900, 'REJECTED', '不想接单 任性！', NULL);
INSERT INTO `ih_order_info` VALUES ('2020-02-22 20:43:28', '2020-02-22 20:44:40', 15, 4, 5, '2020-02-22 00:00:00', '2020-02-22 00:00:00', 1, 69900, 69900, 'WAIT_PAYMENT', NULL, NULL);
INSERT INTO `ih_order_info` VALUES ('2020-02-22 12:42:53', '2020-02-22 13:03:54', 18, 4, 6, '2020-02-22 00:00:00', '2020-02-22 00:00:00', 1, 49900, 49900, 'COMPLETE', '下次一定', '2020022222001400991000081081');

-- ----------------------------
-- Table structure for ih_user_profile
-- ----------------------------
DROP TABLE IF EXISTS `ih_user_profile`;
CREATE TABLE `ih_user_profile`  (
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password_hash` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ih_user_profile
-- ----------------------------
INSERT INTO `ih_user_profile` VALUES ('2020-02-15 00:11:23', '2020-02-22 18:25:56', 1, 'maSks', 'pbkdf2:sha256:150000$794Ama2c$e5bdefca0e10dddd168c89f69163f5e8b6b6a20db23aa744b07578a59bf2c563', '18011111111', 'l', '111111111111111111', 'Ft9kZKoQaFJZJRZiJtJAcKsNiSPm');
INSERT INTO `ih_user_profile` VALUES ('2020-02-19 15:14:35', '2020-02-19 15:15:30', 4, 'laisent', 'pbkdf2:sha256:150000$jl2A5mmJ$bd85aeb410ec30e45dfc3cc656ff591be030975cc4302fdfff9c04e20ca28c87', '18011111112', NULL, NULL, 'Fn71bRxkIewHhGNWxhsbvirDGYuO');

SET FOREIGN_KEY_CHECKS = 1;
