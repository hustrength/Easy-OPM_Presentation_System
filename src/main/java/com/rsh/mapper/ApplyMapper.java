package com.rsh.mapper;

import com.rsh.easy_opm.annotation.*;
import com.rsh.model.Apply;

import java.util.List;
import java.util.Map;

public interface ApplyMapper {
    /**
     * 1. insertApply
     * @param apply
     * @return
     */
    @Insert("insert into Apply values(?,?,?);")
    @ParamType(Apply.class)
    boolean insertApply(Apply apply);

    /**
     * 2. deleteApply
     * @param paramMap
     * @return
     */
    @Delete("delete from Apply where ApplicantID=#{ApplicantID} and TID=#{TID};")
    @ParamType(Map.class)
    boolean deleteApply(Map<String, Object> paramMap);

    /**
     * 3. updateApplyStatus
     * @param paramMap
     * @return
     */
    @Update("update Apply set Status=#{NewStatus} " +
            "where ApplicantID=#{ApplicantID} and TID=#{TID};")
    @ParamType(Map.class)
    boolean updateApplyStatus(Map<String, Object> paramMap);

    /**
     * 4. isApplied
     * @param paramMap
     * @return returning 0 means is not applied, otherwise applied
     */
    @Select("select Status from Apply where TID=#{TID} and ApplicantID=#{ApplicantID};")
    @ParamType(Map.class)
    @ResultType(Integer.class)
    Integer isApplied(Map<String, Object> paramMap);

    /**
     * 5. queryNotProcessedApplyByTid
     * @param tid
     * @return
     */
    @Select("select * from Apply where TID=? and Status=0;")
    @ParamType(Integer.class)
    @ResultType(Apply.class)
    List<Apply> queryNotProcessedApplyByTid(int tid);

    /**
     * 6. queryProcessedApplyBySid
     * @param sid
     * @return
     */
    @Select("select * from Apply where ApplicantID=? and Status!=0")
    @ParamType(String.class)
    @ResultType(Apply.class)
    List<Apply> queryProcessedApplyBySid(String sid);
}
