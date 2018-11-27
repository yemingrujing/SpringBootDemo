package com.example.util.common.invoice.nuonuo;

import java.util.List;

/**
 * 诺诺发票开具请求参数
 *
 * @author Wei.Guang
 * @create 2018-11-27 17:35
 **/
public class InvoiceParam {

    /**
     * 购方名称
     * 是否必填：是
     */
    private String buyername;

    /**
     * 购方税号(企业要填，个人可为空)
     */
    private String taxnum;

    /**
     * 购方手机(开票成功会短信提醒购方)
     * 是否必填：是
     */
    private String phone;

    /**
     * 购方地址(企业要填，个人可为空)
     */
    private String address;

    /**
     * 购方银行账号(企业要填，个人可为空)
     */
    private String account;

    /**
     * 购方电话
     */
    private String telephone;

    /**
     * 订单号(每个企业唯一)
     * 是否必填：是
     */
    private String orderno;

    /**
     * 开票时间
     * 是否必填：是
     */
    private String invoicedate;

    /**
     * 开票员
     * 是否必填：是
     */
    private String clerk;

    /**
     * 销方银行账号
     */
    private String saleaccount;

    /**
     * 销方电话
     * 是否必填：是
     */
    private String salephone;

    /**
     * 销方地址
     * 是否必填：是
     */
    private String saleaddress;

    /**
     * 销方税号
     * 是否必填：是
     */
    private String saletaxnum;

    /**
     * 开票类型:1,正票;2,红票
     * 是否必填：是
     */
    private String kptype;

    /**
     * 备注(冲红时，必须在备注中注明“对应正数发票代码:XXXXXXXXX 号码:YYYYYYYY”文案，其中“X”为发票代码，“Y”为发票号码，否则接口会自动添加该文案)
     */
    private String message;

    /**
     * 收款人
     */
    private String payee;

    /**
     * 复核人
     */
    private String checker;

    /**
     * 对应蓝票发票代码(红票必填， 不满12 位请左补 0)
     */
    private String fpdm;

    /**
     * 对应蓝票发票号码(红票必填， 不满8 位请左补 0)
     */
    private String fphm;

    /**
     * 推 送 方 式 :-1, 不 推送;0,邮箱;1,手机(默认);2,邮箱、手机
     */
    private String tsfs;

    /**
     * 推送邮箱（ tsfs 为 0或 2 时，此项为必填）
     */
    private String email;

    /**
     * 清单标志:0,根据项目名称数，自动产生清单;1,将项目信息打印至清单
     * 默认为 0
     */
    private String qdbz;

    /**
     * 清单项目名称:打印清单时对应发票票面项目名称，注意：税总要求清单项目名称为（详见销货清单）
     * qdbz为 1 时，此项为必填
     */
    private String qdxmmc;

    /**
     * 代开标志:0 非代开; 1 代开。
     * 代开蓝票备注文案要求包含：代开企业税号:***,代开企业名称:***；
     * 代开红票备注文案要求:对应正数发票代码:***,号码:***,代开企业税号:***,代开企业名称:***
     * 默认为 0
     */
    private String dkbz;

    /**
     * 部门门店 id（诺诺系统中的 id）
     */
    private String deptid;

    /**
     * 开票员 id（诺诺系统中的 id）
     */
    private String clerkid;

    /**
     * 发票种类， p 电子增值税普通发票， c 增值税普通发票(纸票)， s增值税专用发票， e收购发票(电子)， f 收购发票(纸质)
     * 默认为电票 p
     */
    private String invoiceLine;

    /**
     * 成品油标志： 0 非成品油， 1 成品油
     * 默认为 0 非成品油
     */
    private String cpybz;

    /**
     * 电子发票明细
     * 是否必填：是
     */
    private List<InvoiceDetailParam> detail;
}
