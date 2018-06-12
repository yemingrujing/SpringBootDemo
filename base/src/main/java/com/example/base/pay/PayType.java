package com.example.base.pay;

import com.egzosn.pay.ali.api.AliPayConfigStorage;
import com.egzosn.pay.ali.api.AliPayService;
import com.egzosn.pay.ali.bean.AliTransactionType;
import com.egzosn.pay.common.api.PayService;
import com.egzosn.pay.common.bean.BasePayType;
import com.egzosn.pay.common.bean.TransactionType;
import com.egzosn.pay.common.http.HttpConfigStorage;
import com.egzosn.pay.wx.api.WxPayConfigStorage;
import com.egzosn.pay.wx.api.WxPayService;
import com.egzosn.pay.wx.bean.WxTransactionType;

/**
 * 支付类型
 *
 * @author Wei.Guang
 * @create 2018-06-11 18:21
 **/
public enum PayType implements BasePayType {

    /**
     * 支付宝支付
     */
    aliPay {
        @Override
        public TransactionType getTransactionType(String transactionType) {
            return AliTransactionType.valueOf(transactionType);
        }

        @Override
        public PayService getPayService(ApyAccount apyAccount) {
            AliPayConfigStorage configStorage = new AliPayConfigStorage();
            //配置的附加参数的使用
            configStorage.setAttach(apyAccount.getPayId());
            configStorage.setPid(apyAccount.getPartner());
            configStorage.setAppId(apyAccount.getAppid());
            configStorage.setKeyPublic(apyAccount.getPublicKey());
            configStorage.setKeyPrivate(apyAccount.getPrivateKey());
            configStorage.setNotifyUrl(apyAccount.getNotifyUrl());
            configStorage.setReturnUrl(apyAccount.getReturnUrl());
            configStorage.setSignType(apyAccount.getSignType());
            configStorage.setSeller(apyAccount.getSeller());
            configStorage.setPayType(apyAccount.getPayType().toString());
            configStorage.setMsgType(apyAccount.getMsgType());
            configStorage.setInputCharset(apyAccount.getInputCharset());
            configStorage.setTest(apyAccount.isTest());
            return new AliPayService(configStorage);
        }
    },
    /**
     * 微信支付
     */
    wxPay{
        /**
         * 根据支付类型获取交易类型
         * @param transactionType 类型值
         * @return
         */
        @Override
        public TransactionType getTransactionType(String transactionType) {
            return WxTransactionType.valueOf(transactionType);
        }

        @Override
        public PayService getPayService(ApyAccount apyAccount) {
            WxPayConfigStorage wxPayConfigStorage = new WxPayConfigStorage();
            wxPayConfigStorage.setMchId(apyAccount.getPartner());
            wxPayConfigStorage.setAppid(apyAccount.getAppid());
            //转账公钥，转账时必填
            wxPayConfigStorage.setKeyPublic(apyAccount.getPublicKey());
            wxPayConfigStorage.setSecretKey(apyAccount.getPrivateKey());
            wxPayConfigStorage.setNotifyUrl(apyAccount.getNotifyUrl());
            wxPayConfigStorage.setReturnUrl(apyAccount.getReturnUrl());
            wxPayConfigStorage.setSignType(apyAccount.getSignType());
            wxPayConfigStorage.setPayType(apyAccount.getPayType().toString());
            wxPayConfigStorage.setMsgType(apyAccount.getMsgType());
            wxPayConfigStorage.setInputCharset(apyAccount.getInputCharset());
            wxPayConfigStorage.setTest(apyAccount.isTest());
            //https证书设置 方式一
            HttpConfigStorage httpConfigStorage = new HttpConfigStorage();
            httpConfigStorage.setKeystore("证书信息串");
            httpConfigStorage.setStorePassword("证书密码");
            httpConfigStorage.setPath(false);
            return  new WxPayService(wxPayConfigStorage, httpConfigStorage);
        }
    };


    public abstract PayService getPayService(ApyAccount apyAccount);
}
