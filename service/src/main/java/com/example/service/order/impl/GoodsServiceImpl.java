package com.example.service.order.impl;

import com.example.base.order.Goods;
import com.example.mapper.order.GoodsMapper;
import com.example.service.order.GoodsService;
import com.example.util.service.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 商品Service
 *
 * @author Wei.Guang
 * @create 2018-06-22 17:27
 **/
@Service
public class GoodsServiceImpl extends BaseServiceImpl<Goods> implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;
}
