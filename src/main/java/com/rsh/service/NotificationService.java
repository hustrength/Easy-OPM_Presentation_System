package com.rsh.service;

import com.rsh.mapper.EasyOpmMapper;
import com.rsh.mapper.NotificationMapper;
import com.rsh.model.Notification;
import org.springframework.stereotype.Service;

@Service
public class NotificationService {
    private final NotificationMapper notificationMapper = EasyOpmMapper.getNotificationMapper();

    public String update(String title, String content) {
        Notification newNotification = new Notification(title, content);
        Notification oldNotification = notificationMapper.query();
        if (oldNotification == null)
            return notificationMapper.insertNotification(newNotification) ? "success" : "fail";
        else
            return notificationMapper.updateNotification(newNotification) ? "success" : "fail";
    }
}
