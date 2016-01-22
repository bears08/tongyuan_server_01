package com.tongyuan.core.domain;

import java.math.BigDecimal;
import java.util.Date;
/*
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
 */
public class Order {
	private Integer id;
	private Integer userId;
	private String userName;
	private Boolean userSex;
	private String userPhone;
	private String userAddress;
	private Date time;
	private String userWords;
	private Date userDispatchTime;
	private Date produceStartTime;
	private Date produceEndTime;
	private Date dispatchStartTime;
	private Date dispatchArriveTime;
	private BigDecimal amount;
	private BigDecimal discountAmount;
	private BigDecimal payAmount;
	private String payMethod;
	private BigDecimal payMoneyAmount;
	private BigDecimal payCardAmount;
	private BigDecimal payWeixinAmount;
	private BigDecimal payAlipayAmount;
	private BigDecimal payOtherAmount;
	private Date payTime;
	private String beta;
	private String state;
	private Integer companyId;
	private String companyName;
	private String companyExecutiveName;
	private String companyAddress;
	private Integer produceEmployeeId;
	private String produceEmployeeName;
	private Integer dispatchEmployeeId;
	private String dispatchEmployeeName;
	private BigDecimal repayment;
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

	public Boolean getUserSex() {
		return userSex;
	}

	public void setUserSex(Boolean userSex) {
		this.userSex = userSex;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getUserWords() {
		return userWords;
	}

	public void setUserWords(String userWords) {
		this.userWords = userWords;
	}

	public Date getUserDispatchTime() {
		return userDispatchTime;
	}

	public void setUserDispatchTime(Date userDispatchTime) {
		this.userDispatchTime = userDispatchTime;
	}

	public Date getProduceStartTime() {
		return produceStartTime;
	}

	public void setProduceStartTime(Date produceStartTime) {
		this.produceStartTime = produceStartTime;
	}

	public Date getProduceEndTime() {
		return produceEndTime;
	}

	public void setProduceEndTime(Date produceEndTime) {
		this.produceEndTime = produceEndTime;
	}

	public Date getDispatchStartTime() {
		return dispatchStartTime;
	}

	public void setDispatchStartTime(Date dispatchStartTime) {
		this.dispatchStartTime = dispatchStartTime;
	}

	public Date getDispatchArriveTime() {
		return dispatchArriveTime;
	}

	public void setDispatchArriveTime(Date dispatchArriveTime) {
		this.dispatchArriveTime = dispatchArriveTime;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public BigDecimal getDiscountAmount() {
		return discountAmount;
	}

	public void setDiscountAmount(BigDecimal discountAmount) {
		this.discountAmount = discountAmount;
	}

	public BigDecimal getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(BigDecimal payAmount) {
		this.payAmount = payAmount;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public BigDecimal getPayMoneyAmount() {
		return payMoneyAmount;
	}

	public void setPayMoneyAmount(BigDecimal payMoneyAmount) {
		this.payMoneyAmount = payMoneyAmount;
	}

	public BigDecimal getPayCardAmount() {
		return payCardAmount;
	}

	public void setPayCardAmount(BigDecimal payCardAmount) {
		this.payCardAmount = payCardAmount;
	}

	public BigDecimal getPayWeixinAmount() {
		return payWeixinAmount;
	}

	public void setPayWeixinAmount(BigDecimal payWeixinAmount) {
		this.payWeixinAmount = payWeixinAmount;
	}

	public BigDecimal getPayAlipayAmount() {
		return payAlipayAmount;
	}

	public void setPayAlipayAmount(BigDecimal payAlipayAmount) {
		this.payAlipayAmount = payAlipayAmount;
	}

	public BigDecimal getPayOtherAmount() {
		return payOtherAmount;
	}

	public void setPayOtherAmount(BigDecimal payOtherAmount) {
		this.payOtherAmount = payOtherAmount;
	}

	public Date getPayTime() {
		return payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}

	public String getBeta() {
		return beta;
	}

	public void setBeta(String beta) {
		this.beta = beta;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyExecutiveName() {
		return companyExecutiveName;
	}

	public void setCompanyExecutiveName(String companyExecutiveName) {
		this.companyExecutiveName = companyExecutiveName;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public Integer getProduceEmployeeId() {
		return produceEmployeeId;
	}

	public void setProduceEmployeeId(Integer produceEmployeeId) {
		this.produceEmployeeId = produceEmployeeId;
	}

	public String getProduceEmployeeName() {
		return produceEmployeeName;
	}

	public void setProduceEmployeeName(String produceEmployeeName) {
		this.produceEmployeeName = produceEmployeeName;
	}

	public Integer getDispatchEmployeeId() {
		return dispatchEmployeeId;
	}

	public void setDispatchEmployeeId(Integer dispatchEmployeeId) {
		this.dispatchEmployeeId = dispatchEmployeeId;
	}

	public String getDispatchEmployeeName() {
		return dispatchEmployeeName;
	}

	public void setDispatchEmployeeName(String dispatchEmployeeName) {
		this.dispatchEmployeeName = dispatchEmployeeName;
	}

	public BigDecimal getRepayment() {
		return repayment;
	}

	public void setRepayment(BigDecimal repayment) {
		this.repayment = repayment;
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