CREATE TABLE IF NOT EXISTS `ty_category` (
  `category_id` int(12)  AUTO_INCREMENT,
  `category_name` varchar(200)  COMMENT '商品分类名称',
  `category_level` varchar(50)  COMMENT '商品分类等级',
  `category_state` varchar(32)  COMMENT '状态,上架在售,售罄,下架',
  `category_score` int(12)  COMMENT '商品分类评分',
  `category_parent_id` int(12)  COMMENT '商品分类父ID',
  `category_parent_name` varchar(50)  COMMENT '商品分类父名称',
  `category_pic` varchar(200)  COMMENT '图片',
  `category_pic_small` varchar(200)  COMMENT '小图',
  `category_summary` varchar(500)  COMMENT '分类简介',
--  产品详情页是否做成article
  `category_detail` varchar(500)  COMMENT '分类详情',
  `category_sold_start` datetime  COMMENT '开始出售时间',
  `category_sold_end` datetime  COMMENT '停止出售时间',
--  产品上架地区或店铺
  `category_is_recommend` int(12) default '0' COMMENT '是否推荐',
  `category_sort` int(10)  COMMENT '商品分类排序字段',
  `operator_id` int(12)  COMMENT '操作员ID',
  `operator_name` varchar(50)  COMMENT '操作员名称',

  `create_date` datetime COMMENT '创建日期',
  `update_date` datetime COMMENT '更新日期',

  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;