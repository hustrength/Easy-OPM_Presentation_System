package com.rsh.mapper;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class EasyOpmMapper {
    private static final ClassPathXmlApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-beans.xml");

    private static final StuMapper stuMapper = (StuMapper) applicationContext.getBean("stuMapper");
    private static final TeaMapper teaMapper = (TeaMapper) applicationContext.getBean("teaMapper");
    private static final StuTeamMapper stuTeamMapper = (StuTeamMapper) applicationContext.getBean("stuTeamMapper");
    private static final NotificationMapper notificationMapper = (NotificationMapper) applicationContext.getBean("notificationMapper");
    private static final CompetitionMapper competitionMapper = (CompetitionMapper) applicationContext.getBean("competitionMapper");
    private static final ApplyMapper applyMapper = (ApplyMapper) applicationContext.getBean("applyMapper");

    public static StuMapper getStuMapper() {
        return stuMapper;
    }

    public static TeaMapper getTeaMapper() {
        return teaMapper;
    }

    public static StuTeamMapper getStuTeamMapper() {
        return stuTeamMapper;
    }

    public static NotificationMapper getNotificationMapper() {
        return notificationMapper;
    }

    public static CompetitionMapper getCompetitionMapper() {
        return competitionMapper;
    }

    public static ApplyMapper getApplyMapper() {
        return applyMapper;
    }
}
