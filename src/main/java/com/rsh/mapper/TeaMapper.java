package com.rsh.mapper;

import com.rsh.easy_opm.annotation.Insert;
import com.rsh.easy_opm.annotation.ParamType;
import com.rsh.easy_opm.annotation.ResultType;
import com.rsh.easy_opm.annotation.Select;
import com.rsh.model.Student;
import com.rsh.model.Teacher;

public interface TeaMapper {
    @Select("select * from teacher " +
            "where teaId = #{id};")
    @ParamType(String.class)
    @ResultType(Teacher.class)
    Teacher queryById(String id);

    @Insert("insert into teacher " +
            "values (#{TeaID}, #{Password}, #{TeaName});")
    @ParamType(Teacher.class)
    boolean insertOne(Teacher teacher);
}
