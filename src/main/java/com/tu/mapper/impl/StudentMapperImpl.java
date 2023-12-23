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
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            BaseDAO.closeSession(session);
        }
        return isU;
    }
}
