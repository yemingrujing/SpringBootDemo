package com.example.util.service;

import java.util.List;

/**
 * 通用 Service
 *
 * @author Wei.Guang
 * @create 2018-06-06 14:46
 **/
public interface BaseService<T> {

    List<T> list(T entity);

    T get(T entity);

    int update(T entity);

    int save(T entity);

    int delete(T entity);

    List<T> selectAll();
}
