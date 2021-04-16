package com.rsh.mapper;

import com.rsh.easy_opm.annotation.*;
import com.rsh.model.Teacher;

public interface TeaMapper {
    /**
     * 1. queryById
     * @param id
     * @return
     */
    @Select("select * from teacher " +
            "where teaId=?;")
    @ParamType(String.class)
    @ResultType(Teacher.class)
    Teacher queryById(String id);

    /**
     * 2. insertOne
     * @param tea
     * @return
     */
    @Insert("insert into teacher " +
            "values (#{TeaID}, #{Password}, #{TeaName});")
    @ParamType(Teacher.class)
    Boolean insertOne(Teacher tea);

    /**
     * 3. updateOne
     * @param tea
     * @return
     */
    @Update("update teacher " +
            "set TeaName=#{TeaName}, Password=#{Password} where TeaID=#{TeaID};")
    @ParamType(Teacher.class)
    Boolean updateOne(Teacher tea);
}
