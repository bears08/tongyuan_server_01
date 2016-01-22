/**
 * Created with IntelliJ IDEA.
 * User: wangzhenlei
 * Date: 14-10-22
 * Time: 下午2:15
 * To change this template use File | Settings | File Templates.
 */
$(function () {
    var bank = {data:':,:BCEL:BCEL,AEON:AEON信贷,UNKNOW:Al Baraka Bank(Pakistan),BCCARD:BC卡公司,CSC:CSC,BOSMX:三门峡银行,SRCB:上海农村商业银行,SHBB:上海商业银行,SPDB:上海浦东发展银行,BOS:上海银行,BOSR:上饶银行,BEA:东亚银行,DRCB:东莞农村商业银行,DGCB:东莞银行,DYCCB:东营银行,CITICKW:中信嘉华银行有限公司,CITIC:中信银行,CEB:中国光大银行,ABC:中国农业银行,ICBC:中国工商银行,CCB:中国建设银行,CMBC:中国民生银行,PSBC:中国邮政储蓄银行,BOC:中国银行,BOSI:中银信用卡(国际)有限公司,LSB:临商银行,BODD:丹东银行,BOWH:乌海银行,UCCB:乌鲁木齐市商业银行,LSCCB:乐山市商业银行,JJCCB:九江银行,YNNX:云南省农村信用社联合社,BCM:交通银行,IBK:企业银行,FSSSNX:佛山市三水区农村信用合作社,BOBD:保定银行,BOXY:信阳银行,LPSCCB:六盘水市商业银行,LZCB:兰州银行,CIB:兴业银行,NMGNX:内蒙古农村信用社联合社,BOIMC:内蒙古银行,LSZCCB:凉山州商业银行,CHBANK:创兴银行,BSB:包商银行,BJRCB:北京农村商业银行,BOB:北京银行,OCBC:华侨银行,HXB:华夏银行,BOXJ:华融湘江银行,NJCB:南京银行,NCCCB:南充市商业银行,BONC:南昌银行,NCB:南洋商业银行,BOXM:厦门银行,WOORI:友利银行,DFS:发现金融服务公司,BOTZ:台州银行,JLNX:吉林省农村信用社联合社,BOJL:吉林银行,WJRCB:吴江农村商业银行,BOZK:周口银行,HMCCB:哈密市商业银行,BOHRB:哈尔滨银行,TSCCB:唐山市商业银行,BOSQ:商丘银行,BOJX:嘉兴银行,SCNX:四川省农村信用社联合社,TFBANK:大丰银行,UOBANK:大华银行,DTCCB:大同市商业银行,DSBANK:大新银行,BNUBANK:大西洋银行,BODL:大连银行,TJRCB:天津农村商业银行,BHRCB:天津滨海农村商业银行,TJCB:天津银行,TCRCB:太仓农村商业银行,WHCCB:威海市商业银行,BONX:宁夏银行,NBDH:宁波东海银行,NBTS:宁波通商银行,NBCB:宁波银行,AHNX:安徽省农村信用社联合社,BOAY:安阳银行,ASCCB:安顺市商业银行,YBCCB:宜宾市商业银行,BJCCB:宝鸡市商业银行,FDB:富滇银行,SDNX:山东省农村信用社联合社,YDRCB:山西尧都农村商业银行,SXNX:山西省农村信用社联合社,CSRCB:常熟农村商业银行,PAB:平安银行,BOPDS:平顶山银行,GDHXCB:广东华兴银行,NHRCB:广东南海农村商业银行,GDNYCB:广东南粤银行,GDNX:广东省农村信用社联合社,CGB:广发银行,GRCB:广州农村商业银行,GZCB:广州银行,GXNX:广西农村信用社联合社,BOBBW:广西北部湾银行,KORLA？:库尔勒市商业银行,BOLF:廊坊银行,ZJKCCB:张家口市商业银行,ZJGRCB:张家港农村商业银行,DZB:德州银行,BODY:德阳银行,HSB:徽商银行,EGB:恒丰银行,HSBANK:恒生银行,CDRCB:成都农村商业银行,BOCD:成都银行,CDB:承德银行,BOFS:抚顺银行,CMB:招商银行,PZHCCB:攀枝花市商业银行,BOXX:新乡银行,XJNX:新疆农村信用社联合社,BOHH:新疆汇和银行,SHCARD:新韩卡公司,SHBANK:新韩银行,WXRCB:无锡农村商业银行,SMBC:日本三井住友卡公司,RZB:日照银行,BOKL:昆仑银行,KSRCB:昆山农村商业银行,YNKMNX:昆明市农村信用社联合社,DBS:星展银行,JZCB:晋中银行,BOJS:晋商银行,JCCB:晋城银行,JDZCCB:景德镇商业银行,BXCCB:本溪市商业银行,HZB:杭州银行,BOZZ:枣庄银行,BOLZ:柳州银行,BOGL:桂林银行,WHRCB:武汉农村商业银行,WHNX:武汉市农村信用社联合社,WHBANK:永亨银行,WLBANK:永隆银行,HSBC:汇丰银行,HKB:汉口银行,JNRCB:江南农村商业银行,JSNX:江苏省农村信用社联合社,JSB:江苏银行,CJCCB:江苏长江商业银行,JXNX:江西省农村信用社联合社,JYRCB:江阴农村商业银行,BOCZ:沧州银行,HBNX:河北省农村信用社联合社,HBB:河北银行,HNNX:河南省农村信用社联合社,BOQZ:泉州银行,TAB:泰安市商业银行,LZCCB:泸州市商业银行,BOLY:洛阳银行,BOJN:济宁银行,CZB:浙商银行,ZJMTB:浙江民泰商业银行,ZJTLCB:浙江泰隆商业银行,ZJNX:浙江省农村信用社联合社,CZCB:浙江稠州银行,HNRCC:海南省农村信用社联合社,HKURCB:海口联合农商银行,SZRCB:深圳农村商业银行,SCBL:渣打银行,CBHB:渤海银行,WZCB:温州银行,HUBNX:湖北省农村信用社联合社,HBCL:湖北银行,HUNNX:湖南省农村信用社联合社,BOHZ:湖州银行,BOLH:漯河银行,WFCCB:潍坊银行,BOPY:濮阳银行,YTCB:烟台银行,JZCCB:焦作市商业银行,YXCCB:玉溪市商业银行,ZHRCB:珠海农村商业银行,ZHHRCB:珠海华润银行,GSNX:甘肃省农村信用社联合社,BOGS:甘肃银行,PJCCB:盘锦市商业银行,BOSJ:盛京银行,BOSJS:石嘴山银行,BOHX:福建海峡银行,FJNX:福建省农村信用社联合社,BOQHD:秦皇岛银行,BOSX:绍兴银行,MYCCB:绵阳市商业银行,ZGCCB:自贡市商业银行,CITIB:花旗银行,BOSZ:苏州银行,LWB:莱商银行,YKYH:营口沿海银行,BOYK:营口银行,BOHLD:葫芦岛银行,BOHS:衡水银行,BOXIA:西安银行,TIBET:西藏银行,BOXC:许昌银行,GZNX:贵州省农村信用社联合社,BOGY:贵阳银行,BOGZ:赣州银行,LNNX:辽宁省农村信用社联合社,LYCB:辽阳银行,DZCCB:达州市商业银行,CBD:迪拜商业银行,SNCCB:遂宁市商业银行,ZYCCB:遵义市商业银行,XTB:邢台银行,HDCB:邯郸银行,BOZJ:郑州银行,ORDOS:鄂尔多斯银行,BEEB:鄞州银行,CGSXCB:重庆三峡银行,CQRCB:重庆农村商业银行,CQCB:重庆银行,JHCCB:金华银行,BOTL:铁岭银行,JZB:锦州银行,CHAB:长安银行,BOCS:长沙银行,CZCCB:长治银行,BOFX:阜新银行,YQCCB:阳泉市商业银行,SHXNX:陕西省农村信用社联合社,YANCCB:雅安市商业银行,CYBANK:集友银行,QDRCB:青岛市农村商业银行,QDCCB:青岛银行,QHNX:青海省农村信用社联合社,BOQH:青海银行,BOAS:鞍山银行,HANABANK:韩亚银行,SANGSUMG:韩国三星卡公司,LOTTE:韩国乐天,SKKB:韩国国民银行,SDEB:顺德农村商业银行,BOZMD:驻马店银行,BOHB:鹤壁银行,YRRCB:黄河农村商业银行,HLJNX:黑龙江省农村信用社联合社,QSB:齐商银行,QLB:齐鲁银行,BOLJ:龙江银行,QJCCB:曲靖市商业银行,BOCY:朝阳银行,LLPAY:连连支付,99BILL:快钱'};
    $('#tbl input:[name=bank]').scombobox(bank);
});


//计算天数差的函数，通用
function  DateDiff(sDate1,  sDate2){    //sDate1和sDate2是2006-12-18格式
    var  aDate,  oDate1,  oDate2,  iDays
    aDate  =  sDate1.split("-")
    oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])    //转换为12-18-2006格式
    aDate  =  sDate2.split("-")
    oDate2  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])
    iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24)    //把相差的毫秒数转换为天数
    return  iDays
}