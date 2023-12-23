package com.tu.mapper.impl;

import com.tu.mapper.TeacherMapper;
import com.tu.pojo.Teacher;
import com.tu.util.BaseDAO;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;

public class TeacherMapperImpl implements TeacherMapper {
    public List<Teacher> getAll() {
        SqlSession session = null;
        List<Teacher> lts = new ArrayList<Teacher>();
        try {
            session = BaseDAO.getSession();
            TeacherMapper tm = session.getMapper(TeacherMapper.class);
            lts = tm.getAll();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            BaseDAO.closeSession(session);
        }
        return lts;
    }

    public Teacher getAllById(int teachId) {
        SqlSession session = null;
        Teacher teach = null;
        try {
            session = BaseDAO.getSession();
            TeacherMapper tm = session.getMapper(TeacherMapper.class);
            teach = tm.getAllById(teachId);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            BaseDAO.closeSession(session);
        }
        return teach;
    }

    public boolean updateTeacher(Teacher teach) {
        SqlSession session = null;
        boolean isU = false;
        try {
            session = BaseDAO.getSession();
            TeacherMapper tm = session.getMapper(TeacherMapper.class);
            isU = tm.updateTeacher(teach);
            session.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            BaseDAO.closeSession(session);
        }
        return isU;
    }

    public int queryCount() {
        SqlSession session = null;
        int count = 0;
        try {
            session = BaseDAO.getSession();
            TeacherMapper tm = session.getMapper(TeacherMapper.class);
            count = tm.queryCount();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            BaseDAO.closeSession(session);
        }
        return count;
    }

    public List<Teacher> findAllByPage(int start, int pagesize) {
        SqlSession session = null;
        List<Teacher> lts = new ArrayList<Teacher>();
        try {
            session = BaseDAO.getSession();
            TeacherMapper tm = session.getMapper(TeacherMapper.class);
            lts = tm.findAllByPage(start, pagesize);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            BaseDAO.closeSession(session);
        }
        return lts;
    }

    public int delTeacherById(int teachId) {
        SqlSession session = null;
        int count = 0;
        try {
            session = BaseDAO.getSession();
            TeacherMapper tm = session.getMapper(TeacherMapper.class);
            count = tm.delTeacherById(teachId);
            session.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            BaseDAO.closeSession(session);
        }
        return count;
    }


}
