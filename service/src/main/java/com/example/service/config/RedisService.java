package com.example.service.config;

import com.example.util.common.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.Random;
import java.util.UUID;

/**
 * redis工具类
 *
 * @author Wei.Guang
 * @create 2018-06-22 11:08
 **/
@Service
public class RedisService {

    @Autowired
    RedisTemplate redisTemplate;

    /**
     * 获取唯一id
     * @param key key
     * @param hashKey hashKey
     * @param delta 增加量（不传采用1）
     * @return
     */
    public Long incrementHash(String key, String hashKey, Long delta) {
        try {
            if(null == delta) {
                delta = 1L;
            }
            return redisTemplate.opsForHash().increment(key, hashKey, delta);
        } catch (Exception e) { //redis宕机时采用uuid的方式生成唯一id
            int first = new Random(10).nextInt(8) + 1;
            int randNo = UUID.randomUUID().toString().hashCode();
            if(randNo < 0) {
                randNo = -randNo;
            }
            return Long.valueOf(first + String.format("%16d", randNo));
        }
    }
}
