package com.example.util.common.invoice;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * 发票开具项目明细
 *
 * @author Wei.Guang
 * @create 2018-11-22 14:05
 **/
@Setter
@Getter
@Builder
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
     * 项目金额
     */
    private BigDecimal xmje;

    /**
     * 税率
     */
    private String sl;
}
