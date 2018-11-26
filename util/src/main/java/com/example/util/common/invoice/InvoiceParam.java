package com.example.util.common.invoice;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * 开票请求参数：
 * {
 *     "ghfSj": "13888884434",
 *     "kplx": "1",
 *     "ghfSf": "江苏省",
 *     "xhfmc": "上海市执业药师协会",
 *     "ghfDz": "金沙江西路1555弄",
 *     "tschbz": "",
 *     "thdh": "",
 *     "xhfNsrsbh": "310101000000090",
 * 	"xhfYhzh": "建设银行622788987765345",
 *     "fpqqlsh": "213132",
 *     "xhfDh": "13888884434",
 *     "kphjje": 400.00,
 *     "bz": "黑色和白色的",
 *     "ghfEmail": "1383838438@qq.com",
 *     "hjbhsje": 0,
 *     "ghfYhzh": "工商银行6227092334322123",
 *     "hjse": 0,
 *     "xhfDz": "上海市柳州路615号2号楼3楼",
 *     "ghfmc": "上海天启集团",
 *     "kpxm": "迷你裙",
 *     "ddh": "",
 *     "chyy": "",
 *     "czdm": "10",
 *     "dkbz": "0",
 *     "yfpHm": "",
 *     "ghfNsrsbh": "420101008800090",
 *     "ghfqylx": "01",
 *     "kpy": "药师",
 *     "yfpDm": "",
 *     "invoiceDetailParams": [{
 *         "ggxh": "M 165",
 *         "xmdj": 0,
 *         "yhzcbs": "0",
 *         "zzstsgl": "",
 *         "xmje": 200.00,
 *         "kce": "",
 *         "xmdw": "条",
 *         "fphxz": "0",
 *         "lslbs": "",
 *         "hsbz": "1",
 *         "xmmc": "迷你裙",
 *         "xmsl": "1",
 *         "sl": "0.17",
 *         "spbm": "1010101030000000000"
 *     },{
 *         "ggxh": "M 165",
 *         "xmdj": 0,
 *         "yhzcbs": "0",
 *         "zzstsgl": "",
 *         "xmje": 200.00,
 *         "kce": "",
 *         "xmdw": "条",
 *         "fphxz": "0",
 *         "lslbs": "",
 *         "hsbz": "1",
 *         "xmmc": "超短裤",
 *         "xmsl": "1",
 *         "sl": "0.03",
 *         "spbm": "1010101030000000000"
 *     }],
 *     "dddate": "",
 *     "ghfGddh": "1383838438"
 * }
 *
 * @author Wei.Guang
 * @create 2018-11-21 17:34
 **/
@Data
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
     * 销方银行、账号
     */
    private String xhfYhzh;

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
     * 原发票代码
     * 如果CZDM不是10或KPLX为红票时候都是必录
     */
    private String yfpDm;

    /**
     * 原发票号码
     * 如果CZDM不是10或KPLX为红票时候都是必录
     */
    private String yfpHm;

    /**
     * 特殊冲红标志
     * 正常冲红(电子发票) 1特殊冲红(冲红纸质等)
     */
    private String tschbz;

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
     * 小数点后2位，以元为单位精确到分
     */
    private BigDecimal kphjje;

    /**
     * 合计不含税金额。
     * 所有商品行不含税金额之和小数点后2位，以元为单位精确到分(单行商品税额之和)
     * 平台处理价税分离，此值传0
     */
    private BigDecimal hjbhsje;

    /**
     * 合计税额。所有商品行税额之和。
     * 所有商品行不含税金额之和小数点后2位，以元为单位精确到分(单行商品税额之和)
     * 平台处理价税分离，此值传0
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
