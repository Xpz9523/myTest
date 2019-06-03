/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : wine_wx_shop

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2018-03-12 17:31:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `pk_address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址编号',
  `fk_user_id` int(11) DEFAULT NULL COMMENT '用户表id',
  `person_name` varchar(200) DEFAULT NULL COMMENT '收货人姓名',
  `person_phone` varchar(200) DEFAULT NULL COMMENT '收货人电话',
  `sheng` varchar(200) DEFAULT NULL COMMENT '省',
  `sheng_code` varchar(200) DEFAULT NULL COMMENT '省编码',
  `city` varchar(200) DEFAULT NULL COMMENT '市',
  `city_code` varchar(200) DEFAULT NULL COMMENT '市编码',
  `area` varchar(200) DEFAULT NULL COMMENT '区域',
  `area_code` varchar(200) DEFAULT NULL COMMENT '区域编码',
  `detail_address` varchar(2000) DEFAULT NULL COMMENT '详细地址',
  `is_default` int(2) DEFAULT NULL COMMENT '是否默认地址  0不是 1是',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(2) DEFAULT '1' COMMENT '0 删除 1未删除',
  PRIMARY KEY (`pk_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='收货地址表';

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '1', '王一飞', '13281166615', '湖北省', '42', '黄冈市', '420120', '麻城市', null, null, null, '2018-03-08 17:10:41', '2018-03-08 17:31:41', '1');
INSERT INTO `address` VALUES ('2', null, '刘亮', '13652102535', '上海市', '31', '浦东新区', '311000', '陆家嘴街道', null, null, null, '2018-03-08 17:10:53', '2018-03-08 17:32:51', '1');
INSERT INTO `address` VALUES ('3', null, '赵鑫', '17763459656', '上海市', '31', '长宁区', '310900', null, null, null, null, '2018-03-08 17:11:06', '2018-03-08 17:29:14', '1');
INSERT INTO `address` VALUES ('4', null, '李露', '13465451660', '湖北省', '42', '武汉市', '420100', null, null, null, null, '2018-03-08 17:11:16', '2018-03-08 17:29:21', '1');
INSERT INTO `address` VALUES ('5', null, '孙洋', '13555642334', '江苏省', '32', '南京市', '320100', null, null, null, null, '2018-03-08 17:11:42', '2018-03-08 17:29:30', '1');
INSERT INTO `address` VALUES ('6', null, '王立', '15654659448', '海南省', '46', '海口市', '460100', null, null, null, null, '2018-03-08 17:11:51', '2018-03-08 17:29:35', '1');
INSERT INTO `address` VALUES ('7', null, '郭飞', '15598466251', '湖南省', '43', '长沙市', '430100', null, null, null, null, '2018-03-08 17:11:58', '2018-03-08 17:29:40', '1');
INSERT INTO `address` VALUES ('8', null, '张爱真', '13117137754', '湖北省', '42', '荆州市', '420700', null, null, null, null, '2018-03-08 17:12:09', '2018-03-08 17:29:56', '1');
INSERT INTO `address` VALUES ('9', null, '马建强', '13225845463', '江苏省', '32', '苏州市', '320300', null, null, null, null, '2018-03-08 17:12:17', '2018-03-08 17:30:08', '1');
INSERT INTO `address` VALUES ('10', null, '李赤峰', '13284672437', '上海市', '31', '杨浦区', '311300', null, null, null, null, '2018-03-08 17:12:26', '2018-03-08 17:30:26', '1');
INSERT INTO `address` VALUES ('11', null, '何朝阳', '15564572246', '河南省', '41', '郑州市', '410100', null, null, null, null, '2018-03-08 17:12:48', '2018-03-08 17:30:36', '1');
INSERT INTO `address` VALUES ('12', null, '李力', '18942113645', '湖北省', '42', '十堰市', '421100', null, null, null, null, '2018-03-08 17:12:59', '2018-03-08 17:30:53', '1');
INSERT INTO `address` VALUES ('13', null, '王彦', '18815468687', '江苏省', '32', '徐州市', '320900', null, null, null, null, '2018-03-08 17:13:13', '2018-03-08 17:30:57', '1');
INSERT INTO `address` VALUES ('14', null, '林磊', '17715467246', '陕西省', '61', '宝鸡市', '610900', null, null, null, null, '2018-03-08 17:16:20', '2018-03-08 17:31:22', '1');

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel` (
  `pk_carousel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `fk_good_id` int(11) DEFAULT NULL COMMENT '点击轮播图跳转的商品详情id',
  `carousel_img` varchar(1000) DEFAULT NULL COMMENT '图片地址',
  `carousel_remark` varchar(1000) DEFAULT NULL COMMENT '轮播描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(2) DEFAULT '1' COMMENT '0 删除 1未删除',
  PRIMARY KEY (`pk_carousel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='轮播图表';

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES ('1', '1', 'lib/common/carouselimg/1.jpg', 'XO伏特加', '2018-03-12 11:09:49', '2018-03-12 11:58:36', '0');
INSERT INTO `carousel` VALUES ('2', '2', 'lib/common/carouselimg/2.jpg', 'JACK DANIELS', '2018-03-12 11:10:14', '2018-03-12 11:58:46', '0');
INSERT INTO `carousel` VALUES ('3', '3', 'lib/common/carouselimg/3.jpg', '人头马', '2018-03-12 11:11:03', '2018-03-12 16:39:32', '0');
INSERT INTO `carousel` VALUES ('4', '4', 'lib/common/carouselimg/4.jpg', '水果香槟', '2018-03-12 11:11:30', '2018-03-12 16:39:30', '0');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `pk_comment_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `fk_user_id` int(2) DEFAULT '0' COMMENT '用户ID',
  `fk_good_id` int(11) DEFAULT NULL COMMENT '商品id',
  `content` varchar(2000) DEFAULT NULL COMMENT '评论内容',
  `comment_level` int(2) DEFAULT NULL COMMENT '评价等级 1~5 颗星星',
  `is_show_name` int(2) DEFAULT '0' COMMENT '是否匿名 0 匿名 1 显示用户名',
  `show_imgs` varchar(2000) DEFAULT NULL COMMENT '晒图 url',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(2) DEFAULT '1' COMMENT '0 删除 1未删除',
  PRIMARY KEY (`pk_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `pk_good_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `fk_good_type_small_id` int(11) DEFAULT NULL COMMENT '商品类型id',
  `good_name` varchar(1000) DEFAULT NULL COMMENT '商品名称',
  `good_title` varchar(1000) DEFAULT NULL COMMENT '商品标题',
  `good_sub_title` varchar(1000) DEFAULT NULL COMMENT '商品子标题',
  `good_price` double DEFAULT '0' COMMENT '商品价格',
  `good_cover_img` varchar(1000) DEFAULT NULL COMMENT '商品封面图',
  `good_carousel_imgs` varchar(2000) DEFAULT NULL COMMENT '商品轮播图 (最少1张 最多10张)',
  `good_detail` longtext COMMENT '商品详情',
  `good_freight` double DEFAULT '0' COMMENT '运费',
  `good_num` int(11) DEFAULT NULL COMMENT '库存数量',
  `good_collection_num` int(11) DEFAULT NULL COMMENT '收藏数量',
  `good_sale_num` int(11) DEFAULT NULL COMMENT '销量卖出',
  `good_state` int(2) DEFAULT '0' COMMENT '0:准备上架１:上架２:下架',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(2) DEFAULT '1' COMMENT '0 删除 1未删除',
  PRIMARY KEY (`pk_good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('1', '1', '汾酒', '汾酒 集团53度1.5L吉象酒杏花村', '白酒礼盒', '300', 'lib/common/img/good/59b9e77dN16af3bc0.jpg', null, '山西杏花村汾酒集团有限责任公司成立于2002年3月，是在原山西杏花村汾酒（集团）公司基础上改制成立的国有独资公司。公司以生产经营中国名酒--汾酒、竹叶青酒为主营业务，同时拥有我国驰名品牌“杏花村”，是久负盛名的大型综合性国营企业，也是国家520户重点企业和山西省12户授权经营企业之一。2012年11月汾酒集团销售收入已经突破百亿元，达到100.18亿元，提前三年实现了“十二五”确定的百亿目标', '0', '3000', '2500', '1000', '1', '2018-03-12 09:11:21', '2018-03-12 11:22:33', '1');
INSERT INTO `good` VALUES ('2', '2', '二锅头', '汾酒 出口玻汾 53度 500mL6瓶装', ' 白酒 六瓶装', '254', 'lib/common/img/good/595b362dN7ea0b82d.jpg', null, '山西杏花村汾酒集团有限责任公司成立于2002年3月，是在原山西杏花村汾酒（集团）公司基础上改制成立的国有独资公司。公司以生产经营中国名酒--汾酒、竹叶青酒为主营业务，同时拥有我国驰名品牌“杏花村”，是久负盛名的大型综合性国营企业，也是国家520户重点企业和山西省12户授权经营企业之一。2012年11月汾酒集团销售收入已经突破百亿元，达到100.18亿元，提前三年实现了“十二五”确定的百亿目标', '0', '5400', '3200', '500', '1', '2018-03-12 09:11:22', '2018-03-12 16:16:21', '1');
INSERT INTO `good` VALUES ('3', '3', '鸡尾酒', '汾酒 黑坛20 53度 475ml 单瓶装 ', '清香型白酒', '260', 'lib/common/img/good/5722fe61N7e7b2aef.jpg', null, '山西杏花村汾酒集团有限责任公司成立于2002年3月，是在原山西杏花村汾酒（集团）公司基础上改制成立的国有独资公司。公司以生产经营中国名酒--汾酒、竹叶青酒为主营业务，同时拥有我国驰名品牌“杏花村”，是久负盛名的大型综合性国营企业，也是国家520户重点企业和山西省12户授权经营企业之一。2012年11月汾酒集团销售收入已经突破百亿元，达到100.18亿元，提前三年实现了“十二五”确定的百亿目标', '0', '7600', '2600', '800', '1', '2018-03-12 09:30:45', '2018-03-12 16:16:15', '1');
INSERT INTO `good` VALUES ('4', '4', '威士忌', '泸州老窖 特曲 52度 ', '浓香型白酒 500ml', '540', 'lib/common/img/good/5a98e881N910c14ba.jpg', null, '泸州老窖(jiào)是中国最古老的四大名酒之一，“浓香鼻祖，酒中泰斗”，中国大型白酒上市公司（深交所股票代码000568）。\r\n其1573国宝窖池群1996年成为行业首家全国重点文物保护单位，传统酿制技艺2006年又入选首批国家级非物质文化遗产名录，世称“双国宝单位”，旗下产品国窖1573被誉为“活文物酿造”、“中国白酒鉴赏标准级酒品”。', '0', '8000', '2200', '700', '1', '2018-03-12 09:36:54', '2018-03-12 16:16:37', '1');
INSERT INTO `good` VALUES ('5', '5', '拉菲', '泸州老窖 新款泸州贡Q9 红瓶+金瓶 52度', ' 2L2盒 整箱白酒', '460', 'lib/common/img/good/57cd2412N15bdc71a.jpg', null, '其1573国宝窖池群1996年成为行业首家全国重点文物保护单位，传统酿制技艺2006年又入选首批国家级非物质文化遗产名录，世称“双国宝单位”，旗下产品国窖1573被誉为“活文物酿造”、“中国白酒鉴赏标准级酒品”。', '0', '4900', '3100', '900', '1', '2018-03-12 09:37:04', '2018-03-12 16:18:14', '1');
INSERT INTO `good` VALUES ('6', '6', '香槟', '茅台 汉酱 51度 ', '单瓶装白酒', '480', 'lib/common/img/good/5a9625a5Nbeb63570.jpg', null, '贵州茅台酒股份有限公司以“酿造高品位的生活”为使命，“打造世界蒸馏酒第一品牌”。公司拥有茅台酒、汉酱、仁酒、王子酒、迎宾酒等酱酒产品。茅台酒是著名蒸馏酒，誉称国酒', '0', '5200', '2900', '1200', '1', '2018-03-12 09:41:58', '2018-03-12 16:18:18', '1');
INSERT INTO `good` VALUES ('7', '7', '百威', '茅台 王子酱门经典 53度 ', '单瓶装白酒', '360', 'lib/common/img/good/58c22bcbNaf7b88fc.jpg', null, '贵州茅台酒股份有限公司以“酿造高品位的生活”为使命，“打造世界蒸馏酒第一品牌”。公司拥有茅台酒、汉酱、仁酒、王子酒、迎宾酒等酱酒产品。茅台酒是著名蒸馏酒，誉称国酒', '0', '6500', '3400', '1100', '1', '2018-03-12 09:43:26', '2018-03-12 16:18:27', '1');
INSERT INTO `good` VALUES ('8', '8', '黑啤', '牛栏山 二锅头桶装 62度 ', '5L4桶整箱装', '270', 'lib/common/img/good/57be662bNcb0cf9dd.jpg', null, '牛栏山，乡镇名，位于北京市顺义区北部，潮白河西岸。南距顺义县城约9公里。为山前平原上的侵蚀孤丘，海拔约80多米。所产灰石纯净，可作化工原料，丘体已被采伐过半，附近建有牛栏山维尼纶厂。', '0', '5500', '3200', '1500', '1', '2018-03-12 09:45:33', '2018-03-12 16:18:32', '1');
INSERT INTO `good` VALUES ('9', '14', '牛栏山', '牛栏山 京味礼盒42度', '500ml4瓶', '480', null, null, '牛栏山，乡镇名，位于北京市顺义区北部，潮白河西岸。南距顺义县城约9公里。为山前平原上的侵蚀孤丘，海拔约80多米。所产灰石纯净，可作化工原料，丘体已被采伐过半，附近建有牛栏山维尼纶厂。', '0', '4900', '3300', '1600', '1', '2018-03-12 09:45:34', '2018-03-12 16:18:38', '1');
INSERT INTO `good` VALUES ('10', '15', '五粮液', '100年传奇52度', '500ml浓香型白酒婚宴喜酒', '390', null, null, '五粮液是五粮液集团有限公司（Wuliangye Group Co., Ltd）的简称，1997年8月19日成立于四川省宜宾市，主要生产大曲浓香型白酒。', '0', '5000', '3700', '1500', '1', '2018-03-12 09:48:46', '2018-03-12 16:18:47', '1');
INSERT INTO `good` VALUES ('11', '15', '五粮液', '五粮液股份公司出品 100年传奇', '淡雅白酒', '470', null, null, '五粮液是五粮液集团有限公司（Wuliangye Group Co., Ltd）的简称，1997年8月19日成立于四川省宜宾市，主要生产大曲浓香型白酒。', '0', '5400', '2800', '750', '1', '2018-03-12 09:49:22', '2018-03-12 16:18:56', '1');
INSERT INTO `good` VALUES ('12', '16', '洋河大曲', '洋河大曲 55度', ' 整箱装白酒 500ml6瓶 口感绵柔浓香型', '360', null, null, '洋河大曲古语云：“水为酒之血，曲为酒之骨”。故“名酒产地必有佳泉”的论断是有科学根据的。名酒“洋河大曲”产于江苏省宿迁市中国江苏洋河酒厂股份有限公司生产，就是用当地“美人泉”的水酿制而成的。诗人称赞“洋河美人泉，佳酿醉神州”。', '0', '6450', '3600', '1650', '1', '2018-03-12 09:52:55', '2018-03-12 16:19:07', '1');
INSERT INTO `good` VALUES ('13', '16', '洋河大曲', '洋河蓝色经典 梦之蓝M3 40.8度 500ml', ' 口感绵柔浓香型', '460', null, null, '洋河大曲古语云：“水为酒之血，曲为酒之骨”。故“名酒产地必有佳泉”的论断是有科学根据的。名酒“洋河大曲”产于江苏省宿迁市中国江苏洋河酒厂股份有限公司生产，就是用当地“美人泉”的水酿制而成的。诗人称赞“洋河美人泉，佳酿醉神州”。', '0', '4800', '4300', '1600', '1', '2018-03-12 09:52:56', '2018-03-12 16:19:12', '1');

-- ----------------------------
-- Table structure for good_type_big
-- ----------------------------
DROP TABLE IF EXISTS `good_type_big`;
CREATE TABLE `good_type_big` (
  `pk_type_big_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品类型编号',
  `type_big_name` varchar(1000) DEFAULT NULL COMMENT '商品类型名称',
  `type_big_remark` varchar(1000) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(2) DEFAULT '1' COMMENT '0 删除 1未删除',
  PRIMARY KEY (`pk_type_big_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='商品大类表';

-- ----------------------------
-- Records of good_type_big
-- ----------------------------
INSERT INTO `good_type_big` VALUES ('1', '白酒', '白酒（外文名：Liquor and Spirits[1]  ），以粮谷为主要原料，以大曲、小曲或麸曲及酒母等为糖化发酵剂，经蒸煮、糖化、发酵、蒸馏而制成的蒸馏酒。又称烧酒、老白干、烧刀子等。酒质无色（或微黄）透明，气味芳香纯正，入口绵甜爽净，酒精含量较高，经贮存老熟后，具有以酯类为主体的复合香味。以曲类、酒母为糖化发酵剂，利用淀粉质（糖质）原料，经蒸煮、糖化、发酵、蒸馏、陈酿和勾兑而酿制而成的各类酒。而严格意义上讲，由食用酒精和食用香料勾兑而成的配制酒则不能算做是白酒。白酒主集中在长江上游和赤水河流域的贵州仁怀、四川宜宾、绵竹三角地带有着全球规模最大、质量最优的蒸馏酒产区，分别为中国三大名酒[2]  的茅五剑，其白酒产业集群扛起中国白酒产业的半壁河山。', '2018-03-12 10:31:16', '2018-03-12 10:31:16', '1');
INSERT INTO `good_type_big` VALUES ('2', '洋酒', '洋酒是指进口酒类的总称。它包括烈酒、啤酒、葡萄酒、利口酒(Liqueur)等，不同酒精含量的酒水品种。 酒的制作过程都少不了发酵这一工艺，它是通过酵母菌的作用，将糖类分解成乙醇（酒精）的可饮用的液体。', '2018-03-12 10:31:57', '2018-03-12 10:31:57', '1');
INSERT INTO `good_type_big` VALUES ('3', '葡萄酒', '葡萄酒是以葡萄为原料酿造的一种果酒。其酒精度高于啤酒而低于白酒。营养丰富，保健作用明显。有人认为，葡萄酒是最健康最卫生的饮料之一。它能调整新陈代谢的性能，促进血液循环，防止胆固醇增加。还具有利尿、激发肝功能和防止衰老的功效。也是医治心脏病的辅助剂，可预防坏血病、贫血、脚气病、消化不良和眼角膜炎等疾病。常饮葡葡酒患心脏病率减少，血脂和血管硬化降低。', '2018-03-12 10:32:31', '2018-03-12 10:32:31', '1');
INSERT INTO `good_type_big` VALUES ('4', '啤酒', '啤酒是以大麦芽为主要原料，大米为淀粉类辅料，并加啤酒花，经过液态糊化和糖化，再经过液态发酵而酿制成的。其酒精含量较低，含有二氧化碳,富有营养。它含有多种氨基酸、维生素、低分子糖、无机盐和各种酶。这些营养成分人体容易吸收利用。啤酒中的低分子糖和氨基酸很易被消化吸收，在体内产生大量热能，因此往往啤酒被人们称为“液体面包”。1L12°Bx 的啤酒，可产生3 344kJ 热量，相当于3~5 个鸡蛋或210g面包所产生热量。一个轻体力劳动者，如果一天能饮用1L 啤酒，即可获得所需热量的三分之一。', '2018-03-12 10:33:04', '2018-03-12 10:33:04', '1');
INSERT INTO `good_type_big` VALUES ('6', '测试1', '测试1', '2018-03-12 11:52:36', '2018-03-12 11:52:36', '1');
INSERT INTO `good_type_big` VALUES ('7', '测试2', '测试2', '2018-03-12 11:52:47', '2018-03-12 11:52:47', '1');
INSERT INTO `good_type_big` VALUES ('8', '测试3', '测试3', '2018-03-12 11:52:56', '2018-03-12 11:52:56', '1');
INSERT INTO `good_type_big` VALUES ('9', '测试34', '4', '2018-03-12 13:19:26', '2018-03-12 13:19:35', '1');
INSERT INTO `good_type_big` VALUES ('10', '呃呃呃', '问问鹅鹅鹅', '2018-03-12 13:19:46', '2018-03-12 13:19:46', '1');
INSERT INTO `good_type_big` VALUES ('12', '33', '33 ', '2018-03-12 13:19:52', '2018-03-12 13:19:52', '1');

-- ----------------------------
-- Table structure for good_type_small
-- ----------------------------
DROP TABLE IF EXISTS `good_type_small`;
CREATE TABLE `good_type_small` (
  `pk_type_small_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '子类型主键ID',
  `fk_type_big_id` int(11) DEFAULT NULL COMMENT '父ID的商品类型',
  `type_small_name` varchar(1000) DEFAULT NULL COMMENT '小类名称',
  `type_small_img` varchar(1000) DEFAULT NULL COMMENT '图片',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(2) DEFAULT '1' COMMENT '0 删除 1未删除',
  PRIMARY KEY (`pk_type_small_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='商品小类表';

-- ----------------------------
-- Records of good_type_small
-- ----------------------------
INSERT INTO `good_type_small` VALUES ('1', '1', '汾酒', null, '2018-03-12 10:33:59', '2018-03-12 10:50:33', '1');
INSERT INTO `good_type_small` VALUES ('2', '1', '二锅头', null, '2018-03-12 10:34:13', '2018-03-12 10:50:49', '1');
INSERT INTO `good_type_small` VALUES ('3', '2', '鸡尾酒', null, '2018-03-12 10:34:17', '2018-03-12 10:51:18', '1');
INSERT INTO `good_type_small` VALUES ('4', '2', '威士忌', null, '2018-03-12 10:34:45', '2018-03-12 10:51:38', '1');
INSERT INTO `good_type_small` VALUES ('5', '3', '拉菲', null, '2018-03-12 10:50:37', '2018-03-12 10:51:55', '1');
INSERT INTO `good_type_small` VALUES ('6', '3', '香槟', null, '2018-03-12 10:52:15', '2018-03-12 10:52:15', '1');
INSERT INTO `good_type_small` VALUES ('7', '4', '百威', null, '2018-03-12 10:52:24', '2018-03-12 10:52:35', '1');
INSERT INTO `good_type_small` VALUES ('8', '4', '黑啤', null, '2018-03-12 10:52:32', '2018-03-12 10:52:38', '1');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `pk_news_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻编号',
  `news_title` varchar(1000) DEFAULT NULL COMMENT '标题',
  `news_content` text COMMENT '内容',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(2) DEFAULT '1' COMMENT '0 删除 1未删除',
  PRIMARY KEY (`pk_news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', 'dsfdfsdssd ', 'rghtdrhrdthdt ', '2018-03-12 11:21:24', '2018-03-12 11:21:24', '1');

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `pk_order_info_id` varchar(200) NOT NULL DEFAULT '' COMMENT 'uuid 字符串唯一   不自增',
  `fk_user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `fk_address_id` int(11) DEFAULT NULL COMMENT '收货地址表id',
  `order_info_no` varchar(1000) DEFAULT NULL COMMENT '订单号 格式:当前时间+流水号',
  `order_info_freight` double DEFAULT NULL COMMENT '运费',
  `order_info_money` double DEFAULT NULL COMMENT '订单金额',
  `order_info_state` int(4) DEFAULT '0' COMMENT '状态 0 未付款 1 已付款 2 未发货 3已发货 4 已签收',
  `pay_method` int(2) DEFAULT NULL COMMENT '支付方式 1 微信 2支付宝',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receiving_time` datetime DEFAULT NULL COMMENT '收货时间(签收的时间)',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间(也是订单创建的时间)',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(2) DEFAULT '1' COMMENT '0 删除 1未删除',
  `is_comment` int(2) DEFAULT NULL COMMENT '是否评价 0 未评价 1已评价',
  PRIMARY KEY (`pk_order_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES ('20156448954asd2c', '2', '2', '201803130003', '15', '25', '0', null, '2018-03-12 09:52:55', '2018-03-12 13:15:53', '2018-03-12 13:16:08', '2018-03-12 13:16:12', '2018-03-12 13:16:13', '1', '0');
INSERT INTO `order_info` VALUES ('20156448954asda1', '1', '1', '201803120002', '10', '322', '2', '2', '2018-03-12 13:15:48', '2018-03-12 13:15:50', '2018-03-12 13:16:05', '2018-03-12 13:16:10', '2018-03-12 13:16:11', '1', '0');
INSERT INTO `order_info` VALUES ('20156448954asda2', '1', '1', '201803120002', '10', '322', '2', '2', '2018-03-12 13:15:48', '2018-03-12 13:15:50', '2018-03-12 13:16:05', '2018-03-12 13:16:10', '2018-03-12 13:16:11', '1', '0');
INSERT INTO `order_info` VALUES ('20156448954asda3', '1', '1', '201803120002', '10', '322', '2', '2', '2018-03-12 13:15:48', '2018-03-12 13:15:50', '2018-03-12 13:16:05', '2018-03-12 13:16:10', '2018-03-12 13:16:11', '1', '0');
INSERT INTO `order_info` VALUES ('20156448954asda4', '1', '1', '201803120002', '10', '322', '2', '2', '2018-03-12 13:15:48', '2018-03-12 13:15:50', '2018-03-12 13:16:05', '2018-03-12 13:16:10', '2018-03-12 13:16:11', '1', '0');
INSERT INTO `order_info` VALUES ('20156448954asda5', '1', '1', '201803120002', '10', '322', '2', '2', '2018-03-12 13:15:48', '2018-03-12 13:15:50', '2018-03-12 13:16:05', '2018-03-12 13:16:10', '2018-03-12 13:16:11', '1', '0');
INSERT INTO `order_info` VALUES ('20156448954asda6', '1', '1', '201803120002', '10', '322', '2', '2', '2018-03-12 13:15:48', '2018-03-12 13:15:50', '2018-03-12 13:16:05', '2018-03-12 13:16:10', '2018-03-12 13:16:11', '1', '0');
INSERT INTO `order_info` VALUES ('20156448954asda7', '1', '1', '201803120002', '10', '322', '2', '2', '2018-03-12 13:15:48', '2018-03-12 13:15:50', '2018-03-12 13:16:05', '2018-03-12 13:16:10', '2018-03-12 13:16:11', '1', '0');
INSERT INTO `order_info` VALUES ('20156448954asda8', '1', '1', '201803120002', '10', '322', '2', '2', '2018-03-12 13:15:48', '2018-03-12 13:15:50', '2018-03-12 13:16:05', '2018-03-12 13:16:10', '2018-03-12 13:16:11', '1', '0');
INSERT INTO `order_info` VALUES ('20156448954asda9', '1', '1', '201803120002', '10', '322', '2', '2', '2018-03-12 13:15:48', '2018-03-12 13:15:50', '2018-03-12 13:16:05', '2018-03-12 13:16:10', '2018-03-12 13:16:11', '1', '0');
INSERT INTO `order_info` VALUES ('20156448954asds1', '1', '1', '201803120002', '10', '322', '2', '2', '2018-03-12 13:15:48', '2018-03-12 13:15:50', '2018-03-12 13:16:05', '2018-03-12 13:16:10', '2018-03-12 13:16:11', '1', '0');

-- ----------------------------
-- Table structure for order_info_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_info_detail`;
CREATE TABLE `order_info_detail` (
  `pk_order_info_detail_id` varchar(200) NOT NULL DEFAULT '' COMMENT '订单明细uuid',
  `fk_good_id` int(11) DEFAULT NULL COMMENT '商品表id',
  `fk_order_info_id` varchar(200) DEFAULT NULL COMMENT '订单表id',
  `num` int(11) DEFAULT NULL COMMENT '订购数量',
  `title` varchar(1000) DEFAULT NULL COMMENT '商品标题',
  `price` double DEFAULT NULL COMMENT '商品单价',
  `count_money` double DEFAULT NULL COMMENT '总价格',
  `good_img` varchar(1000) DEFAULT NULL COMMENT '商品封面',
  `specifications_info` varchar(2000) DEFAULT NULL COMMENT '商品规格信息',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间(也是订单创建的时间)',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(2) DEFAULT '1' COMMENT '0 删除 1未删除',
  PRIMARY KEY (`pk_order_info_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单明细表';

-- ----------------------------
-- Records of order_info_detail
-- ----------------------------
INSERT INTO `order_info_detail` VALUES ('1', '1', '1', '1', '洋河蓝色经典 梦之蓝M3 40.8度 500ml 口感绵柔浓香型', '260', '260', null, null, '2018-03-12 11:19:17', '2018-03-12 11:19:17', '1');
INSERT INTO `order_info_detail` VALUES ('2', '2', '2', '5', '茅台 汉酱 51度 单瓶装白酒', '300', '1500', null, null, '2018-03-12 11:20:55', '2018-03-12 11:20:55', '1');

-- ----------------------------
-- Table structure for shop_car
-- ----------------------------
DROP TABLE IF EXISTS `shop_car`;
CREATE TABLE `shop_car` (
  `pk_shop_car_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车编号',
  `fk_user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `fk_good_id` int(11) DEFAULT NULL COMMENT '商品id',
  `num` int(11) DEFAULT NULL COMMENT '订购数量',
  `title` varchar(1000) DEFAULT NULL COMMENT '商品标题',
  `price` double DEFAULT NULL COMMENT '商品单价',
  `count_money` double DEFAULT NULL COMMENT '总价格',
  `good_img` varchar(1000) DEFAULT NULL COMMENT '商品封面',
  `size_info` varchar(2000) DEFAULT NULL COMMENT '商品规格信息',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(2) DEFAULT '1' COMMENT '0 删除 1未删除',
  PRIMARY KEY (`pk_shop_car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of shop_car
-- ----------------------------
INSERT INTO `shop_car` VALUES ('1', '1', '1', '2', '【京东配送】汾酒 集团53度1.5L吉象酒杏花村白酒礼盒', '300', '600', null, null, '2018-03-12 11:16:10', '2018-03-12 11:16:10', '1');
INSERT INTO `shop_car` VALUES ('2', '2', '2', '1', '茅台 王子酱门经典 53度 单瓶装白酒', '250', '250', null, null, '2018-03-12 11:16:39', '2018-03-12 11:16:39', '1');
INSERT INTO `shop_car` VALUES ('3', '3', '3', '1', '洋河蓝色经典 梦之蓝M3 40.8度 500ml 口感绵柔浓香型', '160', '160', null, null, '2018-03-12 11:17:02', '2018-03-12 11:17:02', '1');

-- ----------------------------
-- Table structure for size
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size` (
  `pk_size_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格种类编号',
  `size_name` varchar(1000) DEFAULT NULL COMMENT '规格种类名称',
  `size_remark` varchar(2000) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(2) DEFAULT '1' COMMENT '0 删除 1未删除',
  PRIMARY KEY (`pk_size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='规格种类表';

-- ----------------------------
-- Records of size
-- ----------------------------

-- ----------------------------
-- Table structure for size_detail
-- ----------------------------
DROP TABLE IF EXISTS `size_detail`;
CREATE TABLE `size_detail` (
  `pk_size_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_size_id` int(11) DEFAULT NULL COMMENT 'hp_specifications 表 id',
  `size_detail_name` varchar(1000) DEFAULT NULL COMMENT '规格种类明细名称',
  `size_detail_remark` varchar(2000) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(2) DEFAULT '1' COMMENT '0 删除 1未删除',
  PRIMARY KEY (`pk_size_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='规格种类明细表';

-- ----------------------------
-- Records of size_detail
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `pk_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `fk_user_level_id` int(11) DEFAULT NULL COMMENT '用户等级表  id',
  `login_name` varchar(200) DEFAULT NULL COMMENT '登录名',
  `login_pwd` varchar(200) DEFAULT NULL COMMENT '登录密码 md5',
  `user_name` varchar(200) DEFAULT NULL COMMENT '用户名称',
  `user_phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `user_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `user_birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `user_headImg` varchar(1000) DEFAULT NULL COMMENT '头像',
  `user_sex` int(2) DEFAULT NULL COMMENT '性别 0 女 1 男',
  `user_age` int(11) DEFAULT NULL COMMENT '年龄',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_admin` int(2) DEFAULT '0' COMMENT '是否是管理员  0 不是 1是',
  `is_delete` int(2) DEFAULT '1' COMMENT '0 删除 1未删除',
  `is_register` int(2) DEFAULT '0' COMMENT '0 未注册 1注册',
  PRIMARY KEY (`pk_user_id`),
  UNIQUE KEY `unique_user_loginName` (`login_name`) USING BTREE,
  UNIQUE KEY `unique_user_email` (`user_email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2', '2', '2', '2', '2', '2', null, null, null, null, '2018-03-08 09:33:23', '2018-03-08 09:33:23', '0', '1', '0');
INSERT INTO `user` VALUES ('2', '1', 'admin', '123', '王瑞', '13260690602', '317601058@qq.com', '1996-10-31 10:09:17', null, '1', '22', '2018-03-12 10:10:13', '2018-03-12 10:10:28', '0', '1', '0');
INSERT INTO `user` VALUES ('3', '2', 'dba', '123', '刘飞', '15548685375', '1109348597@qq.com', '1995-09-28 10:06:00', null, '1', '23', '2018-03-12 10:10:26', '2018-03-12 10:12:29', '0', '1', '0');
INSERT INTO `user` VALUES ('4', '3', 'pm', '123', '胡峰', '15665489532', '994980377@qq.com', '1998-03-12 10:13:41', null, '1', '20', '2018-03-12 10:14:17', '2018-03-12 10:14:17', '0', '1', '0');
INSERT INTO `user` VALUES ('5', '4', 'pw', '123', '詹前锋', '13665258456', '25746244@qq.com', '1985-09-12 10:15:30', null, '1', '33', '2018-03-12 10:15:55', '2018-03-12 10:15:55', '0', '1', '0');

-- ----------------------------
-- Table structure for user_level
-- ----------------------------
DROP TABLE IF EXISTS `user_level`;
CREATE TABLE `user_level` (
  `pk_user_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_level_name` varchar(200) DEFAULT NULL,
  `user_level_remark` varchar(1000) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(2) DEFAULT '1' COMMENT '0 删除 1未删除',
  PRIMARY KEY (`pk_user_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户等级表';

-- ----------------------------
-- Records of user_level
-- ----------------------------
