package com.example.util.common.invoice.nuonuo;

import lombok.Data;

/**
 * 诺诺发票作废参数
 *
 * @author Wei.Guang
 * @create 2018-11-27 18:33
 **/
@Data
public class InvoiceInvalidParam {

    /**
     * 发票请求流水号
     */
    private String fpqqlsh;

    /**
     * 对应发票代码
     */
    private String fpdm;

    /**
     * 对应发票号码
     */
    private String fphm;
}
