package com.example.service.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
/**
 * security定制安全策略
 *
 * @author Wei.Guang
 * @create 2018-07-16 13:14
 **/
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        //在内存中创建了一个用户，该用户的名称为user，密码为password，用户角色为USER
        auth.inMemoryAuthentication().withUser("admin").password("123456").roles("USER");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        /*
        configure(HttpSecurity http)方法是用来定义安全策略
        defaultSuccessUrl方法将其重定向到指定页面
        loginPage("/login")表示在没有授权前，任何访问需要授权才能访问的页面都会先跳转到/login登录页面
         */
        http.authorizeRequests().antMatchers("/pay/**", "/union/**", "/user/**", "/**").permitAll().anyRequest().authenticated().and()
                .formLogin().loginPage("/user/index").defaultSuccessUrl("/user/welcome").permitAll().and()
                .logout().permitAll();
        http.csrf().disable();
    }

    @Override
    public void configure(WebSecurity web) {
        // 解决静态资源被拦截的问题
        web.ignoring().antMatchers("/css/**");
    }
}
