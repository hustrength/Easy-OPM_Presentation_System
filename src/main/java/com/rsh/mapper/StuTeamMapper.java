package com.rsh.mapper;

import com.rsh.easy_opm.annotation.*;
import com.rsh.model.Student;
import com.rsh.model.Team;

import java.util.List;
import java.util.Map;

public interface StuTeamMapper {
    /**
     * 1. queryAllTeam
     * @return
     */
    @Select("select * from team;")
    @ResultType(Team.class)
    List<Team> queryAllTeam();

    /**
     * 2. queryAllTeamByCid
     * @param cid
     * @return
     */
    @Select("select * from team where cid=?")
    @ParamType(Integer.class)
    @ResultType(Team.class)
    List<Team> queryAllTeamByCid(int cid);

    /**
     * 3. queryAllMembers
     * @param tid
     * @return return all members in the team except the captain
     */
    @Select("select * " +
            "from Student inner join Stu_Team " +
            "on Student.StuID=Stu_Team.StuID" +
            "where Position=1 and TID=?")
    @ParamType(Integer.class)
    @ResultType(Student.class)
    List<Student> queryAllMembers(int tid);

    /**
     * 4. belongToTeam
     * @param paramMap StuID and TID
     * @return
     */
    @Select("select exists(select * from Stu_Team where StuID=#{StuID} and TID=#{TID});")
    @ParamType(Map.class)
    @ResultType(Boolean.class)
    Boolean belongToTeam(Map<String, Object> paramMap);

    /**
     * 5. hasJoinedTeam
     * @param sid
     * @return
     */
    @Select("select exists(select * from Stu_Team where StuID=?);")
    @ParamType(String.class)
    @ResultType(Boolean.class)
    Boolean hasJoinedTeam(String sid);

    /**
     * 6. isVacant
     * @param tid
     * @return
     */
    @Select("select exists(select * from Team where TID=?);")
    @ParamType(Integer.class)
    @ResultType(Boolean.class)
    Boolean isVacant(int tid);

    /**
     * 7. updateVacantPos
     * @param paramMap
     * @return
     */
    @Update("update Team set VacantPos=VacantPos+(${ACT}) where TID=#{TID};")
    @ParamType(Map.class)
    boolean updateVacantPos(Map<String, Object> paramMap);

    /**
     * 8. insertStuToTeam
     * @param paramMap
     * @return
     */
    @Insert("insert into Stu_team values(#{TID},#{SID},#{POS});")
    @ParamType(Map.class)
    boolean insertStuToTeam(Map<String, Object> paramMap);

    /**
     * 9. removeStuFromTeam
     * @param paramMap
     * @return
     */
    @Delete("delete from Stu_team where TID=#{TID} and StuID=#{SID};")
    @ParamType(Map.class)
    boolean removeStuFromTeam(Map<String, Object> paramMap);

    /**
     * 10. queryTeamByName
     * @param TName
     * @return
     */
    @Select("select * from Team where TName=?;")
    @ParamType(String.class)
    @ResultType(Team.class)
    Team queryTeamByName(String TName);

    /**
     * 11. queryTeamById
     * @param tid
     * @return
     */
    @Select("select * from Team where TID=?;")
    @ParamType(Integer.class)
    @ResultType(Team.class)
    Team queryTeamByTid(int tid);

    /**
     * 12. addTeam
     * @param team
     * @return
     */
    @Insert("insert into Team(TName, CID, CaptainID, VacantPos) " +
            "values(#{TName},#{CID},#{CaptainID},#{VacantPos});")
    @ParamType(Team.class)
    boolean addTeam(Team team);

    /**
     * 13. updateCaptain
     * @param paramMap
     * @return
     */
    @Update("update Team set CaptainID=#{CaptainID} where TID=#{TID};")
    @ParamType(Map.class)
    boolean updateCaptain(Map<String, Object> paramMap);

    /**
     * 14. updateStuPos
     * @param paramMap
     * @return
     */
    @Update("update Stu_Team set Position=#{Pos} " +
            "where TID=#{TID} and StuID=#{SID};")
    @ParamType(Map.class)
    boolean updateStuPos(Map<String, Object> paramMap);

    /**
     * 15. deleteTeamInfo
     * @param tid
     * @return
     */
    @Delete("delete from Team where TID=?;")
    @ParamType(Integer.class)
    boolean deleteTeamInfo(int tid);
}
