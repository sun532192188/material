/*
Navicat MySQL Data Transfer

Source Server         : HP-PC
Source Server Version : 50535
Source Host           : localhost:3306
Source Database       : material

Target Server Type    : MYSQL
Target Server Version : 50535
File Encoding         : 65001

Date: 2016-12-03 23:16:27
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '4005f2b769ab124bd002e749ce39381d', '0', '1', 'admin', '0', null);
INSERT INTO `admin` VALUES ('6', '4005f2b769ab124bd002e749ce39381d', '0', '5', '采购部', '3', null);
INSERT INTO `admin` VALUES ('7', '4005f2b769ab124bd002e749ce39381d', '0', '6', '使用部', '4', null);
INSERT INTO `admin` VALUES ('8', '4005f2b769ab124bd002e749ce39381d', '0', '7', '财务部', '2', null);

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('7', '食物', '0');
INSERT INTO `category` VALUES ('8', '饮品', '0');
INSERT INTO `category` VALUES ('9', '生活日用品', '0');
INSERT INTO `category` VALUES ('10', '电器', '0');
INSERT INTO `category` VALUES ('11', '面包', '7');
INSERT INTO `category` VALUES ('12', '矿泉水', '8');
INSERT INTO `category` VALUES ('13', '碳酸饮料', '8');
INSERT INTO `category` VALUES ('14', '零食', '7');
INSERT INTO `category` VALUES ('15', '卫生纸', '9');
INSERT INTO `category` VALUES ('16', '毛巾', '9');
INSERT INTO `category` VALUES ('17', '电饭锅', '10');
INSERT INTO `category` VALUES ('18', '电磁炉', '10');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('2', '财务部', '', '15811140738');
INSERT INTO `department` VALUES ('3', '采购部', '', '15811140738');
INSERT INTO `department` VALUES ('4', '使用部', '', '15811140738');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of departplan
-- ----------------------------
INSERT INTO `departplan` VALUES ('11', '2016-11-24 15:27:19', '4', '没有描述', '13300', '1', '使用部11月计划', '使用部');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of departstock
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of function
-- ----------------------------
INSERT INTO `function` VALUES ('1', '部门管理', '', '0');
INSERT INTO `function` VALUES ('2', '用户管理', '', '0');
INSERT INTO `function` VALUES ('3', '供应商管理', '', '0');
INSERT INTO `function` VALUES ('4', '商品类型管理', null, '0');
INSERT INTO `function` VALUES ('5', '商品管理', null, '0');
INSERT INTO `function` VALUES ('6', '入库管理', null, '0');
INSERT INTO `function` VALUES ('7', '领用管理', null, '0');
INSERT INTO `function` VALUES ('8', '调拨管理', null, '0');
INSERT INTO `function` VALUES ('9', '统计管理', null, '0');
INSERT INTO `function` VALUES ('10', '查询供应商', 'supplier/querySupplierList', '3');
INSERT INTO `function` VALUES ('11', '部门查询', 'department/queryDepartList', '1');
INSERT INTO `function` VALUES ('12', '类目查询', 'category/queryInit', '4');
INSERT INTO `function` VALUES ('13', '商品查询', 'goods/queryGoodsPager', '5');
INSERT INTO `function` VALUES ('14', '验收入库', 'storage/queryStorage?type=1', '6');
INSERT INTO `function` VALUES ('15', '预存入库', 'storage/queryStorage?type=2', '6');
INSERT INTO `function` VALUES ('16', '角色管理', '', '0');
INSERT INTO `function` VALUES ('17', '角色查询', 'role/queryInit', '16');
INSERT INTO `function` VALUES ('18', '库存管理', 'stock/queryStockPage', '9');
INSERT INTO `function` VALUES ('19', '用户查询', 'user/queryUserPager', '2');
INSERT INTO `function` VALUES ('20', '领用查询', 'useAlloct/queryUseAlloctPager?type=1', '7');
INSERT INTO `function` VALUES ('21', '调拨查询', 'useAlloct/queryUseAlloctPager?type=2', '8');
INSERT INTO `function` VALUES ('22', '部门中心', '', '0');
INSERT INTO `function` VALUES ('23', '月计划查询', 'departmentCenter/queryMonthPlanPager', '22');
INSERT INTO `function` VALUES ('24', '出库管理', null, '22');
INSERT INTO `function` VALUES ('25', '物资库存', null, '22');
INSERT INTO `function` VALUES ('26', '固定资产库存', null, '22');
INSERT INTO `function` VALUES ('27', '部门月计划统计', null, '9');
INSERT INTO `function` VALUES ('28', '库存入库统计', null, '9');
INSERT INTO `function` VALUES ('29', '库存出库统计', null, '9');
INSERT INTO `function` VALUES ('30', '入库统计', null, '22');
INSERT INTO `function` VALUES ('31', '出库统计', null, '22');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('11', '7', '11', '法式小面包', 'fsxmb', '1', '0', '24', '袋', '200g/袋', '29', '0');
INSERT INTO `goods` VALUES ('12', '8', '12', '农夫山泉', 'nfsq', '1', '0', '2', '瓶', '500ml', '30', '0');
INSERT INTO `goods` VALUES ('13', '7', '11', '东北大米', 'dbdm', '1', '0', '150', '袋', '50kg/袋', '29', '0');
INSERT INTO `goods` VALUES ('14', '10', '17', '红木木桌', 'hmmz', '2', '0', '200', '把', '20kg/把', '31', '0');
INSERT INTO `goods` VALUES ('15', '10', '18', '红牛插线板', 'hxcxb', '2', '0', '50', '个', '400g/个', '31', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of loginlog
-- ----------------------------
INSERT INTO `loginlog` VALUES ('345', '2016-11-21 11:19:44', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('346', '2016-11-21 11:37:06', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('347', '2016-11-21 11:38:09', '1', '6', '采购部');
INSERT INTO `loginlog` VALUES ('348', '2016-11-21 12:34:59', '1', '6', '采购部');
INSERT INTO `loginlog` VALUES ('349', '2016-11-21 12:44:34', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('350', '2016-11-21 13:51:10', '1', '6', '采购部');
INSERT INTO `loginlog` VALUES ('351', '2016-11-22 12:37:57', '1', '6', '采购部');
INSERT INTO `loginlog` VALUES ('352', '2016-11-22 13:31:03', '1', '6', '采购部');
INSERT INTO `loginlog` VALUES ('353', '2016-11-22 13:37:08', '1', '6', '采购部');
INSERT INTO `loginlog` VALUES ('354', '2016-11-22 13:58:22', '1', '6', '采购部');
INSERT INTO `loginlog` VALUES ('355', '2016-11-22 14:00:40', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('356', '2016-11-22 14:01:36', '1', '7', '使用部');
INSERT INTO `loginlog` VALUES ('357', '2016-11-22 14:16:20', '1', '7', '使用部');
INSERT INTO `loginlog` VALUES ('358', '2016-11-22 14:18:54', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('359', '2016-11-22 17:44:40', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('360', '2016-11-23 16:47:19', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('361', '2016-11-24 09:41:45', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('362', '2016-11-24 09:42:33', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('363', '2016-11-24 09:53:20', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('364', '2016-11-24 10:37:41', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('365', '2016-11-24 10:43:06', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('366', '2016-11-24 10:46:35', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('367', '2016-11-24 10:54:21', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('368', '2016-11-24 11:29:34', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('369', '2016-11-24 12:28:09', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('370', '2016-11-24 12:39:53', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('371', '2016-11-24 13:35:18', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('372', '2016-11-24 13:38:10', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('373', '2016-11-24 15:04:34', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('374', '2016-11-24 15:06:01', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('375', '2016-11-24 15:23:38', '1', '7', '使用部');
INSERT INTO `loginlog` VALUES ('376', '2016-11-24 15:25:26', '1', '7', '使用部');
INSERT INTO `loginlog` VALUES ('377', '2016-11-24 15:26:21', '1', '7', '使用部');
INSERT INTO `loginlog` VALUES ('378', '2016-11-24 15:39:29', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('379', '2016-11-24 16:32:41', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('380', '2016-11-28 10:00:45', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('381', '2016-11-28 10:02:30', '1', '7', '使用部');
INSERT INTO `loginlog` VALUES ('382', '2016-11-28 10:03:37', '1', '7', '使用部');
INSERT INTO `loginlog` VALUES ('383', '2016-11-29 12:33:41', '1', '7', '使用部');
INSERT INTO `loginlog` VALUES ('384', '2016-11-29 12:33:49', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('385', '2016-11-29 13:06:00', '1', '7', '使用部');
INSERT INTO `loginlog` VALUES ('386', '2016-11-29 13:06:54', '1', '7', '使用部');
INSERT INTO `loginlog` VALUES ('387', '2016-11-29 13:08:50', '1', '7', '使用部');
INSERT INTO `loginlog` VALUES ('388', '2016-11-29 13:09:05', '1', '7', '使用部');
INSERT INTO `loginlog` VALUES ('389', '2016-11-29 13:26:09', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('390', '2016-11-29 13:40:48', '1', '7', '使用部');
INSERT INTO `loginlog` VALUES ('391', '2016-12-01 13:09:27', '1', '7', '使用部');
INSERT INTO `loginlog` VALUES ('392', '2016-12-01 13:09:43', '1', '1', 'admin');
INSERT INTO `loginlog` VALUES ('393', '2016-12-01 13:15:06', '1', '1', 'admin');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of materialapply
-- ----------------------------
INSERT INTO `materialapply` VALUES ('7', '11', '60', '9', '13', '247');
INSERT INTO `materialapply` VALUES ('9', '12', '21', '10', '2000', '0');
INSERT INTO `materialapply` VALUES ('13', '5', '20', '9', '24', '216');
INSERT INTO `materialapply` VALUES ('14', '7', '100', '9', '2', '200');
INSERT INTO `materialapply` VALUES ('15', '5', '11', '8', '24', '264');
INSERT INTO `materialapply` VALUES ('16', '11', '21', '8', '13', '273');
INSERT INTO `materialapply` VALUES ('17', '11', '100', '11', '24', '2400');
INSERT INTO `materialapply` VALUES ('18', '12', '200', '11', '2', '400');
INSERT INTO `materialapply` VALUES ('19', '13', '50', '11', '150', '7500');
INSERT INTO `materialapply` VALUES ('20', '14', '10', '11', '200', '2000');
INSERT INTO `materialapply` VALUES ('21', '15', '20', '11', '50', '1000');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of materialconsume
-- ----------------------------

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of operattemp
-- ----------------------------
INSERT INTO `operattemp` VALUES ('47', '11', '500', 'YSRK-20161122-00001', '24', '12000', '袋', '200g/袋', '29', '法式小面包');
INSERT INTO `operattemp` VALUES ('48', '13', '100', 'YSRK-20161122-00001', '150', '15000', '袋', '50kg/袋', '29', '东北大米');
INSERT INTO `operattemp` VALUES ('49', '12', '1000', 'YCRK-20161122-00001', '2', '2000', '瓶', '500ml', '30', '农夫山泉');
INSERT INTO `operattemp` VALUES ('50', '14', '200', 'YSRK-20161122-00002', '200', '40000', '把', '20kg/把', '31', '红木木桌');
INSERT INTO `operattemp` VALUES ('51', '15', '500', 'YSRK-20161122-00002', '50', '25000', '个', '400g/个', '31', '红牛插线板');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员');
INSERT INTO `role` VALUES ('5', '采购');
INSERT INTO `role` VALUES ('6', '使用');
INSERT INTO `role` VALUES ('7', '财务');

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of rolefunction
-- ----------------------------
INSERT INTO `rolefunction` VALUES ('3', '1', '部门管理', '1', '');
INSERT INTO `rolefunction` VALUES ('4', '2', '用户管理', '1', '');
INSERT INTO `rolefunction` VALUES ('5', '3', '供应商管理', '1', '');
INSERT INTO `rolefunction` VALUES ('6', '4', '商品类型管理', '1', null);
INSERT INTO `rolefunction` VALUES ('7', '5', '商品管理', '1', null);
INSERT INTO `rolefunction` VALUES ('8', '6', '入库管理', '1', null);
INSERT INTO `rolefunction` VALUES ('9', '7', '领用管理', '1', null);
INSERT INTO `rolefunction` VALUES ('10', '8', '调拨管理', '1', null);
INSERT INTO `rolefunction` VALUES ('11', '9', '统计管理', '1', null);
INSERT INTO `rolefunction` VALUES ('12', '16', '角色管理', '1', null);
INSERT INTO `rolefunction` VALUES ('15', '3', '供应商管理', '5', '');
INSERT INTO `rolefunction` VALUES ('16', '4', '商品类型管理', '5', null);
INSERT INTO `rolefunction` VALUES ('17', '5', '商品管理', '5', null);
INSERT INTO `rolefunction` VALUES ('18', '6', '入库管理', '5', null);
INSERT INTO `rolefunction` VALUES ('19', '7', '领用管理', '5', null);
INSERT INTO `rolefunction` VALUES ('20', '8', '调拨管理', '5', null);
INSERT INTO `rolefunction` VALUES ('21', '9', '统计管理', '5', null);
INSERT INTO `rolefunction` VALUES ('22', '5', '商品管理', '6', null);
INSERT INTO `rolefunction` VALUES ('23', '22', '部门中心', '6', '');
INSERT INTO `rolefunction` VALUES ('24', '5', '商品管理', '7', null);
INSERT INTO `rolefunction` VALUES ('25', '9', '统计管理', '7', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('15', '11', '24', '1', '', '500', '1', '29', '7', '11');
INSERT INTO `stock` VALUES ('16', '13', '150', '1', '', '100', '1', '29', '7', '11');
INSERT INTO `stock` VALUES ('17', '12', '2', '1', '', '1000', '2', '30', '8', '12');
INSERT INTO `stock` VALUES ('18', '14', '200', '2', '', '200', '1', '31', '10', '17');
INSERT INTO `stock` VALUES ('19', '15', '50', '2', '', '500', '1', '31', '10', '18');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO `storage` VALUES ('16', '呵呵', '3', '孙晓荣', '2016-11-22 14:20:42', '27000', 'YSRK-20161122-00001', '1', '29');
INSERT INTO `storage` VALUES ('17', '呵呵呵', '3', '孙晓荣', '2016-11-22 14:21:21', '2000', 'YCRK-20161122-00001', '2', '30');
INSERT INTO `storage` VALUES ('18', '呵呵呵呵', '3', '孙晓荣', '2016-11-22 14:27:52', '65000', 'YSRK-20161122-00002', '1', '31');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of storagematerial
-- ----------------------------
INSERT INTO `storagematerial` VALUES ('26', '11', '500', '24', '12000', '16');
INSERT INTO `storagematerial` VALUES ('27', '13', '100', '150', '15000', '16');
INSERT INTO `storagematerial` VALUES ('28', '12', '1000', '2', '2000', '17');
INSERT INTO `storagematerial` VALUES ('29', '14', '200', '200', '40000', '18');
INSERT INTO `storagematerial` VALUES ('30', '15', '500', '50', '25000', '18');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('29', '北京市海淀区中关村南路', '中国广大银行', '北京海淀中关村支行', '6212260200082424', '北京面包坊科技有限公司', '15811140738', '面包坊', '王富来', '王面包');
INSERT INTO `supplier` VALUES ('30', '北京市朝阳区北园路北泰岳大厦', '中国工商银行', '北京朝阳', '6212260200082424', '北京娃哈哈饮料科技有线公司', '15811140738', '娃哈哈饮料', '王哈哈', '王哈哈');
INSERT INTO `supplier` VALUES ('31', '中关村南大街', '中国建设银行', '北京海淀', '6212260200082424', '日金五杂电器城', '15811140738', '日金五杂电器城', '电器哥', '电器哥');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of usealloct
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of usealloctdetail
-- ----------------------------
