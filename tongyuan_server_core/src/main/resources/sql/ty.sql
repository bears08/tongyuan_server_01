-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET time_zone = "+00:00";
-- 数据库: `tongyuan`
--1、用户表,自有用户表ty_user_self,第三方用户表ty_user_third
--2、员工基本信息表ty_employee
--3、公司店铺信息表ty_company
--4、商品信息表ty_product
--5、购物车表ty_shop_car
--6、订单表ty_order,订单详情表ty_order_detail
--todo 现金流水表,资产负债表,渠道表 地区表
--todo 时间,地点,人物,事件
--每个表都有的公共字段,操作员,操作时间,创建时间,更新时间
--主键生成规则,索引

-- --------------------------------------------------------
--1、用户基本信息表ty_user_self  用户扩展表ty_user_extend  用户行为流水表 ty_user_action  用户验证码表

CREATE TABLE IF NOT EXISTS `ty_user_self` (
  `user_id` int(12)  AUTO_INCREMENT ,
  `user_name` varchar(50)  COMMENT '用户名,自有用户的用户名跟手机号一致，第三方的用第三方的',
  `user_netname` varchar(50)  COMMENT '昵称',
  `user_phone` varchar(20)  COMMENT '手机号唯一',
  `user_pwd` varchar(50)  COMMENT '密码',
  `user_email` varchar(50)  COMMENT '邮箱',
  `user_regdate` datetime  COMMENT '注册时间',
  `user_regip` varchar(20) COMMENT '注册ip',
  `user_regphone_mac` varchar(100) COMMENT '注册手机的mac',
  `user_yanzheng_ma` varchar(20) COMMENT '手机注册验证码',
  `user_yanzheng_date` datetime COMMENT '手机注册验证码下发时间',
  `user_yanzheng_num` int(5) COMMENT '手机注册验证码下发次数,不超过三次',
  `user_state` varchar(20)  COMMENT '状态,手机验证过或邮箱验证过的才OK',
  `user_balance` decimal(10,2) DEFAULT '0.00' COMMENT '用户余额',
  `user_points` int(10) DEFAULT '0' COMMENT '户用积分',
  `user_phone_verify` tinyint(1) DEFAULT '0' COMMENT '手机认证',
  `user_email_verify` tinyint(1) DEFAULT '0' COMMENT '邮箱认证',
  `user_id_card_verify` tinyint(1) DEFAULT '0' COMMENT '身份证认证',
  `user_bank_card_verify` tinyint(1) DEFAULT '0' COMMENT '银行卡认证',
  `user_real_name` varchar(20) COMMENT '真实名称',
  `user_address` varchar(200) COMMENT '配送地址',
  `user_location` varchar(200) COMMENT '当前所在位置',
  `user_sex` tinyint(1) DEFAULT '0' COMMENT '性别',
  `user_birthday` datetime COMMENT '生日',
  `user_tel` varchar(20) COMMENT '电话',
  `user_id_card` varchar(50) COMMENT '身份证id',
  `user_bank_card` varchar(50)  COMMENT '银行卡号',
  `create_date` datetime COMMENT '创建日期',
  `update_date` datetime COMMENT '更新日期',

  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--2、ty_employee员工基本信息表

CREATE TABLE IF NOT EXISTS `ty_employee` (
  `employee_id` int(12)  AUTO_INCREMENT ,
  `employee_name` varchar(50)  COMMENT '员工姓名',
  `employee_pwd` varchar(50) COMMENT '密码',
  `employee_netname` varchar(50)  COMMENT '员工昵称',
  `employee_phone` varchar(20) COMMENT '员工个人手机号',
  `employee_address` varchar(200) COMMENT '员工个人地址',
  `employee_work_phone` varchar(20) COMMENT '员工工作手机号',
  `employee_id_card` varchar(50) COMMENT '员工身份证id',
  `employee_birthday` datetime NULL COMMENT '员工生日',
  `employee_sex` tinyint(1) DEFAULT '0' COMMENT '性别',
  `employee_bank_card` varchar(50) COMMENT '银行卡号',
  `employee_email` varchar(50) COMMENT '邮箱',
  `employee_regdate` datetime COMMENT '入职时间',
  `employee_state` varchar(20) COMMENT '状态,在职,离职',
  `employee_type` varchar(20) COMMENT '员工类型,开发,运营,配送,',
  `employee_level` varchar(20) COMMENT '员工级别,T1-1',
--  学历,学校扩展信息表
  `employee_education` varchar(20) COMMENT '员工学历',
  `employee_school` varchar(200) COMMENT '员工学校',
--  员工工资,补贴,请假等扩展信息表
  `employee_wage` decimal(10,2) COMMENT '员工工资',
  `employee_subsidy` decimal(10,2) COMMENT '员工补贴',
  `employee_supervisor_id` int(12) COMMENT '员工上级id',
  `employee_supervisor_name` varchar(50) COMMENT '员工上级姓名',
  `employee_company_id` int(12) COMMENT '员工所在公司ID',
  `employee_company_name` varchar(200) COMMENT '员工所在公司名称',
  `employee_company_address` varchar(200) COMMENT '员工工作地址',
  `employee_operator_id` int(12) COMMENT '员工信息操作员ID',
  `employee_operator_name` varchar(50) COMMENT '员工信息操作员姓名',
  `operator_id` int(12)  COMMENT '操作员ID',
  `operator_name` varchar(50)  COMMENT '操作员名称',
  `create_date` datetime COMMENT '创建日期',
  `update_date` datetime COMMENT '更新日期',

  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--3、公司店铺信息表ty_company

CREATE TABLE IF NOT EXISTS `ty_company` (
  `company_id` int(12)  AUTO_INCREMENT,
  `company_name` varchar(50) COMMENT '公司名称',
  `company_executive_id` int(12) COMMENT '公司负责人ID',
  `company_executive_name` varchar(50) COMMENT '公司负责人姓名',
  `company_supervisor_id` int(12) COMMENT '公司的上级公司ID',
  `company_supervisor_name` varchar(50) COMMENT '公司的上级公司的名称',
  `company_type` varchar(50) COMMENT '公司的性质,开发公司,餐饮公司,店铺...',
  `company_regdate` datetime COMMENT '注册时间',
  `company_regid` varchar(200) COMMENT '注册编号',
  `company_state` smallint(2)  COMMENT '状态',
  `company_intro` text  COMMENT '介绍',
  `company_linkname` varchar(50)  COMMENT '联系人',
  `company_linktel` varchar(50)  COMMENT '联系人电话',
  `company_tel` varchar(20)  COMMENT '公司电话',
  `company_address` varchar(200)  COMMENT '公司地址',
  `company_area_id` int(10)  COMMENT '地区id',
  `company_area_allid` varchar(50)  COMMENT '地区id全路径',
  `company_area` varchar(50)  COMMENT '所在区域名',
  `company_opentime_start` int(10)  COMMENT '营业开始时间',
  `company_opentime_close` int(10)  COMMENT '营业结束时间',
  `company_pic_small` varchar(100)  COMMENT '公司logo',
  `company_pic` varchar(100)  COMMENT '小图',
  `company_mode` smallint(2)  COMMENT '经营范围',
  `operator_id` int(12)  COMMENT '操作员ID',
  `operator_name` varchar(50)  COMMENT '操作员名称',
  `create_date` datetime COMMENT '创建日期',
  `update_date` datetime COMMENT '更新日期',

  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--4、商品信息表ty_product
--   商品分类表ty_category
--   商品评论表

CREATE TABLE IF NOT EXISTS `ty_product` (
  `product_id` int(12)  AUTO_INCREMENT,
  `product_name` varchar(500)  COMMENT '商品名称',
  `product_price` decimal(10,2)  COMMENT '单价',
  `product_discount` float(4,2) default '1' COMMENT '商品折扣',
  `product_state` varchar(32)  COMMENT '状态,上架在售,售罄,下架',
  `product_num` int(12)  COMMENT '商品数量',
  `product_score` int(12)  COMMENT '商品评分',
  `product_category_id` int(12)  COMMENT '商品分类ID',
  `product_category_name` varchar(50)  COMMENT '商品分类名称',
  `product_unit` varchar(10)  COMMENT '单位,件,克,份',
  `product_pic` varchar(200)  COMMENT '图片',
  `product_pic_small` varchar(200)  COMMENT '小图',
  `product_element` varchar(500)  COMMENT '产品的成分,组成',
  `product_function` varchar(500)  COMMENT '产品的功能,推荐',
  `product_summary` varchar(500)  COMMENT '产品简介',
--  产品详情页是否做成article
  `product_detail` varchar(500)  COMMENT '产品详情',
  `product_sold_start` datetime  COMMENT '开始出售时间',
  `product_sold_end` datetime  COMMENT '停止出售时间',
  `product_is_reserve` tinyint(1) DEFAULT '0' COMMENT '是否需要预定,默认不需要预定',
--  产品上架地区或店铺
  `product_is_recommend` int(12) default '0' COMMENT '是否推荐,推荐的商品出现在今日里面',
  `product_sort` int(10)  COMMENT '商品排序字段',
  `operator_id` int(12)  COMMENT '操作员ID',
  `operator_name` varchar(50)  COMMENT '操作员名称',

  `create_date` datetime COMMENT '创建日期',
  `update_date` datetime COMMENT '更新日期',

  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--5、购物车表ty_shop_car

CREATE TABLE IF NOT EXISTS `ty_shop_cart` (
  `cart_id` int(12)  AUTO_INCREMENT,
  `user_id` int(12) COMMENT '用户id',
  `user_name` varchar(50)  COMMENT '用户名,自有用户的用户名跟手机号一致，第三方的用第三方的',
  `product_id` int(12)  COMMENT '商品 ID',
  `product_num` int(12)  COMMENT '商品数量',
  `product_name` varchar(500)  COMMENT '商品名称',
  `cart_channel_id` int(12)  COMMENT '渠道ID,从app,web下的单',
  `cart_channel_name` varchar(50)  COMMENT '渠道名称',
  `create_date` datetime COMMENT '创建日期',
  `update_date` datetime COMMENT '更新日期',

  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--6、订单表ty_order,订单详情表ty_order_detail

CREATE TABLE IF NOT EXISTS `ty_order` (
  `order_id` int(12)  AUTO_INCREMENT,
  `user_id` int(12)  COMMENT '用户id',
  `user_name` varchar(50)  COMMENT '用户姓名',
  `user_sex` tinyint(1)  COMMENT '性别',
  `user_phone` varchar(20)  COMMENT '手机',
  `user_address` varchar(200)  COMMENT '配送地址',
  `order_time` datetime  COMMENT '下单时间',
  `order_user_words` varchar(200)  COMMENT '用户留言',
  `order_user_dispatch_time` datetime  COMMENT '用户要求送达时间',
  `order_produce_start_time` datetime  COMMENT '开始生产时间',
  `order_produce_end_time` datetime  COMMENT '开始结束时间',
  `order_dispatch_start_time` datetime  COMMENT '开始派送时间',
  `order_dispatch_arrive_time` datetime  COMMENT '派送送达时间',
  `order_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单总金额',
  `order_discount_amount` decimal(10,2) DEFAULT '0.00' COMMENT '优惠金额',
  `order_pay_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单支付金额',
--  退款相关
  `order_pay_method` varchar(50)  COMMENT '支付方式',
  `order_pay_money_amount` decimal(10,2) DEFAULT '0.00' COMMENT '现金支付金额',
  `order_pay_card_amount` decimal(10,2) DEFAULT '0.00' COMMENT '银行卡支付金额',
  `order_pay_weixin_amount` decimal(10,2) DEFAULT '0.00' COMMENT '微信支付金额',
  `order_pay_alipay_amount` decimal(10,2) DEFAULT '0.00' COMMENT '支付宝支付金额',
  `order_pay_other_amount` decimal(10,2) DEFAULT '0.00' COMMENT '其他支付金额',
  `order_pay_time` datetime  COMMENT '支付时间',
  `order_beta` varchar(255)  COMMENT '订单备注',
  `order_state` varchar(20)  COMMENT '状态',
  `company_id` int(12)  COMMENT '接收订单的公司或店铺ID',
  `company_name` varchar(50)  COMMENT '接收订单的公司或店铺名称',
  `company_executive_name` varchar(50) COMMENT '公司负责人姓名',
  `company_address` varchar(200)  COMMENT '公司地址',
  `produce_employee_id` int(12)  COMMENT '生产负责人id',
  `produce_employee_name` varchar(50)  COMMENT '生产负责人姓名',
  `dispatch_employee_id` int(12)  COMMENT '配送负责人id',
  `dispatch_employee_name` varchar(50)  COMMENT '配送负责人姓名',
  `order_repayment` decimal(10,2) DEFAULT '0.00' COMMENT '预付款',
  `create_date` datetime COMMENT '创建日期',
  `update_date` datetime COMMENT '更新日期',

  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--订单详情表ty_order_detail

CREATE TABLE IF NOT EXISTS `ty_order_detail` (
  `order_detail_id` int(12)  AUTO_INCREMENT,
  `order_id` int(12)  COMMENT '所属订单id',
  `user_id` int(12)  COMMENT '用户id',
  `user_name` varchar(50)  COMMENT '用户姓名',
  `user_sex` tinyint(1)  COMMENT '性别',
  `user_phone` varchar(20)  COMMENT '手机',
  `user_address` varchar(200)  COMMENT '配送地址',
  `product_id` int(12)  COMMENT '商品ID',
  `product_name` varchar(500)  COMMENT '商品名称',
  `product_discount` float(4,2) default '1' COMMENT '商品折扣',
  `product_price` decimal(10,2)  COMMENT '单价',
  `product_discount` float(4,2) default '1' COMMENT '商品折扣',
  `product_num` int(12)  COMMENT '商品数量',
  `order_time` datetime  COMMENT '下单时间',
  `product_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单总金额',
  `product_discount_amount` decimal(10,2) DEFAULT '0.00' COMMENT '优惠金额',
  `product_pay_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单支付金额',
  `order_detail_beta` varchar(255)  COMMENT '订单备注',
  `order_detail_state` varchar(20)  COMMENT '状态',
  `create_date` datetime COMMENT '创建日期',
  `update_date` datetime COMMENT '更新日期',

--  如果发生了单品退款
  PRIMARY KEY (`order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;