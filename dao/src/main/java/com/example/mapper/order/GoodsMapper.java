package com.example.mapper.order;

import com.example.base.order.Goods;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface GoodsMapper extends Mapper<Goods> {

    Goods findOne(@Param("goodsId") Long goodsId);
}