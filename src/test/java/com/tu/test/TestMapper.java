package com.tu.test;

import com.tu.mapper.LoginMapper;
import com.tu.mapper.impl.LoginMapperImpl;
import com.tu.pojo.Login;
import org.junit.Test;

public class TestMapper {
    @Test
    public void TestLogin(){
        LoginMapper lm = new LoginMapperImpl();
        int type = lm.isLogin("root", "Mm123456");
        System.out.println(type);
    }
}
