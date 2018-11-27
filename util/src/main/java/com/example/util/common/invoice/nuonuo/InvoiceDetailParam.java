package com.example.util.common.invoice.nuonuo;

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
     * 是否必填：是
     */
    private String goodsname;

    /**
     * 项目单位
     */
    private String unit;

    /**
     * 规格型号
     */
    private String spec;

    /**
     * 数量(冲红时项目数量为负数)
     */
    private String num;

    /**
     * 单价含税标志， 0:不含税,1:含税
     * 是否必填：是
     */
    private String hsbz;

    /**
     * 0正常行 1折扣行 2被折扣行
     * 是否必填：是
     */
    private String fphxz;

    /**
     * 项目单价(正票和红票单价都大于‘0’)
     */
    private BigDecimal price;

    /**
     * 商品编码(技术人员需向企业财务核实；不足 19位后面补‘0’)
     * 是否必填：是
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
     * 税率  test 0.17 ; ys 0.03
     */
    private String taxrate;

    /**
     * 不含税金额
     */
    private String taxfreeamt;

    /**
     * 税额
     */
    private String tax;

    /**
     * 含税金额
     * 是否必填：是
     */
    private String taxamt;
}
