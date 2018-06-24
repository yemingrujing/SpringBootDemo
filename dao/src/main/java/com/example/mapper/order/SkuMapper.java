package com.example.mapper.order;

import com.example.base.order.Sku;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface SkuMapper extends Mapper<Sku> {

    Sku findOne(@Param("skuId") int SkuId);
}