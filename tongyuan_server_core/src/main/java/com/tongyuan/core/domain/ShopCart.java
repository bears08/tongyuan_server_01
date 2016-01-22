package com.tongyuan.core.domain;

import java.util.Date;
/*
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
 */
public class ShopCart {
	private Integer id;
	private Integer userId;
	private String userName;
	private Integer productId;
	private Integer productNum;
	private String productName;
	private Integer channelId;
	private String channelName;
	private Date createDate;
	private Date updateDate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getProductNum() {
		return productNum;
	}

	public void setProductNum(Integer productNum) {
		this.productNum = productNum;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getChannelId() {
		return channelId;
	}

	public void setChannelId(Integer channelId) {
		this.channelId = channelId;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

}