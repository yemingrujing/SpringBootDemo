package com.example.mapper.login;

import com.example.base.login.OUserInfo;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface OUserInfoMapper extends Mapper<OUserInfo> {

    /**
     * 根据用户ID查询用户信息
     * @param userId
     * @return
     */
    OUserInfo getUserByUserID(@Param("userId") Integer userId);
}