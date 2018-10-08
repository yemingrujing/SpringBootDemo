package com.example.mapper.login;

import com.example.base.login.UserAuths;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface UserAuthsMapper extends Mapper<UserAuths> {

    /**
     * 根据userId查询token
     *
     * @param userId
     * @return
     */
    String getToken(@Param("userId") int userId);

    /**
     * 保存token
     *
     * @param userId
     * @param token
     */
    int saveToken(@Param("userId") int userId, @Param("token") String token);

    /**
     * 注册
     *
     * @param userId
     * @return
     */
    int register(@Param("userId") int userId);
}