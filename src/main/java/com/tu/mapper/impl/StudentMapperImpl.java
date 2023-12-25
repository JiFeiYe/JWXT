package com.tu.mapper.impl;

import com.tu.mapper.StudentMapper;
import com.tu.pojo.Student;
import com.tu.util.BaseDAO;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;

public class StudentMapperImpl implements StudentMapper {
    public List<Student> getAll() {
        SqlSession session = null;
        List<Student> lts = new ArrayList<Student>();
        try {
            session = BaseDAO.getSession();
            StudentMapper sm = session.getMapper(StudentMapper.class);
            lts = sm.getAll();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            BaseDAO.closeSession(session);
        }
        return lts;
    }

    public Student getAllById(int userId) {
        SqlSession session = null;
        Student stu = null;
        try {
            session = BaseDAO.getSession();
            StudentMapper sm = session.getMapper(StudentMapper.class);
            stu = sm.getAllById(userId);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            BaseDAO.closeSession(session);
        }
        return stu;
    }

    public boolean updateStudent(Student student) {
        SqlSession session = null;
        boolean isU = false;
        try {
            session = BaseDAO.getSession();
            StudentMapper sm = session.getMapper(StudentMapper.class);
            isU = sm.updateStudent(student);
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
            StudentMapper sm = session.getMapper(StudentMapper.class);
            count = sm.queryCount();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            BaseDAO.closeSession(session);
        }
        return count;
    }

    public List<Student> findAllByPage(int start, int pagesize) {
        SqlSession session = null;
        List<Student> lts = new ArrayList<Student>();
        try {
            session = BaseDAO.getSession();
            StudentMapper sm = session.getMapper(StudentMapper.class);
            lts = sm.findAllByPage(start, pagesize);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            BaseDAO.closeSession(session);
        }
        return lts;
    }

    public int delStudentById(int userId) {
        SqlSession session = null;
        int count = 0;
        try {
            session = BaseDAO.getSession();
            StudentMapper sm = session.getMapper(StudentMapper.class);
            count = sm.delStudentById(userId);
            session.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            BaseDAO.closeSession(session);
        }
        return count;
    }

    public int insertStudent(Student student) {
        SqlSession session = null;
        int count = 0;
        try {
            session = BaseDAO.getSession();
            StudentMapper sm = session.getMapper(StudentMapper.class);
            count = sm.insertStudent(student);
            session.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            BaseDAO.closeSession(session);
        }
        return count;
    }
}
