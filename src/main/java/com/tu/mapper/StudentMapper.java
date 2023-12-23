package com.tu.mapper;

import com.tu.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
    List<Student> getAll();

    Student getAllById(@Param("userId") int userId);

    boolean updateStudent(Student student);

    int queryCount();

    List<Student> findAllByPage(@Param("start") int start, @Param("pagesize") int pagesize);
}
