package com.tu.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

public class BaseDAO {
    /**
     * 获得数据库连接
     *
     * @return
     */
    public static SqlSession getSession() {
        SqlSessionFactory factory = null;
        try {
            InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
            SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
            factory = builder.build(inputStream);
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return factory.openSession(false); // 支持事务管理
    }

    /**
     * 关闭会话
     *
     * @param session
     */
    public static void closeSession(SqlSession session) {
        if (session != null)
            session.close();
    }
}
