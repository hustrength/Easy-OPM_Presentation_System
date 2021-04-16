package com.rsh.mapper;

import com.rsh.easy_opm.annotation.*;
import com.rsh.model.Competition;

import java.util.List;

public interface CompetitionMapper {
    /**
     * 1. queryByCid
     * @param cid
     * @return
     */
    @Select("select * from Competition where CID=?;")
    @ParamType(Integer.class)
    @ResultType(Competition.class)
    Competition queryByCid(int cid);

    /**
     * 2. queryAllCompetition
     * @return
     */
    @Select("select * from Competition;")
    @ResultType(Competition.class)
    List<Competition> queryAllCompetition();

    /**
     * 3. updateCompetition
     * @param competition
     * @return
     */
    @Update("update Competition set CName=#{CName}, Introduction=#{Introduction} where CID=#{CID};")
    @ParamType(Competition.class)
    Boolean update(Competition competition);

    /**
     * 4. insertCompetition
     * @param competition
     * @return
     */
    @Insert("insert into Competition(CName, Introduction, Publisher) values(#{CName},#{Introduction},#{Publisher});")
    @ParamType(Competition.class)
    Boolean insert(Competition competition);

    /**
     * 5. deleteCompetition
     * @param cid
     * @return
     */
    @Delete("delete from Competition where CID=?;")
    @ParamType(Integer.class)
    Boolean deleteCompetition(int cid);
}
