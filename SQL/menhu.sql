/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : menhu

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 25/11/2021 21:39:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aw_accounts
-- ----------------------------
DROP TABLE IF EXISTS `aw_accounts`;
CREATE TABLE `aw_accounts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  `avatar` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'http://localhost:3000/upload/20210612/16234847490027294.png',
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '个人介绍',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `aw_accounts_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `aw_roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of aw_accounts
-- ----------------------------
INSERT INTO `aw_accounts` VALUES (1, 'admin', '$2b$10$CF58gT1FjtbAsz0NqMLKSOOdzcHgWds7eXimZYh.h0MXxzJmIk3yK', '2021-04-13 22:06:24', '2021-06-12 18:18:47', 1, 'http://localhost:3000/upload/20210612/16234846156416317.png', '超级管理员', '张三', '男', '技术一部', '浙江-杭州');
INSERT INTO `aw_accounts` VALUES (2, 'youke', '$2b$10$cX52DV7xdVi3ONXGC1RsXeM8EsCtGQFwFqRYaSW2mDE6fjEhkRadK', '2021-04-14 16:36:04', '2021-06-13 14:37:41', 3, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '游客，普通权限', '王五', '男', '运营二部', '北京');
INSERT INTO `aw_accounts` VALUES (16, 'editor', '$2b$10$BmRzMNTLMocyHqzHNutBQuZJJ6j/S0mkdgK/Ffe7E/jiVovFh9ezi', '2021-06-04 21:32:15', '2021-06-15 09:40:16', 2, 'http://localhost:3000/upload/2021064/16228135311306915.jpg', '文章编辑员', '李四', '男', '运营一部', '北京');
INSERT INTO `aw_accounts` VALUES (27, 'normal', '$2b$10$yF/EfQIgxM5QErwfOjOX6OL.GH6fTO5yIFbvnzEszbk.FKMHQxWVu', '2021-06-15 22:00:19', '2021-06-15 22:00:19', 3, 'http://localhost:3000/upload/20210615/16237656051412474.png', '普通用户', NULL, NULL, NULL, NULL);
INSERT INTO `aw_accounts` VALUES (28, 'normal02', '$2b$10$eOw05lZiBVUF/IOP8cZeYOV4gYcba.1FkNMv1EaC2l20EX0XOq1YO', '2021-06-15 22:00:47', '2021-06-15 22:00:47', 3, 'http://localhost:3000/upload/20210615/16237656414616152.png', '普通用户', NULL, NULL, NULL, NULL);
INSERT INTO `aw_accounts` VALUES (29, 'test', '$2b$10$LO4uM7rfz8Dd0KCOlojes.uMNMK2CzCoFyVtvA2VBML63GseszWdS', '2021-09-25 22:56:51', '2021-09-25 22:56:51', 3, 'http://localhost:3000/upload/20210612/16234847490027294.png', '个人介绍', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for aw_city_infos
-- ----------------------------
DROP TABLE IF EXISTS `aw_city_infos`;
CREATE TABLE `aw_city_infos`  (
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市名称',
  `en_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市代码',
  INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of aw_city_infos
-- ----------------------------
INSERT INTO `aw_city_infos` VALUES ('2021-04-25 21:35:51', '2021-04-25 21:35:45', '上海', 'Shanghai', 'CT_125');
INSERT INTO `aw_city_infos` VALUES ('2021-04-25 21:41:43', '2021-04-25 21:41:38', '北京', 'Beijing', 'CT_11');
INSERT INTO `aw_city_infos` VALUES ('2021-04-25 21:41:43', '2021-04-25 21:41:38', '杭州', 'HangZhou', 'CT_12');
INSERT INTO `aw_city_infos` VALUES ('2021-04-25 21:41:43', '2021-04-25 21:41:38', '深圳', 'ShenZhen', 'CT_13');

-- ----------------------------
-- Table structure for aw_images
-- ----------------------------
DROP TABLE IF EXISTS `aw_images`;
CREATE TABLE `aw_images`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'url链接，图片后期存放在oss',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型:swiper--轮播图图片,background--背景图图片,product--产品图片',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '补充信息',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aw_images
-- ----------------------------
INSERT INTO `aw_images` VALUES (1, 'https://th.wallhaven.cc/lg/72/72rxqo.jpg', 'swiper', NULL, '2021-10-08 23:53:23', '2021-10-08 23:53:35');
INSERT INTO `aw_images` VALUES (2, 'https://th.wallhaven.cc/small/g7/g75r7d.jpg', 'swiper', NULL, '2021-10-09 00:07:14', '2021-10-09 00:07:16');
INSERT INTO `aw_images` VALUES (3, 'https://th.wallhaven.cc/lg/o3/o32kol.jpg', 'swiper', NULL, '2021-10-09 00:07:40', '2021-10-11 06:56:18');
INSERT INTO `aw_images` VALUES (4, 'https://th.wallhaven.cc/small/x8/x8z9yo.jpg', 'swiper', NULL, '2021-10-09 00:10:34', '2021-10-09 00:10:37');
INSERT INTO `aw_images` VALUES (5, 'https://th.wallhaven.cc/small/3z/3z32j3.jpg', 'swiper', NULL, '2021-10-09 00:10:54', '2021-10-09 00:10:58');

-- ----------------------------
-- Table structure for aw_job_categories
-- ----------------------------
DROP TABLE IF EXISTS `aw_job_categories`;
CREATE TABLE `aw_job_categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位类别',
  `depth` int(11) NOT NULL,
  `en_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位类别',
  `parent` int(11) NULL DEFAULT NULL COMMENT '父级职位类别',
  `children` int(11) NULL DEFAULT NULL COMMENT '父级职位类别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of aw_job_categories
-- ----------------------------
INSERT INTO `aw_job_categories` VALUES (1, '2021-04-25 21:33:41', '2021-04-25 21:33:45', '产品运营', 2, 'Product ops', 2, NULL);
INSERT INTO `aw_job_categories` VALUES (2, '2021-04-25 21:35:11', '2021-04-25 21:35:06', '运营', 1, 'Operations', NULL, NULL);
INSERT INTO `aw_job_categories` VALUES (3, '2021-04-25 21:40:06', '2021-04-25 21:39:58', '前端', 2, 'Frontend', 4, NULL);
INSERT INTO `aw_job_categories` VALUES (4, '2021-04-25 21:40:45', '2021-04-25 21:40:41', '研发', 1, 'R&D', NULL, NULL);
INSERT INTO `aw_job_categories` VALUES (5, '2021-04-26 16:11:43', '2021-04-26 16:11:47', '设计', 1, 'design', NULL, NULL);

