package com.rsh.mapper;

import com.rsh.easy_opm.annotation.*;
import com.rsh.model.Student;

public interface StuMapper {
    @Select("select * from student " +
            "where stuId = #{id};")
    @ParamType(String.class)
    @ResultType(Student.class)
    Student queryById(String id);

    @Insert("insert into student " +
            "values (#{StuID}, #{Password}, #{Sex}, #{StuName});")
    @ParamType(Student.class)
    boolean insertOne(Student student);
}
