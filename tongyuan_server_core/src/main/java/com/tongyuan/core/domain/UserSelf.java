package com.tongyuan.core.domain;

import java.math.BigDecimal;
import java.util.Date;
/*
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
  `user_yu_e` decimal(10,2) DEFAULT '0.00' COMMENT '用户余额',
  `user_jifen` int(10) DEFAULT '0' COMMENT '户用积分',
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
 */
public class UserSelf {
	private Integer id;
	private String name;
	private String netname;
	private String phone;
	private String pwd;
	private String email;
	private Date regdate;
	private String regip;
	private String regphoneMac;
	private String yanzhengMa;
	private Date yanzhengDate;
	private Integer yanzhengNum;
	private String state;
	private BigDecimal balance;
	private Integer points;
	private Boolean phoneVerify;
	private Boolean emailVerify;
	private Boolean idCardVerify;
	private Boolean bankCardVerify;
	private String realName;
	private String address;
	private String location;
	private Boolean sex;
	private Date birthday;
	private String tel;
	private String idCard;
	private String bankCard;
	private Date createDate;
	private Date updateDate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNetname() {
		return netname;
	}

	public void setNetname(String netname) {
		this.netname = netname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getRegip() {
		return regip;
	}

	public void setRegip(String regip) {
		this.regip = regip;
	}

	public String getRegphoneMac() {
		return regphoneMac;
	}

	public void setRegphoneMac(String regphoneMac) {
		this.regphoneMac = regphoneMac;
	}

	public String getYanzhengMa() {
		return yanzhengMa;
	}

	public void setYanzhengMa(String yanzhengMa) {
		this.yanzhengMa = yanzhengMa;
	}

	public Date getYanzhengDate() {
		return yanzhengDate;
	}

	public void setYanzhengDate(Date yanzhengDate) {
		this.yanzhengDate = yanzhengDate;
	}

	public Integer getYanzhengNum() {
		return yanzhengNum;
	}

	public void setYanzhengNum(Integer yanzhengNum) {
		this.yanzhengNum = yanzhengNum;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public Integer getPoints() {
        return points;
    }

    public void setPoints(Integer points) {
        this.points = points;
    }

    public Boolean getPhoneVerify() {
		return phoneVerify;
	}

	public void setPhoneVerify(Boolean phoneVerify) {
		this.phoneVerify = phoneVerify;
	}

	public Boolean getEmailVerify() {
		return emailVerify;
	}

	public void setEmailVerify(Boolean emailVerify) {
		this.emailVerify = emailVerify;
	}

	public Boolean getIdCardVerify() {
		return idCardVerify;
	}

	public void setIdCardVerify(Boolean idCardVerify) {
		this.idCardVerify = idCardVerify;
	}

	public Boolean getBankCardVerify() {
		return bankCardVerify;
	}

	public void setBankCardVerify(Boolean bankCardVerify) {
		this.bankCardVerify = bankCardVerify;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Boolean getSex() {
		return sex;
	}

	public void setSex(Boolean sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getBankCard() {
		return bankCard;
	}

	public void setBankCard(String bankCard) {
		this.bankCard = bankCard;
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