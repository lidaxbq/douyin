/*
 Navicat Premium Data Transfer

 Source Server         : dy阿里云
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 115.29.172.197:3306
 Source Schema         : dy

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 17/06/2020 13:01:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fan_change
-- ----------------------------
DROP TABLE IF EXISTS `fan_change`;
CREATE TABLE `fan_change`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_info_id` int(10) NULL DEFAULT NULL,
  `fan_num` int(10) NULL DEFAULT NULL,
  `check_time` bigint(20) NULL DEFAULT NULL,
  `uid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 486278 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fan_change_copy1
-- ----------------------------
DROP TABLE IF EXISTS `fan_change_copy1`;
CREATE TABLE `fan_change_copy1`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_info_id` int(10) NULL DEFAULT NULL,
  `fan_num` int(10) NULL DEFAULT NULL,
  `check_time` bigint(20) NULL DEFAULT NULL,
  `uid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207558 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fan_overlap
-- ----------------------------
DROP TABLE IF EXISTS `fan_overlap`;
CREATE TABLE `fan_overlap`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `talenta_id` int(255) NOT NULL COMMENT '用户a',
  `talentb_id` int(255) NULL DEFAULT NULL COMMENT '用户b',
  `talenda_fan_num` int(11) NULL DEFAULT NULL COMMENT 'a的粉丝数量',
  `talendb_fan_num` int(255) NULL DEFAULT NULL,
  `overlap_value` int(10) NULL DEFAULT NULL COMMENT '重合的数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fans_user_info
-- ----------------------------
DROP TABLE IF EXISTS `fans_user_info`;
CREATE TABLE `fans_user_info`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nick_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar_href` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `age` int(2) NULL DEFAULT NULL,
  `gender` int(2) NULL DEFAULT NULL,
  `login_device` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登陆设备',
  `follower_count` int(10) NULL DEFAULT NULL COMMENT '粉丝',
  `following_count` int(10) NULL DEFAULT NULL COMMENT '关注数',
  `total_favorited` int(10) NULL DEFAULT NULL COMMENT '点赞数',
  `total_comment_num` int(10) NULL DEFAULT NULL COMMENT '获得评论数',
  `total_share_num` int(10) NULL DEFAULT NULL COMMENT '分享',
  `total_dynaic_num` int(10) NULL DEFAULT NULL COMMENT '动态',
  `aweme_count` int(10) NULL DEFAULT NULL COMMENT '作品数',
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签名，描述',
  `birthday` date NULL DEFAULT NULL,
  `dy_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '抖音号',
  `favoriting_count` int(10) NULL DEFAULT NULL COMMENT '喜欢的作品数量',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6219253 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for platform
-- ----------------------------
DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `platform_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台名字',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for platform_property
-- ----------------------------
DROP TABLE IF EXISTS `platform_property`;
CREATE TABLE `platform_property`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `platform_id` int(10) NULL DEFAULT NULL COMMENT '平台类型的id',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '类型id',
  `check_time` bigint(20) NULL DEFAULT NULL COMMENT '检查的时间点',
  `all_user_num` int(10) NULL DEFAULT NULL COMMENT '行业总用户数',
  `real_all_user_num` int(10) NULL DEFAULT NULL COMMENT '有效用户数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for platform_property_analyse
-- ----------------------------
DROP TABLE IF EXISTS `platform_property_analyse`;
CREATE TABLE `platform_property_analyse`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `platform_id` int(10) NULL DEFAULT NULL,
  `all_fans_num` int(10) NULL DEFAULT NULL COMMENT '总粉丝',
  `real_fans_num` int(10) NULL DEFAULT NULL COMMENT '真实粉丝',
  `max_video_play_num` int(11) NULL DEFAULT NULL,
  `min_video_play_num` int(11) NULL DEFAULT NULL COMMENT '作品视频播放量最少的数量',
  `avg_video_play_num` int(10) NULL DEFAULT NULL COMMENT '视频播放量',
  `predict_video_play_num` int(255) NULL DEFAULT NULL COMMENT '预测视频播放量',
  `interaction_rate` float(20, 0) NULL DEFAULT NULL COMMENT '交互率',
  `price` int(10) NULL DEFAULT NULL COMMENT '价格',
  `predict_cpm` float(255, 0) NULL DEFAULT NULL COMMENT '预测cpm',
  `max_like_num` int(11) NULL DEFAULT NULL,
  `min_like_num` int(11) NULL DEFAULT NULL,
  `avg_like_num` int(10) NULL DEFAULT NULL COMMENT '点赞',
  `max_comment_num` int(11) NULL DEFAULT NULL COMMENT '作品中评论数最少的数量',
  `min_comment_num` int(11) NULL DEFAULT NULL,
  `avg_comment_num` int(10) NULL DEFAULT NULL COMMENT '评论',
  `work_num` int(10) NULL DEFAULT NULL COMMENT '作品',
  `dynamic_num` int(11) NULL DEFAULT NULL COMMENT '动态',
  `min_share_num` int(11) NULL DEFAULT NULL,
  `avg_share_num` int(11) NULL DEFAULT NULL COMMENT '转发',
  `max_share_num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 435 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for price
-- ----------------------------
DROP TABLE IF EXISTS `price`;
CREATE TABLE `price`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `talent_user_id` int(11) NULL DEFAULT NULL,
  `time_range` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '视频时间长度',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '视频类型',
  `price` int(10) NULL DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5359 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for talent_fans_union
-- ----------------------------
DROP TABLE IF EXISTS `talent_fans_union`;
CREATE TABLE `talent_fans_union`  (
  `talent_id` int(255) NOT NULL COMMENT '达人id',
  `fans_id` int(255) NOT NULL COMMENT '粉丝id',
  `id` int(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index`(`talent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3690436 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for talent_type
-- ----------------------------
DROP TABLE IF EXISTS `talent_type`;
CREATE TABLE `talent_type`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '达人类型名',
  `type_sub_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子类型名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for talent_type_union
-- ----------------------------
DROP TABLE IF EXISTS `talent_type_union`;
CREATE TABLE `talent_type_union`  (
  `talent_user_info_id` int(10) NOT NULL,
  `talent_type_id` int(10) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for talent_user_info
-- ----------------------------
DROP TABLE IF EXISTS `talent_user_info`;
CREATE TABLE `talent_user_info`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '抖音app里的id',
  `unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '抖音、星图id',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avatar_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像地址',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '市',
  `gender` int(2) NULL DEFAULT NULL COMMENT '0:女，1：男，2：其他',
  `total_like` int(11) NULL DEFAULT NULL COMMENT '点赞数量',
  `avg_like` int(255) NULL DEFAULT NULL COMMENT '平均点赞',
  `fans_count` int(11) NULL DEFAULT NULL COMMENT '粉丝数量',
  `focus_count` int(11) NULL DEFAULT NULL COMMENT '关注数量',
  `real_fans_count` int(11) NULL DEFAULT NULL COMMENT '真粉数量',
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户提出的价格：1-20s：1000，20s-60s：2000',
  `value` float(10, 5) NULL DEFAULT NULL COMMENT '计算的真实价值：',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户领域',
  `total_play_num` int(11) NULL DEFAULT NULL COMMENT '总播放量',
  `avg_play_num` int(10) NULL DEFAULT NULL COMMENT '平均播放量',
  `pre_play_num` int(10) NULL DEFAULT NULL COMMENT '预期播放量',
  `play_num_unit` float(5, 5) NULL DEFAULT NULL COMMENT '单位粉丝贡献播放量',
  `interaction_num` float(10, 5) NULL DEFAULT NULL COMMENT '互动率',
  `total_comment_num` int(10) NULL DEFAULT NULL COMMENT '总评论数',
  `avg_comment` int(255) NULL DEFAULT NULL COMMENT '平均评论数',
  `total_share_num` int(11) NULL DEFAULT NULL COMMENT '总分享数',
  `avg_share_num` int(11) NULL DEFAULT NULL COMMENT '平均分享数',
  `total_dynaic_num` int(10) NULL DEFAULT NULL COMMENT '发表的动态数量',
  `communication_value` float(10, 5) NULL DEFAULT NULL COMMENT '传播力',
  `fans_feature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '粉丝特征',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户描述',
  `video_count` int(11) NULL DEFAULT NULL COMMENT '视频数',
  `is_verified` int(10) NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `cpm` float(10, 5) NULL DEFAULT NULL,
  `xt_pre_play_num` int(11) NULL DEFAULT NULL,
  `xt_cpm` float(255, 0) NULL DEFAULT NULL,
  `xt_order_complete_num` int(11) NULL DEFAULT NULL COMMENT '星图上任务完成数',
  `other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '扩展字段',
  `platform_id` int(11) NULL DEFAULT 1 COMMENT '平台id',
  `favoriting_count` int(255) NULL DEFAULT NULL COMMENT '喜欢的作品数量',
  `datafrom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '爬虫扩展字段：来源',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniqueid`(`unique_id`) USING BTREE,
  INDEX `nickname`(`nick_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2515 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `passwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_id` int(11) NULL DEFAULT NULL,
  `other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '抖音的视频id',
  `worker_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作品的抖音链接',
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '抖音id',
  `user_info_id` int(255) NULL DEFAULT NULL COMMENT '用户信息表的id',
  `video_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '视频标题',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `play_num` int(10) NULL DEFAULT NULL,
  `comment_num` int(10) NULL DEFAULT NULL,
  `share_num` int(10) NULL DEFAULT NULL,
  `favorited_num` int(10) NULL DEFAULT NULL COMMENT '点赞数量',
  `create_time` bigint(20) NULL DEFAULT NULL,
  `duration` int(10) NULL DEFAULT NULL COMMENT '时长，单位s',
  `forward_count` int(10) NULL DEFAULT NULL COMMENT '应该是视频的广告的点击数量',
  `download_count` int(10) NULL DEFAULT NULL COMMENT '下载数量',
  `head_image_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `extren` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `vid`(`vid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 175811 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for video_change
-- ----------------------------
DROP TABLE IF EXISTS `video_change`;
CREATE TABLE `video_change`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '视频id',
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '达人id',
  `myvid` int(11) NULL DEFAULT NULL COMMENT '我们的视频id',
  `myuid` int(11) NULL DEFAULT NULL COMMENT '我们的达人id',
  `video_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `play_num` int(11) NULL DEFAULT NULL COMMENT '播放量',
  `comment_num` int(11) NULL DEFAULT NULL COMMENT '评论数量',
  `share_num` int(11) NULL DEFAULT NULL COMMENT '分享数量',
  `favorited_num` int(11) NULL DEFAULT NULL COMMENT '点赞数量',
  `download_count` int(255) NULL DEFAULT NULL COMMENT '下载数量',
  `extren` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `record_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '记录时间',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '视频发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80263 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for video_comment
-- ----------------------------
DROP TABLE IF EXISTS `video_comment`;
CREATE TABLE `video_comment`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建的时间戳',
  `digg_count` int(10) NULL DEFAULT NULL COMMENT '点赞数量',
  `is_reply` int(2) NULL DEFAULT NULL COMMENT '1: 回复\r\n0：评论',
  `reply_id` int(255) NULL DEFAULT NULL COMMENT '作为评论时，指向视频作品id，作为回复时，是评论的id',
  `reply_comment_total` int(10) NULL DEFAULT NULL COMMENT '该条评论的回复的总数量',
  `uid` int(255) NULL DEFAULT NULL COMMENT '用户id',
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段',
  `cid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '抖音的评论id',
  `vid` int(11) NULL DEFAULT NULL COMMENT '作品id',
  `author_id` int(11) NULL DEFAULT NULL COMMENT '作者id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 557 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
