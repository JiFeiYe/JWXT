package com.tu.mapper;

import org.apache.ibatis.annotations.Param;

public interface LoginMapper {
    int isLogin(@Param("username") String username, @Param("password") String password);

    boolean isRegister(@Param("username") String username);

}
