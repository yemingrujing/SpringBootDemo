package com.example.util.common.invoice;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;

/**
 * 开票请求参数
 *
 * @author Wei.Guang
 * @create 2018-11-21 17:34
 **/
@Setter
@Getter
@Builder
public class InvoiceParam {

    /**
     * 发票请求唯一流水号(每张发票的发票请求唯一流水号无重复，由企业定义。前8位是企业的DSPTBM值。长度限制20~50位)
     */
    private String fpqqlsh;

    /**
     * 自开(0) 代开(1)
     */
    @Builder.Default
    private String dkbz;

    /**
     * 编码表版本号 26.0 now
     */
    @Builder.Default
    private String bmbBbh;

    /**
     * 主要开票项目
     */
    private String kpxm;

    /**
     * 销货方识别号
     */
    private String xhfNsrsbh;

    /**
     * 销货方名称
     */
    private String xhfmc;

    /**
     * 销货方地址
     */
    private String xhfDz;

    /**
     * 销货方电话
     */
    private String xhfDh;

    /**
     * 购货方名称, 即发票抬头
     */
    private String ghfmc;

    /**
     * 购货方识别号(企业消费，如果填写识别号，需要传输过来)
     */
    private String ghfNsrsbh;

    /**
     * 购货方地址
     */
    private String ghfDz;

    /**
     * 购货方省份
     */
    private String ghfSf;

    /**
     * 购货方固定电话
     */
    private String ghfGddh;

    /**
     * 购货方手机
     */
    private String ghfSj;

    /**
     * 购货方手机
     */
    private String ghfEmail;

    /**
     * 购货方企业类型 01：企业 02：机关事业单位 03：个人 04：其它
     */
    private String ghfqylx;

    /**
     * 购货方银行、账号
     */
    private String ghfYhzh;

    /**
     * 开票员
     */
    private String kpy;

    /**
     * 开票类型：1正票 2红票
     */
    @Builder.Default
    private String kplx = "1";

    /**
     * 操作代码：10正票正常开具 20退货折让红票
     */

    @Builder.Default
    private String czdm = "10";

    /**
     * 冲红原因(冲红时填写，由企业定义)
     */
    private String chyy;

    /**
     * 价税合计金额
     */
    private BigDecimal kphjje;

    /**
     * 合计不含税金额。所有商品行不含税金额之和
     */
    private BigDecimal hjbhsje;

    /**
     * 合计税额。所有商品行税额之和。
     */
    private BigDecimal hjse;

    /**
     * 备注
     */
    private String bz;

    /**
     * 订单号
     */
    private String ddh;

    /**
     * 退货单号(在开具红字发票退货、折让的时候必须填写)
     */
    private String thdh;

    /**
     * 订单时间
     */
    private String dddate;

    /**
     * 项目明细
     */
    private List<InvoiceDetailParam> invoiceDetailParams;
}