-- ----------------------------
-- Table structure for aw_jobs
-- ----------------------------
DROP TABLE IF EXISTS `aw_jobs`;
CREATE TABLE `aw_jobs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `job_category` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位描述',
  `requirement` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位要求',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位名称',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `job_category`(`job_category`) USING BTREE,
  INDEX `city`(`city`) USING BTREE,
  CONSTRAINT `aw_jobs_ibfk_3183` FOREIGN KEY (`job_category`) REFERENCES `aw_job_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `aw_jobs_ibfk_3184` FOREIGN KEY (`city`) REFERENCES `aw_city_infos` (`code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of aw_jobs
-- ----------------------------
INSERT INTO `aw_jobs` VALUES (1, '2021-04-25 21:37:32', '2021-05-30 19:31:26', 1, '1、负责电商红人美妆店铺的运营工作，助力红人店铺发展；\n2、设计美妆红人店铺直播解决方案，根据行业发展特征和消费者洞察力，输出美妆红人店铺打法及落地；设计美妆红人店铺直播解决方案，根据行业发展特征和消费者洞察力，输出美妆红人店铺打法及落地；\n3、和主播进行美妆货品结构方向的沟通，帮助红人通过直播加速商品流通。', '1、3年以上互联网平台店铺运营经验，有直播电商经验加分；\r\n2、对数据敏感，逻辑能力强，可以从海量数据中发掘机会点助力美妆红人店铺业务的增长；\r\n3、具备美妆行业的洞察力，从商品供给侧进行红人店铺机会的挖掘和放大。', '电商美妆行业运营专家-红人店方向', 'CT_125');
INSERT INTO `aw_jobs` VALUES (2, '2021-04-25 21:43:24', '2021-06-16 13:11:50', 3, '测试城市\n1、负责公司商业变现业务的设计和开发，完成项目的前端架构设计，并带领团队完成具体业务落地；\n2、持续改进公司前端工程化体系，推动前端的自动化、工具化；\n3、为团队建立明确的技术发展路线，构建统一的企业级前端运行态框架和组件库；\n4、优秀的技术敏锐性，紧跟技术发展，并将成果应用于组织；\n5、营造良好的前端技术氛围，领导并促进团队成长；\n6、负责解决前端开发流程中的各种痛点，带领技术攻关。\n\n**薪资：** 15k/年', '1、本科及以上学历，五年以上前端研发经验，有团队管理经验；\n2、精通各种Web前端技术，熟悉面向对象，函数式编程等常见技术开发模式；\n3、理解最新Web标准和转换策略，对ES6的可用性相关知识有实际的了解和实践经验；\n4、对前端MV*框架有深刻理解，至少有一个现代库或框架的大型项目经验（如：Backbone、Angular、 React、Vue）；\n5、有前端架构设计、性能优化、组件化和模块化方面的实践经验；\n6、熟悉前端工程化工具，如Fis3、Webpack、Rollup等；\n7、熟悉一门服务端语言并有一定的开发经验 (如：Node，Python，PHP，Java)；\n8、对自动化测试，单元测试，集成测试等代码质量优化方式有一定的理解和实践；\n9、热衷学习与分享，喜欢阅读技术文档和书籍，有自己的开源社区项目或者技术博客。', '前端开发负责人 - 商业变现', 'CT_11');
INSERT INTO `aw_jobs` VALUES (36, '2021-05-30 19:30:38', '2021-06-03 22:16:30', 3, '1、参与推荐/机器学习中台的构建，负责数据可视化，产品设计和技术选型；\n2、负责AI相关业务场景下的前端开发和交付；\n3、负责系统设计评审、代码审计等工作保证平台高质量落地。\n![wy.jpg](http://localhost:3000/upload/2021063/16227297868578750.jpg)', '1、扎实的操作系统和数据结构基础；\n2、熟悉 HTML、CSS、JavaScript 和主流语言标准；\n3、熟悉主流前端框架和工具，有 React 和 Webpack 经验者优先；\n4、熟悉 Web 性能优化，了解 Web 应用最佳实践；\n5、对用户体验有深刻的理解，热衷于从用户视角改善平台体验；\n6、具备良好的服务意识、责任心、较强的学习能力和优秀的团队沟通与协作能力。', '前端开发工程师-机器学习平台', 'CT_125');

-- ----------------------------
-- Table structure for aw_menu_lists
-- ----------------------------
DROP TABLE IF EXISTS `aw_menu_lists`;
CREATE TABLE `aw_menu_lists`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单路径',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of aw_menu_lists
-- ----------------------------
INSERT INTO `aw_menu_lists` VALUES (1, NULL, 'Dashboard', 'dashboard', '/dashboard', '2021-05-16 13:53:50', '2021-05-16 13:53:54', '首页');
INSERT INTO `aw_menu_lists` VALUES (2, NULL, 'Personal', 'el-icon-s-help', '/personal', '2021-05-16 14:01:22', '2021-05-16 14:01:26', '个人中心');
INSERT INTO `aw_menu_lists` VALUES (5, NULL, 'Permission', 'nested', '/permission', '2021-05-16 16:31:39', '2021-05-16 16:31:43', '权限管理');
INSERT INTO `aw_menu_lists` VALUES (6, NULL, 'Article', 'el-icon-s-help', '/article', '2021-05-16 18:57:42', '2021-05-16 18:57:46', '文章管理');
INSERT INTO `aw_menu_lists` VALUES (7, 5, 'RoleManage', NULL, 'role_manage', '2021-05-17 21:17:17', '2021-05-17 21:17:22', '角色管理');
INSERT INTO `aw_menu_lists` VALUES (8, 5, 'RolePermission', NULL, 'role_permission', '2021-05-17 21:17:42', '2021-05-17 21:17:38', '角色权限');
INSERT INTO `aw_menu_lists` VALUES (9, 5, 'List', NULL, 'list', '2021-05-27 17:46:07', '2021-05-27 17:46:10', '权限列表');
INSERT INTO `aw_menu_lists` VALUES (10, 6, 'CreateArticle', NULL, 'create', '2021-05-27 17:46:48', '2021-05-27 17:46:51', '创建文章');
INSERT INTO `aw_menu_lists` VALUES (11, 6, 'EditArticle', NULL, 'edit/:id(\\d+)', '2021-05-27 17:47:24', '2021-05-27 17:47:34', '编辑文章');
INSERT INTO `aw_menu_lists` VALUES (12, 6, 'ArticleList', NULL, 'list', '2021-05-27 17:47:54', '2021-05-27 17:47:57', '文章列表');
INSERT INTO `aw_menu_lists` VALUES (13, NULL, 'Job', NULL, '/job', '2021-05-27 17:53:43', '2021-05-27 17:53:45', '职位管理');
INSERT INTO `aw_menu_lists` VALUES (14, NULL, 'Account', NULL, '/account', '2021-05-28 16:49:18', '2021-05-28 16:49:21', '账户管理');
INSERT INTO `aw_menu_lists` VALUES (15, 14, 'AddAccount', NULL, 'add_account', '2021-05-28 16:50:01', '2021-05-28 16:50:09', '添加账户');
INSERT INTO `aw_menu_lists` VALUES (16, 14, 'ManageAccount', NULL, 'manage_account', '2021-05-28 16:50:35', '2021-05-28 16:50:37', '账户列表');
INSERT INTO `aw_menu_lists` VALUES (17, 13, 'CreateJob', NULL, 'create', '2021-05-28 23:27:36', '2021-05-28 23:27:38', '创建职位');
INSERT INTO `aw_menu_lists` VALUES (18, 13, 'EditJob', NULL, 'edit/:id(\\d+)', '2021-05-28 23:28:10', '2021-05-28 23:28:25', '编辑职位');
INSERT INTO `aw_menu_lists` VALUES (19, 13, 'JobList', NULL, 'list', '2021-05-28 23:28:48', '2021-05-28 23:28:50', '职位列表');
INSERT INTO `aw_menu_lists` VALUES (20, NULL, 'Product', NULL, '/product', '2021-05-29 15:25:21', '2021-05-29 15:25:23', '产品管理');
INSERT INTO `aw_menu_lists` VALUES (21, 20, 'CreateProduct', NULL, 'create', '2021-05-29 15:25:50', '2021-05-29 15:25:52', '添加产品');
INSERT INTO `aw_menu_lists` VALUES (22, 20, 'EditProduct', NULL, 'edit/:id(\\d+)', '2021-05-29 15:26:17', '2021-05-29 15:26:19', '编辑产品');
INSERT INTO `aw_menu_lists` VALUES (23, 20, 'ProductList', NULL, 'list', '2021-05-29 15:26:41', '2021-05-29 15:26:43', '产品列表');
INSERT INTO `aw_menu_lists` VALUES (24, NULL, 'Swiper', NULL, '/swiper', '2021-10-10 18:13:21', '2021-10-10 18:13:24', '轮播图管理');
INSERT INTO `aw_menu_lists` VALUES (25, 24, 'CreateSwiper', NULL, 'create', '2021-10-10 19:08:30', '2021-10-10 19:08:32', '添加轮播图');
INSERT INTO `aw_menu_lists` VALUES (26, 24, 'EditSwiper', NULL, 'edit/:id(\\d+)', '2021-10-10 19:09:48', '2021-10-10 19:09:54', '编辑轮播图');
INSERT INTO `aw_menu_lists` VALUES (27, 24, 'SwiperList', NULL, 'list', '2021-10-10 19:10:38', '2021-10-10 19:10:40', '轮播图列表');
INSERT INTO `aw_menu_lists` VALUES (28, NULL, 'WebInfo', NULL, '/webinfo', '2021-10-16 17:26:54', '2021-10-16 17:27:04', '网页管理');
INSERT INTO `aw_menu_lists` VALUES (29, 28, 'Support', NULL, 'support', '2021-10-16 17:27:55', '2021-10-16 17:27:57', '技术支持');
INSERT INTO `aw_menu_lists` VALUES (30, 28, 'Basic', NULL, 'basic', '2021-10-16 17:43:29', '2021-10-16 17:43:31', '基本信息');
INSERT INTO `aw_menu_lists` VALUES (31, NULL, 'Menu', NULL, '/menus', '2021-10-16 18:05:46', '2021-10-16 18:05:48', '菜单管理');
INSERT INTO `aw_menu_lists` VALUES (32, 31, 'CreateMenu', NULL, 'create', '2021-10-16 18:06:23', '2021-10-16 18:06:25', '新增菜单');
INSERT INTO `aw_menu_lists` VALUES (33, 31, 'ListMenu', NULL, 'list', '2021-10-16 18:10:58', '2021-10-16 18:11:00', '菜单列表');

-- ----------------------------
-- Table structure for aw_news
-- ----------------------------
DROP TABLE IF EXISTS `aw_news`;
CREATE TABLE `aw_news`  (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `cover_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻列表项封面',
  `news_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新闻标题',
  `news_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新闻列表项简要描述',
  `news_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻内容',
  `is_hot` tinyint(1) NOT NULL DEFAULT 0 COMMENT '新闻是否热门',
  `news_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻访问路径',
  `publish_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：true/已发布，false/草稿',
  PRIMARY KEY (`news_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  CONSTRAINT `aw_news_ibfk_1` FOREIGN KEY (`type`) REFERENCES `aw_news_types` (`type_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of aw_news
-- ----------------------------
INSERT INTO `aw_news` VALUES (65, 'http://localhost:3000/upload/20210530/16223738960775989.jfif', '智慧城市与数字孪生怎么“生”？', '每一年的两会往往都会带来很多新鲜热词，尤其是赶上五年计划的年份，新概念尤为多。今年便是如此——随着全国两会的圆满落幕，“十四五”规划纲要也正式出炉。长达七万字的规划纲要中再次聚焦“数字中国”，由此也带出来一系列让产业界、学术界乃至资本界进行新一轮追逐的发展产业。这一次被点中的是“云计算、大数据、物联网、工业互联网、区块链、人工智能、虚拟现实和增强现实”作为数字经济重点产业。', '<p style=\"line-height:1.6;\"><span style=\"font-size: 14px;\">&nbsp; &nbsp;&nbsp;</span><span style=\"font-size: 14px;\">&nbsp; &nbsp;&nbsp;</span><b>导语：</b>每一年的两会往往都会带来很多新鲜热词，尤其是赶上五年计划的年份，新概念尤为多。今年便是如此——随着全国两会的圆满落幕，“十四五”规划纲要也正式出炉。长达七万字的规划纲要中再次聚焦“数字中国”，由此也带出来一系列让产业界、学术界乃至资本界进行新一轮追逐的发展产业。这一次被点中的是“云计算、大数据、物联网、工业互联网、区块链、人工智能、虚拟现实和增强现实”作为数字经济重点产业。</p><p style=\"line-height:1.6;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;而在两会代表的提案中，“数字孪生”与城市建设结合到了一起，那么什么是数字孪生，数字孪生又将给城市建设带来哪些新思路呢？</p><p style=\"line-height:1.6;\">&nbsp; &nbsp; &nbsp; &nbsp; <b>数字是谁的孪生？</b><br/></p><p style=\"line-height:1.6;\">&nbsp; &nbsp; &nbsp; &nbsp; 数字孪生，对于城市建设来说是一个舶来词。它最早出现在工业制造领域。有资料介绍说，它最早出现在航天领域。数字孪生即通过数字模拟飞机飞行时的数据，来进行测试检查与维护。<b><br/></b></p><p style=\"text-align:center;line-height:1.6;\"><img src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0528%2F5599780fj00qtso46002ed000u000fnp.jpg&amp;thumbnail=650x2147483647&amp;quality=80&amp;type=jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/></p><p style=\"line-height:1.6;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所谓“孪生”，指的是“物理空间”和“信息空间”。数字孪生技术是通过数字化的技术手段，将物理世界中的实体在虚拟世界中一模一样的虚拟映射，借此来实现对物理实体的分析和控制?</p><p style=\"text-align:center;line-height:1.6;\"><img src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0528%2Fe71f2b34j00qtso84001xd000u000etp.jpg&amp;thumbnail=650x2147483647&amp;quality=80&amp;type=jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/></p><p style=\"line-height:1.6;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数字孪生技术是集成了人工智能?机器学习等技术，将数据?算法和决策分析结合在一起。将物理空间与信息空间形成映像，在虚拟模型中实时监控物理对象的变化过程，通过对于实际物理空间的数据进行处理分析得到未来状态预测和风险评估。最终实现针对物理对象的科学管控。</p><p style=\"line-height:1.6;\"><span style=\"font-size: 14px;\">&nbsp; &nbsp;&nbsp;</span><span style=\"font-size: 14px;\">&nbsp; &nbsp;&nbsp;</span><b>数字孪生城市是什么？</b></p><p style=\"line-height:1.6;\">　　<b>数字孪生城市是指数字孪生技术在城市建设中的应用。</b>通过构建城市物理世界与虚拟数字空间的一一对应?相互映射?协同交互的复杂巨系统，在虚拟空间中再造一个与物理城市对应的孪生城市。这样就会实现了全要素数字化和虚拟化?城市全状态实时化和可视化?城市管理决策协同化和智能化?<br/><br/>　　通过数字孪生技术可以支撑起具有复杂综合体系的新型智慧城市建设，更好地为实体城市建设服务。同生共存?虚实交融将成为城市未来发展新形态。</p><p style=\"line-height:1.6;\">&nbsp; &nbsp; &nbsp; &nbsp; 在数字孪生系统的建设上，由于对于物理实体系统的实时动态数据的采集需求，<b>因此实时数据采集、传输、更新就是至关重要的技术。</b>在数字孪生城市的建设中，大量的高精度传感器将在一线工作，起到基础的感知器官作用。而快速可靠的信息传输网络则是数据上传的基础。<br/></p><p style=\"text-align:center;line-height:1.6;\"><br/><br/></p>', 1, '16223739786893199', '2021-05-30 19:26:18', '2021-10-17 12:18:23', 1, 0);
INSERT INTO `aw_news` VALUES (66, 'http://localhost:3000/upload/2021061/1622480222260421.png', '荣耀成立智能机器公司 注册资本1亿元', '5月31日下午消息，天眼查App显示，5月31日，深圳荣耀智能机器有限公司成立，注册资本1亿人民币', '<p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://n.sinaimg.cn/tech/transform/143/w630h313/20210531/22ff-kquziii8322227.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/></p><p style=\"line-height:1.6;\">&nbsp; &nbsp; &nbsp; &nbsp; 5月31日下午消息，天眼查App显示，5月31日，深圳荣耀智能机器有限公司成立，注册资本1亿人民币，法定代表人为彭求恩，经营范围包括移动终端设备制造；计算机软硬件及外围设备制造；电子产品销售；可穿戴智能设备制造；可穿戴智能设备销售；非银行金融业务等。股东信息显示，该公司由荣耀终端有限公司全资持股。</p><p style=\"text-align:center;\"><img src=\"https://n.sinaimg.cn/tech/transform/30/w523h307/20210531/33d2-kquziii8322584.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><br/></p>', 1, '16224802243099350', '2021-06-01 00:57:04', '2021-10-17 12:18:21', 1, 1);
INSERT INTO `aw_news` VALUES (67, 'http://localhost:3000/upload/2021061/16224804237797820.jpg', '我国北斗系统加速与新技术融合发展', '通过高精地图实现汽车自动驾驶、智能化实时监测维护的石油管网、一颗与现实地球高度一致的“数字地球”……这些都是北斗系统与新技术融合发展的成果，“北斗+”“+北斗”正成为中国卫星导航产业的新模式、新业态。', '<p style=\"line-height:1.6;\"><font size=\"3\">&nbsp; &nbsp; &nbsp; &nbsp; 通过高精地图实现汽车自动驾驶、智能化实时监测维护的石油管网、一颗与现实地球高度一致的“数字地球”……这些都是北斗系统与新技术融合发展的成果，“北斗+”“+北斗”正成为中国卫星导航产业的新模式、新业态。</font></p><p style=\"line-height:1.6;\"><font size=\"3\">　　中国卫星导航系统管理办公室主任冉承其在南昌召开的第十二届中国卫星导航年会上表示，今年是“十四五”规划的开局之年，北斗产业已被列入国家“十四五”规划和2035年远景目标纲要，中国卫星导航产业发展已经进入了新时代、迈入了新阶段、迎来了新机遇。</font></p><p style=\"line-height:1.6;\"><font size=\"3\">　　北斗系统是我国新型基础设施建设的重要组成部分，既赋能通信、导航、遥感技术一体化融合，也为未来其他新型基础设施提供战略性基础性时空数据支撑。</font></p><p style=\"line-height:1.6;\"><font size=\"3\">　　以汽车无人智能驾驶为例，高精地图是其首要前提。“高精地图与常规意义上的地图不同，不仅包含道路的路网形状、属性、限制规则等，还需要包含道路的坡度、曲率，以及高精度的车道、路口、红绿灯、停车位等语义和特征层信息。”百度智驾地图业务部负责人佘党恩说，这首先依赖于通过北斗系统实现对基础数据的采集。</font></p><p style=\"line-height:1.6;\"><font size=\"3\">　　只有加速融合，才能倍增发展。北斗系统优异的功能性与物联网、无人驾驶、人工智能、5G、区块链等战略性前沿技术的交叉融合，使“北斗+”“+北斗”成为打造系统完备、高效实用、智能绿色、安全可靠的现代化基础设施体系的重要手段。</font></p><p style=\"line-height:1.6;\"><font size=\"3\">　　在地质灾害监测领域，上海华测导航技术股份有限公司一款融合应用卫星导航、大数据、云计算等技术的普适性传感器，正在改变传统的监测模式。</font></p><p style=\"line-height:1.6;\"><font size=\"3\">　　“原来在山体滑坡的自动化监测中，依靠传统传感器，只能提供相对位移。”上海华测导航技术股份有限公司副总裁姜春生说，北斗技术能提供三维坐标和精准时间信息，除了能获得一定时间内的位移变化，也能获取滑坡的速度和加速度，从而对地表的滑坡监测有更精准的判断。</font></p><p style=\"line-height:1.6;\"><font size=\"3\">　　“北斗应用只受想象力限制。”北斗卫星导航系统工程总设计师杨长风说，不断挖潜北斗系统能力，鼓励“北斗+”“+北斗”技术创新，赋能更多新业态、新产业。</font></p>', 1, '16224804251967901', '2021-06-01 01:00:25', '2021-06-12 18:37:51', 1, 0);
INSERT INTO `aw_news` VALUES (68, 'http://localhost:3000/upload/2021061/16224806001675873.jpg', '成为云计算领域最火概念之后 国内“云原生”走到了哪一步？', '云原生，这个普通人听上去有些陌生的词，可能是过去几年里云计算领域最火的概念，也是未来几年间头部云厂商最重要的竞技场', '<p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://n.sinaimg.cn/tech/transform/188/w630h358/20210531/2a35-kquziii7897884.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/></p><p style=\"line-height:1.6;\"><font size=\"3\">&nbsp; &nbsp; &nbsp; &nbsp; 去年9月，一家名为Snowflake的云原生数据仓库厂商上市，当天市值即涨破700亿美元，一举成为软件史上最大IPO。</font></p><p style=\"line-height:1.6;\"><font size=\"3\"><br/></font>　　<b>云原生</b>，这个普通人听上去有些陌生的词，可能是过去几年里云计算领域最火的概念，也是未来几年间头部云厂商最重要的竞技场。<br/><br/>　　或许很多人对云的印象还停留在“把机房的服务搬到云上”，但随着云计算平台的成熟和分布式框架的普及，越来越多厂商开始考虑向“云原生”升级。简而言之，应用程序从诞生之初就在云上，可以直接在云平台上运行或非常轻松的迁移到云平台。<br/><br/>　　为什么云原生如此受追捧？一个易于理解的原因是，尽管企业的服务器已经“上云”，但随着需要运转的数据量越来越大，这个过程中底层的资源包括存储、算力以及网络带宽加在一起负荷也更高，如果资源不能充分最大化，那对企业来说会是极大的负担。<br/><br/>　　<b>云原生的优势在于</b>，开发者无需考虑底层的技术实现，就能够精细地控制底层资源，所有算力能够自动启停、伸缩，自动且快速地响应业务，做到资源最大化利用，节约成本，且具备业务持续性。这个优势在疫情期间十分明显，即“需要时可以用很多，不需要时也不会产生大量浪费。”<br/><br/>　　国内主要云厂商中，腾讯是重要的云原生推动者之一。根据官方披露的数据，腾讯已经拥有的云原生产品体系和架构，涵盖软件研发流程、计算资源、架构框架、数据存储和处理、安全五个领域的多个场景。目前，腾讯云原生注册用户规模超过100万，覆盖政府、金融、文体、教育等行业。<br/><br/>　　今年3月，腾讯还发布了国内首个云原生加速器，面向云原生应用、云原生应用编排及管理、云原生底层技术、云原生安全技术等四个方向招募30家企业，旨在进一步扩大其云原生的生态朋友圈，探索云原生的发展方向。<br/><br/>　　在近日的复试路演现场，界面新闻采访了几家参赛企业，他们分享了自己对云原生与中国云原生未来的看法。<br/><br/>　　何浚炫是参赛企业TreeLab的CEO。他对界面新闻介绍，TreeLab是一款让非IT人员快速构建信息化系统的生产力工具。一个背景是，大量传统行业的人都在使用Excel整理数据，但Excel很难形成标准化的系统，导致“表哥”、“表妹”们在数据整理上花费太多无用时间。TreeLab 想让这些IT能力弱的“表哥”、“表妹”自己来构建一个“数据中台”，建立更适合自身业务和上下游协同的数据处理系统。<br/><br/>　　这是时兴的“低代码”应用，也是一个典型的、基于云原生设计的应用。何浚炫解释道，随着用户量增加，TreeLab的数据承载量也变得更大，只有云原生的应用才能承载这样的业务场景。<br/><br/>　　之所以参与腾讯云原生加速器，何浚炫看中了三点：一是希望利用腾讯云的技术能力，二是想借助企业微信打造轻量级的CRM（客户关系管理）工具，三是能够接触到腾讯大量产业生态伙伴，从而进行业务合作。<br/><br/>　　另一家参赛企业Kyligence是一家PaaS供应商。这家公司解决的问题是，在超大规模数据量的情况下如何快速访问和分析数据。基于云原生技术，Kyligence帮助金融、保险、制造等行业的客户在云上进行成本更低的数据分析。参与腾讯云原生加速器，是看中后者的底层技术能力。<br/><br/></p><p>　　国内近两年已经涌现出不少提供云原生技术的厂商。但众人的共识是，无论是大厂还是初创企业，国内的云原生布局都还在十分初级的阶段。　　云原生，这个普通人听上去有些陌生的词，可能是过去几年里云计算领域最火的概念，也是未来几年间头部云厂商最重要的竞技场。<br/></p><p><br/>　　或许很多人对云的印象还停留在“把机房的服务搬到云上”，但随着云计算平台的成熟和分布式框架的普及，越来越多厂商开始考虑向“云原生”升级。简而言之，应用程序从诞生之初就在云上，可以直接在云平台上运行或非常轻松的迁移到云平台。<br/><br/>　　为什么云原生如此受追捧？一个易于理解的原因是，尽管企业的服务器已经“上云”，但随着需要运转的数据量越来越大，这个过程中底层的资源包括存储、算力以及网络带宽加在一起负荷也更高，如果资源不能充分最大化，那对企业来说会是极大的负担。<br/><br/>　　云原生的优势在于，开发者无需考虑底层的技术实现，就能够精细地控制底层资源，所有算力能够自动启停、伸缩，自动且快速地响应业务，做到资源最大化利用，节约成本，且具备业务持续性。这个优势在疫情期间十分明显，即“需要时可以用很多，不需要时也不会产生大量浪费。”<br/><br/>　　国内主要云厂商中，腾讯是重要的云原生推动者之一。根据官方披露的数据，腾讯已经拥有的云原生产品体系和架构，涵盖软件研发流程、计算资源、架构框架、数据存储和处理、安全五个领域的多个场景。目前，腾讯云原生注册用户规模超过100万，覆盖政府、金融、文体、教育等行业。<br/><br/>　　今年3月，腾讯还发布了国内首个云原生加速器，面向云原生应用、云原生应用编排及管理、云原生底层技术、云原生安全技术等四个方向招募30家企业，旨在进一步扩大其云原生的生态朋友圈，探索云原生的发展方向。<br/><br/>　　在近日的复试路演现场，界面新闻采访了几家参赛企业，他们分享了自己对云原生与中国云原生未来的看法。<br/><br/>　　何浚炫是参赛企业TreeLab的CEO。他对界面新闻介绍，TreeLab是一款让非IT人员快速构建信息化系统的生产力工具。一个背景是，大量传统行业的人都在使用Excel整理数据，但Excel很难形成标准化的系统，导致“表哥”、“表妹”们在数据整理上花费太多无用时间。TreeLab 想让这些IT能力弱的“表哥”、“表妹”自己来构建一个“数据中台”，建立更适合自身业务和上下游协同的数据处理系统。<br/><br/>　　这是时兴的“低代码”应用，也是一个典型的、基于云原生设计的应用。何浚炫解释道，随着用户量增加，TreeLab的数据承载量也变得更大，只有云原生的应用才能承载这样的业务场景。<br/><br/>　　之所以参与腾讯云原生加速器，何浚炫看中了三点：一是希望利用腾讯云的技术能力，二是想借助企业微信打造轻量级的CRM（客户关系管理）工具，三是能够接触到腾讯大量产业生态伙伴，从而进行业务合作。<br/><br/>　　另一家参赛企业Kyligence是一家PaaS供应商。这家公司解决的问题是，在超大规模数据量的情况下如何快速访问和分析数据。基于云原生技术，Kyligence帮助金融、保险、制造等行业的客户在云上进行成本更低的数据分析。参与腾讯云原生加速器，是看中后者的底层技术能力。<br/><br/>　　国内近两年已经涌现出不少提供云原生技术的厂商。但众人的共识是，无论是大厂还是初创企业，国内的云原生布局都还在十分初级的阶段。</p>', 1, '16224806355301256', '2021-06-01 01:03:55', '2021-06-12 18:37:52', 1, 0);
INSERT INTO `aw_news` VALUES (69, 'http://localhost:3000/upload/2021061/16224807256962924.jpg', '智慧城市与数字孪生怎么“生”？~1', '每一年的两会往往都会带来很多新鲜热词，尤其是赶上五年计划的年份，新概念尤为多。今年便是如此——随着全国两会的圆满落幕，“十四五”规划纲要也正式出炉。长达七万字的规划纲要中再次聚焦“数字中国”，由此也带出来一系列让产业界、学术界乃至资本界进行新一轮追逐的发展产业。这一次被点中的是“云计算、大数据、物联网、工业互联网、区块链、人工智能、虚拟现实和增强现实”作为数字经济重点产业。', '<p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<b>导语：</b>每一年的两会往往都会带来很多新鲜热词，尤其是赶上五年计划的年份，新概念尤为多。今年便是如此——随着全国两会的圆满落幕，“十四五”规划纲要也正式出炉。长达七万字的规划纲要中再次聚焦“数字中国”，由此也带出来一系列让产业界、学术界乃至资本界进行新一轮追逐的发展产业。这一次被点中的是“云计算、大数据、物联网、工业互联网、区块链、人工智能、虚拟现实和增强现实”作为数字经济重点产业。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;而在两会代表的提案中，“数字孪生”与城市建设结合到了一起，那么什么是数字孪生，数字孪生又将给城市建设带来哪些新思路呢？</p><p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<b>数字是谁的孪生？</b><br/></p><p>&nbsp; &nbsp; &nbsp; &nbsp; 数字孪生，对于城市建设来说是一个舶来词。它最早出现在工业制造领域。有资料介绍说，它最早出现在航天领域。数字孪生即通过数字模拟飞机飞行时的数据，来进行测试检查与维护。<b><br/></b></p><p><img src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0528%2F5599780fj00qtso46002ed000u000fnp.jpg&amp;thumbnail=650x2147483647&amp;quality=80&amp;type=jpg\"/><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所谓“孪生”，指的是“物理空间”和“信息空间”。数字孪生技术是通过数字化的技术手段，将物理世界中的实体在虚拟世界中一模一样的虚拟映射，借此来实现对物理实体的分析和控制?</p><p><img src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0528%2Fe71f2b34j00qtso84001xd000u000etp.jpg&amp;thumbnail=650x2147483647&amp;quality=80&amp;type=jpg\"/><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数字孪生技术是集成了人工智能?机器学习等技术，将数据?算法和决策分析结合在一起。将物理空间与信息空间形成映像，在虚拟模型中实时监控物理对象的变化过程，通过对于实际物理空间的数据进行处理分析得到未来状态预测和风险评估。最终实现针对物理对象的科学管控。</p><p>&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<b>数字孪生城市是什么？</b></p><p>　　<b>数字孪生城市是指数字孪生技术在城市建设中的应用。</b>通过构建城市物理世界与虚拟数字空间的一一对应?相互映射?协同交互的复杂巨系统，在虚拟空间中再造一个与物理城市对应的孪生城市。这样就会实现了全要素数字化和虚拟化?城市全状态实时化和可视化?城市管理决策协同化和智能化?<br/><br/>　　通过数字孪生技术可以支撑起具有复杂综合体系的新型智慧城市建设，更好地为实体城市建设服务。同生共存?虚实交融将成为城市未来发展新形态。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 在数字孪生系统的建设上，由于对于物理实体系统的实时动态数据的采集需求，<b>因此实时数据采集、传输、更新就是至关重要的技术。</b>在数字孪生城市的建设中，大量的高精度传感器将在一线工作，起到基础的感知器官作用。而快速可靠的信息传输网络则是数据上传的基础。<br/></p><p><br/></p>', 1, '16224807271734644', '2021-06-01 01:05:27', '2021-06-01 01:29:11', 1, 0);
INSERT INTO `aw_news` VALUES (70, 'http://localhost:3000/upload/2021061/16224807931784843.jpg', '成为云计算领域最火概念之后 国内“云原生”走到了哪一步？~1', '成为云计算领域最火概念之后 国内“云原生”走到了哪一步？', '<p style=\"text-align:center;\"><br/><img src=\"https://n.sinaimg.cn/tech/transform/188/w630h358/20210531/2a35-kquziii7897884.jpg\"/><br/></p><p>&nbsp; &nbsp; &nbsp; &nbsp; 去年9月，一家名为Snowflake的云原生数据仓库厂商上市，当天市值即涨破700亿美元，一举成为软件史上最大IPO。</p><p><br/>　　<b>云原生</b>，这个普通人听上去有些陌生的词，可能是过去几年里云计算领域最火的概念，也是未来几年间头部云厂商最重要的竞技场。<br/><br/>　　或许很多人对云的印象还停留在“把机房的服务搬到云上”，但随着云计算平台的成熟和分布式框架的普及，越来越多厂商开始考虑向“云原生”升级。简而言之，应用程序从诞生之初就在云上，可以直接在云平台上运行或非常轻松的迁移到云平台。<br/><br/>　　为什么云原生如此受追捧？一个易于理解的原因是，尽管企业的服务器已经“上云”，但随着需要运转的数据量越来越大，这个过程中底层的资源包括存储、算力以及网络带宽加在一起负荷也更高，如果资源不能充分最大化，那对企业来说会是极大的负担。<br/><br/>　　<b>云原生的优势在于</b>，开发者无需考虑底层的技术实现，就能够精细地控制底层资源，所有算力能够自动启停、伸缩，自动且快速地响应业务，做到资源最大化利用，节约成本，且具备业务持续性。这个优势在疫情期间十分明显，即“需要时可以用很多，不需要时也不会产生大量浪费。”<br/><br/>　　国内主要云厂商中，腾讯是重要的云原生推动者之一。根据官方披露的数据，腾讯已经拥有的云原生产品体系和架构，涵盖软件研发流程、计算资源、架构框架、数据存储和处理、安全五个领域的多个场景。目前，腾讯云原生注册用户规模超过100万，覆盖政府、金融、文体、教育等行业。<br/><br/>　　今年3月，腾讯还发布了国内首个云原生加速器，面向云原生应用、云原生应用编排及管理、云原生底层技术、云原生安全技术等四个方向招募30家企业，旨在进一步扩大其云原生的生态朋友圈，探索云原生的发展方向。<br/><br/>　　在近日的复试路演现场，界面新闻采访了几家参赛企业，他们分享了自己对云原生与中国云原生未来的看法。<br/><br/>　　何浚炫是参赛企业TreeLab的CEO。他对界面新闻介绍，TreeLab是一款让非IT人员快速构建信息化系统的生产力工具。一个背景是，大量传统行业的人都在使用Excel整理数据，但Excel很难形成标准化的系统，导致“表哥”、“表妹”们在数据整理上花费太多无用时间。TreeLab 想让这些IT能力弱的“表哥”、“表妹”自己来构建一个“数据中台”，建立更适合自身业务和上下游协同的数据处理系统。<br/><br/>　　这是时兴的“低代码”应用，也是一个典型的、基于云原生设计的应用。何浚炫解释道，随着用户量增加，TreeLab的数据承载量也变得更大，只有云原生的应用才能承载这样的业务场景。<br/><br/>　　之所以参与腾讯云原生加速器，何浚炫看中了三点：一是希望利用腾讯云的技术能力，二是想借助企业微信打造轻量级的CRM（客户关系管理）工具，三是能够接触到腾讯大量产业生态伙伴，从而进行业务合作。<br/><br/>　　另一家参赛企业Kyligence是一家PaaS供应商。这家公司解决的问题是，在超大规模数据量的情况下如何快速访问和分析数据。基于云原生技术，Kyligence帮助金融、保险、制造等行业的客户在云上进行成本更低的数据分析。参与腾讯云原生加速器，是看中后者的底层技术能力。<br/><br/></p><p>　　国内近两年已经涌现出不少提供云原生技术的厂商。但众人的共识是，无论是大厂还是初创企业，国内的云原生布局都还在十分初级的阶段。　　云原生，这个普通人听上去有些陌生的词，可能是过去几年里云计算领域最火的概念，也是未来几年间头部云厂商最重要的竞技场。<br/></p><p><br/>　　或许很多人对云的印象还停留在“把机房的服务搬到云上”，但随着云计算平台的成熟和分布式框架的普及，越来越多厂商开始考虑向“云原生”升级。简而言之，应用程序从诞生之初就在云上，可以直接在云平台上运行或非常轻松的迁移到云平台。<br/><br/>　　为什么云原生如此受追捧？一个易于理解的原因是，尽管企业的服务器已经“上云”，但随着需要运转的数据量越来越大，这个过程中底层的资源包括存储、算力以及网络带宽加在一起负荷也更高，如果资源不能充分最大化，那对企业来说会是极大的负担。<br/><br/>　　云原生的优势在于，开发者无需考虑底层的技术实现，就能够精细地控制底层资源，所有算力能够自动启停、伸缩，自动且快速地响应业务，做到资源最大化利用，节约成本，且具备业务持续性。这个优势在疫情期间十分明显，即“需要时可以用很多，不需要时也不会产生大量浪费。”<br/><br/>　　国内主要云厂商中，腾讯是重要的云原生推动者之一。根据官方披露的数据，腾讯已经拥有的云原生产品体系和架构，涵盖软件研发流程、计算资源、架构框架、数据存储和处理、安全五个领域的多个场景。目前，腾讯云原生注册用户规模超过100万，覆盖政府、金融、文体、教育等行业。<br/><br/>　　今年3月，腾讯还发布了国内首个云原生加速器，面向云原生应用、云原生应用编排及管理、云原生底层技术、云原生安全技术等四个方向招募30家企业，旨在进一步扩大其云原生的生态朋友圈，探索云原生的发展方向。<br/><br/>　　在近日的复试路演现场，界面新闻采访了几家参赛企业，他们分享了自己对云原生与中国云原生未来的看法。<br/><br/>　　何浚炫是参赛企业TreeLab的CEO。他对界面新闻介绍，TreeLab是一款让非IT人员快速构建信息化系统的生产力工具。一个背景是，大量传统行业的人都在使用Excel整理数据，但Excel很难形成标准化的系统，导致“表哥”、“表妹”们在数据整理上花费太多无用时间。TreeLab 想让这些IT能力弱的“表哥”、“表妹”自己来构建一个“数据中台”，建立更适合自身业务和上下游协同的数据处理系统。<br/><br/>　　这是时兴的“低代码”应用，也是一个典型的、基于云原生设计的应用。何浚炫解释道，随着用户量增加，TreeLab的数据承载量也变得更大，只有云原生的应用才能承载这样的业务场景。<br/><br/>　　之所以参与腾讯云原生加速器，何浚炫看中了三点：一是希望利用腾讯云的技术能力，二是想借助企业微信打造轻量级的CRM（客户关系管理）工具，三是能够接触到腾讯大量产业生态伙伴，从而进行业务合作。<br/><br/>　　另一家参赛企业Kyligence是一家PaaS供应商。这家公司解决的问题是，在超大规模数据量的情况下如何快速访问和分析数据。基于云原生技术，Kyligence帮助金融、保险、制造等行业的客户在云上进行成本更低的数据分析。参与腾讯云原生加速器，是看中后者的底层技术能力。<br/><br/>　　国内近两年已经涌现出不少提供云原生技术的厂商。但众人的共识是，无论是大厂还是初创企业，国内的云原生布局都还在十分初级的阶段。</p>', 1, '16224807942499549', '2021-06-01 01:06:34', '2021-06-16 13:07:11', 1, 0);
INSERT INTO `aw_news` VALUES (71, 'http://localhost:3000/upload/2021061/1622480880551544.png', '荣耀成立智能机器公司 注册资本1亿元~1', '荣耀成立智能机器公司 注册资本1亿元', '<p style=\"text-align:center;line-height:1.6;\"><br/><img src=\"https://n.sinaimg.cn/tech/transform/143/w630h313/20210531/22ff-kquziii8322227.png\"/><br/></p><p style=\"line-height:1.6;\">&nbsp; &nbsp; &nbsp; &nbsp; 5月31日下午消息，天眼查App显示，5月31日，深圳荣耀智能机器有限公司成立，注册资本1亿人民币，法定代表人为彭求恩，经营范围包括移动终端设备制造；计算机软硬件及外围设备制造；电子产品销售；可穿戴智能设备制造；可穿戴智能设备销售；非银行金融业务等。股东信息显示，该公司由荣耀终端有限公司全资持股。</p><p style=\"line-height:1.6; text-align:center;\"><img src=\"https://n.sinaimg.cn/tech/transform/30/w523h307/20210531/33d2-kquziii8322584.png\"/></p><p style=\"line-height:1.6;\"><br/></p>', 1, '16224808822638136', '2021-06-01 01:08:02', '2021-06-15 09:41:01', 1, 1);
INSERT INTO `aw_news` VALUES (72, 'http://localhost:3000/upload/2021061/16224809817308266.jpg', '智慧城市与数字孪生怎么“生”？', '数字孪生，对于城市建设来说是一个舶来词。它最早出现在工业制造领域。有资料介绍说，它最早出现在航天领域。数字孪生即通过数字模拟飞机飞行时的数据，来进行测试检查与维护。', '<p><b>导语：</b>每一年的两会往往都会带来很多新鲜热词，尤其是赶上五年计划的年份，新概念尤为多。今年便是如此——随着全国两会的圆满落幕，“十四五”规划纲要也正式出炉。长达七万字的规划纲要中再次聚焦“数字中国”，由此也带出来一系列让产业界、学术界乃至资本界进行新一轮追逐的发展产业。这一次被点中的是“云计算、大数据、物联网、工业互联网、区块链、人工智能、虚拟现实和增强现实”作为数字经济重点产业。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;而在两会代表的提案中，“数字孪生”与城市建设结合到了一起，那么什么是数字孪生，数字孪生又将给城市建设带来哪些新思路呢？</p><p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<b>数字是谁的孪生？</b><br/></p><p>&nbsp; &nbsp; &nbsp; &nbsp; 数字孪生，对于城市建设来说是一个舶来词。它最早出现在工业制造领域。有资料介绍说，它最早出现在航天领域。数字孪生即通过数字模拟飞机飞行时的数据，来进行测试检查与维护。<b><br/></b></p><p><img src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0528%2F5599780fj00qtso46002ed000u000fnp.jpg&amp;thumbnail=650x2147483647&amp;quality=80&amp;type=jpg\"/><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所谓“孪生”，指的是“物理空间”和“信息空间”。数字孪生技术是通过数字化的技术手段，将物理世界中的实体在虚拟世界中一模一样的虚拟映射，借此来实现对物理实体的分析和控制?</p><p><img src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0528%2Fe71f2b34j00qtso84001xd000u000etp.jpg&amp;thumbnail=650x2147483647&amp;quality=80&amp;type=jpg\"/><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数字孪生技术是集成了人工智能?机器学习等技术，将数据?算法和决策分析结合在一起。将物理空间与信息空间形成映像，在虚拟模型中实时监控物理对象的变化过程，通过对于实际物理空间的数据进行处理分析得到未来状态预测和风险评估。最终实现针对物理对象的科学管控。</p><p>&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<b>数字孪生城市是什么？</b></p><p>　　<b>数字孪生城市是指数字孪生技术在城市建设中的应用。</b>通过构建城市物理世界与虚拟数字空间的一一对应?相互映射?协同交互的复杂巨系统，在虚拟空间中再造一个与物理城市对应的孪生城市。这样就会实现了全要素数字化和虚拟化?城市全状态实时化和可视化?城市管理决策协同化和智能化?<br/><br/>　　通过数字孪生技术可以支撑起具有复杂综合体系的新型智慧城市建设，更好地为实体城市建设服务。同生共存?虚实交融将成为城市未来发展新形态。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 在数字孪生系统的建设上，由于对于物理实体系统的实时动态数据的采集需求，<b>因此实时数据采集、传输、更新就是至关重要的技术。</b>在数字孪生城市的建设中，大量的高精度传感器将在一线工作，起到基础的感知器官作用。而快速可靠的信息传输网络则是数据上传的基础。</p>', 1, '16224809834822573', '2021-06-01 01:09:43', '2021-06-01 01:09:43', 1, 1);
INSERT INTO `aw_news` VALUES (73, 'http://localhost:3000/upload/2021061/16224810434378467.jpg', '我国北斗系统加速与新技术融合发展~2', '我国北斗系统加速与新技术融合发展~2', '<p style=\"line-height:1.6; text-align:left;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;通过高精地图实现汽车自动驾驶、智能化实时监测维护的石油管网、一颗与现实地球高度一致的“数字地球”……这些都是北斗系统与新技术融合发展的成果，“北斗+”“+北斗”正成为中国卫星导航产业的新模式、新业态。</p><p style=\"line-height:1.6; text-align:left;\">　　中国卫星导航系统管理办公室主任冉承其在南昌召开的第十二届中国卫星导航年会上表示，今年是“十四五”规划的开局之年，北斗产业已被列入国家“十四五”规划和2035年远景目标纲要，中国卫星导航产业发展已经进入了新时代、迈入了新阶段、迎来了新机遇。</p><p style=\"line-height:1.6; text-align:left;\">　　北斗系统是我国新型基础设施建设的重要组成部分，既赋能通信、导航、遥感技术一体化融合，也为未来其他新型基础设施提供战略性基础性时空数据支撑。</p><p style=\"line-height:1.6; text-align:left;\">　　以汽车无人智能驾驶为例，高精地图是其首要前提。“高精地图与常规意义上的地图不同，不仅包含道路的路网形状、属性、限制规则等，还需要包含道路的坡度、曲率，以及高精度的车道、路口、红绿灯、停车位等语义和特征层信息。”百度智驾地图业务部负责人佘党恩说，这首先依赖于通过北斗系统实现对基础数据的采集。</p><p style=\"line-height:1.6; text-align:left;\">　　只有加速融合，才能倍增发展。北斗系统优异的功能性与物联网、无人驾驶、人工智能、5G、区块链等战略性前沿技术的交叉融合，使“北斗+”“+北斗”成为打造系统完备、高效实用、智能绿色、安全可靠的现代化基础设施体系的重要手段。</p><p style=\"line-height:1.6; text-align:left;\">　　在地质灾害监测领域，上海华测导航技术股份有限公司一款融合应用卫星导航、大数据、云计算等技术的普适性传感器，正在改变传统的监测模式。</p><p style=\"line-height:1.6; text-align:left;\">　　“原来在山体滑坡的自动化监测中，依靠传统传感器，只能提供相对位移。”上海华测导航技术股份有限公司副总裁姜春生说，北斗技术能提供三维坐标和精准时间信息，除了能获得一定时间内的位移变化，也能获取滑坡的速度和加速度，从而对地表的滑坡监测有更精准的判断。</p><p style=\"line-height:1.6; text-align:left;\">　　“北斗应用只受想象力限制。”北斗卫星导航系统工程总设计师杨长风说，不断挖潜北斗系统能力，鼓励“北斗+”“+北斗”技术创新，赋能更多新业态、新产业。</p>', 1, '16224810443733343', '2021-06-01 01:10:44', '2021-06-01 01:10:44', 1, 1);
INSERT INTO `aw_news` VALUES (74, 'http://localhost:3000/upload/2021061/16224811207639391.jpg', '成为云计算领域最火概念之后 国内“云原生”走到了哪一步？~2', '成为云计算领域最火概念之后 国内“云原生”走到了哪一步？~2', '<p style=\"line-height:1.6; text-align:center;\"><img src=\"https://n.sinaimg.cn/tech/transform/188/w630h358/20210531/2a35-kquziii7897884.jpg\"/><br/></p><p style=\"line-height: 1.6;\">&nbsp; &nbsp; &nbsp; &nbsp; 去年9月，一家名为Snowflake的云原生数据仓库厂商上市，当天市值即涨破700亿美元，一举成为软件史上最大IPO。</p><p style=\"line-height: 1.6;\"><br/>　　<b>云原生</b>，这个普通人听上去有些陌生的词，可能是过去几年里云计算领域最火的概念，也是未来几年间头部云厂商最重要的竞技场。<br/><br/>　　或许很多人对云的印象还停留在“把机房的服务搬到云上”，但随着云计算平台的成熟和分布式框架的普及，越来越多厂商开始考虑向“云原生”升级。简而言之，应用程序从诞生之初就在云上，可以直接在云平台上运行或非常轻松的迁移到云平台。<br/><br/>　　为什么云原生如此受追捧？一个易于理解的原因是，尽管企业的服务器已经“上云”，但随着需要运转的数据量越来越大，这个过程中底层的资源包括存储、算力以及网络带宽加在一起负荷也更高，如果资源不能充分最大化，那对企业来说会是极大的负担。<br/><br/>　　<b>云原生的优势在于</b>，开发者无需考虑底层的技术实现，就能够精细地控制底层资源，所有算力能够自动启停、伸缩，自动且快速地响应业务，做到资源最大化利用，节约成本，且具备业务持续性。这个优势在疫情期间十分明显，即“需要时可以用很多，不需要时也不会产生大量浪费。”<br/><br/>　　国内主要云厂商中，腾讯是重要的云原生推动者之一。根据官方披露的数据，腾讯已经拥有的云原生产品体系和架构，涵盖软件研发流程、计算资源、架构框架、数据存储和处理、安全五个领域的多个场景。目前，腾讯云原生注册用户规模超过100万，覆盖政府、金融、文体、教育等行业。<br/><br/>　　今年3月，腾讯还发布了国内首个云原生加速器，面向云原生应用、云原生应用编排及管理、云原生底层技术、云原生安全技术等四个方向招募30家企业，旨在进一步扩大其云原生的生态朋友圈，探索云原生的发展方向。<br/><br/>　　在近日的复试路演现场，界面新闻采访了几家参赛企业，他们分享了自己对云原生与中国云原生未来的看法。<br/><br/>　　何浚炫是参赛企业TreeLab的CEO。他对界面新闻介绍，TreeLab是一款让非IT人员快速构建信息化系统的生产力工具。一个背景是，大量传统行业的人都在使用Excel整理数据，但Excel很难形成标准化的系统，导致“表哥”、“表妹”们在数据整理上花费太多无用时间。TreeLab 想让这些IT能力弱的“表哥”、“表妹”自己来构建一个“数据中台”，建立更适合自身业务和上下游协同的数据处理系统。<br/><br/>　　这是时兴的“低代码”应用，也是一个典型的、基于云原生设计的应用。何浚炫解释道，随着用户量增加，TreeLab的数据承载量也变得更大，只有云原生的应用才能承载这样的业务场景。<br/><br/>　　之所以参与腾讯云原生加速器，何浚炫看中了三点：一是希望利用腾讯云的技术能力，二是想借助企业微信打造轻量级的CRM（客户关系管理）工具，三是能够接触到腾讯大量产业生态伙伴，从而进行业务合作。<br/><br/>　　另一家参赛企业Kyligence是一家PaaS供应商。这家公司解决的问题是，在超大规模数据量的情况下如何快速访问和分析数据。基于云原生技术，Kyligence帮助金融、保险、制造等行业的客户在云上进行成本更低的数据分析。参与腾讯云原生加速器，是看中后者的底层技术能力。<br/><br/></p><p style=\"line-height: 1.6;\">　　国内近两年已经涌现出不少提供云原生技术的厂商。但众人的共识是，无论是大厂还是初创企业，国内的云原生布局都还在十分初级的阶段。　　云原生，这个普通人听上去有些陌生的词，可能是过去几年里云计算领域最火的概念，也是未来几年间头部云厂商最重要的竞技场。<br/></p><p style=\"line-height: 1.6;\"><br/>　　或许很多人对云的印象还停留在“把机房的服务搬到云上”，但随着云计算平台的成熟和分布式框架的普及，越来越多厂商开始考虑向“云原生”升级。简而言之，应用程序从诞生之初就在云上，可以直接在云平台上运行或非常轻松的迁移到云平台。<br/><br/>　　为什么云原生如此受追捧？一个易于理解的原因是，尽管企业的服务器已经“上云”，但随着需要运转的数据量越来越大，这个过程中底层的资源包括存储、算力以及网络带宽加在一起负荷也更高，如果资源不能充分最大化，那对企业来说会是极大的负担。<br/><br/>　　云原生的优势在于，开发者无需考虑底层的技术实现，就能够精细地控制底层资源，所有算力能够自动启停、伸缩，自动且快速地响应业务，做到资源最大化利用，节约成本，且具备业务持续性。这个优势在疫情期间十分明显，即“需要时可以用很多，不需要时也不会产生大量浪费。”<br/><br/>　　国内主要云厂商中，腾讯是重要的云原生推动者之一。根据官方披露的数据，腾讯已经拥有的云原生产品体系和架构，涵盖软件研发流程、计算资源、架构框架、数据存储和处理、安全五个领域的多个场景。目前，腾讯云原生注册用户规模超过100万，覆盖政府、金融、文体、教育等行业。<br/><br/>　　今年3月，腾讯还发布了国内首个云原生加速器，面向云原生应用、云原生应用编排及管理、云原生底层技术、云原生安全技术等四个方向招募30家企业，旨在进一步扩大其云原生的生态朋友圈，探索云原生的发展方向。<br/><br/>　　在近日的复试路演现场，界面新闻采访了几家参赛企业，他们分享了自己对云原生与中国云原生未来的看法。<br/><br/>　　何浚炫是参赛企业TreeLab的CEO。他对界面新闻介绍，TreeLab是一款让非IT人员快速构建信息化系统的生产力工具。一个背景是，大量传统行业的人都在使用Excel整理数据，但Excel很难形成标准化的系统，导致“表哥”、“表妹”们在数据整理上花费太多无用时间。TreeLab 想让这些IT能力弱的“表哥”、“表妹”自己来构建一个“数据中台”，建立更适合自身业务和上下游协同的数据处理系统。<br/><br/>　　这是时兴的“低代码”应用，也是一个典型的、基于云原生设计的应用。何浚炫解释道，随着用户量增加，TreeLab的数据承载量也变得更大，只有云原生的应用才能承载这样的业务场景。<br/><br/>　　之所以参与腾讯云原生加速器，何浚炫看中了三点：一是希望利用腾讯云的技术能力，二是想借助企业微信打造轻量级的CRM（客户关系管理）工具，三是能够接触到腾讯大量产业生态伙伴，从而进行业务合作。<br/><br/>　　另一家参赛企业Kyligence是一家PaaS供应商。这家公司解决的问题是，在超大规模数据量的情况下如何快速访问和分析数据。基于云原生技术，Kyligence帮助金融、保险、制造等行业的客户在云上进行成本更低的数据分析。参与腾讯云原生加速器，是看中后者的底层技术能力。<br/><br/></p><p style=\"text-align:left;\">　　国内近两年已经涌现出不少提供云原生技术的厂商。但众人的共识是，无论是大厂还是初创企业，国内的云原生布局都还在十分初级的阶段。　　或许很多人对云的印象还停留在“把机房的服务搬到云上”，但随着云计算平台的成熟和分布式框架的普及，越来越多厂商开始考虑向“云原生”升级。简而言之，应用程序从诞生之初就在云上，可以直接在云平台上运行或非常轻松的迁移到云平台。<br/></p><p style=\"text-align:left;\"><br/>　　为什么云原生如此受追捧？一个易于理解的原因是，尽管企业的服务器已经“上云”，但随着需要运转的数据量越来越大，这个过程中底层的资源包括存储、算力以及网络带宽加在一起负荷也更高，如果资源不能充分最大化，那对企业来说会是极大的负担。<br/><br/>　　云原生的优势在于，开发者无需考虑底层的技术实现，就能够精细地控制底层资源，所有算力能够自动启停、伸缩，自动且快速地响应业务，做到资源最大化利用，节约成本，且具备业务持续性。这个优势在疫情期间十分明显，即“需要时可以用很多，不需要时也不会产生大量浪费。”<br/><br/>　　国内主要云厂商中，腾讯是重要的云原生推动者之一。根据官方披露的数据，腾讯已经拥有的云原生产品体系和架构，涵盖软件研发流程、计算资源、架构框架、数据存储和处理、安全五个领域的多个场景。目前，腾讯云原生注册用户规模超过100万，覆盖政府、金融、文体、教育等行业。<br/><br/>　　今年3月，腾讯还发布了国内首个云原生加速器，面向云原生应用、云原生应用编排及管理、云原生底层技术、云原生安全技术等四个方向招募30家企业，旨在进一步扩大其云原生的生态朋友圈，探索云原生的发展方向。<br/><br/>　　在近日的复试路演现场，界面新闻采访了几家参赛企业，他们分享了自己对云原生与中国云原生未来的看法。<br/><br/>　　何浚炫是参赛企业TreeLab的CEO。他对界面新闻介绍，TreeLab是一款让非IT人员快速构建信息化系统的生产力工具。一个背景是，大量传统行业的人都在使用Excel整理数据，但Excel很难形成标准化的系统，导致“表哥”、“表妹”们在数据整理上花费太多无用时间。TreeLab 想让这些IT能力弱的“表哥”、“表妹”自己来构建一个“数据中台”，建立更适合自身业务和上下游协同的数据处理系统。<br/><br/>　　这是时兴的“低代码”应用，也是一个典型的、基于云原生设计的应用。何浚炫解释道，随着用户量增加，TreeLab的数据承载量也变得更大，只有云原生的应用才能承载这样的业务场景。<br/><br/>　　之所以参与腾讯云原生加速器，何浚炫看中了三点：一是希望利用腾讯云的技术能力，二是想借助企业微信打造轻量级的CRM（客户关系管理）工具，三是能够接触到腾讯大量产业生态伙伴，从而进行业务合作。<br/><br/>　　另一家参赛企业Kyligence是一家PaaS供应商。这家公司解决的问题是，在超大规模数据量的情况下如何快速访问和分析数据。基于云原生技术，Kyligence帮助金融、保险、制造等行业的客户在云上进行成本更低的数据分析。参与腾讯云原生加速器，是看中后者的底层技术能力。<br/><br/>　　国内近两年已经涌现出不少提供云原生技术的厂商。但众人的共识是，无论是大厂还是初创企业，国内的云原生布局都还在十分初级的阶段。</p>', 1, '16224811219216453', '2021-06-01 01:12:01', '2021-06-04 12:47:10', 1, 0);
INSERT INTO `aw_news` VALUES (75, 'http://localhost:3000/upload/2021061/16224811655762533.jpg', '成为云计算领域最火概念之后 国内“云原生”走到了哪一步？~3', '成为云计算领域最火概念之后 国内“云原生”走到了哪一步？~3', '<p style=\"text-align:center;\"><img src=\"https://n.sinaimg.cn/tech/transform/188/w630h358/20210531/2a35-kquziii7897884.jpg\"/><br/></p><p>&nbsp; &nbsp; &nbsp; &nbsp; 去年9月，一家名为Snowflake的云原生数据仓库厂商上市，当天市值即涨破700亿美元，一举成为软件史上最大IPO。</p><p><br/>　　<b>云原生</b>，这个普通人听上去有些陌生的词，可能是过去几年里云计算领域最火的概念，也是未来几年间头部云厂商最重要的竞技场。<br/><br/>　　或许很多人对云的印象还停留在“把机房的服务搬到云上”，但随着云计算平台的成熟和分布式框架的普及，越来越多厂商开始考虑向“云原生”升级。简而言之，应用程序从诞生之初就在云上，可以直接在云平台上运行或非常轻松的迁移到云平台。<br/><br/>　　为什么云原生如此受追捧？一个易于理解的原因是，尽管企业的服务器已经“上云”，但随着需要运转的数据量越来越大，这个过程中底层的资源包括存储、算力以及网络带宽加在一起负荷也更高，如果资源不能充分最大化，那对企业来说会是极大的负担。<br/><br/>　　<b>云原生的优势在于</b>，开发者无需考虑底层的技术实现，就能够精细地控制底层资源，所有算力能够自动启停、伸缩，自动且快速地响应业务，做到资源最大化利用，节约成本，且具备业务持续性。这个优势在疫情期间十分明显，即“需要时可以用很多，不需要时也不会产生大量浪费。”<br/><br/>　　国内主要云厂商中，腾讯是重要的云原生推动者之一。根据官方披露的数据，腾讯已经拥有的云原生产品体系和架构，涵盖软件研发流程、计算资源、架构框架、数据存储和处理、安全五个领域的多个场景。目前，腾讯云原生注册用户规模超过100万，覆盖政府、金融、文体、教育等行业。<br/><br/>　　今年3月，腾讯还发布了国内首个云原生加速器，面向云原生应用、云原生应用编排及管理、云原生底层技术、云原生安全技术等四个方向招募30家企业，旨在进一步扩大其云原生的生态朋友圈，探索云原生的发展方向。<br/><br/>　　在近日的复试路演现场，界面新闻采访了几家参赛企业，他们分享了自己对云原生与中国云原生未来的看法。<br/><br/>　　何浚炫是参赛企业TreeLab的CEO。他对界面新闻介绍，TreeLab是一款让非IT人员快速构建信息化系统的生产力工具。一个背景是，大量传统行业的人都在使用Excel整理数据，但Excel很难形成标准化的系统，导致“表哥”、“表妹”们在数据整理上花费太多无用时间。TreeLab 想让这些IT能力弱的“表哥”、“表妹”自己来构建一个“数据中台”，建立更适合自身业务和上下游协同的数据处理系统。<br/><br/>　　这是时兴的“低代码”应用，也是一个典型的、基于云原生设计的应用。何浚炫解释道，随着用户量增加，TreeLab的数据承载量也变得更大，只有云原生的应用才能承载这样的业务场景。<br/><br/>　　之所以参与腾讯云原生加速器，何浚炫看中了三点：一是希望利用腾讯云的技术能力，二是想借助企业微信打造轻量级的CRM（客户关系管理）工具，三是能够接触到腾讯大量产业生态伙伴，从而进行业务合作。<br/><br/>　　另一家参赛企业Kyligence是一家PaaS供应商。这家公司解决的问题是，在超大规模数据量的情况下如何快速访问和分析数据。基于云原生技术，Kyligence帮助金融、保险、制造等行业的客户在云上进行成本更低的数据分析。参与腾讯云原生加速器，是看中后者的底层技术能力。<br/><br/></p><p>　　国内近两年已经涌现出不少提供云原生技术的厂商。但众人的共识是，无论是大厂还是初创企业，国内的云原生布局都还在十分初级的阶段。　　云原生，这个普通人听上去有些陌生的词，可能是过去几年里云计算领域最火的概念，也是未来几年间头部云厂商最重要的竞技场。<br/></p><p><br/>　　或许很多人对云的印象还停留在“把机房的服务搬到云上”，但随着云计算平台的成熟和分布式框架的普及，越来越多厂商开始考虑向“云原生”升级。简而言之，应用程序从诞生之初就在云上，可以直接在云平台上运行或非常轻松的迁移到云平台。<br/><br/>　　为什么云原生如此受追捧？一个易于理解的原因是，尽管企业的服务器已经“上云”，但随着需要运转的数据量越来越大，这个过程中底层的资源包括存储、算力以及网络带宽加在一起负荷也更高，如果资源不能充分最大化，那对企业来说会是极大的负担。<br/><br/>　　云原生的优势在于，开发者无需考虑底层的技术实现，就能够精细地控制底层资源，所有算力能够自动启停、伸缩，自动且快速地响应业务，做到资源最大化利用，节约成本，且具备业务持续性。这个优势在疫情期间十分明显，即“需要时可以用很多，不需要时也不会产生大量浪费。”<br/><br/>　　国内主要云厂商中，腾讯是重要的云原生推动者之一。根据官方披露的数据，腾讯已经拥有的云原生产品体系和架构，涵盖软件研发流程、计算资源、架构框架、数据存储和处理、安全五个领域的多个场景。目前，腾讯云原生注册用户规模超过100万，覆盖政府、金融、文体、教育等行业。<br/><br/>　　今年3月，腾讯还发布了国内首个云原生加速器，面向云原生应用、云原生应用编排及管理、云原生底层技术、云原生安全技术等四个方向招募30家企业，旨在进一步扩大其云原生的生态朋友圈，探索云原生的发展方向。<br/><br/>　　在近日的复试路演现场，界面新闻采访了几家参赛企业，他们分享了自己对云原生与中国云原生未来的看法。<br/><br/>　　何浚炫是参赛企业TreeLab的CEO。他对界面新闻介绍，TreeLab是一款让非IT人员快速构建信息化系统的生产力工具。一个背景是，大量传统行业的人都在使用Excel整理数据，但Excel很难形成标准化的系统，导致“表哥”、“表妹”们在数据整理上花费太多无用时间。TreeLab 想让这些IT能力弱的“表哥”、“表妹”自己来构建一个“数据中台”，建立更适合自身业务和上下游协同的数据处理系统。<br/><br/>　　这是时兴的“低代码”应用，也是一个典型的、基于云原生设计的应用。何浚炫解释道，随着用户量增加，TreeLab的数据承载量也变得更大，只有云原生的应用才能承载这样的业务场景。<br/><br/>　　之所以参与腾讯云原生加速器，何浚炫看中了三点：一是希望利用腾讯云的技术能力，二是想借助企业微信打造轻量级的CRM（客户关系管理）工具，三是能够接触到腾讯大量产业生态伙伴，从而进行业务合作。<br/><br/>　　另一家参赛企业Kyligence是一家PaaS供应商。这家公司解决的问题是，在超大规模数据量的情况下如何快速访问和分析数据。基于云原生技术，Kyligence帮助金融、保险、制造等行业的客户在云上进行成本更低的数据分析。参与腾讯云原生加速器，是看中后者的底层技术能力。<br/><br/>　　国内近两年已经涌现出不少提供云原生技术的厂商。但众人的共识是，无论是大厂还是初创企业，国内的云原生布局都还在十分初级的阶段。</p>', 1, '16224811663157731', '2021-06-01 01:12:46', '2021-06-01 01:12:46', 1, 1);
INSERT INTO `aw_news` VALUES (76, 'http://localhost:3000/upload/20210616/16238201344597644.png', '云计算', '云计算平台', '<p>云计算 平台<img src=\"http://localhost:3000/upload/20210616/16238201266933936.jpg\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p>', 0, '16238201379018572', '2021-06-16 13:08:57', '2021-06-16 13:08:57', 2, 1);

-- ----------------------------
-- Table structure for aw_news_types
-- ----------------------------
DROP TABLE IF EXISTS `aw_news_types`;
CREATE TABLE `aw_news_types`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of aw_news_types
-- ----------------------------
INSERT INTO `aw_news_types` VALUES (1, '最新动态', '2021-04-13 21:18:52', '2021-04-13 21:18:54');
INSERT INTO `aw_news_types` VALUES (2, '典型案例', '2021-04-13 21:19:12', '2021-04-13 21:19:14');
INSERT INTO `aw_news_types` VALUES (3, '通知公告', '2021-04-13 21:19:33', '2021-04-13 21:19:35');

-- ----------------------------
-- Table structure for aw_permissions
-- ----------------------------
DROP TABLE IF EXISTS `aw_permissions`;
CREATE TABLE `aw_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限描述',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：1/正常',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限请求路径',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求方法',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of aw_permissions
-- ----------------------------
INSERT INTO `aw_permissions` VALUES (1, '用户信息', 1, '2021-05-27 22:11:13', '2021-05-27 22:11:11', '/info', 'get');
INSERT INTO `aw_permissions` VALUES (2, '路由信息', 1, '2021-05-27 22:12:14', '2021-05-27 22:12:10', '/routes', 'get');
INSERT INTO `aw_permissions` VALUES (3, '添加角色', 1, '2021-05-27 22:13:00', '2021-05-27 22:12:57', '/roles', 'post');
INSERT INTO `aw_permissions` VALUES (4, '获取角色信息', 1, '2021-05-27 22:52:39', '2021-05-27 22:52:42', '/roles/:id', 'get');
INSERT INTO `aw_permissions` VALUES (5, '获取角色列表', 1, '2021-05-27 22:55:17', '2021-05-27 22:55:14', '/roles', 'get');
INSERT INTO `aw_permissions` VALUES (6, '更新角色信息', 1, '2021-05-27 22:56:05', '2021-05-27 22:56:08', '/roles/:id', 'put');
INSERT INTO `aw_permissions` VALUES (7, '删除角色', 1, '2021-05-27 22:59:09', '2021-05-27 22:59:13', '/roles/:id', 'delete');
INSERT INTO `aw_permissions` VALUES (8, '创建文章', 1, '2021-05-28 01:15:33', '2021-05-28 01:15:36', '/article', 'post');
INSERT INTO `aw_permissions` VALUES (9, '更新文章', 1, '2021-05-28 01:16:14', '2021-05-28 01:16:16', '/article/:path', 'put');
INSERT INTO `aw_permissions` VALUES (10, '删除文章', 1, '2021-05-28 01:17:45', '2021-05-28 01:17:49', '/article/:path', 'delete');
INSERT INTO `aw_permissions` VALUES (11, '获取文章列表', 1, '2021-05-28 01:18:35', '2021-05-28 01:18:37', '/article', 'get');
INSERT INTO `aw_permissions` VALUES (12, '获取文章分类', 1, '2021-05-28 01:19:37', '2021-05-28 01:19:39', '/article_category', 'get');
INSERT INTO `aw_permissions` VALUES (13, '获取文章详情', 1, '2021-05-28 01:20:20', '2021-05-28 01:20:22', '/article/:path', 'get');
INSERT INTO `aw_permissions` VALUES (14, '上传文件', 1, '2021-05-28 01:38:33', '2021-05-28 01:38:35', '/file', 'post');
INSERT INTO `aw_permissions` VALUES (15, '删除文件', 1, '2021-05-28 01:39:05', '2021-05-28 01:39:07', '/file/:url', 'delete');
INSERT INTO `aw_permissions` VALUES (16, '获取权限列表', 1, '2021-05-28 02:55:58', '2021-05-28 02:56:00', '/permission', 'get');
INSERT INTO `aw_permissions` VALUES (17, '获取角色权限列表', 1, '2021-05-28 10:57:25', '2021-05-28 10:57:27', '/role/permission/:id', 'get');
INSERT INTO `aw_permissions` VALUES (18, '获取菜单列表', 1, '2021-05-28 11:23:24', '2021-05-28 11:23:26', '/menu', 'get');
INSERT INTO `aw_permissions` VALUES (19, '获取角色菜单列表', 1, '2021-05-28 12:53:25', '2021-05-28 12:53:27', '/menu/:id', 'get');
INSERT INTO `aw_permissions` VALUES (20, '更新角色菜单权限', 1, '2021-05-28 14:08:56', '2021-05-28 14:08:58', '/menu/:id', 'put');
INSERT INTO `aw_permissions` VALUES (21, '更新角色操作权限', 1, '2021-05-28 15:20:44', '2021-05-28 15:20:46', '/permission/:id', 'put');
INSERT INTO `aw_permissions` VALUES (22, '获取用户列表', 1, '2021-05-28 18:08:06', '2021-05-28 18:08:08', '/account', 'get');
INSERT INTO `aw_permissions` VALUES (23, '更新用户信息', 1, '2021-05-28 18:50:37', '2021-05-28 18:50:39', '/account/:id', 'put');
INSERT INTO `aw_permissions` VALUES (24, '删除用户', 1, '2021-05-28 18:51:06', '2021-05-28 18:51:09', '/account/:id', 'delete');
INSERT INTO `aw_permissions` VALUES (25, '添加用户', 1, '2021-05-28 21:19:56', '2021-05-28 21:19:58', '/account', 'post');
INSERT INTO `aw_permissions` VALUES (26, '获取职位分类', 1, '2021-05-29 01:43:15', '2021-05-29 01:43:17', '/job_category', 'get');
INSERT INTO `aw_permissions` VALUES (27, '获取职位城市', 1, '2021-05-29 01:43:55', '2021-05-29 01:43:57', '/city', 'get');
INSERT INTO `aw_permissions` VALUES (28, '添加职位', 1, '2021-05-29 02:34:28', '2021-05-29 02:34:31', '/job', 'post');
INSERT INTO `aw_permissions` VALUES (29, '获取职位列表', 1, '2021-05-29 09:38:57', '2021-05-29 09:39:00', '/job', 'get');
INSERT INTO `aw_permissions` VALUES (30, '删除职位', 1, '2021-05-29 10:05:55', '2021-05-29 10:05:57', '/job/:id', 'delete');
INSERT INTO `aw_permissions` VALUES (31, '获取职位详情', 1, '2021-05-29 10:14:10', '2021-05-29 10:14:13', '/job/:id', 'get');
INSERT INTO `aw_permissions` VALUES (32, '更新职位详情', 1, '2021-05-29 10:49:31', '2021-05-29 10:49:33', '/job/:id', 'put');
INSERT INTO `aw_permissions` VALUES (33, '添加产品', 1, '2021-05-29 16:11:07', '2021-05-29 16:11:10', '/product', 'post');
INSERT INTO `aw_permissions` VALUES (34, '更新产品信息', 1, '2021-05-29 16:26:06', '2021-05-29 16:26:09', '/product/:id', 'put');
INSERT INTO `aw_permissions` VALUES (35, '删除产品', 1, '2021-05-29 16:26:49', '2021-05-29 16:26:51', '/product/:id', 'delete');
INSERT INTO `aw_permissions` VALUES (36, '获取产品列表', 1, '2021-05-29 16:27:36', '2021-05-29 16:27:39', '/product', 'get');
INSERT INTO `aw_permissions` VALUES (37, '获取产品详情', 1, '2021-05-29 16:28:14', '2021-05-29 16:28:16', '/product/:id', 'get');
INSERT INTO `aw_permissions` VALUES (38, '用户列表按日期分组', 1, '2021-06-15 21:51:23', '2021-06-15 21:51:25', '/account/date', 'get');
INSERT INTO `aw_permissions` VALUES (39, '获取轮播图列表', 1, '2021-10-10 19:50:15', '2021-10-10 19:50:24', '/swiper', 'get');
INSERT INTO `aw_permissions` VALUES (40, '添加轮播图', 1, '2021-10-10 23:24:49', '2021-10-10 23:24:45', '/swiper', 'post');
INSERT INTO `aw_permissions` VALUES (41, '更新轮播图信息', 1, '2021-10-10 23:26:10', '2021-10-10 23:26:08', '/swiper/:id', 'put');
INSERT INTO `aw_permissions` VALUES (42, '删除指定的轮播图', 1, '2021-10-10 23:26:36', '2021-10-10 23:26:39', '/swiper/:id', 'delete');
INSERT INTO `aw_permissions` VALUES (43, '获取轮播图的详细信息', 1, '2021-10-10 23:34:38', '2021-10-10 23:34:40', '/swiper/:id', 'get');
INSERT INTO `aw_permissions` VALUES (44, '获取商品分类树型数据', 1, '2021-10-15 00:03:03', '2021-10-15 00:03:05', '/pro/category/tree/data', 'get');
INSERT INTO `aw_permissions` VALUES (45, '获取菜单列表', 1, '2021-10-16 21:26:19', '2021-10-16 21:26:21', '/menu/list', 'post');

-- ----------------------------
-- Table structure for aw_pro_categories
-- ----------------------------
DROP TABLE IF EXISTS `aw_pro_categories`;
CREATE TABLE `aw_pro_categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品分类id',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类内容',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '产品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aw_pro_categories
-- ----------------------------
INSERT INTO `aw_pro_categories` VALUES (1, NULL, 'PC端', '2021-10-14 23:45:08', '2021-10-14 23:45:11');
INSERT INTO `aw_pro_categories` VALUES (2, NULL, '移动端', '2021-10-14 23:46:21', '2021-10-14 23:46:24');
INSERT INTO `aw_pro_categories` VALUES (3, NULL, '小程序', '2021-10-14 23:46:40', '2021-10-14 23:46:45');
INSERT INTO `aw_pro_categories` VALUES (4, 1, '管理后台', '2021-10-14 23:47:04', '2021-10-14 23:47:07');

-- ----------------------------
-- Table structure for aw_products
-- ----------------------------
DROP TABLE IF EXISTS `aw_products`;
CREATE TABLE `aw_products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cover_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品图片',
  `product_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品logo',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品英文名称',
  `product_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品中文名称',
  `product_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品描述',
  `product_sub_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品详细描述',
  `product_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品详情链接',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `use_git` tinyint(1) NOT NULL COMMENT '是否使用git',
  `github_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'github链接',
  `gitee_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'gitee链接',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '分类id(二级)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of aw_products
-- ----------------------------
INSERT INTO `aw_products` VALUES (1, 'http://localhost:3000/upload/20210521/keleji01.png', 'http://localhost:3000/upload/20210521/keleji.png', 'keleji', '可记', '可记是一个极简风格设计的笔记产品', '适合笔记记录与散文写作,它附带了一个功能丰富的扩展键盘和一些精美的主题,既可以作为纯文本编辑器使用又可以保存富媒体样式的笔记', 'http://localhost:8080', '2021-04-15 19:54:34', '2021-04-15 19:54:36', 0, NULL, NULL, NULL);
INSERT INTO `aw_products` VALUES (2, 'http://localhost:3000/upload/20210521/secai01.png', 'http://localhost:3000/upload/20210521/secai.png', 'secai', '色彩', '这是一款写给大家用的配色 APP', '无论你是配色初学者,还是专业设计师都能通过应用内提供的多种配色方式,寻找配色灵感,轻松搭配出好色彩', 'http://localhost:8080', '2021-04-15 19:56:53', '2021-04-15 19:56:55', 0, NULL, NULL, NULL);
INSERT INTO `aw_products` VALUES (3, 'http://localhost:3000/upload/20210521/tell01.png', 'http://localhost:3000/upload/20210521/tell.png', 'tell', 'Tell', 'Tell 是一个通过倾诉来消解的平台。', '我们希望每个用户在 Tell 写下或者说出故事之后,能够得到「有效」的回应。这些回应可能不是正确的,但是你总能找到一些微小的支点,支撑起你已经混沌的内心', 'http://localhost:8080', '2021-04-15 19:58:29', '2021-04-15 19:58:35', 0, NULL, NULL, NULL);
INSERT INTO `aw_products` VALUES (4, 'http://localhost:3000/upload/20210521/keleji01.png', 'http://localhost:3000/upload/20210521/keleji.png', 'keleji', '可记', '可记是一个极简风格设计的笔记产品', '适合笔记记录与散文写作,它附带了一个功能丰富的扩展键盘和一些精美的主题,既可以作为纯文本编辑器使用又可以保存富媒体样式的笔记', 'http://localhost:8080', '2021-04-15 20:00:36', '2021-04-15 20:00:39', 0, NULL, NULL, NULL);
INSERT INTO `aw_products` VALUES (5, 'http://localhost:3000/upload/20210616/16238199734679283.jpg', 'http://localhost:3000/upload/20210616/16238199812926337.png', NULL, '后台管理系统', '后台管理系统', '后台管理系统12', 'http://localhost:9000', '2021-06-16 13:06:24', '2021-06-16 13:06:24', 0, NULL, NULL, NULL);
INSERT INTO `aw_products` VALUES (6, 'http://localhost:3000/upload/20211013/16341311960244433.jpg', 'http://localhost:3000/upload/20211013/16341312008752853.jpeg', NULL, '测试产品', '这是测试的产品名称', '这是详细的描述', 'https://www.baidu.com', '2021-10-13 21:24:25', '2021-10-13 21:24:25', 1, 'https://github.com/vueComponent/ant-design-vue-pro', '', NULL);

-- ----------------------------
-- Table structure for aw_recommend_news
-- ----------------------------
DROP TABLE IF EXISTS `aw_recommend_news`;
CREATE TABLE `aw_recommend_news`  (
  `recommend_id` int(11) NOT NULL AUTO_INCREMENT,
  `publish_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `news_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`recommend_id`) USING BTREE,
  INDEX `news_id`(`news_id`) USING BTREE,
  CONSTRAINT `aw_recommend_news_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `aw_news` (`news_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of aw_recommend_news
-- ----------------------------
INSERT INTO `aw_recommend_news` VALUES (1, '2021-04-15 17:36:46', '2021-04-15 17:36:43', 65);
INSERT INTO `aw_recommend_news` VALUES (2, '2021-04-15 17:37:10', '2021-04-15 17:37:07', 66);
INSERT INTO `aw_recommend_news` VALUES (3, '2021-04-15 17:37:15', '2021-04-15 17:37:18', 67);
INSERT INTO `aw_recommend_news` VALUES (4, '2021-04-15 17:37:24', '2021-04-15 17:37:26', 68);

-- ----------------------------
-- Table structure for aw_role_menu_lists
-- ----------------------------
DROP TABLE IF EXISTS `aw_role_menu_lists`;
CREATE TABLE `aw_role_menu_lists`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(4) NOT NULL DEFAULT 1 COMMENT '状态：1/正常',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `aw_menu_list_id` int(11) NULL DEFAULT NULL,
  `aw_role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `aw_role_menu_lists_awRoleId_awMenuListId_unique`(`aw_menu_list_id`, `aw_role_id`) USING BTREE,
  INDEX `aw_role_id`(`aw_role_id`) USING BTREE,
  CONSTRAINT `aw_role_menu_lists_ibfk_2943` FOREIGN KEY (`aw_menu_list_id`) REFERENCES `aw_menu_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aw_role_menu_lists_ibfk_2944` FOREIGN KEY (`aw_role_id`) REFERENCES `aw_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of aw_role_menu_lists
-- ----------------------------
INSERT INTO `aw_role_menu_lists` VALUES (12, 1, '2021-05-27 17:41:02', '2021-05-27 17:40:58', 1, 1);
INSERT INTO `aw_role_menu_lists` VALUES (13, 1, '2021-05-27 17:41:15', '2021-05-27 17:41:12', 2, 1);
INSERT INTO `aw_role_menu_lists` VALUES (14, 1, '2021-05-27 17:41:30', '2021-05-27 17:41:27', 5, 1);
INSERT INTO `aw_role_menu_lists` VALUES (15, 1, '2021-05-27 17:41:47', '2021-05-27 17:41:42', 6, 1);
INSERT INTO `aw_role_menu_lists` VALUES (16, 1, '2021-05-27 17:42:01', '2021-05-27 17:41:57', 7, 1);
INSERT INTO `aw_role_menu_lists` VALUES (17, 1, '2021-05-27 17:42:15', '2021-05-27 17:42:12', 8, 1);
INSERT INTO `aw_role_menu_lists` VALUES (18, 1, '2021-05-27 17:49:44', '2021-05-27 17:49:40', 9, 1);
INSERT INTO `aw_role_menu_lists` VALUES (19, 1, '2021-05-27 17:50:00', '2021-05-27 17:49:56', 10, 1);
INSERT INTO `aw_role_menu_lists` VALUES (20, 1, '2021-05-27 17:50:13', '2021-05-27 17:50:11', 11, 1);
INSERT INTO `aw_role_menu_lists` VALUES (21, 1, '2021-05-27 17:51:32', '2021-05-27 17:51:30', 12, 1);
INSERT INTO `aw_role_menu_lists` VALUES (22, 1, '2021-05-27 17:54:32', '2021-05-27 17:54:34', 13, 1);
INSERT INTO `aw_role_menu_lists` VALUES (92, 1, '2021-05-28 16:51:39', '2021-05-28 16:51:41', 14, 1);
INSERT INTO `aw_role_menu_lists` VALUES (93, 1, '2021-05-28 16:52:00', '2021-05-28 16:52:02', 15, 1);
INSERT INTO `aw_role_menu_lists` VALUES (94, 1, '2021-05-28 16:52:11', '2021-05-28 16:52:14', 16, 1);
INSERT INTO `aw_role_menu_lists` VALUES (117, 1, '2021-05-28 23:31:02', '2021-05-28 23:31:00', 17, 1);
INSERT INTO `aw_role_menu_lists` VALUES (118, 1, '2021-05-28 23:31:13', '2021-05-28 23:31:15', 18, 1);
INSERT INTO `aw_role_menu_lists` VALUES (119, 1, '2021-05-28 23:31:20', '2021-05-28 23:31:22', 19, 1);
INSERT INTO `aw_role_menu_lists` VALUES (120, 1, '2021-05-29 15:27:22', '2021-05-29 15:27:24', 20, 1);
INSERT INTO `aw_role_menu_lists` VALUES (121, 1, '2021-05-29 15:27:39', '2021-05-29 15:27:41', 21, 1);
INSERT INTO `aw_role_menu_lists` VALUES (122, 1, '2021-05-29 15:27:55', '2021-05-29 15:27:57', 22, 1);
INSERT INTO `aw_role_menu_lists` VALUES (123, 1, '2021-05-29 15:28:02', '2021-05-29 15:28:04', 23, 1);
INSERT INTO `aw_role_menu_lists` VALUES (124, 1, '2021-06-12 18:36:08', '2021-06-12 18:36:08', 1, 2);
INSERT INTO `aw_role_menu_lists` VALUES (125, 1, '2021-06-12 18:36:08', '2021-06-12 18:36:08', 2, 2);
INSERT INTO `aw_role_menu_lists` VALUES (126, 1, '2021-06-12 18:36:09', '2021-06-12 18:36:09', 6, 2);
INSERT INTO `aw_role_menu_lists` VALUES (127, 1, '2021-06-12 18:36:09', '2021-06-12 18:36:09', 10, 2);
INSERT INTO `aw_role_menu_lists` VALUES (128, 1, '2021-06-12 18:36:09', '2021-06-12 18:36:09', 11, 2);
INSERT INTO `aw_role_menu_lists` VALUES (129, 1, '2021-06-12 18:36:09', '2021-06-12 18:36:09', 12, 2);
INSERT INTO `aw_role_menu_lists` VALUES (131, 1, '2021-06-15 09:40:42', '2021-06-15 09:40:42', 1, 3);
INSERT INTO `aw_role_menu_lists` VALUES (132, 1, '2021-06-15 09:40:42', '2021-06-15 09:40:42', 2, 3);
INSERT INTO `aw_role_menu_lists` VALUES (133, 1, '2021-10-10 19:11:15', '2021-10-10 19:11:17', 24, 1);
INSERT INTO `aw_role_menu_lists` VALUES (134, 1, '2021-10-10 19:11:48', '2021-10-10 19:11:51', 25, 1);
INSERT INTO `aw_role_menu_lists` VALUES (135, 1, '2021-10-10 19:12:12', '2021-10-10 19:12:14', 26, 1);
INSERT INTO `aw_role_menu_lists` VALUES (136, 1, '2021-10-10 19:12:31', '2021-10-10 19:12:33', 27, 1);
INSERT INTO `aw_role_menu_lists` VALUES (137, 1, '2021-10-16 17:29:13', '2021-10-16 17:29:15', 28, 1);
INSERT INTO `aw_role_menu_lists` VALUES (138, 1, '2021-10-16 17:29:25', '2021-10-16 17:29:27', 29, 1);
INSERT INTO `aw_role_menu_lists` VALUES (139, 1, '2021-10-16 17:44:09', '2021-10-16 17:44:11', 30, 1);
INSERT INTO `aw_role_menu_lists` VALUES (140, 1, '2021-10-16 18:06:48', '2021-10-16 18:06:50', 31, 1);
INSERT INTO `aw_role_menu_lists` VALUES (141, 1, '2021-10-16 18:06:59', '2021-10-16 18:07:01', 32, 1);
INSERT INTO `aw_role_menu_lists` VALUES (142, 1, '2021-10-16 18:11:18', '2021-10-16 18:11:20', 33, 1);

-- ----------------------------
-- Table structure for aw_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `aw_role_permissions`;
CREATE TABLE `aw_role_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(4) NOT NULL DEFAULT 1 COMMENT '状态：1/正常',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `aw_role_id` int(11) NULL DEFAULT NULL,
  `aw_permission_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `aw_role_permissions_awPermissionId_awRoleId_unique`(`aw_role_id`, `aw_permission_id`) USING BTREE,
  INDEX `aw_permission_id`(`aw_permission_id`) USING BTREE,
  CONSTRAINT `aw_role_permissions_ibfk_2095` FOREIGN KEY (`aw_role_id`) REFERENCES `aw_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aw_role_permissions_ibfk_2096` FOREIGN KEY (`aw_permission_id`) REFERENCES `aw_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of aw_role_permissions
-- ----------------------------
INSERT INTO `aw_role_permissions` VALUES (1, 1, '2021-05-27 23:00:25', '2021-05-27 23:00:28', 1, 1);
INSERT INTO `aw_role_permissions` VALUES (2, 1, '2021-05-27 23:01:13', '2021-05-27 23:01:16', 1, 2);
INSERT INTO `aw_role_permissions` VALUES (3, 1, '2021-05-27 23:01:28', '2021-05-27 23:01:30', 1, 3);
INSERT INTO `aw_role_permissions` VALUES (4, 1, '2021-05-27 23:01:37', '2021-05-27 23:01:35', 1, 4);
INSERT INTO `aw_role_permissions` VALUES (5, 1, '2021-05-27 23:01:55', '2021-05-27 23:01:51', 1, 5);
INSERT INTO `aw_role_permissions` VALUES (6, 1, '2021-05-27 23:02:07', '2021-05-27 23:02:09', 1, 6);
INSERT INTO `aw_role_permissions` VALUES (7, 1, '2021-05-27 23:02:20', '2021-05-27 23:02:18', 1, 7);
INSERT INTO `aw_role_permissions` VALUES (8, 1, '2021-05-28 01:25:04', '2021-05-28 01:25:07', 1, 8);
INSERT INTO `aw_role_permissions` VALUES (9, 1, '2021-05-28 01:25:25', '2021-05-28 01:25:28', 1, 9);
INSERT INTO `aw_role_permissions` VALUES (11, 1, '2021-05-28 01:26:26', '2021-05-28 01:26:29', 1, 10);
INSERT INTO `aw_role_permissions` VALUES (12, 1, '2021-05-28 01:26:45', '2021-05-28 01:26:48', 1, 11);
INSERT INTO `aw_role_permissions` VALUES (13, 1, '2021-05-28 01:27:01', '2021-05-28 01:27:04', 1, 12);
INSERT INTO `aw_role_permissions` VALUES (14, 1, '2021-05-28 01:27:18', '2021-05-28 01:27:21', 1, 13);
INSERT INTO `aw_role_permissions` VALUES (15, 1, '2021-05-28 01:39:36', '2021-05-28 01:39:39', 1, 14);
INSERT INTO `aw_role_permissions` VALUES (16, 1, '2021-05-28 01:39:53', '2021-05-28 01:39:55', 1, 15);
INSERT INTO `aw_role_permissions` VALUES (19, 1, '2021-05-28 02:56:20', '2021-05-28 02:56:22', 1, 16);
INSERT INTO `aw_role_permissions` VALUES (20, 1, '2021-05-28 10:58:51', '2021-05-28 10:58:54', 1, 17);
INSERT INTO `aw_role_permissions` VALUES (21, 1, '2021-05-28 11:23:58', '2021-05-28 11:23:59', 1, 18);
INSERT INTO `aw_role_permissions` VALUES (22, 1, '2021-05-28 12:53:42', '2021-05-28 12:53:44', 1, 19);
INSERT INTO `aw_role_permissions` VALUES (23, 1, '2021-05-28 14:09:13', '2021-05-28 14:09:15', 1, 20);
INSERT INTO `aw_role_permissions` VALUES (24, 1, '2021-05-28 15:21:13', '2021-05-28 15:21:16', 1, 21);
INSERT INTO `aw_role_permissions` VALUES (41, 1, '2021-05-28 18:09:45', '2021-05-28 18:09:46', 1, 22);
INSERT INTO `aw_role_permissions` VALUES (42, 1, '2021-05-28 18:51:43', '2021-05-28 18:51:45', 1, 23);
INSERT INTO `aw_role_permissions` VALUES (43, 1, '2021-05-28 18:51:56', '2021-05-28 18:51:58', 1, 24);
INSERT INTO `aw_role_permissions` VALUES (44, 1, '2021-05-28 21:20:22', '2021-05-28 21:20:24', 1, 25);
INSERT INTO `aw_role_permissions` VALUES (45, 1, '2021-05-29 01:44:22', '2021-05-29 01:44:23', 1, 26);
INSERT INTO `aw_role_permissions` VALUES (46, 1, '2021-05-29 01:44:36', '2021-05-29 01:44:37', 1, 27);
INSERT INTO `aw_role_permissions` VALUES (47, 1, '2021-05-29 02:34:51', '2021-05-29 02:34:54', 1, 28);
INSERT INTO `aw_role_permissions` VALUES (48, 1, '2021-05-29 09:39:21', '2021-05-29 09:39:23', 1, 29);
INSERT INTO `aw_role_permissions` VALUES (49, 1, '2021-05-29 10:06:21', '2021-05-29 10:06:23', 1, 30);
INSERT INTO `aw_role_permissions` VALUES (50, 1, '2021-05-29 10:14:39', '2021-05-29 10:14:41', 1, 31);
INSERT INTO `aw_role_permissions` VALUES (51, 1, '2021-05-29 10:50:12', '2021-05-29 10:50:14', 1, 32);
INSERT INTO `aw_role_permissions` VALUES (52, 1, '2021-05-29 16:12:07', '2021-05-29 16:12:08', 1, 33);
INSERT INTO `aw_role_permissions` VALUES (53, 1, '2021-05-29 16:29:06', '2021-05-29 16:29:08', 1, 34);
INSERT INTO `aw_role_permissions` VALUES (54, 1, '2021-05-29 16:29:13', '2021-05-29 16:29:16', 1, 35);
INSERT INTO `aw_role_permissions` VALUES (55, 1, '2021-05-29 16:29:28', '2021-05-29 16:29:32', 1, 36);
INSERT INTO `aw_role_permissions` VALUES (56, 1, '2021-05-29 16:29:43', '2021-05-29 16:29:40', 1, 37);
INSERT INTO `aw_role_permissions` VALUES (81, 1, '2021-06-13 18:59:13', '2021-06-13 18:59:13', 3, 1);
INSERT INTO `aw_role_permissions` VALUES (82, 1, '2021-06-13 18:59:13', '2021-06-13 18:59:13', 3, 2);
INSERT INTO `aw_role_permissions` VALUES (83, 1, '2021-06-13 18:59:13', '2021-06-13 18:59:13', 3, 14);
INSERT INTO `aw_role_permissions` VALUES (84, 1, '2021-06-13 18:59:13', '2021-06-13 18:59:13', 3, 15);
INSERT INTO `aw_role_permissions` VALUES (85, 1, '2021-06-13 18:59:13', '2021-06-13 18:59:13', 3, 18);
INSERT INTO `aw_role_permissions` VALUES (86, 1, '2021-06-13 18:59:13', '2021-06-13 18:59:13', 3, 22);
INSERT INTO `aw_role_permissions` VALUES (87, 1, '2021-06-13 18:59:13', '2021-06-13 18:59:13', 3, 23);
INSERT INTO `aw_role_permissions` VALUES (88, 1, '2021-06-13 18:59:13', '2021-06-13 18:59:13', 3, 36);
INSERT INTO `aw_role_permissions` VALUES (89, 1, '2021-06-13 18:59:13', '2021-06-13 18:59:13', 3, 37);
INSERT INTO `aw_role_permissions` VALUES (90, 1, '2021-06-15 21:51:47', '2021-06-15 21:51:49', NULL, NULL);
INSERT INTO `aw_role_permissions` VALUES (91, 1, '2021-06-15 21:51:47', '2021-06-15 21:51:49', 1, 38);
INSERT INTO `aw_role_permissions` VALUES (92, 1, '2021-06-20 16:33:58', '2021-06-20 16:33:58', 2, 1);
INSERT INTO `aw_role_permissions` VALUES (93, 1, '2021-06-20 16:33:58', '2021-06-20 16:33:58', 2, 2);
INSERT INTO `aw_role_permissions` VALUES (94, 1, '2021-06-20 16:33:58', '2021-06-20 16:33:58', 2, 8);
INSERT INTO `aw_role_permissions` VALUES (95, 1, '2021-06-20 16:33:58', '2021-06-20 16:33:58', 2, 9);
INSERT INTO `aw_role_permissions` VALUES (96, 1, '2021-06-20 16:33:58', '2021-06-20 16:33:58', 2, 10);
INSERT INTO `aw_role_permissions` VALUES (97, 1, '2021-06-20 16:33:58', '2021-06-20 16:33:58', 2, 11);
INSERT INTO `aw_role_permissions` VALUES (98, 1, '2021-06-20 16:33:58', '2021-06-20 16:33:58', 2, 12);
INSERT INTO `aw_role_permissions` VALUES (99, 1, '2021-06-20 16:33:58', '2021-06-20 16:33:58', 2, 13);
INSERT INTO `aw_role_permissions` VALUES (100, 1, '2021-06-20 16:33:58', '2021-06-20 16:33:58', 2, 14);
INSERT INTO `aw_role_permissions` VALUES (101, 1, '2021-06-20 16:33:58', '2021-06-20 16:33:58', 2, 15);
INSERT INTO `aw_role_permissions` VALUES (102, 1, '2021-06-20 16:33:58', '2021-06-20 16:33:58', 2, 18);
INSERT INTO `aw_role_permissions` VALUES (103, 1, '2021-06-20 16:33:58', '2021-06-20 16:33:58', 2, 23);
INSERT INTO `aw_role_permissions` VALUES (104, 1, '2021-06-20 16:33:58', '2021-06-20 16:33:58', 2, 36);
INSERT INTO `aw_role_permissions` VALUES (105, 1, '2021-06-20 16:33:58', '2021-06-20 16:33:58', 2, 37);
INSERT INTO `aw_role_permissions` VALUES (106, 1, '2021-10-10 19:59:44', '2021-10-10 19:59:46', 1, 39);
INSERT INTO `aw_role_permissions` VALUES (107, 1, '2021-10-10 23:25:14', '2021-10-10 23:25:18', 1, 40);
INSERT INTO `aw_role_permissions` VALUES (108, 1, '2021-10-10 23:26:56', '2021-10-10 23:26:58', 1, 41);
INSERT INTO `aw_role_permissions` VALUES (109, 1, '2021-10-10 23:27:13', '2021-10-10 23:27:15', 1, 42);
INSERT INTO `aw_role_permissions` VALUES (110, 1, '2021-10-10 23:34:59', '2021-10-10 23:35:01', 1, 43);
INSERT INTO `aw_role_permissions` VALUES (111, 1, '2021-10-15 00:03:37', '2021-10-15 00:03:40', 1, 44);
INSERT INTO `aw_role_permissions` VALUES (113, 1, '2021-10-16 21:26:50', '2021-10-16 21:26:52', 1, 45);

-- ----------------------------
-- Table structure for aw_roles
-- ----------------------------
DROP TABLE IF EXISTS `aw_roles`;
CREATE TABLE `aw_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：1/正常',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of aw_roles
-- ----------------------------
INSERT INTO `aw_roles` VALUES (1, 1, '2021-05-27 17:34:02', '2021-05-27 17:35:46', '管理员', '超级管理员');
INSERT INTO `aw_roles` VALUES (2, 1, '2021-05-16 11:31:16', '2021-05-28 20:17:33', 'editor', '责任编辑');
INSERT INTO `aw_roles` VALUES (3, 1, '2021-05-27 11:52:54', '2021-06-15 09:40:23', 'normal', '普通用户');

-- ----------------------------
-- Table structure for aw_webinfos
-- ----------------------------
DROP TABLE IF EXISTS `aw_webinfos`;
CREATE TABLE `aw_webinfos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站信息的json字符串',
  `version` int(5) NOT NULL COMMENT '版本号自增',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '补充说明',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aw_webinfos
-- ----------------------------
INSERT INTO `aw_webinfos` VALUES (1, '{\"website_name\":\"北京xxx信息技术有限公司\",\"email\":\"17611@qq.com\",\"phone\":\"00987651\",\"swiper_way\":\"hover\"}', 1, NULL, '2021-10-09 00:46:15', '2021-10-09 00:46:18');

-- ----------------------------
-- Table structure for menu_permissions
-- ----------------------------
DROP TABLE IF EXISTS `menu_permissions`;
CREATE TABLE `menu_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路径',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of menu_permissions
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
