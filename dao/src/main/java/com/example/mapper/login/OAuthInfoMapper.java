package com.example.mapper.login;

import com.example.base.login.OAuthInfo;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface OAuthInfoMapper extends Mapper<OAuthInfo> {

    /**
     * 插入用户授权验证信息
     *
     * @param authInfo
     */
    int saveAuthInfo(@Param("authInfo") OAuthInfo authInfo);

    /**
     * 根据id查询授权信息
     *
     * @param id
     * @return
     */
    OAuthInfo getAuthInfoById(@Param("id") int id);

    /**
     * 根据openId查询用户ID
     *
     * @param openId
     * @param idenType
     * @return
     */
    int getUserIdByOpenId(@Param("openId") String openId, @Param("idenType") String idenType);

    /**
     * 是否有授权
     *
     * @param authInfo 授权信息
     * @return
     */
    int isAuthorize(@Param("authInfo") OAuthInfo authInfo);

    /**
     * 根据openId获取授权信息
     *
     * @param openId
     * @param idenType
     * @return
     */
    OAuthInfo getAuthInfoByOpenId(@Param("openId") String openId, @Param("idenType") String idenType);

    /**
     * 更新授权信息
     *
     * @param authInfo
     * @return
     */
    int updateAuthInfo(@Param("authInfo") OAuthInfo authInfo);
}