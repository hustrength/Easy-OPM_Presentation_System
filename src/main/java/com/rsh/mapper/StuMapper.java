package com.rsh.mapper;

import com.rsh.easy_opm.annotation.*;
import com.rsh.model.Student;
import com.rsh.model.Team;

import java.util.List;

public interface StuMapper {
    /**
     * 1. queryById
     * @param id
     * @return
     */
    @Select("select * from student " +
            "where stuId=?;")
    @ParamType(String.class)
    @ResultType(Student.class)
    Student queryById(String id);

    /**
     * 2. insertOne
     * @param stu
     * @return
     */
    @Insert("insert into student " +
            "values (#{StuID}, #{Password}, #{Sex}, #{StuName});")
    @ParamType(Student.class)
    Boolean insertOne(Student stu);

    /**
     * 3. updateOne
     * @param stu
     * @return
     */
    @Update("update student " +
            "set Password=#{Password}, Sex=#{Sex}, StuName=#{StuName} " +
            "where StuID=#{StuID};")
    @ParamType(Student.class)
    Boolean updateOne(Student stu);

    /**
     * 4. queryTeamIdByCaptainId
     * @param id
     * @return
     */
    @Select("select TID from Team where CaptainID=?;")
    @ParamType(String.class)
    @ResultType(Integer.class)
    List<Integer> queryTeamIdByCaptainId(String id);

    /**
     * 5. queryTeamByStuId
     * @param id
     * @return
     */
    @Select("select * from Team " +
            "where TID in (select TID from Stu_Team where StuID=?)")
    @ParamType(String.class)
    @ResultType(Team.class)
    List<Team> queryTeamByStuId(String id);
}
