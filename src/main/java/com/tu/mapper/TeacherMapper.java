package com.tu.mapper;

import com.tu.pojo.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherMapper {
    List<Teacher> getAll();

    Teacher getAllById(@Param("teachId") int teachId);

    boolean updateTeacher(Teacher teach);
}
