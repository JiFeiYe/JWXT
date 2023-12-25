package com.tu.mapper;

import com.tu.pojo.Student;
import com.tu.pojo.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherMapper {
    List<Teacher> getAll();

    Teacher getAllById(@Param("teachId") int teachId);

    boolean updateTeacher(Teacher teach);

    int queryCount();

    List<Teacher> findAllByPage(@Param("start") int start, @Param("pagesize") int pagesize);

    int delTeacherById(@Param("teachId") int teachId);

    int insertTeacher(Teacher teacher);
}
