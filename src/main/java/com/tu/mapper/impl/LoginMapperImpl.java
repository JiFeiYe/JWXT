package com.tu.mapper.impl;

import com.tu.mapper.LoginMapper;
import com.tu.util.BaseDAO;
import org.apache.ibatis.session.SqlSession;

public class LoginMapperImpl implements LoginMapper {
    public int isLogin(String username, String password) {
        SqlSession session = null;
        int type = 0;
        try {
            session = BaseDAO.getSession();
            // todo:是否可以实例化LoginMapper然后代替LoginMapper.class?
            LoginMapper gm = session.getMapper(LoginMapper.class);
            type = gm.isLogin(username, password);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            BaseDAO.closeSession(session);
        }
        return type;
    }

    public boolean isRegister(String username) {
        SqlSession session = null;
        boolean isR = false;
        try {
            session = BaseDAO.getSession();
            LoginMapper gm = session.getMapper(LoginMapper.class);
            isR = gm.isRegister(username);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            BaseDAO.closeSession(session);
        }
        return isR;
    }
}
