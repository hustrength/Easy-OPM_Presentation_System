package com.rsh.mapper;

import com.rsh.easy_opm.annotation.*;
import com.rsh.model.Notification;

public interface NotificationMapper {
    /**
     * 1. insertNotification
     * @param paramMap
     * @return
     */
    @Insert("insert into Notification(Title,Content) values(#{Title},#{Content});")
    @ParamType(Notification.class)
    Boolean insertNotification(Notification notification);

    /**
     * 2. updateNotification
     * @param notification
     * @return
     */
    @Update("update Notification set Title=#{Title},Content=#{Content};")
    @ParamType(Notification.class)
    Boolean updateNotification(Notification notification);

    /**
     * 3. query
     * @return
     */
    @Select("select * from Notification;")
    @ResultType(Notification.class)
    Notification query();
}
