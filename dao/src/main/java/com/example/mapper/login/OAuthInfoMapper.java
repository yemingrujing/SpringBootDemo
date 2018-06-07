package com.example.mapper.login;

import com.example.base.login.OAuthInfo;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface OAuthInfoMapper extends Mapper<OAuthInfo> {

    /**
     * 插入用户授权验证信息
     * @param authInfo
     */
    int insertWXAuthInfo(@Param("authInfo") OAuthInfo authInfo);

    /**
     * 根据id查询授权信息
     * @param id
     * @return
     */
    OAuthInfo getAuthInfoById(@Param("id") int id);

    /**
     * 根据openId查询用户ID
     * @param OpenId
     * @return
     */
    int getUserIdByOpenId(@Param("openId") String openId);
}