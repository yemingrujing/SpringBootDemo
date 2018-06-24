package com.example.service.order;

import com.example.base.order.Sku;

/**
 * sku接口
 *
 * @author Wei.Guang
 * @create 2018-06-22 17:26
 **/
public interface SkuService {

    Sku findOne(int skuId);
}
