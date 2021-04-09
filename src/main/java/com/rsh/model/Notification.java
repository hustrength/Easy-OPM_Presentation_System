package com.rsh.model;

public class Notification {
    private String Title;
    private String Content;

    public Notification(String title, String content) {
        Title = title;
        Content = content;
    }

    public Notification() {
    }

    @Override
    public String toString() {
        return "Notification{" +
                "Title='" + Title + '\'' +
                ", Content='" + Content + '\'' +
                '}';
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }
}
