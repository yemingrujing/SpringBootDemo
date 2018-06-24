package com.example.service.order.impl;

import com.example.base.order.Sku;
import com.example.mapper.order.SkuMapper;
import com.example.service.order.SkuService;
import com.example.util.service.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.ws.soap.Addressing;

/**
 * sku商品
 *
 * @author Wei.Guang
 * @create 2018-06-22 17:28
 **/
@Service
public class SkuServiceImpl extends BaseServiceImpl<Sku> implements SkuService {

    @Autowired
    private SkuMapper skuMapper;


    @Override
    public Sku findOne(int skuId) {
        return skuMapper.findOne(skuId);
    }
}
