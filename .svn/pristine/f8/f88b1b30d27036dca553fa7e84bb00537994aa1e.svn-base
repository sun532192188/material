/*
Navicat MySQL Data Transfer

Source Server         : HP-PC
Source Server Version : 50535
Source Host           : localhost:3306
Source Database       : material

Target Server Type    : MYSQL
Target Server Version : 50535
File Encoding         : 65001

Date: 2017-02-21 22:16:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remove` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `userName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departId` int(11) DEFAULT NULL,
  `departmentName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roleName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '4005f2b769ab124bd002e749ce39381d', '0', '1', 'admin', '0', null, null);
INSERT INTO `admin` VALUES ('5', '4005f2b769ab124bd002e749ce39381d', '0', '4', '采购办', '3', null, null);
INSERT INTO `admin` VALUES ('6', '4005f2b769ab124bd002e749ce39381d', '0', '5', '宣传股', '4', null, null);

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `categoryNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('28', '办公用品', '0', 'BG', '0');
INSERT INTO `category` VALUES ('30', '电子通信', '0', 'DZ', '0');
INSERT INTO `category` VALUES ('32', '五金电料', '0', 'WJ', '0');
INSERT INTO `category` VALUES ('33', '劳保日杂', '0', 'LB', '0');
INSERT INTO `category` VALUES ('34', '笔', '28', 'BG01', '0');
INSERT INTO `category` VALUES ('35', '本', '28', 'BG02', '0');
INSERT INTO `category` VALUES ('36', '纸', '28', 'BG03', '0');
INSERT INTO `category` VALUES ('37', '工具', '32', 'WJ01', '0');
INSERT INTO `category` VALUES ('38', '电线', '32', 'WJ02', '0');
INSERT INTO `category` VALUES ('39', '胶带', '32', 'WJ03', '0');
INSERT INTO `category` VALUES ('40', '清洁工具', '33', 'LB01', '0');
INSERT INTO `category` VALUES ('41', '手套', '33', 'LB02', '0');
INSERT INTO `category` VALUES ('42', '电脑', '30', 'DZ01', '0');
INSERT INTO `category` VALUES ('43', '硬盘', '30', 'DZ02', '0');
INSERT INTO `category` VALUES ('45', '保密柜', '28', 'BG04', '0');
INSERT INTO `category` VALUES ('46', '铜轴线', '30', 'DZ03', '0');
INSERT INTO `category` VALUES ('47', '李四2', '0', 'LS', '0');
INSERT INTO `category` VALUES ('48', '椅子', '47', 'GD01', '0');
INSERT INTO `category` VALUES ('49', '桌子', '47', 'GD02', '0');
INSERT INTO `category` VALUES ('50', '钢笔2', '28', 'BG05', '0');
INSERT INTO `category` VALUES ('51', '测试', '47', 'GD03', '0');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('3', '采购办', '', '18031377618');
INSERT INTO `department` VALUES ('4', '宣传股', '', '1803135546');
INSERT INTO `department` VALUES ('5', '作训股', '', '18031371297');
INSERT INTO `department` VALUES ('6', '通信股', '', '18031375555');

-- ----------------------------
-- Table structure for `departplan`
-- ----------------------------
DROP TABLE IF EXISTS `departplan`;
CREATE TABLE `departplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumPrice` double DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `planName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of departplan
-- ----------------------------
INSERT INTO `departplan` VALUES ('1', '2016-12-24 19:33:07', '4', '', '0', '1', '1', '宣传股');
INSERT INTO `departplan` VALUES ('2', '2016-12-25 20:47:20', '4', '', '0', null, null, '宣传股');
INSERT INTO `departplan` VALUES ('3', '2016-12-25 20:55:05', '4', '佛挡杀佛', '0', '0', '但是复苏的', '宣传股');
INSERT INTO `departplan` VALUES ('4', '2016-12-25 20:55:07', '4', '股份大股东方', '13.56', '0', '广泛大锅饭的', '宣传股');
INSERT INTO `departplan` VALUES ('5', '2016-12-25 20:56:09', '4', '广泛大锅饭的', '13.56', '0', '广泛大锅饭的', '宣传股');
INSERT INTO `departplan` VALUES ('6', '2016-12-25 20:57:45', '4', '添加申请', '5070', '0', '1月份月季花申请', '宣传股');
INSERT INTO `departplan` VALUES ('7', '2016-12-25 21:02:26', '4', '分的高飞的', '5837.56', '1', '测试申请', '宣传股');
INSERT INTO `departplan` VALUES ('8', '2016-12-25 21:08:36', '4', '王改改是傻逼', '5837.56', '1', '佛挡杀佛', '宣传股');
INSERT INTO `departplan` VALUES ('9', '2016-12-25 21:15:26', '4', '幅度是否松动', '5151.56', '0', '幅度是否松动', '宣传股');

-- ----------------------------
-- Table structure for `departstock`
-- ----------------------------
DROP TABLE IF EXISTS `departstock`;
CREATE TABLE `departstock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryOne` int(11) DEFAULT NULL,
  `categoryTwo` int(11) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `goodsPrice` double DEFAULT NULL,
  `goodsType` int(11) DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stockNum` double DEFAULT NULL,
  `stockType` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of departstock
-- ----------------------------
INSERT INTO `departstock` VALUES ('30', '28', '34', '3', '15', '6.78', '1', '', '3', '2', null);
INSERT INTO `departstock` VALUES ('31', '28', '34', '3', '16', '34', '1', '', '2', '2', null);
INSERT INTO `departstock` VALUES ('32', '33', '40', '5', '24', '6', '1', '', '2', '1', null);
INSERT INTO `departstock` VALUES ('33', '47', '49', '5', '36', '10', '2', '该资产还未使用', '1', '1', '1');
INSERT INTO `departstock` VALUES ('34', '47', '49', '5', '36', '10', '2', '该资产还未使用', '1', '1', '1');
INSERT INTO `departstock` VALUES ('35', '47', '49', '5', '37', '12', '2', '该资产还未使用', '1', '1', '1');
INSERT INTO `departstock` VALUES ('36', '47', '49', '5', '37', '12', '2', '该资产还未使用', '1', '1', '1');
INSERT INTO `departstock` VALUES ('37', '47', '49', '5', '37', '12', '2', '该资产还未使用', '1', '1', '1');
INSERT INTO `departstock` VALUES ('38', '47', '49', '5', '37', '12', '2', '该资产还未使用', '1', '1', '1');
INSERT INTO `departstock` VALUES ('39', '47', '49', '5', '37', '12', '2', '该资产还未使用', '1', '1', '1');
INSERT INTO `departstock` VALUES ('40', '33', '40', '4', '24', '6', '1', '', '2', '1', null);

-- ----------------------------
-- Table structure for `departuse`
-- ----------------------------
DROP TABLE IF EXISTS `departuse`;
CREATE TABLE `departuse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentId` int(11) DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumMoney` double DEFAULT NULL,
  `useDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of departuse
-- ----------------------------

-- ----------------------------
-- Table structure for `function`
-- ----------------------------
DROP TABLE IF EXISTS `function`;
CREATE TABLE `function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of function
-- ----------------------------
INSERT INTO `function` VALUES ('1', '部门管理', null, '0');
INSERT INTO `function` VALUES ('2', '部门查询', null, '1');
INSERT INTO `function` VALUES ('3', '角色管理', null, '0');
INSERT INTO `function` VALUES ('4', '角色查询', null, '3');
INSERT INTO `function` VALUES ('5', '用户管理', null, '0');
INSERT INTO `function` VALUES ('6', '用户查询', null, '5');
INSERT INTO `function` VALUES ('7', '供应商管理', null, '0');
INSERT INTO `function` VALUES ('8', '查询供应商', null, '7');
INSERT INTO `function` VALUES ('9', '商品类型管理', null, '0');
INSERT INTO `function` VALUES ('10', '类目查询', null, '9');
INSERT INTO `function` VALUES ('11', '商品管理', null, '0');
INSERT INTO `function` VALUES ('12', '商品查询', null, '11');
INSERT INTO `function` VALUES ('13', '入库管理', null, '0');
INSERT INTO `function` VALUES ('14', '验收入库', null, '13');
INSERT INTO `function` VALUES ('15', '预存入库', null, '13');
INSERT INTO `function` VALUES ('16', '调拨管理', null, '0');
INSERT INTO `function` VALUES ('17', '调拨查询', null, '16');
INSERT INTO `function` VALUES ('18', '领用管理', null, '0');
INSERT INTO `function` VALUES ('19', '领用查询', null, '18');
INSERT INTO `function` VALUES ('20', '统计管理', null, '0');
INSERT INTO `function` VALUES ('21', '部门月计划统计', null, '20');
INSERT INTO `function` VALUES ('22', '库存管理', null, '20');
INSERT INTO `function` VALUES ('23', '库存入库统计', null, '20');
INSERT INTO `function` VALUES ('24', '库存出库统计', null, '20');
INSERT INTO `function` VALUES ('25', '数据中心', null, '0');
INSERT INTO `function` VALUES ('26', '数据操作', null, '25');
INSERT INTO `function` VALUES ('27', '系统名称', null, '25');
INSERT INTO `function` VALUES ('28', '商品信息', null, '0');
INSERT INTO `function` VALUES ('29', '商品查看', null, '28');
INSERT INTO `function` VALUES ('30', '月计划', null, '0');
INSERT INTO `function` VALUES ('31', '月计划查询', null, '30');
INSERT INTO `function` VALUES ('32', '物资管理', null, '0');
INSERT INTO `function` VALUES ('33', '入库单查看', null, '32');
INSERT INTO `function` VALUES ('34', '物资出库', null, '32');
INSERT INTO `function` VALUES ('35', '部门库存', null, '0');
INSERT INTO `function` VALUES ('36', '物资库存', null, '35');
INSERT INTO `function` VALUES ('37', '固定资产库存', null, '35');
INSERT INTO `function` VALUES ('38', '物资统计', null, '0');
INSERT INTO `function` VALUES ('39', '部门入库统计', null, '38');
INSERT INTO `function` VALUES ('40', '部门出库统计', null, '38');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryOne` int(11) DEFAULT NULL,
  `categoryTwo` int(11) DEFAULT NULL,
  `goodsName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goodsNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goodsType` int(11) DEFAULT NULL,
  `isDecimal` int(1) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `spec` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specModel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplierId` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('15', '28', '34', '中性笔', 'BG0100001', '1', '0', '6.78', '盒', '金万年0.5', '12', '0');
INSERT INTO `goods` VALUES ('16', '28', '34', '中性笔', 'BG0100002', '1', '0', '34', '盒', '金万年0.7', '12', '0');
INSERT INTO `goods` VALUES ('17', '30', '42', '电脑', 'DZ0100001', '2', '0', '2535', '台', '联想233', '14', '0');
INSERT INTO `goods` VALUES ('18', '30', '43', '硬盘', 'DZ0200001', '2', '0', '333', '块', '是索尼', '14', '0');
INSERT INTO `goods` VALUES ('19', '32', '37', '扳手', 'WJ0100001', '1', '0', '10', '把', '21', '15', '0');
INSERT INTO `goods` VALUES ('20', '32', '37', '套筒', 'WJ0100002', '1', '0', '20', '把', '555', '15', '0');
INSERT INTO `goods` VALUES ('21', '33', '40', '扫把', 'LB0100001', '1', '0', '7', '把', '木质', '13', '0');
INSERT INTO `goods` VALUES ('22', '33', '41', '手套', 'LB0200001', '1', '0', '1', '付', '薄', '13', '0');
INSERT INTO `goods` VALUES ('23', '33', '41', '手套', 'LB0200002', '1', '0', '2', '付', '厚', '13', '0');
INSERT INTO `goods` VALUES ('24', '33', '40', '墩布', 'LB0100002', '1', '0', '6', '把', '木质', '13', '0');
INSERT INTO `goods` VALUES ('25', '32', '38', '电线', 'WJ0200001', '1', '0', '100', '盘', '2.5平方', '15', '0');
INSERT INTO `goods` VALUES ('26', '32', '38', '电线', 'WJ0200002', '1', '0', '200', '盘', '3.5平方', '15', '0');
INSERT INTO `goods` VALUES ('27', '28', '36', '纸', 'BG0300001', '1', '0', '10', '包', 'A4', '12', '0');
INSERT INTO `goods` VALUES ('28', '28', '36', '纸', 'BG0300002', '1', '0', '5', '包', 'A5', '12', '0');
INSERT INTO `goods` VALUES ('29', '28', '35', '本', 'BG0200001', '1', '0', '1.5', '本', '薄', '12', '0');
INSERT INTO `goods` VALUES ('30', '28', '35', '本', 'BG0200002', '1', '0', '3', '本', '厚', '12', '0');
INSERT INTO `goods` VALUES ('31', '32', '39', '胶布', 'WJ0300001', '1', '0', '3', '卷', '防水', '15', '0');
INSERT INTO `goods` VALUES ('32', '32', '39', '胶布', 'WJ0300002', '1', '0', '5', '卷', '高级防水', '15', '0');
INSERT INTO `goods` VALUES ('33', '28', '45', '保密柜', 'BG0400001', '2', '0', '1000', '个', '2', '12', '0');
INSERT INTO `goods` VALUES ('34', '47', '48', '椅子', 'GD0100001', '2', '0', '200', '把', '20', '16', '0');
INSERT INTO `goods` VALUES ('35', '47', '48', '椅子', 'GD0100002', '2', '0', '3000', '把', '30', '16', '0');
INSERT INTO `goods` VALUES ('36', '47', '49', '桌子', 'GD0200001', '2', '0', '10000', '张', '50', '16', '0');
INSERT INTO `goods` VALUES ('37', '47', '49', '桌子', 'GD0200002', '2', '0', '12000', '张', '60', '16', '0');
INSERT INTO `goods` VALUES ('38', '28', '36', '纸', 'BG0300003', '1', '0', '25', '包', 'A4、80g', '12', '0');
INSERT INTO `goods` VALUES ('39', '28', '34', '中性笔', 'BG0100003', '1', '0', '10', '盒', '金万年、0.38', '12', '0');
INSERT INTO `goods` VALUES ('40', '28', '50', '钢笔', 'BG0500001', '1', '0', '30', '支', '影响', '12', '0');
INSERT INTO `goods` VALUES ('41', '28', '50', '钢笔', 'BG0500002', '1', '0', '50', '支', '狗熊', '12', '0');
INSERT INTO `goods` VALUES ('42', '28', '50', '钢笔', 'BG0500003', '1', '0', '120', '支', '飞机', '12', '0');
INSERT INTO `goods` VALUES ('43', '28', '35', '笔记本', 'BG0200003', '1', '0', '50', '本', '会议笔记本', '12', '0');
INSERT INTO `goods` VALUES ('44', '28', '35', '笔记本', 'BG0200004', '1', '0', '15', '本', '皮质', '12', '0');
INSERT INTO `goods` VALUES ('45', '28', '45', '保密柜', 'BG0400002', '2', '0', '500', '个', '塑料', '12', '0');
INSERT INTO `goods` VALUES ('46', '28', '34', '中性笔', 'BG0100004', '1', '0', '60', '盒', '金万年、1.0', '12', '0');
INSERT INTO `goods` VALUES ('47', '28', '35', '笔记本', 'BG0200005', '1', '0', '500', '本', '加厚性', '12', '0');
INSERT INTO `goods` VALUES ('48', '28', '34', '中性笔', 'BG0100005', '1', '0', '16', '盒', '金万年、1.2', '12', '0');
INSERT INTO `goods` VALUES ('49', '28', '34', '中性笔', 'BG0100006', '1', '0', '23', '盒', '金万年、1.9', '12', '0');
INSERT INTO `goods` VALUES ('50', '28', '34', '中性笔', 'BG0100007', '1', '0', '25', '盒', '金万年、203', '12', '0');
INSERT INTO `goods` VALUES ('51', '28', '34', '中性笔', 'BG0100008', '1', '0', '56', '盒', '金万年、3.4', '12', '0');
INSERT INTO `goods` VALUES ('52', '28', '34', '中性笔', 'BG0100009', '1', '0', '65', '盒', '金万年、15.', '12', '0');
INSERT INTO `goods` VALUES ('53', '28', '34', '中性笔', 'BG0100010', '1', '0', '89', '盒', '646546', '12', '0');
INSERT INTO `goods` VALUES ('54', '28', '34', '中性笔', 'BG0100011', '1', '0', '1324', '盒', '89725', '12', '0');
INSERT INTO `goods` VALUES ('55', '28', '34', '中性笔', 'BG0100012', '1', '0', '115', '盒', '69966', '12', '0');
INSERT INTO `goods` VALUES ('56', '28', '36', '打印纸', 'BG0300004', '1', '0', '10', '包', 'B6', '12', '0');
INSERT INTO `goods` VALUES ('57', '28', '36', '打印纸', 'BG0300005', '1', '0', '35', '包', 'B7', '12', '0');
INSERT INTO `goods` VALUES ('58', '28', '36', '打印纸', 'BG0300006', '1', '0', '62', '包', 'A1', '12', '0');
INSERT INTO `goods` VALUES ('59', '28', '36', '打印纸', 'BG0300007', '1', '0', '66', '包', 'B5.366', '12', '0');
INSERT INTO `goods` VALUES ('60', '28', '50', '钢笔', 'BG0500004', '1', '0', '55', '支', '阿斯', '12', '0');
INSERT INTO `goods` VALUES ('61', '28', '50', '钢笔', 'BG0500005', '1', '0', '32', '支', '原值', '12', '0');
INSERT INTO `goods` VALUES ('62', '28', '34', '笔', 'BG0100013', '1', '0', '12', '盒', '1111', '12', '0');
INSERT INTO `goods` VALUES ('63', '28', '34', '笔', 'BG0100014', '1', '0', '123', '盒', '165465', '12', '0');
INSERT INTO `goods` VALUES ('64', '28', '36', 'A58', 'BG0300008', '1', '0', '66', '报', '315', '12', '0');
INSERT INTO `goods` VALUES ('65', '28', '36', 'A9', 'BG0300009', '1', '0', '45', '报', 'AKA', '12', '0');

-- ----------------------------
-- Table structure for `loginlog`
-- ----------------------------
DROP TABLE IF EXISTS `loginlog`;
CREATE TABLE `loginlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginTime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `userName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of loginlog
-- ----------------------------

-- ----------------------------
-- Table structure for `materialalloct`
-- ----------------------------
DROP TABLE IF EXISTS `materialalloct`;
CREATE TABLE `materialalloct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alloctNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allotDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departId` int(11) DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumMoney` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of materialalloct
-- ----------------------------

-- ----------------------------
-- Table structure for `materialapply`
-- ----------------------------
DROP TABLE IF EXISTS `materialapply`;
CREATE TABLE `materialapply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(255) DEFAULT NULL,
  `goodsNum` double DEFAULT NULL,
  `planId` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `singlePrice` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of materialapply
-- ----------------------------
INSERT INTO `materialapply` VALUES ('1', '15', '2', '1', '6.78', '13.56');
INSERT INTO `materialapply` VALUES ('2', '16', '3', '1', '34', '102');
INSERT INTO `materialapply` VALUES ('3', '23', '5', '1', '2', '10');
INSERT INTO `materialapply` VALUES ('4', '24', '6', '1', '6', '36');
INSERT INTO `materialapply` VALUES ('5', '33', '1', '1', '1', '1');
INSERT INTO `materialapply` VALUES ('6', '34', '2', '1', '200', '400');
INSERT INTO `materialapply` VALUES ('7', '36', '3', '1', '10', '30');
INSERT INTO `materialapply` VALUES ('8', '37', '1', '1', '12', '12');
INSERT INTO `materialapply` VALUES ('9', '15', '2', '2', '6.78', '13.56');
INSERT INTO `materialapply` VALUES ('10', '16', '2', '2', '34', '68');
INSERT INTO `materialapply` VALUES ('11', '17', '2', '2', '2535', '5070');
INSERT INTO `materialapply` VALUES ('12', '15', '2', '3', '6.78', '13.56');
INSERT INTO `materialapply` VALUES ('13', '15', '2', '5', '6.78', '13.56');
INSERT INTO `materialapply` VALUES ('14', '17', '2', '6', '2535', '5070');
INSERT INTO `materialapply` VALUES ('15', '15', '2', '7', '6.78', '13.56');
INSERT INTO `materialapply` VALUES ('16', '16', '2', '7', '34', '68');
INSERT INTO `materialapply` VALUES ('17', '17', '2', '7', '2535', '5070');
INSERT INTO `materialapply` VALUES ('18', '18', '2', '7', '333', '666');
INSERT INTO `materialapply` VALUES ('19', '19', '2', '7', '10', '20');
INSERT INTO `materialapply` VALUES ('20', '15', '2', '8', '6.78', '13.56');
INSERT INTO `materialapply` VALUES ('21', '16', '2', '8', '34', '68');
INSERT INTO `materialapply` VALUES ('22', '17', '2', '8', '2535', '5070');
INSERT INTO `materialapply` VALUES ('23', '18', '2', '8', '333', '666');
INSERT INTO `materialapply` VALUES ('24', '19', '2', '8', '10', '20');
INSERT INTO `materialapply` VALUES ('25', '15', '2', '9', '6.78', '13.56');
INSERT INTO `materialapply` VALUES ('26', '16', '2', '9', '34', '68');
INSERT INTO `materialapply` VALUES ('27', '17', '2', '9', '2535', '5070');

-- ----------------------------
-- Table structure for `materialconsume`
-- ----------------------------
DROP TABLE IF EXISTS `materialconsume`;
CREATE TABLE `materialconsume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consumeDate` datetime DEFAULT NULL,
  `consumeMoney` double DEFAULT NULL,
  `operatNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `targetDepartId` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `departId` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of materialconsume
-- ----------------------------
INSERT INTO `materialconsume` VALUES ('3', '2016-12-25 00:32:04', '12', 'CK-20161225-00001', '', '4', '1', '4', '0');

-- ----------------------------
-- Table structure for `materialconsumedetail`
-- ----------------------------
DROP TABLE IF EXISTS `materialconsumedetail`;
CREATE TABLE `materialconsumedetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) DEFAULT NULL,
  `goodsNum` double DEFAULT NULL,
  `goodsPrice` double DEFAULT NULL,
  `outStockId` int(11) DEFAULT NULL,
  `singleMoney` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of materialconsumedetail
-- ----------------------------

-- ----------------------------
-- Table structure for `operattemp`
-- ----------------------------
DROP TABLE IF EXISTS `operattemp`;
CREATE TABLE `operattemp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) DEFAULT NULL,
  `goodsNum` double DEFAULT NULL,
  `operatNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `singleMoney` double DEFAULT NULL,
  `spec` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specModel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplierId` int(11) DEFAULT NULL,
  `goodsName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goodsNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operatId` int(11) DEFAULT NULL,
  `operatType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of operattemp
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员');
INSERT INTO `role` VALUES ('4', '采购部门');
INSERT INTO `role` VALUES ('5', '使用部门');

-- ----------------------------
-- Table structure for `rolefunction`
-- ----------------------------
DROP TABLE IF EXISTS `rolefunction`;
CREATE TABLE `rolefunction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionId` int(11) DEFAULT NULL,
  `functionName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of rolefunction
-- ----------------------------
INSERT INTO `rolefunction` VALUES ('115', '1', '部门管理', '1', '');
INSERT INTO `rolefunction` VALUES ('116', '3', '角色管理', '1', '');
INSERT INTO `rolefunction` VALUES ('117', '5', '用户管理', '1', '');
INSERT INTO `rolefunction` VALUES ('118', '7', '供应商管理', '1', null);
INSERT INTO `rolefunction` VALUES ('119', '9', '商品类型管理', '1', null);
INSERT INTO `rolefunction` VALUES ('120', '11', '商品管理', '1', null);
INSERT INTO `rolefunction` VALUES ('121', '13', '入库管理', '1', null);
INSERT INTO `rolefunction` VALUES ('122', '16', '调拨管理', '1', null);
INSERT INTO `rolefunction` VALUES ('123', '18', '领用管理', '1', null);
INSERT INTO `rolefunction` VALUES ('124', '20', '统计管理', '1', '');
INSERT INTO `rolefunction` VALUES ('125', '25', '数据中心', '1', null);
INSERT INTO `rolefunction` VALUES ('178', '28', '商品信息', '5', null);
INSERT INTO `rolefunction` VALUES ('179', '30', '月计划', '5', null);
INSERT INTO `rolefunction` VALUES ('180', '32', '物资管理', '5', null);
INSERT INTO `rolefunction` VALUES ('181', '35', '部门库存', '5', null);
INSERT INTO `rolefunction` VALUES ('182', '38', '物资统计', '5', null);
INSERT INTO `rolefunction` VALUES ('200', '7', '供应商管理', '4', null);
INSERT INTO `rolefunction` VALUES ('201', '9', '商品类型管理', '4', null);
INSERT INTO `rolefunction` VALUES ('202', '11', '商品管理', '4', null);
INSERT INTO `rolefunction` VALUES ('203', '13', '入库管理', '4', null);
INSERT INTO `rolefunction` VALUES ('204', '16', '调拨管理', '4', null);
INSERT INTO `rolefunction` VALUES ('205', '18', '领用管理', '4', null);
INSERT INTO `rolefunction` VALUES ('206', '20', '统计管理', '4', null);

-- ----------------------------
-- Table structure for `stock`
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) DEFAULT NULL,
  `goodsPrice` double DEFAULT NULL,
  `goodsType` int(11) DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stockNum` double DEFAULT NULL,
  `stockType` int(11) DEFAULT NULL,
  `supplierId` int(11) DEFAULT NULL,
  `categoryOne` int(11) DEFAULT NULL,
  `categoryTwo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('20', '19', '10', '1', '', '20', '1', '15', '32', '37');
INSERT INTO `stock` VALUES ('21', '25', '100', '1', '', '10', '1', '15', '32', '38');
INSERT INTO `stock` VALUES ('22', '31', '3', '1', '', '5', '1', '15', '32', '39');
INSERT INTO `stock` VALUES ('23', '32', '5', '1', '', '10', '1', '15', '32', '39');
INSERT INTO `stock` VALUES ('24', '21', '7', '1', '', '2', '1', '13', '33', '40');
INSERT INTO `stock` VALUES ('25', '22', '1', '1', '', '1', '1', '13', '33', '41');
INSERT INTO `stock` VALUES ('26', '23', '2', '1', '', '3', '1', '13', '33', '41');
INSERT INTO `stock` VALUES ('27', '24', '6', '1', '', '1', '1', '13', '33', '40');
INSERT INTO `stock` VALUES ('28', '15', '6.78', '1', '', '5', '1', '12', '28', '34');
INSERT INTO `stock` VALUES ('29', '16', '34', '1', '', '4', '1', '12', '28', '34');
INSERT INTO `stock` VALUES ('30', '27', '10', '1', '', '32', '2', '12', '28', '36');
INSERT INTO `stock` VALUES ('31', '28', '5', '1', '', '230', '2', '12', '28', '36');
INSERT INTO `stock` VALUES ('32', '29', '1.5', '1', '', '24', '2', '12', '28', '35');
INSERT INTO `stock` VALUES ('33', '30', '3', '1', '', '19', '2', '12', '28', '35');
INSERT INTO `stock` VALUES ('34', '15', '6.78', '1', '', '34', '2', '12', '28', '34');
INSERT INTO `stock` VALUES ('35', '16', '34', '1', '', '38', '2', '12', '28', '34');
INSERT INTO `stock` VALUES ('36', '34', '200', '2', '', '2', '1', '16', '47', '48');
INSERT INTO `stock` VALUES ('37', '35', '3', '2', '', '5', '1', '16', '47', '48');
INSERT INTO `stock` VALUES ('38', '36', '10', '2', '', '8', '1', '16', '47', '49');
INSERT INTO `stock` VALUES ('39', '37', '12', '2', '', '10', '1', '16', '47', '49');
INSERT INTO `stock` VALUES ('40', '33', '1000', '2', '', '14', '2', '12', '28', '45');
INSERT INTO `stock` VALUES ('41', '38', '25', '1', '', '22', '2', '12', '28', '36');
INSERT INTO `stock` VALUES ('42', '39', '10', '1', '', '2', '2', '12', '28', '34');
INSERT INTO `stock` VALUES ('43', '40', '30', '1', '', '1', '2', '12', '28', '50');
INSERT INTO `stock` VALUES ('44', '41', '50', '1', '', '1', '2', '12', '28', '50');
INSERT INTO `stock` VALUES ('45', '42', '120', '1', '', '1', '2', '12', '28', '50');
INSERT INTO `stock` VALUES ('46', '43', '50', '1', '', '1', '2', '12', '28', '35');
INSERT INTO `stock` VALUES ('47', '44', '15', '1', '', '1', '2', '12', '28', '35');
INSERT INTO `stock` VALUES ('48', '45', '500', '2', '', '1', '2', '12', '28', '45');
INSERT INTO `stock` VALUES ('49', '46', '60', '1', '', '1', '2', '12', '28', '34');
INSERT INTO `stock` VALUES ('50', '47', '500', '1', '', '1', '2', '12', '28', '35');
INSERT INTO `stock` VALUES ('51', '48', '16', '1', '', '1', '2', '12', '28', '34');
INSERT INTO `stock` VALUES ('52', '49', '23', '1', '', '1', '2', '12', '28', '34');
INSERT INTO `stock` VALUES ('53', '50', '25', '1', '', '11', '2', '12', '28', '34');
INSERT INTO `stock` VALUES ('54', '51', '56', '1', '', '1', '2', '12', '28', '34');
INSERT INTO `stock` VALUES ('55', '52', '65', '1', '', '1', '2', '12', '28', '34');
INSERT INTO `stock` VALUES ('56', '53', '89', '1', '', '11', '2', '12', '28', '34');
INSERT INTO `stock` VALUES ('57', '54', '1324', '1', '', '22', '2', '12', '28', '34');
INSERT INTO `stock` VALUES ('58', '55', '115', '1', '', '2', '2', '12', '28', '34');
INSERT INTO `stock` VALUES ('59', '56', '10', '1', '', '2', '2', '12', '28', '36');
INSERT INTO `stock` VALUES ('60', '57', '35', '1', '', '12', '2', '12', '28', '36');
INSERT INTO `stock` VALUES ('61', '58', '62', '1', '', '12', '2', '12', '28', '36');
INSERT INTO `stock` VALUES ('62', '59', '66', '1', '', '12', '2', '12', '28', '36');
INSERT INTO `stock` VALUES ('63', '60', '55', '1', '', '12', '2', '12', '28', '50');
INSERT INTO `stock` VALUES ('64', '61', '32', '1', '', '11', '2', '12', '28', '50');

-- ----------------------------
-- Table structure for `storage`
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signDepart` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storageDate` datetime DEFAULT NULL,
  `storageMoney` double DEFAULT NULL,
  `storageNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storageType` int(11) DEFAULT NULL,
  `supplierId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO `storage` VALUES ('34', '数量齐全，质量合格', '3', '宁二波', '2016-12-24 16:08:06', '169.9', 'YSRK-20161224-00001', '1', '12', '1');
INSERT INTO `storage` VALUES ('35', '数量齐全，质量合格。', '3', '宁二波', '2016-12-24 16:09:19', '51', 'YSRK-20161224-00002', '1', '13', '1');
INSERT INTO `storage` VALUES ('36', '数量齐全，质量合格。', '3', '宁二波', '2016-12-24 16:14:09', '65', 'YSRK-20161224-00003', '1', '15', '1');
INSERT INTO `storage` VALUES ('37', '质量合格，所欠物资明日送达。', '3', '宁二波', '2016-12-24 16:15:31', '1200', 'YSRK-20161224-00004', '1', '15', '1');
INSERT INTO `storage` VALUES ('38', '', '3', '宁二波', '2016-12-24 17:07:48', '515.9', 'YCRK-20161224-00001', '2', '12', '1');
INSERT INTO `storage` VALUES ('39', '', '3', '宁二波', '2016-12-24 18:52:03', '685', 'YSRK-20161224-00005', '1', '16', '1');
INSERT INTO `storage` VALUES ('40', '', '3', '宁二波', '2016-12-24 19:04:36', '18261.3', 'YSRK-20161224-00006', '1', '12', '0');
INSERT INTO `storage` VALUES ('41', '', '3', '宁二波', '2016-12-25 00:43:43', '12998', 'YCRK-20161225-00001', '2', '12', '0');
INSERT INTO `storage` VALUES ('42', '', '3', '宁二波', '2016-12-25 00:57:50', '38986.8', 'YCRK-20161225-00002', '2', '12', '0');
INSERT INTO `storage` VALUES ('43', '', '3', '宁二波', '2016-12-25 00:57:50', '38986.8', 'YCRK-20161225-00002', '2', '12', '1');
INSERT INTO `storage` VALUES ('44', '没有描述', '3', '孙晓荣', '2017-01-15 23:13:03', '288.06', 'YSRK-20170115-00001', '1', '12', '0');

-- ----------------------------
-- Table structure for `storagematerial`
-- ----------------------------
DROP TABLE IF EXISTS `storagematerial`;
CREATE TABLE `storagematerial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) DEFAULT NULL,
  `goodsNum` double DEFAULT NULL,
  `goodsPrice` double DEFAULT NULL,
  `singleMoney` double DEFAULT NULL,
  `storageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of storagematerial
-- ----------------------------
INSERT INTO `storagematerial` VALUES ('24', '19', '20', '10', '200', '37');
INSERT INTO `storagematerial` VALUES ('25', '25', '10', '100', '1000', '37');
INSERT INTO `storagematerial` VALUES ('26', '31', '5', '3', '15', '36');
INSERT INTO `storagematerial` VALUES ('27', '32', '10', '5', '50', '36');
INSERT INTO `storagematerial` VALUES ('28', '21', '2', '7', '14', '35');
INSERT INTO `storagematerial` VALUES ('29', '22', '1', '1', '1', '35');
INSERT INTO `storagematerial` VALUES ('30', '23', '3', '2', '6', '35');
INSERT INTO `storagematerial` VALUES ('31', '24', '5', '6', '30', '35');
INSERT INTO `storagematerial` VALUES ('32', '15', '5', '6.78', '33.9', '34');
INSERT INTO `storagematerial` VALUES ('33', '16', '4', '34', '136', '34');
INSERT INTO `storagematerial` VALUES ('34', '27', '10', '10', '100', '38');
INSERT INTO `storagematerial` VALUES ('35', '28', '16', '5', '80', '38');
INSERT INTO `storagematerial` VALUES ('36', '29', '10', '1.5', '15', '38');
INSERT INTO `storagematerial` VALUES ('37', '30', '5', '3', '15', '38');
INSERT INTO `storagematerial` VALUES ('38', '15', '5', '6.78', '33.9', '38');
INSERT INTO `storagematerial` VALUES ('39', '16', '8', '34', '272', '38');
INSERT INTO `storagematerial` VALUES ('40', '34', '2', '200', '400', '39');
INSERT INTO `storagematerial` VALUES ('41', '35', '5', '3', '15', '39');
INSERT INTO `storagematerial` VALUES ('42', '36', '10', '10', '100', '39');
INSERT INTO `storagematerial` VALUES ('43', '37', '15', '12', '180', '39');
INSERT INTO `storagematerial` VALUES ('44', '15', '32', '6.78', '216.96', '43');
INSERT INTO `storagematerial` VALUES ('45', '16', '32', '34', '1088', '43');
INSERT INTO `storagematerial` VALUES ('46', '27', '22', '10', '220', '43');
INSERT INTO `storagematerial` VALUES ('47', '28', '214', '5', '1070', '43');
INSERT INTO `storagematerial` VALUES ('48', '29', '14', '1.5', '21', '43');
INSERT INTO `storagematerial` VALUES ('49', '30', '14', '3', '42', '43');
INSERT INTO `storagematerial` VALUES ('50', '33', '14', '1000', '14000', '43');
INSERT INTO `storagematerial` VALUES ('51', '38', '22', '25', '550', '43');
INSERT INTO `storagematerial` VALUES ('52', '39', '2', '10', '20', '43');
INSERT INTO `storagematerial` VALUES ('53', '40', '1', '30', '30', '43');
INSERT INTO `storagematerial` VALUES ('54', '41', '1', '50', '50', '43');
INSERT INTO `storagematerial` VALUES ('55', '42', '1', '120', '120', '43');
INSERT INTO `storagematerial` VALUES ('56', '43', '1', '50', '50', '43');
INSERT INTO `storagematerial` VALUES ('57', '44', '1', '15', '15', '43');
INSERT INTO `storagematerial` VALUES ('58', '45', '1', '500', '500', '43');
INSERT INTO `storagematerial` VALUES ('59', '46', '1', '60', '60', '43');
INSERT INTO `storagematerial` VALUES ('60', '47', '1', '500', '500', '43');
INSERT INTO `storagematerial` VALUES ('61', '48', '1', '16', '16', '43');
INSERT INTO `storagematerial` VALUES ('62', '49', '1', '23', '23', '43');
INSERT INTO `storagematerial` VALUES ('63', '50', '11', '25', '275', '43');
INSERT INTO `storagematerial` VALUES ('64', '51', '1', '56', '56', '43');
INSERT INTO `storagematerial` VALUES ('65', '52', '1', '65', '65', '43');
INSERT INTO `storagematerial` VALUES ('66', '53', '11', '89', '979', '43');
INSERT INTO `storagematerial` VALUES ('67', '54', '22', '1324', '29128', '43');
INSERT INTO `storagematerial` VALUES ('68', '55', '2', '115', '230', '43');
INSERT INTO `storagematerial` VALUES ('69', '56', '2', '10', '20', '43');
INSERT INTO `storagematerial` VALUES ('70', '57', '12', '35', '420', '43');
INSERT INTO `storagematerial` VALUES ('71', '58', '12', '62', '744', '43');
INSERT INTO `storagematerial` VALUES ('72', '59', '12', '66', '792', '43');
INSERT INTO `storagematerial` VALUES ('73', '60', '12', '55', '660', '43');
INSERT INTO `storagematerial` VALUES ('74', '61', '11', '32', '352', '43');

-- ----------------------------
-- Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bankAddr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bankCard` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardholder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkman` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('12', '怀来县沙城百货大楼', '工行怀来之行', '张家口市怀来县', '12135665431321321', '怀来县沙城存瑞镇盈百旺综合商店', '15532386718', '盈百旺', '怀来县沙城百货大楼', '赵荣乔');
INSERT INTO `supplier` VALUES ('13', '怀来县沙城百货大楼', '工行怀来之行', '张家口市怀来县', '21555568884646', '怀来县沙城百货大楼', '155325666644', '三元合', '怀来县沙城百货大楼', '张三');
INSERT INTO `supplier` VALUES ('14', '万联电子可', '213551', '万联电子可', '13155611322', '万联电子可', '1863130112', '万联电子', '万联电子可', '李剑');
INSERT INTO `supplier` VALUES ('15', '万联电子可', '中国工商银行', '万联电子可', '23156165115151511222', '少吃', '155653248', '瑞昌五金', '=万联电子可', '基金');
INSERT INTO `supplier` VALUES ('16', '数量齐全', '质量合格。', '沙城', '25546431211', '李四', '1564346422', '张三', '沙城', '设施');

-- ----------------------------
-- Table structure for `usealloct`
-- ----------------------------
DROP TABLE IF EXISTS `usealloct`;
CREATE TABLE `usealloct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentId` int(11) DEFAULT NULL,
  `operatNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumMoney` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `useAlloctDate` datetime DEFAULT NULL,
  `useName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of usealloct
-- ----------------------------
INSERT INTO `usealloct` VALUES ('7', '4', 'DB-20161224-00001', '数量齐全，质量完好。', '169.9', '1', '2016-12-24 16:55:51', '王淏田', '1');
INSERT INTO `usealloct` VALUES ('8', '5', 'DB-20161224-00002', '', '239', '1', '2016-12-24 16:57:27', '程坤', '1');
INSERT INTO `usealloct` VALUES ('9', '3', 'LY-20161224-00001', '', '305.9', '2', '2016-12-24 17:15:41', '宁二波', '1');
INSERT INTO `usealloct` VALUES ('10', '3', 'LY-20161224-00002', '', '88.34', '2', '2016-12-24 18:41:49', '宁二波', '1');
INSERT INTO `usealloct` VALUES ('11', '5', 'DB-20161224-00003', '', '495', '1', '2016-12-24 18:53:55', '程坤', '1');
INSERT INTO `usealloct` VALUES ('12', '5', 'DB-20161224-00004', '', '1000', '1', '2016-12-24 18:57:46', '程坤', '0');
INSERT INTO `usealloct` VALUES ('13', '4', 'DB-20161225-00001', '', '169.9', '1', '2016-12-25 00:25:33', '王淏天', '1');
INSERT INTO `usealloct` VALUES ('14', '4', 'DB-20161225-00002', '', '26', '1', '2016-12-25 00:26:49', '王昊天', '1');
INSERT INTO `usealloct` VALUES ('15', '4', 'DB-20161225-00003', '', '65', '1', '2016-12-25 00:30:37', '田宇', '1');

-- ----------------------------
-- Table structure for `usealloctdetail`
-- ----------------------------
DROP TABLE IF EXISTS `usealloctdetail`;
CREATE TABLE `usealloctdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryOne` int(11) DEFAULT NULL,
  `categoryTwo` int(11) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `goodsName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goodsType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `spec` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sunMoney` double DEFAULT NULL,
  `supplierId` int(11) DEFAULT NULL,
  `supplierName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `useAlloctNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goodsNum` double DEFAULT NULL,
  `singleMoney` double DEFAULT NULL,
  `useAlloctId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of usealloctdetail
-- ----------------------------
INSERT INTO `usealloctdetail` VALUES ('13', '28', '34', '15', '', '1', null, '6.78', '盒', null, '12', null, null, null, '3', '20.34', '10');
INSERT INTO `usealloctdetail` VALUES ('14', '28', '34', '16', '', '1', null, '34', '盒', null, '12', null, null, null, '2', '68', '10');
INSERT INTO `usealloctdetail` VALUES ('15', '33', '40', '24', '', '1', null, '6', '把', null, '13', null, null, null, '2', '12', '8');
INSERT INTO `usealloctdetail` VALUES ('16', '47', '49', '36', '', '2', null, '10', '张', null, '16', null, null, null, '2', '20', '11');
INSERT INTO `usealloctdetail` VALUES ('17', '47', '49', '37', '', '2', null, '12', '张', null, '16', null, null, null, '5', '60', '11');
INSERT INTO `usealloctdetail` VALUES ('18', '33', '40', '24', '', '1', null, '6', '把', null, '13', null, null, null, '2', '12', '14');
