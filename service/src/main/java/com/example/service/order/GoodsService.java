package com.example.service.order;

import com.example.base.order.Goods;

/**
 * 商品接口
 *
 * @author Wei.Guang
 * @create 2018-06-22 17:26
 **/
public interface GoodsService {

    Goods findOne(Long goodsId);
}
