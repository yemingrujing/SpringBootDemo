package com.example.util.common.invoice;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 发票开具项目明细
 *
 * @author Wei.Guang
 * @create 2018-11-22 14:05
 **/
@Data
public class InvoiceDetailParam {

    /**
     * 项目名称
     */
    private String xmmc;

    /**
     * 项目单位
     */
    private String xmdw;

    /**
     * 规格型号
     */
    private String ggxh;

    /**
     * XMSL
     */
    private String xmsl;

    /**
     * 0 表示都不含税，1 表示都含税。
     */
    private String hsbz;

    /**
     * 0正常行 1折扣行 2被折扣行
     */
    private String fphxz;

    /**
     * 项目单价(正票和红票单价都大于‘0’)
     */
    private BigDecimal xmdj;

    /**
     * 商品编码(技术人员需向企业财务核实；不足 19位后面补‘0’)
     */
    private String spbm;

    /**
     * 优惠政策标识(0：不使用， 1：使用)
     */
    @Builder.Default
    private String yhzcbs = "0";

    /**
     * 零税率标识(非必填)
     * 空：非零税率， 1：免税， 2：不征税，3普通零税率
     */
    private String lslbs;

    /**
     * 增值税特殊管理(非必填)
     * 当YHZCBS为1时必填（如：免税、不征税）
     */
    private String zzstsgl;

    /**
     * 扣除额(非必填)
     * 单位元，小数点 2位小数 不能大于不含税金额 说明上海爱信诺航天信息有限公司
     * 如下： 1.差额征税的发票如果没有折扣的话，只能允许一条商品行。 2.具体差额征税发票的
     * 计算方法如下： 不含税差额 = 不含税金额 - 扣除额；税额 = 不含税差额*税率
     */
    private String kce;

    /**
     * 项目金额
     */
    private BigDecimal xmje;

    /**
     * 税率  test 0.17 ; ys 0.03
     */
    private String sl;
}
