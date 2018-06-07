package com.example.mapper.login;

import com.example.base.login.OAuthInfo;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface OAuthInfoMapper extends Mapper<OAuthInfo> {

    /**
     * 根据openId查询用户ID
     * @param OpenId
     * @return
     */
    Integer getUserIdByOpenId(@Param("openId") String openId);
}